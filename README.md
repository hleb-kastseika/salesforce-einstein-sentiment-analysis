# Salesforce Einstein Sentiment Analysis Demo

[![Build Status](https://travis-ci.org/last-khajiit/salesforce-einstein-sentiment-analysis.svg?branch=master)](https://travis-ci.org/last-khajiit/salesforce-einstein-sentiment-analysis)
[![License](https://img.shields.io/badge/License-MIT-brightgreen.svg)](https://raw.githubusercontent.com/last-khajiit/salesforce-einstein-sentiment-analysis/master/copying.txt)


## Steps for using
1. Deploy to Salesforce (using bellow button or manually)

<a href="https://githubsfdeploy.herokuapp.com/?owner=last-khajiit&repo=salesforce-einstein-sentiment-analysis"><img alt="Deploy to Salesforce" src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/src/main/webapp/resources/img/deploy.png"></a>

2. Create Remote Site Setting for Einstein APIs (read more [here](https://metamind.readme.io/docs/apex-qs-create-remote-site))

3. Populate Custom Settings

4. Use EinsteinService class for getting sentiment of text. Example for Anonimous execution in Developer Console:

```java
EinsteinService einstein = new EinsteinService();
SentimentAnalysisResponse response = einstein.findSentiment('I love Salesforce!');
System.debug('Response = '+ response);
```
In log we get next result:

```
Response = SentimentAnalysisResponse:[probabilities=(Probabilities:[label=positive, probability=0.49315557], Probabilities:[label=neutral, probability=0.3688144], Probabilities:[label=negative, probability=0.13803007])]
```

---

**[Copyright](https://github.com/last-khajiit/salesforce-einstein-sentiment-analysis/blob/master/LICENSE) © 2017 Hleb <last.khajiit@gmail.com>**
