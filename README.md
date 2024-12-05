# Asthma Case Study

---

 Author: Pedro Bettencourt
 
 Date: December 5, 2024
 
---


# Scenario

Asthma is a common chronic inflammatory pulmonary disease. 
It is triggered by allergens, pollen, dust, or other particles, that are inhaled, causing the restriction of oxygen flow.
Symptoms include episodes of wheezing, coughing, chest tightness, and shortness of breath.


### Objectives

* Analyze patterns related to asthma.
* Uncover insights into the disease.
* Use insights to improve conditions that lead to asthma.

---

# Dataset

The dataset was obtained from [kaggle](https://www.kaggle.com/datasets/rabieelkharoua/asthma-disease-dataset/data).
It consists of synthetic data that deals with factors important to asthma. It contains 2392 observations and has factors like age, education, symptoms, and dust and pollution exposure.

---

# Data preparation

The data didn't contain null or missing values, and there were no duplicate entries. 
One of the columns, DoctorInCharge, was removed as it is irrelevant.


---

# Analysis

The analysis was made through SQL queries, which analyzed the relation between asthma diagnosis and various metrics - age, gender, ethnicity, education, bmi, smoking, symptoms, and environemnt.
Other relations were analyzed: the relation between symptoms and the environment; and the environment with ethnicity, gender, and education.

For the 1st type of queries, the main logic is to calculate the number of people within a certain group (for example, men within gender) and then see what number of that calculated group has.


---

# Visualization

The visualizations for some of the queries were done in Tableau and can be seen [here](https://public.tableau.com/app/profile/pedro.bettencourt6384/viz/Asthma_17329068753480/Dashboard1?publish=yes).


---


# Conclusions

We can see that:
 * People with higher education have a higher rate of asthma.
 * Interestingly, people with no symptoms of respiratory problems have the highest rate of asthmatics. This could be a result of better medication.
 * People with severe symptoms have a higher rate of asthmatics than people with milder symptoms.
 * In terms of age, it various a bit between age groups, with people between 45 and 54 having the least cases of asthma.
 * Still related to symptoms, as there is more exposure dust, pollen, and pollution there is a trend of increased severity of repiratory symptoms.
 * An increase of diet quality is also related to worse symptoms.

The findings, unfortunately, aren't very relevant, as this is a synthetic dataset. However, it is still possible to make insights.

I would think that the higher education level having more asthma cases could mean that less educated people have less access to a diagnosis. Therefore, a campaign for asthma awareness could take this into account.

In terms of the environment, obviously people would have improved symptoms if pollution, pollen, and dust exposure were lowered.
