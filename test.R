library(pROC)
library(ggplot2)

# Set seed for reproducibility
set.seed(1)

# Info for controls
control_mean <- 0.4
control_sd <- 0.1

# Info for cases
case_mean <- 0.7
case_sd <- 0.1

all_AUC = c()
all_vals = list()
for(n in c(10:990)){
  # number of cases
  num_cases <- n
  num_controls = 1000 - n
  
  # generate data
  control_data <- rnorm(num_controls, mean = control_mean, sd = control_sd)
  case_data <- rnorm(num_cases, mean = case_mean, sd = case_sd)
  
  # Combine control and case data
  data <- c(control_data, case_data)
  labels <- c(rep("control", num_controls), rep("case", num_cases))
  
  # calculate AUC
  roc_obj <- roc(labels, data)
  auc <- auc(roc_obj)
  all_AUC = c(all_AUC, auc)
  
  # add all vals
  all_vals[[n]] = data.frame(data = data, labels = labels)
}

# plot AUC values
df_plot = data.frame(
  auc = all_AUC,
  perc_cases = (c(10:990)/1000) * 100
)
ggplot(df_plot,aes(perc_cases,auc))+
  geom_bar(stat = "identity") + 
  geom_line() +
  xlab("Percentage of controls")+
  ylab("AUC")+
  geom_hline(yintercept = min(df_plot$auc), col = "red") +
  geom_hline(yintercept = max(df_plot$auc), col = "blue") +
  geom_hline(yintercept = median(df_plot$auc), col = "green")
  
# plot histogram
ggplot(all_vals[[50]],aes(data,fill = labels))+
  geom_histogram(alpha = 0.5, position="identity") + 
  theme_bw() +
  xlab("Classification results (probability)")+
  ylab("Counts")+
  ggtitle("Histogram with 50 positive cases (5%)")

ggplot(all_vals[[250]],aes(data,fill = labels))+
  geom_histogram(alpha = 0.5, position="identity") + 
  theme_bw() +
  xlab("Classification results (probability)")+
  ylab("Counts")+
  ggtitle("Histogram with 250 positive cases (25%)")

ggplot(all_vals[[500]],aes(data,fill = labels))+
  geom_histogram(alpha = 0.5, position="identity") + 
  theme_bw() +
  xlab("Classification results (probability)")+
  ylab("Counts")+
  ggtitle("Histogram with 500 positive cases (50%)")

ggplot(all_vals[[750]],aes(data,fill = labels))+
  geom_histogram(alpha = 0.5, position="identity") + 
  theme_bw() +
  xlab("Classification results (probability)")+
  ylab("Counts")+
  ggtitle("Histogram with 750 positive cases (75%)")

ggplot(all_vals[[950]],aes(data,fill = labels))+
  geom_histogram(alpha = 0.5, position="identity") + 
  theme_bw() +
  xlab("Classification results (probability)")+
  ylab("Counts")+
  ggtitle("Histogram with 950 positive cases (95%)")
