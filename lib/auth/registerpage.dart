import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:news_app/auth/showsnackbar.dart';

import '../HomePageController.dart';
import 'constants.dart';
import 'custome_button.dart';
import 'custome_textformfeild.dart';
class RegisterPage extends StatefulWidget {
  RegisterPage({super.key});
  static String id = 'registerPage';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  String? email;

  String? password;

  bool isLoading = false;

  GlobalKey<FormState> formKey=GlobalKey();

  @override
  Widget build(BuildContext context) {
    return  ModalProgressHUD(
      inAsyncCall: isLoading,
      child: Scaffold(
        backgroundColor: kPrimaryColor,
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          child: Form(
            key:formKey,
            child: ListView(
              children: [
                SizedBox(height: 75,),
                Image.asset('Assets/Photos/news.png',height: 100,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('News App',style: TextStyle(fontSize: 32,color: Colors.white,fontFamily: 'pacifico'),),
                  ],
                ),
                SizedBox(height: 75,),
                Row(
                  children: [
                    Text('REGISTER',style: TextStyle(fontSize: 24,color: Colors.white),),
                  ],
                ),
                SizedBox(height: 20,),
                CustomeTextFormFeild(
                  onChanged: (data){
                    email=data;
                  },
                  hintText: 'Email',
                ),
                SizedBox(height: 10,),
                CustomeTextFormFeild(
                  onChanged: (data){
                    password=data;
                  },
                  hintText: 'Password',
                ),
                SizedBox(height: 20,),
                CustomeButton(text: 'Register',
                  onTap: ()async{
                    if (formKey.currentState!.validate()) {
                      isLoading=true;
                      setState(() {

                      });
                      try{
                        await registerUser();
                        Navigator.pushReplacement(context, MaterialPageRoute(builder: (_)=>  HomePageController (),));

                      }on FirebaseAuthException catch(ex){
                        if (ex.code == 'weak-password') {
                          showSnackBarr(context,'weak password');
                        } else if (ex.code == 'email-already-in-use') {
                          showSnackBarr(context, 'email already exists');
                        }
                      }catch(ex){
                        showSnackBarr(context, 'there was an error');

                      }
                      isLoading = false;
                      setState(() {

                      });
                    }else{}
                  },

                ),
                SizedBox(height: 10,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('alreadt have an account ?',
                      style: TextStyle(color: Colors.white),),
                    GestureDetector(
                      onTap: (){
                        Navigator.pop(context);
                      },
                      child: Text(' Login',
                        style: TextStyle(color:Color(0xffC7EDE9)),),
                    ),],),],
            ),
          ),),),
    );}



  Future<void> registerUser() async {
    UserCredential user  =await FirebaseAuth.instance.createUserWithEmailAndPassword
      (email: email!, password: password!);
  }
}
