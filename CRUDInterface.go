package main

import (
    "database/sql"
    "log"
    "net/http"
    "text/template"
	"database/database"

    _ "github.com/go-sql-driver/mysql"
)

type Person struct {
    PersonID  int
    FirstName    string
    LastName  string
    Birthdate  string
    BirthCity  string
    BirthState string
    Region string
}

func dbConn() (db *sql.DB) {
  username := database.Usr()
  password := database.Pwd()
  db, err := sql.Open("mysql", username + ":" + password + "@/" + username)
  if err != nil {
        panic(err.Error())
  }
  return db
  return nil
}

var tmpl = template.Must(template.ParseGlob("templates/*"))

func Index(w http.ResponseWriter, r *http.Request) {
    db := dbConn()
    row, err := db.Query("SELECT PersonID, FirstName, LastName FROM people")
    if err != nil {
        panic(err.Error())
    }
    Results :=[]Person{}
    for row.Next(){
      var personID int
      var firstName,lastName string
      err = row.Scan(&personID,&firstName,&lastName)
      if err != nil{
        panic(err.Error())
      }
      Results = append(Results, Person{PersonID:personID, FirstName:firstName,LastName:lastName})
    }

    tmpl.ExecuteTemplate(w, "index.html", Results)
    defer db.Close()
}

func Create(w http.ResponseWriter, r *http.Request) {
    //Execute template that will provide a form for adding a person

	//UNCOMMENT LINE BELOW WHEN INSTRUCTED IN LAB
	tmpl.ExecuteTemplate(w, "create.html", nil)
}

func Add(w http.ResponseWriter, r *http.Request) {
    //This function is called AFTER the form in create.html is submitted
db := dbConn()
if r.Method == "POST"{
  fname := r.FormValue("FName")
  lname := r.FormValue("LName")
  bday := r.FormValue("BirthDate")
  bcity := r.FormValue("BirthCity")
  bstate := r.FormValue("BirthState")
  region := r.FormValue("Region")
  stmt, err := db.Prepare("INSERT INTO people(FirstName, LastName, Birthdate, BirthCity, BirthState, Region) VALUES(?, ?, ?, ?, ?, ?)")
  if err != nil{
    panic(err.Error())
  }
  stmt.Exec(fname,lname,bday,bcity,bstate,region)
  	log.Println("ADDED: Name: " + fname + " " + lname)
}

	//This function will add a person's information so "Post" fields from the form
	//Look back at your lab and homework on PresidentsDB for syntax to process form fields

	//Prepare a statement to Insert Into people
	//Execute statement using form values

		//Log updated information - will print to Command Line
		//Change my variable names firstName and lastName to what you defined then UNCOMMENT statement below
		



	//Defer closing database

	//UNCOMMENT LINES BELOW ONCE FUNCTION IS IMPLEMENTED
	defer db.Close()

	//****************Redirect to index.html "/"
  http.Redirect(w, r, "/", 301)

}

func Edit(w http.ResponseWriter, r *http.Request) {
	//This function is called AFTER a link to a specific person has been selected on the index.html page

    //Connect to your database using "db" as the name of your handler
	//This function is editing a person so "Get" their "id" from the query string
	//Using this "id", query your database to get this person's information
	//Create a "onePerson" slice of Person, adding the one row from your query to this slice



   //Execute template, sending results to edit.html and defer closing db
   //UNCOMMENT LINES BELOW ONCE FUNCTION IS IMPLEMENTED
   //tmpl.ExecuteTemplate(w, "edit.html", onePerson)
   //defer db.Close()
}

func Update(w http.ResponseWriter, r *http.Request) {
    //This function is called AFTER the form in edit.html is submitted

	//Connect to your database using "db" as the name of your handler
	//This function will update a person's information so "Post" fields from the form
	//Look back at your lab and homework on PresidentsDB for syntax to process form fields

	//Prepare a statement to Update people
	//Execute statement using form values




		//Log updated information - will print to Command Line
		//Change my variable names firstName and lastName to what you defined then UNCOMMENT statement below
		//log.Println("UPDATE: Name: " + firstName + " " + lastName + " | ID: " + pID)


	//Defer closing database

	//UNCOMMENT LINES BELOW ONCE FUNCTION IS IMPLEMENTED
	//defer db.Close()

	//****************Redirect to index.html "/"

}

func Delete(w http.ResponseWriter, r *http.Request) {
	//This function is called AFTER a link to a specific person has been selected on the index.html page

    //Connect to your database using "db" as the name of your handler
	//This function is deleting a person so "Get" their "id" from the query string
	//Using this "id", prepare a statement to Delete From people
	//Execute statement using "id" as the criterion



	//Log delete
    log.Println("DELETE")

	//Defer closing database

	//UNCOMMENT LINES BELOW ONCE FUNCTION IS IMPLEMENTED
	//defer db.Close()

	//****************Redirect to index.html "/"

}

func main() {
    log.Println("Server started on: http://localhost:8127")    //*****Replace 1111 with your port
    http.HandleFunc("/", Index)
    http.HandleFunc("/create.html", Create)
    http.HandleFunc("/add", Add)
    //http.HandleFunc("/edit.html", Edit)
    //http.HandleFunc("/update", Update)
    //http.HandleFunc("/delete.html", Delete)
    http.Handle("/home/jtweedle/static/", http.StripPrefix("/home/jtweedle/static/", http.FileServer(http.Dir("static"))))
    http.ListenAndServe(":8127", nil)			//**********Replace 1111 with your port
}
