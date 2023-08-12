import 'package:flutter/material.dart';
import 'package:mvvm/viewmodal/user_view_modal.dart';
import 'package:provider/provider.dart';

class UI extends StatefulWidget {
  const UI({Key? key}) : super(key: key);

  @override
  State<UI> createState() => _UIState();
}

class _UIState extends State<UI> {
  @override
  Widget build(BuildContext context) {
    UserViewModal userViewModal=context.watch<UserViewModal>();
    return Scaffold(
      body: Container(
        child: Column(children: [
          _ui(userViewModal)
        ]),
      )

    );
  }
  _ui(UserViewModal userViewModal){
    if(userViewModal.loading)
    {
      return Container();
    }
    // if(userViewModal.userError !=null){
    //   return Container();
    // }
    return Expanded(child: ListView.separated(
        itemBuilder: (context,index){
          return Container(
          );
        },
        separatorBuilder: (context,index)=>Divider(),
        itemCount: userViewModal.userListModel.length));
  }
}

