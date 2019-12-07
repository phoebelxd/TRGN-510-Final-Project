library(BiocManager)
options(repos = BiocManager::repositories())

F2<-readRDS("F2.rds")
F3<-readRDS("F3.rds")
M2<-readRDS("M2.rds")
M3<-readRDS("M3.rds")

## Combine all data together 
ALL<-c(F2,F3,M2,M3)

## Function1 = obtain the mean value of a data set

aggregate <- function(listname) {
  res <- rowMeans(sapply(listname,function(x){
    return(x[,2])
  }))
  return(res)
}

## Function2 = transformations from the raw-scale

lcpm <- function(listname) {
  res <- cpm(listname, log=TRUE)
  return(res)
}

## Generate data frame

library(edgeR)
res<- data.frame(all=lcpm(aggregate(ALL)), m2=lcpm(aggregate(M2)), m3=lcpm(aggregate(M3)), f2=lcpm(aggregate(F2)), f3=lcpm(aggregate(F3)), name=ALL[[1]][,1])

## Removing genes that are lowly expressed

keep.exprs <- filterByExpr(aggregate(ALL))
res <- res[keep.exprs,]

## Graphical representation

res2<-head(res[order(res$all, decreasing= T),], n = 20)
rownames(res2)<-res2[,6]
res2$m2<-(res2$m2-res2$all)/res2$all*100
res2$m3<-(res2$m3-res2$all)/res2$all*100
res2$f2<-(res2$f2-res2$all)/res2$all*100
res2$f3<-(res2$f3-res2$all)/res2$all*100
res2$all<-(res2$all-res2$all)/res2$all*100
res2<-subset(res2, select=-c(name))
heatmap(data.matrix(res2))

library(shiny)
library(dplyr)
library(logging)
options(stringsAsFactors = FALSE)
basicConfig(0)
ui <- fluidPage(
  titlePanel("The Gene Expression Quantification of Acute Lymphoblastic Leukemia" ),
  sidebarLayout(
    sidebarPanel(
      selectInput("dataset1", "Please delet or add a gender with phase to compare:",
                  choices = c("Female phase2", "Female phase3", "Male phase2", "Male phase3", "All"),
                  multiple = TRUE,
                  selected = c("Female phase2", "Female phase3", "Male phase2", "Male phase3", "All")),
      
      
      helpText("Note:Data view will show only top 20 highest gene expression.",
               " The color of 'all' represents the zero difference with the mean value of all the cases.",
               "The deep color represents high gene expression.")
      
      
      
    ),
    # Main panel for displaying outputs ----
    mainPanel (
      # Output: 
      h4("Comparison Heatmap"),
      
      plotOutput("heatmap")
      
    )
  )
)

server <- function(input, output) { 
  observe({
    logdebug(data.frame(col = input$dataset1))
  })
  firstcolumn <- reactive({
    case_when(input$dataset1 == "Female phase2" ~ "f2",
              input$dataset1 == "Female phase3" ~ "f3",
              input$dataset1 == "Male phase2" ~ "m2",
              input$dataset1 == "Male phase3" ~ "m3",
              TRUE~"all")  
  })
  
  
  observe({
    logdebug(firstcolumn())
  })
  
  output$heatmap <- renderPlot({
    data<- res2[, names(res2) %in% firstcolumn()]
    heatmap(data.matrix(data), height= "800", width= "100%")})
  
}  

shinyApp(ui, server)
