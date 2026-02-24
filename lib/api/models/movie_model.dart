// id : 1
// name : "Leanne Graham"
// username : "Bret"
// email : "Sincere@april.biz"


class MovieModel {
// step 1 create variable tor the parameters

int id;
String name;
String username;
String email;

//step 2 create constructor

MovieModel ( {
this.id = 0,
this.name = "",
this.username = "",
this.email = "",
});

// 3RD factory method for parsing and returning class object 
factory MovieModel.fromJSON (Map map) {
  return MovieModel(
    id : map ['id'] ?? 0,
    name : map ['name'] ?? "",
    username : map ['username'] ?? "",
    email : map ['email'] ?? "",
    );

}
}