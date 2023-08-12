// import 'package:flutter/cupertino.dart'

import 'package:flutter/material.dart';
import 'package:mvvm/repo/api_status.dart';
import 'package:mvvm/repo/user_services.dart';

import '../model/Model.dart';

class UserViewModal extends ChangeNotifier{
  bool _loading =false;
  List<Model> _userListModel=[];
  // UserError _userError;
  bool get loading =>_loading;
  List<Model> get userListModel=>_userListModel;
  // UserError get userError=>_userError;

  setLoading(bool  loading)async{
    _loading=loading;
    notifyListeners();
  }
  setUserListMode(List<Model> userListModel){
    _userListModel=userListModel;

  }
  // setUserError(UserError userError){
  //   _userError=userError;
  //
  // }
  getUser() async{
    setLoading(true);
    var response= await UserServices.getUsers();
    if(response is Success){
      setUserListMode(response.response as List<Model>);
    }
    if(response is Failure){
      // UserError userError=UserError(
      //   code:response.code,
      //   message:response.errorResponse,
      // );
      // setUserError();
      // UserError userError=UserError();
    }
    setLoading(false);
  }

}