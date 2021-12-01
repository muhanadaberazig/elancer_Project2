// import 'package:elancer_api/api/controllers/auth_api_controller.dart';
// import 'package:elancer_api/api/controllers/user_api_controller.dart';
// import 'package:elancer_api/models/category.dart';
// import 'package:flutter/material.dart';
//
// class CategoriesScreen extends StatefulWidget {
//   const CategoriesScreen({Key? key}) : super(key: key);
//
//   @override
//   _CategoriesScreenState createState() => _CategoriesScreenState();
// }
//
// class _CategoriesScreenState extends State<CategoriesScreen> {
//   late Future<List<Category>> _future;
//   List<Category> _categories = <Category>[];
//
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     _future = UserApiController().getCategories();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Colors.white,
//       appBar: AppBar(
//         title: Text('Categories'),
//         actions: [
//           IconButton(
//             onPressed: () async => await logout(context),
//             icon: const Icon(Icons.logout),
//           ),
//         ],
//       ),
//       body: FutureBuilder<List<Category>>(
//         future: _future,
//         builder: (context, snapshot) {
//           if (snapshot.connectionState == ConnectionState.waiting) {
//             return Center(child: CircularProgressIndicator());
//           } else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
//             _categories = snapshot.data ?? [];
//             return GridView.builder(
//               padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
//               itemCount: _categories.length,
//               gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
//                 crossAxisCount: 2,
//                 mainAxisSpacing: 10,
//                 crossAxisSpacing: 10,
//               ),
//               itemBuilder: (context, index) {
//                 return Card(
//                   elevation: 4,
//                   shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(10),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       CircleAvatar(
//                         radius: 40,
//                         backgroundImage: NetworkImage(_categories[index].image),
//                       ),
//                       const SizedBox(height: 15),
//                       Text(
//                         _categories[index].title,
//                         style: const TextStyle(
//                           color: Colors.black,
//                           fontWeight: FontWeight.bold,
//                         ),
//                       )
//                     ],
//                   ),
//                 );
//               },
//             );
//           } else {
//             return Center(
//               child: Column(
//                 children: const [
//                   Icon(Icons.warning, size: 80),
//                   Text(
//                     'NO DATA',
//                     style: TextStyle(
//                       color: Colors.grey,
//                       fontWeight: FontWeight.bold,
//                       fontSize: 24,
//                     ),
//                   )
//                 ],
//               ),
//             );
//           }
//         },
//       ),
//     );
//   }
//
//   Future<void> logout(BuildContext context) async {
//     bool loggedOut = await AuthApiController().logout();
//     if (loggedOut) Navigator.pushReplacementNamed(context, '/login_screen');
//   }
// }
