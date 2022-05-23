
// import 'package:to_do_app_portfolio/model_class/model_class.dart';
//
// import '../repository/repository.dart';
//
// class Services {
//   late Repository _repository;
//   Services(){
//     _repository = Repository();
//   }
//
//   SaveUser(UserSignIn userSignIn)async{
//     return await _repository.insertData('sign', userSignIn.userSignInMap());
//   }
//   readAllUsers()async{
//     return await _repository.readData('sign');
//   }
// }

import '../model_class/model_class.dart';
import '../repository/repository.dart';

class UserService
{
  late Repository _repository;
  UserService(){
    _repository = Repository();
  }
  //Save User
  SaveUser(User user) async{
    return await _repository.insertData('users', user.userMap());
  }
  //Read All Users
  readAllUsers() async{
    return await _repository.readData('users');
  }
  //Edit User
  UpdateUser(User user) async{
    return await _repository.updateData('users', user.userMap());
  }

  deleteUser(userId) async {
    return await _repository.deleteDataById('users', userId);
  }

}