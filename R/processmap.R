processmap <-
function(content,topic,theme) {
temp <- gsub('\n', '', fixed = TRUE, content, perl = TRUE)
temp <- gsub("\\s+$", "", temp, perl = TRUE) #Removing trailing whitespace
temp <- gsub(",+$", "", temp, perl = TRUE) #Remove trailing comma if accidentally added by user online
temp <- paste('Mymatrix <- matrix(c(',temp,'), ncol=2, byrow=TRUE,dimnames = list(NULL, c("Reason","count")))')
x<-eval(parse(file = "", n = NULL, text = temp))

KUBlue = "#0022B4"
SkyBlue = "#6DC6E7"

temp <- content
#temp <- gsub('\n', '', fixed = TRUE, temp)
temp <- gsub("\\s+$", "", temp) #Removing trailing whitespace
temp <- gsub(",+$", "", temp) #Remove trailing comma if accidentally added by user online
temp <- paste('list(',temp,')')
mapcontents<-eval(parse(file = "", n = NULL, text = temp))
#Note that mapcontents contains the lists: inputs, steps, outputs

#Inputs of process "i" are inputs of process "i+1"
input.output<-vector(mode="list",length=length(steps))
for(i in 1: length(steps))
	{
	input.output[i]<-list(c(""))
	}
	
#Parameters of each process
x.parameters<-vector(mode="list",length=length(steps))
for(i in 1: length(steps))
	{
	x.parameters[i]<-list(c(list(c("Operator", "C")),list(c("Guidance", "C")),list(c("Task", "P")),list(c("Queue", "N"))))
	}
	
#Features of each process
y.features<-vector(mode="list",length=length(steps))
for(i in 1: length(steps))
	{
	y.features[i]<-list(c(list(c("ok", "Cr"))))
	}

ss.pMap(steps, inputs, outputs, input.output, x.parameters, y.features, main="", sub="", ss.col = c(SkyBlue, SkyBlue, "#CCCCCC", SkyBlue, "#EEEEEE"))
grid.text("Process Map",y=1.05,gp = gpar(fontsize = 16, fontface = "bold", col=KUBlue))
grid.text(topic,y=1,gp = gpar(fontsize = 16, fontface = "bold", col=KUBlue))
}
# http://www.sixsigmawithr.com/
