# Final Project

## Domain Of Interest

- Why are you interested in this field/domain?

Research questions concerning the pandemic have been altogether too topical as of late but seeing that two of our group members are interested in Public Health, we felt that it would be a good choice for our group to pursue a COVID-19 related question. We hope to explore the relationship between geographically situated COVID-skeptic social media posts and coronavirus hotspots in the U.S.. In order to do this, we have searched for similar projects and applicable data.

- What other examples of data driven project have you found related to this domain (share at least 3)?

While there is a plethora of readily accessible coronavirus data, the COVID-in-social media aspect of our research has expectedly less data representation. Despite this, we have been able to find a few research projects concerned with COVID social media misinformation.

https://explore.openaire.eu/search/dataset?datasetId=r37b0ad08687::b8c8f1c5e33684a9b3bfb87fdd616f73

Carnegie Mellon University project aimed at building a dataset of annotated misleading posts from Twitter and providing social media misinformation research models for further study.

https://esoc.princeton.edu/publications/esoc-covid-19-disinformation-tracking-report

A Princeton University ESOC 2020 research article presenting data methods for tracking social media COVID misinformation and fake news.

https://arxiv.org/pdf/2005.05710.pdf

This is an August 2020 research paper that aims to quantify COVID misinformation tweets and to propose methods for identifying and fact-checking misleading posts.

- What data-driven questions do you hope to answer about this domain (share at least 3)?

Our main question is whether or not a high number of COVID related tweets in a geographic area has any relationship with COVID severity in the area. Another question potentially addressable in our project, is what particular hashtags/post categories most commonly contain misinformation posts. Additionally, a final potential might be what kind of account is more likely to make an original misinformation post (verified or not, etc) or what kind of account most commonly retweets misinformation posts. We expect that as we begin our analysis in earnest, more potential questions will be revealed.

# Finding Data

## COVID-19 Location Data

- Where did you download the data (e.g., a web URL)?

https://ourworldindata.org/coronavirus-source-data

- How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?

The data was collected by **Our World in Data** which provides open access to data and research to "make progress against the worlds largest problems". Our World in Data uses COVID-19 data from Johns Hopkins, European Centre for Disease Prevention and Control, the COVID tracking project, and from data collected by Our World in Data themselves. They compile this data to create a dataset with almost sixty features which measure global cases, hospitalizations, deaths, vaccinations, ICU patients and testing along with others. This provides a comprehensive COVID-19 dataset which is updated on a daily basis.

- How many observations (rows) are in your data?

63392 observations in the dataset.

- How many features (columns) are in the data?

There are 59 features or columns in the dataset.

- What questions (from above) can be answered using the data in this dataset?

With 59 features there are many questions that can be asked of this data set such as which countries have the highest hospitalizations to case ratio, which countries are providing the most tests and does the rate of testing correlate to the rate of cases. Which countries are cases increasing the fastest and which the lowest. There are countless questions that can be answered using this dataset.

## Tagged COVID-19 Tweets

- Where did you download the data (e.g., a web URL)?

https://www.kaggle.com/datatattle/covid-19-nlp-text-classification

- How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?

The data classifies nearly 45,000 tweets related to COVID-19. The tweets have been pulled from Twitter and manual tagging was performed by Aman Miglani about five months ago. Each entry includes the location, time of tweet, text of tweet, and a positive or negative "sentiment" label. The names and usernames of the original "tweeters" are also included but are given codes for the sake of privacy.

- How many observations (rows) are in your data?

From both the train and test data set, there are approximately 45,000 tweets (rows).

- How many features (columns) are in the data?

There are six features in the data: "Name", "Screen Name", "Tweeted From", "Tweeted At", "Twitter Text", and "Sentiment".

- What questions (from above) can be answered using the data in this dataset?

Data driven questions related to users' locations and their feelings about COVID-19 can be answered using this data set. For example, what regions have users with the most negative sentiments regarding COVID-19? The manual labeling of the data, however, may prompt further questioning about its subjective nature.


## COVID-19 Tweets

- Where did you download the data (e.g., a web URL)?

https://www.kaggle.com/gpreda/covid19-tweets

- How was the data collected or generated? Make sure to explain who collected the data (not necessarily the same people that host the data), and who or what the data is about?

The data was collected by extracting tweets with the #COVID19 hashtag via the Twitter API with a python script. The data was collected by Dr. Gabriel Preda, the lead data scientist at Endava.
The data is a raw dataset which includes the tweet date, tweet content, geolocation, user profile creation date, followers, mutuals and if the user is verified or not, and more.

- How many observations (rows) are in your data?

179109

- How many features (columns) are in the data?

13

- What questions (from above) can be answered using the data in this dataset?

We can find the relationship between locaitons with high amounts of "covid skeptical" tweets and locations with high amounts of COVID-19 cases.
However, a downside may be that we will have to manually codify the tweet content ourselves to determine if it is "covid skeptical."
