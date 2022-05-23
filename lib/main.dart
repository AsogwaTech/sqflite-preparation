// import 'package:flutter/material.dart';
// import 'package:to_do_app_portfolio/model_class/model_class.dart';
// import 'package:to_do_app_portfolio/pages/add_user_details.dart';
// import 'package:to_do_app_portfolio/services/services.dart';
//
// void main() {
//   runApp(const MyApp());
// }
//
// class MyApp extends StatelessWidget {
//   const MyApp({Key? key}) : super(key: key);
//
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         primarySwatch: Colors.blue,
//       ),
//       home: const MyHomePage(title: 'Flutter Demo Home Page'),
//     );
//   }
// }
//
// class MyHomePage extends StatefulWidget {
//   const MyHomePage({Key? key, required this.title}) : super(key: key);
//
//   final String title;
//
//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }
//
// class _MyHomePageState extends State<MyHomePage> {
//
//
//
//   late List<UserSignIn> _userList = <UserSignIn>[];
//   final _services = Services();//creating an instance of the service
//
//
//   getAllUserDetails() async {
//     var users = await _services.readAllUsers();
//     _userList = <UserSignIn>[];
//     users.forEach((userSignIn) {
//       setState(() {
//         var userModel = UserSignIn();// creating the instance of the model class
//         userModel.id = userSignIn['id'];
//         userModel.userName = userSignIn['userName'];
//         userModel.fullName = userSignIn['fullName'];
//         userModel.email = userSignIn['email'];
//         userModel.phoneNumber = userSignIn['phoneNumber'];
//         _userList.add(userModel);
//       });
//     });
//   }
//
//
//   @override
//   void initState() {
//     getAllUserDetails();
//     super.initState();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('user data'),
//       ),
//       body:ListView.builder(
//       itemCount: _userList.length,
//       itemBuilder: (context, index){
//         return Card(
//         child:Column(
//           children: [
//             Text(_userList[index].userName ?? ''),
//             Text(_userList[index].fullName ?? ''),
//             Text(_userList[index].email ?? ''),
//             Text(_userList[index].phoneNumber ?? ''),
//           ],
//         ),
//
//         );
//     }
//     ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: (context) => const AddUserDetails()))
//               .then((data) {
//             if (data != null) {
//               getAllUserDetails();
//               // _showSuccessSnackBar('User Detail Added Success');
//             }
//           });
//         },
//         child: const Icon(Icons.add),
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app_portfolio/pages/add_user_details.dart';
import 'package:to_do_app_portfolio/services/services.dart';

import 'model_class/model_class.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<User> _userList = <User>[];
  final _userService = UserService();// creating an object of the user service

  getAllUserDetails() async {
    var users = await _userService.readAllUsers();
    _userList = <User>[];
    users.forEach((user) {
      setState(() {
        var userModel = User();
        userModel.id = user['id'];
        userModel.userName = user['userName'];
        userModel.fullName = user['fullName'];
        userModel.email = user['email'];
        userModel.phoneNumber = user['phoneNumber'];
        _userList.add(userModel);
      });
    });
  }

  @override
  void initState() {
    getAllUserDetails();
    super.initState();
  }

  _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }

  _deleteFormDialog(BuildContext context, userId) {
    return showDialog(
        context: context,
        builder: (param) {
          return AlertDialog(
            title: const Text(
              'Are You Sure to Delete',
              style: TextStyle(color: Colors.teal, fontSize: 20),
            ),
            actions: [
              TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white, // foreground
                      backgroundColor: Colors.red),
                  onPressed: ()  async{
                    var result=await _userService.deleteUser(userId);
                    if (result != null) {
                      Navigator.pop(context);
                      getAllUserDetails();
                      _showSuccessSnackBar(
                          'User Detail Deleted Success');
                    }
                  },
                  child: const Text('Delete')),
              TextButton(
                  style: TextButton.styleFrom(
                      primary: Colors.white, // foreground
                      backgroundColor: Colors.teal),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Close'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("SQLite CRUD"),
      ),
      body: ListView.builder(
          itemCount: _userList.length,
          itemBuilder: (context, index) {
            return Card(
              child:Container(
                margin: EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(_userList[index].userName ?? ''),
                    SizedBox(height: 15),
                    Text(_userList[index].fullName ?? ''),
                    SizedBox(height: 15),
                    Text(_userList[index].email ?? ''),
                    SizedBox(height: 15),
                    Text(_userList[index].phoneNumber ?? ''),
                  ],
                ),
              )
              // ListTile(
              //   onTap: () {
              //     Navigator.push(
              //         context,
              //         MaterialPageRoute(
              //             builder: (context) => ViewUser(
              //               user: _userList[index],
              //             )));
              //   },
              //   leading: const Icon(Icons.person),
              //   title: Text(_userList[index].name ?? ''),
              //   subtitle: Text(_userList[index].contact ?? ''),
              //   trailing: Row(
              //     mainAxisSize: MainAxisSize.min,
              //     // children: [
              //     //   // IconButton(
              //     //   //     onPressed: () {
              //     //   //       Navigator.push(
              //     //   //           context,
              //     //   //           MaterialPageRoute(
              //     //   //               builder: (context) => EditUser(
              //     //   //                 user: _userList[index],
              //     //   //               ))).then((data) {
              //     //   //         if (data != null) {
              //     //   //           getAllUserDetails();
              //     //   //           _showSuccessSnackBar(
              //     //   //               'User Detail Updated Success');
              //     //   //         }
              //     //   //       });
              //     //   //       ;
              //     //   //     },
              //     //   //     icon: const Icon(
              //     //   //       Icons.edit,
              //     //   //       color: Colors.teal,
              //     //   //     )),
              //     //   // IconButton(
              //     //   //     onPressed: () {
              //     //   //       _deleteFormDialog(context, _userList[index].id);
              //     //   //     },
              //     //   //     icon: const Icon(
              //     //   //       Icons.delete,
              //     //   //       color: Colors.red,
              //     //   //     ))
              //     // ],
              //   ),
              // ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => const AddUser()))
              .then((data) {
            if (data != null) {
              getAllUserDetails();
              _showSuccessSnackBar('User Detail Added Success');
            }
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
