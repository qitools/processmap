processmap <-  
function(content,topic,theme) {

KUBlue = "#0022B4"
SkyBlue = "#6DC6E7"

temp <- content
#temp <- gsub('\n', '', fixed = TRUE, temp)
temp <- gsub(',,', ',', fixed = TRUE, temp, perl = TRUE)
temp <- gsub(',)', ')', fixed = TRUE, temp, perl = TRUE)
temp <- gsub('Who:', '\nWho:', fixed = TRUE, temp, perl = TRUE)
temp <- gsub('With:', '\nWith:', fixed = TRUE, temp, perl = TRUE)
temp <- gsub('Where:', '\nWhere:', fixed = TRUE, temp, perl = TRUE)
temp <- gsub('Why:', '\nWhy:', fixed = TRUE, temp, perl = TRUE)
temp <- gsub('Criteria:', '\nCriteria:', fixed = TRUE, temp, perl = TRUE)
temp <- gsub('Trigger:', '\nTrigger:', fixed = TRUE, temp, perl = TRUE)
temp <- gsub('Note:', '\nNote:', fixed = TRUE, temp, perl = TRUE)
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
	
#Add bold to each step name (does not work)
x.parameters<-vector(mode="list",length=length(steps))
for(i in 1: length(steps))
	{
	#steps[i]<-paste("~bold(",steps[i]) #Start
	#steps[i]<-gsub("Who", ")Who",steps[i]) #Close
	#steps[i]<-eval(parse(file = "", n = NULL, text = steps[i]))
	}
	
#Parameters of each process
x.parameters<-vector(mode="list",length=length(steps))
for(i in 1: length(steps))
	{
	x.parameters[i]<-list(c(list(c("Task (what)", "P")),list(c("Operator (who)", "C")),list(c("Guidance (with)", "C")),list(c("Location (where)", "C")),list(c("What else (queue)", "N"))))
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
