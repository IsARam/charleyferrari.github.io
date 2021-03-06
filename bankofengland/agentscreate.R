library(dplyr)

setwd("/Users/Charley/Downloads/charleyferrari.github.io")


agentsraw <- read.csv("AgentsRaw.csv")

futurelist <- c(colnames(agentsraw)[1:2],colnames(agentsraw)[14:length(colnames(agentsraw))])

currentlist <- c(colnames(agentsraw)[1:13],colnames(agentsraw[25]))

agentsfuture <- agentsraw[,futurelist]
agentscurrent <- agentsraw[,currentlist]
colnames(agentsfuture) <- colnames(agentscurrent)

agentsfuture$ScoreType <- "Future"
agentscurrent$ScoreType <- "Current"

agents <- rbind(agentscurrent, agentsfuture)

write.csv(agents, "agents.csv", row.names=FALSE)

