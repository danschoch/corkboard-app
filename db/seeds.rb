#Users
@user1 = User.create(username: 'dantheman' , email: 'dan@dan.com' , password: 'password')
@user2 = User.create(username: 'inesthechick' , email: 'ines@ines.com' , password: 'password')
@user3 = User.create(username: 'bugthekitty', email: 'bug@bug.com' , password: 'password')

#Notebooks
@notebook1 = Notebook.create(name: "Journal #{@user1.id}", description: "Description for Journal #{@user1.id}", user_id: @user1.id)
@notebook2 = Notebook.create(name: "Journal #{@user1.id}-2", description: "Description for Journal #{@user1.id}-2", user_id: @user1.id)
@notebook3 = Notebook.create(name: "Journal #{@user2.id}", description: "Description for Journal #{@user2.id}", user_id: @user2.id)
@notebook4 = Notebook.create(name: "Journal #{@user2.id}-2", description: "Description for Journal #{@user2.id}-2", user_id: @user2.id)
@notebook5 = Notebook.create(name: "Journal #{@user3.id}", description: "Description for Journal #{@user3.id}", user_id: @user3.id)
@notebook6 = Notebook.create(name: "Journal #{@user3.id}-2", description: "Description for Journal #{@user3.id}-2", user_id: @user3.id)
@notebook7 = Notebook.create(name: "Journal #{@user3.id}-3", description: "Description for Journal #{@user3.id}-3", user_id: @user3.id)

#Notes
@note1 = Note.create(title: "Note #{@user1.id}", content: "Content for Note #{@user1.id}", user_id: @user1.id)
@note2 = Note.create(title: "Note #{@user1.id}-2", content: "Content for Note #{@user1.id}-2", user_id: @user1.id)
@note3 = Note.create(title: "Note #{@user2.id}", content: "Content for Note #{@user2.id}", user_id: @user2.id)
@note4 = Note.create(title: "Note #{@user2.id}-2", content: "Content for Note #{@user2.id}-2", user_id: @user2.id)
@note5 = Note.create(title: "Note #{@user3.id}", content: "Content for Note #{@user3.id}", user_id: @user3.id)
@note6 = Note.create(title: "Note #{@user3.id}-2", content: "Content for Note #{@user3.id}-2", user_id: @user3.id)
@note7 = Note.create(title: "Note #{@user3.id}-3", content: "Content for Note #{@user3.id}-3", user_id: @user3.id)

#Note Notebooks
NoteNotebook.create(note_id: @note1.id, notebook_id: @notebook2.id )
NoteNotebook.create(note_id: @note2.id, notebook_id: @notebook1.id )
NoteNotebook.create(note_id: @note3.id, notebook_id: @notebook4.id )
NoteNotebook.create(note_id: @note4.id, notebook_id: @notebook3.id )
NoteNotebook.create(note_id: @note5.id, notebook_id: @notebook6.id )
NoteNotebook.create(note_id: @note6.id, notebook_id: @notebook5.id )
NoteNotebook.create(note_id: @note7.id, notebook_id: @notebook5.id )