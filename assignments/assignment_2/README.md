# Hate-speech and offensive language on Twitter
## M2 Individual Assignment 2 - Working with Natural Language

![hatespeech](http://www.dqweek.com/wp-content/uploads/2017/06/news_firenze-800x550-800x420.jpeg)

This assignment is less structured than previous individual assignment. This time there will be also no starter code.

You are given a collection of approximately 25k tweets that have been manually (human) annotated.  ```class``` denotes: 0 - hate speech, 1 - offensive language, 2 - neither

```https://transfer.sh/wzLw2/twitter_hate_speech.csv```

### 1. Preprocess the tweets for ML application. 
Justify your choices and explain possible alternatives (e.g. removing stopwords, tidentirying bi/tri-grams, removing verbs or use of stemming etc.)

Create a bag-of-words representation, apply TF-IDF and topic moddeling to transform the your corpus into a feature matrix.

If you are using R, please check out the [Quanteda](https://quanteda.io) package to perform tasks that are handled with Gensim in Python.

### 2. Explore and compare the 2 "classes of interest" - hate speech vs offensive language. 

- Can you see differences by using simple count-based approaches? 
- Can you identify themes (aka clusters) that are specific for one class or another?

### Build a ML model that can predict hate speech
Use the ML pipeline (learned in M1) to build a classification model that can identify offensive language and hate speech. It is not an easy task to get good results. Experiment with different 

The best reported results for this dataset are.

| Class         | Precision     |
| ------------- |:-------------:|
| 0             |0.61           |
| 1             |0.91           |
| 2             |0.95           |
| ------------- |:-------------:|
| Overall       |0.91           |

Here advanced NLP feature engineering has been used and thus everything around an overall accuracy of 85 is fine. You will see that it is not easy to lift class 0 accuracy over 0.5