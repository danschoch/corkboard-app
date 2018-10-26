## Notes for Me -- DELETE BEFORE SUBMISSION

Notebook/Journal app

- Users have many notebooks
    - attr: username, email, password_digest
    - initial signup could suggest types of notebook (daily journal, reminder list, etc.)
        - signup flow: signup page(user info only) => success => inital notebooks view (includes default notebook choices and create custom notebooks)
    - option to create custom notebooks
- Notebooks belong to user, have many notes
    - attr:  name, description, user_id
    - contain instances of notes
    - description should be optional
- Notes belong to notebook
    - attr: title, content, notebook_id, datetime(?)
    - make content optional for reminder list, add datetime fpr due date?

TODO (as of 10/25):
 - add notes index view/action