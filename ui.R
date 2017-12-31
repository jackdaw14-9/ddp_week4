library(shiny)
library(ElemStatLearn)
library(plotly)
library(shinyjs)
shinyUI(fluidPage(
	titlePanel("Week 4 Shiny App"),
	navbarPage("Used navbarPage",
		tabsetPanel(type = "tabs",
			tabPanel("mtcars", br(),
				plotOutput("plot_1"),
				h4("Tab_1 contains the linear_model of the dataset : mtcars", br(),
					"Plotted : mpg vs. hp", br(),
					"The Linear Model is used to predict Horsepower for the entered value of mpg"),
				sliderInput("sl_mpg", "Value of mpg", min = 10, max = 36, value = 23),
				submitButton("Submit"),
				h4("Predicted horsepower using the model =", textOutput("tab_1"))
			),
			tabPanel("galaxy Dataset", br(),
				h4("Tab_2 contains the plot_ly plot of Galaxy Dataset. This is the data for Galaxy NGC7531", br(),
					"x :: east-west co-ordinate", br(),
					"y :: north-south co-ordinate", br(),
					"z :: velocity", br(),
					"color :: radial_position"),
				plotlyOutput("gal3d")
			)
		)
	)
))
