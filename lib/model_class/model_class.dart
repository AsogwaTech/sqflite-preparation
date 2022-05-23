

// class UserSignIn {
//   int? id;
//   String? userName;
//   String? fullName;
//   String? email;
//   String? phoneNumber;
//
//
//   userSignInMap(){
//     var map = Map<String, dynamic>();
//     map['id'] = id ?? null;
//     map['userName'] = userName!;
//     map['fullName'] = fullName!;
//     map['email'] = email!;
//     map['phoneNumber'] = phoneNumber!;
//
//   }
// }

//This helps us in transferring data between UI

class User{
  int? id;
  String? userName;
  String? fullName;
  String? email;
  String? phoneNumber;
  userMap() {// Map here is use in converting the field into map for the data operations
    var mapping = Map<String, dynamic>();
    mapping['id'] = id ?? null;
    mapping['userName'] = userName!;
    mapping['fullName'] = fullName!;
    mapping['email'] = email!;
    mapping['phoneNumber'] = phoneNumber!;
    return mapping;
  }
}