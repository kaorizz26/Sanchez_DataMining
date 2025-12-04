
#install.packages("arules")
#install.packages("arulesViz")


library(arules)
library(arulesViz)

data("Groceries")

summary(Groceries)

inspect(Groceries[1:5])

frequent_items <- apriori(Groceries, 
                          parameter = list(supp = 0.01, 
                                           target = "frequent itemsets"))

inspect(head(sort(frequent_items, by = "support", decreasing = TRUE), 10))

rules <- apriori(Groceries, 
                 parameter = list(supp = 0.01, conf = 0.3))

inspect(head(rules))

rules_lift <- sort(rules, by = "lift", decreasing = TRUE)

inspect(head(rules_lift, 10))

# Visualize the top 20 rules as a graph
plot(rules_lift[1:20], method = "graph", engine = "htmlwidget")

# Scatterplot of all rules
plot(rules, method = "scatterplot", measure = c("support", "confidence"), shading = "lift")
