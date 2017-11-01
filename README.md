# Salesforce Einstein Sentiment Analysis Demo

[![Build Status](https://travis-ci.org/last-khajiit/salesforce-einstein-sentiment-analysis.svg?branch=master)](https://travis-ci.org/last-khajiit/salesforce-einstein-sentiment-analysis)


## Steps for using
1. Deploy to Salesforce (using bellow button or manually)

<a href="https://githubsfdeploy.herokuapp.com/?owner=last-khajiit&repo=salesforce-einstein-sentiment-analysis"><img alt="Deploy to Salesforce" src="https://raw.githubusercontent.com/afawcett/githubsfdeploy/master/src/main/webapp/resources/img/deploy.png"></a>

2. Create Remote Site Setting for Einstein APIs (read more [here](https://metamind.readme.io/docs/apex-qs-create-remote-site))

3. Populate Custom Settings

4. Use EinsteinService class for getting sentiment of text:

```java
EinsteinService einstein = new EinsteinService();
SentimentAnalysisResponse sentimentResponse = einstein.findSentiment('Test string with some sentiment');
```



---

**[Copyright](https://github.com/last-khajiit/salesforce-einstein-sentiment-analysis/blob/master/LICENSE) © 2017 Hleb <last.khajiit@gmail.com>**
