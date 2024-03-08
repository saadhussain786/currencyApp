import 'dart:io';

import 'package:currencyexchange1/Widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final emailController=TextEditingController();
  final passwordController=TextEditingController();
  final phoneController=TextEditingController();
  final fnameController=TextEditingController();
  final lnameController=TextEditingController();
  String selectedGender='Male';
  File? personProfile;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
          child: SingleChildScrollView(
            physics:const BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Register',style: TextStyle(
                    color: Colors.deepPurple,
                    fontSize: 30
                ),),
                SizedBox(height: 30,),
                GestureDetector(
                  onTap: () async{
                    XFile? selectedImage=await ImagePicker().pickImage(source: ImageSource.gallery);
                    if(selectedImage!=null)
                      {
                        File convertFile=File(selectedImage.path);
                        setState(() {
                          personProfile=convertFile;
                        });
                      }
                    else
                      {
                        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('No Image select')));
                      }
                  },
                  child: CircleAvatar(
                    backgroundImage: FileImage(personProfile!),
                    radius: 90,
                    backgroundColor: Colors.deepPurple,
                  ),
                ),
                SizedBox(height: 30,),
                CustomTextField(controller: fnameController,
                    label: "First Name", icon: Icons.drive_file_rename_outline, isHide: false, hintText: "Enter your first name"),
                SizedBox(height: 30,),
                CustomTextField(controller: lnameController,
                    label: "Last Name", icon: Icons.drive_file_rename_outline, isHide: false, hintText: "Enter your last name"),
                SizedBox(height: 30,),
                CustomTextField(controller: emailController,
                    label: "Email", icon: Icons.email_outlined, isHide: false, hintText: "Enter your email"),
                SizedBox(height: 30,),
                CustomTextField(controller: phoneController,
                    label: "Phone", icon: Icons.phone, isHide: false, hintText: "Enter your phone"),
                SizedBox(height: 30,),
                DropdownButtonFormField(
                    value: selectedGender,
                    onChanged: (newGender)
                {
                  setState(() {
                    selectedGender=newGender!;
                  });
                },
                items: ['Male','Female','Ohter'].map((String value){
                  return DropdownMenuItem(child: Text('$value'),value: value,);
                }).toList(),
                  decoration: InputDecoration(
                    border: OutlineInputBorder()
                  ),
                ),
                SizedBox(height: 30,),
                CustomTextField(controller: passwordController,
                    label: "Password", icon: Icons.password, isHide: true, hintText: "Enter your password"),
                SizedBox(height: 30,),
                SizedBox(
                    height: 40.0,
                    width: 250,
                    child: ElevatedButton(onPressed: (){}, child:Text('Sign In')))
              ],
            ),
          ),
        ),
      ),
    );
  }
}


