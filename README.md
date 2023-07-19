# Evaluate AUC ROC dependence on the number of positive cases

In a binary classification problem, we are tasked with classifying two distinct labels, typically denoted as "case" (encoded with 1) and "control" (encoded with 0). The classification process often results in a continuous output representing the classifier's confidence in predicting the cases. In our specific case, we obtain probabilities ranging from 0 to 1, which is common when using logistic regression for classification. These probabilities reflect the likelihood of an instance belonging to the positive class ("case").

In this example, we have 1000 samples, with half being controls and the other half being cases. Using a pre-trained classifier, we can predict the probability of each sample belonging to the "case" group. The results are presented in a histogram:

![alt text](https://raw.githubusercontent.com/AlessioMilanese/evaluate_AUC/main/plots/figure1.png)

There are different ways to evaluate the performance of the classifier. For example, we could evaluate precision (which represents the accuracy of positive predictions, basically how many errors we make in the classification) and recall (which represents the sensitivity, telling us if we recover all the positive examples). But note that they depend on defining a threshold. So in the example above, if I choose a threshold of 0.37, I will have a recall of 1, but lower precision. If I choose a threshold of 0.7, I will have a high precision (1) and lower recall (because I miss some cases):

Here we want to access weather the Area Under the Curve (AUC) for Receiver Operating Characteristic (ROC) curves is dependent on the numer of positive and negative cases, in the context of a binary classification problem. 
