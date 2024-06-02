# Assignment 1: Design a Logical Model

## Question 1
Create a logical model for a small bookstore. 📚

At the minimum it should have employee, order, sales, customer, and book entities (tables). Determine sensible column and table design based on what you know about these concepts. Keep it simple, but work out sensible relationships to keep tables reasonably sized. Include a date table. There are several tools online you can use, I'd recommend [_Draw.io_](https://www.drawio.com/) or [_LucidChart_](https://www.lucidchart.com/pages/).

!(<Bookstore Logical Model(VGuima).png>)


## Question 2
We want to create employee shifts, splitting up the day into morning and evening. Add this to the ERD.
(<Bookstore Logical Model(VGuima)-2.png>)

## Question 3
The store wants to keep customer addresses. Propose two architectures for the CUSTOMER_ADDRESS table, one that will retain changes, and another that will overwrite. Which is type 1, which is type 2?

_Hint, search type 1 vs type 2 slowly changing dimensions._
When a record in a dimension table changes, the current record is updated or replaced using SCD type 1. If not, the dimension table is updated with the new entry. This indicates that no previous data is kept and that all records in the dimension table always represent the current situation. 
SCD type 1 makes sure that the data represents the most recent current dimension and that there are no duplicate records in the table.In situations when only the present state is important, such as real-time dashboarding and predictive modeling, this is quite helpful.

But since the table only keeps the most recent information, the data practitioners are unable to compare changes in dimensions over time because the database only stores the most recent information. For instance, after the customer address was changed to the current one, a data analyst would likely have problems recognizing the old address.

SCD type 1 has limits when it comes to undertaking historical analyses, but it simplifies current state reporting and analytics.
It can be helpful to have a table that merely shows the present state, but there are situations in which tracking past changes to a dimension is practical—even necessary. When a dimension changes, SCD type 2 preserves historical data by creating a new row, appropriately designating it as current, and appropriately designating the newly historical record.


Bonus: Are there privacy implications to this, why or why not?
```
Your answer...
The preservation of historical data in files is not unethical; in fact, depending on the type of business, it may be necessary. The public expects and is a part of risk management to keep their information secure, and no longer than necessary.

## Question 4
Review the AdventureWorks Schema [here](https://i.stack.imgur.com/LMu4W.gif)

Highlight at least two differences between it and your ERD. Would you change anything in yours?
```
Your answer...
```

# Criteria

[Assignment Rubric](./assignment_rubric.md)

# Submission Information

🚨 **Please review our [Assignment Submission Guide](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md)** 🚨 for detailed instructions on how to format, branch, and submit your work. Following these guidelines is crucial for your submissions to be evaluated correctly.

### Submission Parameters:
* Submission Due Date: `June 1, 2024`
* The branch name for your repo should be: `model-design`
* What to submit for this assignment:
    * This markdown (design_a_logical_model.md) should be populated.
    * Two Entity-Relationship Diagrams (preferably in a pdf, jpeg, png format).
* What the pull request link should look like for this assignment: `https://github.com/<your_github_username>/sql/pull/<pr_id>`
    * Open a private window in your browser. Copy and paste the link to your pull request into the address bar. Make sure you can see your pull request properly. This helps the technical facilitator and learning support staff review your submission easily.

Checklist:
- [ ] Create a branch called `model-design`.
- [ ] Ensure that the repository is public.
- [ ] Review [the PR description guidelines](https://github.com/UofT-DSI/onboarding/blob/main/onboarding_documents/submissions.md#guidelines-for-pull-request-descriptions) and adhere to them.
- [ ] Verify that the link is accessible in a private browser window.

If you encounter any difficulties or have questions, please don't hesitate to reach out to our team via our Slack at `#cohort-3-help`. Our Technical Facilitators and Learning Support staff are here to help you navigate any challenges.
