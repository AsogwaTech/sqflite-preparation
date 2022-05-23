

// import 'package:flutter/material.dart';
// import 'package:to_do_app_portfolio/model_class/model_class.dart';
// import 'package:to_do_app_portfolio/services/services.dart';
//
// class AddUserDetails extends StatefulWidget {
//   const AddUserDetails({Key? key}) : super(key: key);
//
//   @override
//   _AddUserDetailsState createState() => _AddUserDetailsState();
// }
//
// class _AddUserDetailsState extends State<AddUserDetails> {
//
//
// var  _services = Services();// creating the instance of the services class
//
//
//
//   var _userNameController = TextEditingController();
//   var _fullNameController = TextEditingController();
//   var _emailController = TextEditingController();
//   var _phoneNumberController = TextEditingController();
//
//   bool _validateUserName = false;
//   bool _validateFullName = false;
//   bool _validateEmail = false;
//   bool _validatePhoneNumber = false;
//
//
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('CRUD OPERATION'),
//       ),
//       body: SingleChildScrollView(
//         child: Container(
//           padding: EdgeInsets.all(16),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children:  [
//               const Text('ADD NEW MEMBER',
//               style: TextStyle(
//                 fontWeight: FontWeight.bold,
//                 color: Colors.black,
//               ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: _userNameController,
//                 decoration:  InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Enter your username',
//                   labelText: 'UserName',
//                   errorText: _validateUserName ? 'Username field should not be empty':null,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: _fullNameController,
//                 decoration:  InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Enter your full name',
//                   labelText: 'Full Name',
//                   errorText: _validateFullName ? 'Full Name field should not be empty':null,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 controller: _emailController,
//                 decoration:  InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Enter your Email address',
//                   labelText: 'Email ID',
//                   errorText: _validateEmail ? 'Email field should not be empty':null,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               TextField(
//                 obscureText: true,
//                 controller: _phoneNumberController,
//                 decoration:  InputDecoration(
//                   border: OutlineInputBorder(),
//                   hintText: 'Enter your password',
//                   labelText: 'UserName',
//                   errorText: _validatePhoneNumber ? 'Password field should not be empty':null,
//                 ),
//               ),
//               const SizedBox(height: 20),
//               Row(
//                 children: [
//                   TextButton(
//                     style: TextButton.styleFrom(
//                       primary: Colors.white,
//                       backgroundColor: Colors.tealAccent,
//                     ),
//                     onPressed: () async{
//                       setState(() {
//                         _userNameController.text.isEmpty ? _validateUserName = true : _validateUserName = false;
//                         _fullNameController.text.isEmpty ? _validateFullName = true : _validateFullName = false;
//                         _emailController.text.isEmpty ? _validateEmail = true : _validateEmail = false;
//                         _phoneNumberController.text.isEmpty ? _validatePhoneNumber = true : _validatePhoneNumber = false;
//                       });
//                       if (_validateUserName == false && _validateFullName == false && _validateEmail == false && _validatePhoneNumber == false){
//                         print('user added successfully');
//                         var _userSignIn = UserSignIn();// creating the instance of the model class
//                         _userSignIn.userName = _userNameController.text;
//                         _userSignIn.fullName = _fullNameController.text;
//                         _userSignIn.email = _emailController.text;
//                         _userSignIn.phoneNumber = _phoneNumberController.text;
//                         var result = await _services.SaveUser(_userSignIn);// inserting the user input to the database through the services
//                         print('i am ok');
//                         Navigator.pop(context,result);
//                       }
//                     },
//                     child: Text('Add user'),
//                   ),
//                   const SizedBox(width: 15),
//                   TextButton(
//                     style: TextButton.styleFrom(
//                       primary: Colors.white,
//                       backgroundColor: Colors.tealAccent,
//                     ),
//                       onPressed: () {
//                       _userNameController.text = '';
//                       _fullNameController.text = '';
//                       _emailController.text = '';
//                       _phoneNumberController.text = '';
//                       Navigator.pop(context);
//                       },
//                       child: Text('clear details'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }


import 'package:flutter/material.dart';

import '../model_class/model_class.dart';
import '../services/services.dart';

class AddUser extends StatefulWidget {
  const AddUser({Key? key}) : super(key: key);

  @override
  State<AddUser> createState() => _AddUserState();
}

class _AddUserState extends State<AddUser> {
  var _userNameController = TextEditingController();
  var _fullNameController = TextEditingController();
  var _emailController = TextEditingController();
  var _phoneNumberController = TextEditingController();
  bool _validateUserName = false;
  bool _validateFullName = false;
  bool _validateEmail = false;
  bool _validatePhoneNumber = false;
  var _userService=UserService();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQLite CRUD"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Add New User',
                style: TextStyle(
                    fontSize: 20,
                    color: Colors.teal,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _userNameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter UserName',
                    labelText: 'UserName',
                    errorText:
                    _validateUserName ? 'UserName Value Can\'t Be Empty' : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _fullNameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Full name',
                    labelText: 'Full Name',
                    errorText: _validateFullName
                        ? 'full name Value Can\'t Be Empty'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter Email address',
                    labelText: 'Email Id',
                    errorText: _validateEmail
                        ? 'Email Value Can\'t Be Empty'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              TextField(
                  controller: _phoneNumberController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: 'Enter phone number',
                    labelText: 'Phone Number',
                    errorText: _validatePhoneNumber
                        ? 'Phone Number Value Can\'t Be Empty'
                        : null,
                  )),
              const SizedBox(
                height: 20.0,
              ),
              Row(
                children: [
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.teal,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () async {
                        setState(() {
                          _userNameController.text.isEmpty
                              ? _validateUserName = true
                              : _validateUserName = false;
                          _fullNameController.text.isEmpty
                              ? _validateFullName = true
                              : _validateFullName = false;
                          _emailController.text.isEmpty
                              ? _validateEmail = true
                              : _validateEmail = false;
                          _phoneNumberController.text.isEmpty
                              ? _validatePhoneNumber = true
                              : _validatePhoneNumber = false;

                        });
                        if (_validateUserName == false &&
                            _validateFullName == false &&
                            _validateEmail == false && _validatePhoneNumber == false) {
                          // print("Good Data Can Save");
                          var _user = User();
                          _user.userName = _userNameController.text;
                          _user.fullName = _fullNameController.text;
                          _user.email = _emailController.text;
                          _user.phoneNumber = _phoneNumberController.text;
                          var result=await _userService.SaveUser(_user);
                          Navigator.pop(context,result);
                        }
                      },
                      child: const Text('Save Details')),
                  const SizedBox(
                    width: 10.0,
                  ),
                  TextButton(
                      style: TextButton.styleFrom(
                          primary: Colors.white,
                          backgroundColor: Colors.red,
                          textStyle: const TextStyle(fontSize: 15)),
                      onPressed: () {
                        _userNameController.text = '';
                        _fullNameController.text = '';
                        _emailController.text = '';
                        _phoneNumberController.text = '';
                      },
                      child: const Text('Clear Details'))
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}