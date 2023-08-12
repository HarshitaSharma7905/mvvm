import 'package:flutter/material.dart';
import 'package:mvvm/view/ui.dart';
import 'package:mvvm/viewmodal/user_view_modal.dart';
import 'package:provider/provider.dart';

void main(){
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (_)=>UserViewModal())
    ],child: MaterialApp(home: UI()));

  }
}


