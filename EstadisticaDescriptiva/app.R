# Instalar paquetes necesarios
install.packages("readxl")
install.packages("dplyr")
install.packages("shinydashboard")
install.packages("shiny")

# Cargar librerías
library(readxl)
library(dplyr)
library(shiny)
library(shinydashboard)


# Calcular estadísticas descriptivas
estadisticas <- datos %>%
  summarise(
    Promedio_Edad = mean(Edad, na.rm = TRUE),
    Maximo_Edad = max(Edad, na.rm = TRUE),
    Minimo_Edad = min(Edad, na.rm = TRUE),
    Desviacion_Edad = sd(Edad, na.rm = TRUE),
    Varianza_Edad = var(Edad, na.rm = TRUE),
    Cuartiles_Edad = quantile(Edad, probs = c(0.25, 0.5, 0.75), na.rm = TRUE),
    Quintiles_Edad = quantile(Edad, probs = seq(0, 1, by = 0.2), na.rm = TRUE)
    # Repetir para Peso, Talla, Temperatura
  )

# Crear aplicación Shiny
ui <- dashboardPage(
  dashboardHeader(title = "Estadísticas Descriptivas"),
  dashboardSidebar(disable = TRUE),
  dashboardBody(
    fluidRow(
      box(title = "Estadísticas Descriptivas", status = "primary", solidHeader = TRUE,
          tableOutput("estadisticas")),
      fileInput("file1", "Sube tu archivo Excel", accept = c(".xlsx"))
    )
  )
)

server <- function(input, output) {
  output$estadisticas <- renderTable({
    estadisticas
  })
}

shinyApp(ui, server)
