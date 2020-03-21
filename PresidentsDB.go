package main
import(
  "database/sql"
  "database/database"
  "log"
  "net/http"
  "text/template"
  _ "github.com/go-sql-driver/mysql"
  "strconv"
//"strings"
)
//import packages

type President struct {
 Num int64
 LName string
 FName string
 MInitial string
 State string
 Party string
 Start int64
 End int64
 Term string
}
func dbConn() (db *sql.DB) {
  username := database.Usr()
  password := database.Pwd()
  db, err := sql.Open("mysql", username + ":" + password + "@/" + username)
  if err != nil {
        panic(err.Error())
  }
  return db
}

var tmpl = template.Must(template.ParseGlob("templates/*"))

func ChoosePresident2019(w http.ResponseWriter, r *http.Request) {
    db := dbConn()

	//NOTE:  This select statement assumes you still have a Formula table
    row, err := db.Query("SELECT number, lname, fname, mInitial, state, party, start, end, term  FROM presidents")
    if err != nil {
        panic(err.Error())
    }
    USPresidents :=[]President{}
    for row.Next(){
      var num, start, end int64
      var lname, fname, mInitial, state, party,term string
      err = row.Scan(&num,&lname,&fname,&mInitial,&state,&party,&start,&end,&term)
      if err != nil{
        panic(err.Error())
      }
      USPresidents = append(USPresidents, President{Num:num, LName:lname, FName:fname, MInitial:mInitial, State:state, Party:party, Start:start, End:end, Term:term})
    }
	tmpl.ExecuteTemplate(w, "choosePresidentDB2019.html", USPresidents)
	defer db.Close()
}
func ListPresident2019(w http.ResponseWriter, r *http.Request){
  db := dbConn()
  USPresidents := []President{}
if r.Method == "POST" {
  IDStr := r.FormValue("ID")
  if IDStr != "" {
    ID,_ := strconv.ParseInt(IDStr, 0, 64)
    row, err := db.Query("SELECT number, lname, fname, mInitial, state, party, start, end, term  FROM presidents where number=?",ID)
    if err != nil {
        panic(err.Error())
    }
     for row.Next(){
        var num, start, end int64
        var lname, fname, mInitial, state, party,term string
        err = row.Scan(&num,&lname,&fname,&mInitial,&state,&party,&start,&end,&term)
        if err != nil{
          panic(err.Error())
        }
        USPresidents = append(USPresidents, President{Num:num, LName:lname, FName:fname, MInitial:mInitial, State:state, Party:party, Start:start, End:end, Term:term})
      }
      }
    }


tmpl.ExecuteTemplate(w, "listPresidentDB2019.html", USPresidents)
defer db.Close()
}
func main() {
	//Replace 1111 with your localhost
	//Replace **********  with your webid
    log.Println("Server started on: http://localhost:8127")
    http.HandleFunc("/", ChoosePresident2019)
    http.HandleFunc("/listPresidentDB2019.html", ListPresident2019)
    http.Handle("/home/jtweedle/static/", http.StripPrefix("/home/jtweedle/static/", http.FileServer(http.Dir("static"))))
    http.ListenAndServe(":8127", nil)
}
