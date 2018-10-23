## Notes for Me -- DELETE BEFORE SUBMISSION

Notebook/Journal app

- Users have many notebooks
    - attr: username, email, password
    - initial signup could suggest types of notebook (daily journal, reminder list, etc.)
    - option to create custom notebooks
- Notebooks belong to user, have many notes
    - attr:  name, description, user_id
    - contain instances of notes
    - description should be optional
- Notes belong to notebook
    - attr: title, content, notebook_id, datetime(?)
    - make content optional for reminder list, add datetime?