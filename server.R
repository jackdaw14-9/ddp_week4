library(shiny)
library(ElemStatLearn)
library(plotly)
library(shinyjs)
shinyServer(function(input, output) {
	model_1 <- lm(hp ~ mpg, data = mtcars)

	model_1_pred <- reactive({
		mpg_input <- input$sl_mpg
		predict(model_1, newdata = data.frame(mpg = mpg_input))
	})

	output$plot_1 <- renderPlot({
		mpg_input <- input$sl_mpg
		plot(mtcars$mpg, mtcars$hp, xlab = "Miles per Gallon", ylab = "Horse Power", 
			bty = "n", pch = 16, xlim = c(10, 50), ylim = c(50, 500))

		abline(model_1, col = "red", lwd = 2)

		legend(25, 250, "Linear Model", pch = 16, col = "red", bty = "n", cex = 1.2)
	})

	output$tab_1 <- renderText({
		model_1_pred()
	})

	output$gal3d <- renderPlotly({
		gal_plot <- plot_ly(x = galaxy$east.west, y = galaxy$north.south, z = galaxy$velocity, color = galaxy$radial.position, type = "scatter3d", mode = "markers")
		layout (gal_plot, title = "Galaxy Data 3d scatter plot", scene = list( xaxis = list(title = "east-west"), yaxis = list(title = "north-south"), zaxis = list(title = "velocity")))
	})
})
