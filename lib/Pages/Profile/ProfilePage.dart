import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Profile Page", style: TextStyle(
          fontSize: 25,
          fontFamily: "Poppins",
          fontWeight: FontWeight.w600,
          letterSpacing: 1.5,
        ),),
      ),
      body:  Column(
        children: [
          SizedBox(height: 10,),
              Align(
                child: ClipOval(
                  child: Image(image: AssetImage('Assets/Photos/1.png'),width: 200,height: 200,),),
              ),
          SizedBox(height: 10,),
          Container(
            color: Colors.blue,
            height: 70,
            child: Row(
              children: [
                Text('      Name :                    ',style: TextStyle(fontWeight:FontWeight.bold),),
                Text('Rewan Elmalah',style: TextStyle(fontWeight:FontWeight.bold),),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(color: Colors.blue,
            height: 70,
            child: Row(
              children: [
                Text('      Phone :                    ',style: TextStyle(fontWeight:FontWeight.bold),),
                Text('01205065796',style: TextStyle(fontWeight:FontWeight.bold),),
              ],
            ),
          ),
          SizedBox(height: 10,),
          Container(
            color: Colors.blue,
            height: 70,
            child: Row(
              children: [
                Text('      Email :                    ',style: TextStyle(fontWeight:FontWeight.bold),),
                Text('rwanmohamed86@icloud.com',style: TextStyle(fontWeight:FontWeight.bold),),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
