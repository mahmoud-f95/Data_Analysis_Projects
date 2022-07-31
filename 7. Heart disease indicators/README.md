# Personal-Key-Indicators-of-Heart-Disease-Analysis-and-Visualization

### Dataset
The link to the dataset on kaggle:\
https://www.kaggle.com/datasets/kamilpytlak/personal-key-indicators-of-heart-disease

### Content
2020 annual CDC survey data of 400k adults related to their health status
The dataset contains 18 variables (9 booleans, 5 strings and 4 decimals):

`HeartDisease` Respondents that have ever reported having coronary heart disease (CHD) or myocardial infarction (MI)\
`BMI` Body Mass Index (BMI)\
`Smoking` Have you smoked at least 100 cigarettes in your entire life? [Note: 5 packs = 100 cigarettes]\
`AlcoholDrinking` Heavy drinkers (adult men having more than 14 drinks per week and adult women having more than 7 drinks per week\
`Stroke`(Ever told) (you had) a stroke?\
`PhysicalHealth`includes physical illness and injury, for how many days during the past 30 days\
`MentalHealth` for how many days during the past 30 days was your mental health not good?\
`DiffWalking` Do you have serious difficulty walking or climbing stairs?\
`Sex`\
`AgeCategory`\
`Race` race/ethnicity\
`Diabetic`\
`PhysicalActivity` Adults who reported doing physical activity or exercise during the past 30 days other than their regular job\
`GenHealth`How would yo describe your health\
`SleepTime` Average number of sleeping hours\
`Asthma`\
`KidneyDisease`Not including kidney stones, bladder infection or incontinence\
`SkinCancer`

#### Approach
* After validating the data I'v started the exploratory data analysis which included univariate analysis,sample statistics and sample distribution.
* Then I moved to bi-variate analysis analyzing each variable against the target variabl (Heart disease).
* All of these analysis have been interpreted into visuals to gather insights easily
* Lastly,Instead of One-Hot Encoding, I made correlation by computing a relevant measure of association between each and every feature, and plot it all as an easy-to-read heat-map.

