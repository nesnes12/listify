import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:listify/home.dart';
import 'package:listify/signUp.dart';
import 'package:listify/utils/colors.dart';

import 'firebase_options.dart';


void main()  async {
  await Firebase.initializeApp(
  options: DefaultFirebaseOptions.currentPlatform,
);

  runApp(const MyApp());
}
 
class MyApp extends StatelessWidget {
 
 
  static const String _title = 'Welcome !';

  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      
      home: Scaffold(
        
        appBar: AppBar(
          backgroundColor: AppColors.greeney,
          centerTitle: true,
          title: const Text(
            _title,
              style: TextStyle(
                
                fontSize: 20,
                fontFamily: 'Font2'
          ),
        ),
        ),
      
         body: Stack(
          children: [
            Container(
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/pexels-karolina-grabowska-4862892.jpg'), 
                  fit: BoxFit.cover,
                ),
              ),
            ),
            const MyStatefulWidget(),
          ],
        ),
       
         
      ),
    );
  }
}
 
class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);
 
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}
 
class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool _obscurePassword = true;
   final FocusNode _focusNodeEmail = FocusNode();
  final FocusNode _focusNodePassword = FocusNode();
  final FocusNode _focusNodeConfirmPassword = FocusNode();
  final TextEditingController _controllerUsername = TextEditingController();
  final TextEditingController _controllerEmail = TextEditingController();
  final TextEditingController _controllerPassword = TextEditingController();
  final TextEditingController _controllerConFirmPassword =
      TextEditingController();
 
  @override
  Widget build(BuildContext context) {
    return Padding(
  
  padding: const EdgeInsets.all(10),
  child: ListView(
    
    children: <Widget>[
      Row( 
      
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
              AnimatedContainer(
            duration: const Duration(seconds: 1),
            curve: Curves.easeInOut,
            width: 200, 
            height: 200, 
            child: Image.asset('assets/images/LogoMakr-6X0gBn.png'),
          ),
          
        ],
      ),
      
      Container(
        padding: const EdgeInsets.all(10),
        child: TextFormField(
                
                keyboardType: TextInputType.name,
                decoration: InputDecoration(
                  labelText: "Username",
                  labelStyle: const TextStyle(color: Colors.black45,fontWeight: FontWeight.w400),
                  prefixIcon: const Icon(Icons.person_outline, color: AppColors.faderGreeney,),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.faderGreeney),
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                
                
              ),
      ),
      Container(
        padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
        child: TextFormField(
                controller: _controllerPassword,
                obscureText: _obscurePassword,
                focusNode: _focusNodePassword,
                keyboardType: TextInputType.visiblePassword,
                decoration: InputDecoration(
                  labelText: "Password",
                  floatingLabelStyle: const TextStyle(color: AppColors.greeney),
                  labelStyle: const TextStyle(color: Colors.black45,fontWeight: FontWeight.w400),
                  prefixIcon: const Icon(Icons.password_outlined, color: AppColors.faderGreeney,),
                  suffixIcon: IconButton(
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                      icon: _obscurePassword
                          ? const Icon(Icons.visibility_outlined,color: AppColors.faderGreeney)
                          : const Icon(Icons.visibility_off_outlined,color: AppColors.faderGreeney)),
                  border: OutlineInputBorder(
                    borderSide: const BorderSide(color: AppColors.greeney),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  enabledBorder: OutlineInputBorder(
                    
                    borderSide: const BorderSide(color: AppColors.faderGreeney),
                    borderRadius: BorderRadius.circular(10),
                    
                  ),
                ),
                validator: (String? value) {
                  if (value == null || value.isEmpty) {
                    return "Please enter password.";
                  } else if (value.length < 8) {
                    return "Password must be at least 8 character.";
                  }
                  return null;
                },
                
              ),
      ),
      TextButton(
        
        onPressed: () {
        },
        child: const Text('Forgot Your Password ?', style: TextStyle(color: AppColors.greeney, ),),
      ),
      Container(
      
        height: 50,
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: ElevatedButton( 
          
          style: ElevatedButton.styleFrom(
            minimumSize: const Size.fromHeight(50), backgroundColor: AppColors.greeney,
            shape: RoundedRectangleBorder(
                        
                        borderRadius: BorderRadius.circular(20),
                      ), 
          ),
          child: const Text('Login',style: TextStyle(
            fontSize: 18,

          )),
          onPressed: () {
            
            print(nameController.text);
            print(passwordController.text);
             Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const MyApp1()), 
      );
          },
        ),
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          const Padding(padding: EdgeInsets.only(top: 20)),
          const Text('Does not have an account?', style: TextStyle(color: Colors.black45,fontWeight: FontWeight.bold)),
          TextButton(
            
            child: const Text(
              'Sign up',
              style: TextStyle(fontSize: 15, color: AppColors.greeney),
            ),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Signup()),
              );
            },
          ),
        ],
      ),
    ],
  ),
);

        
  }
   @override
  void dispose() {
    _focusNodeEmail.dispose();
    _focusNodePassword.dispose();
    _focusNodeConfirmPassword.dispose();
    _controllerUsername.dispose();
    _controllerEmail.dispose();
    _controllerPassword.dispose();
    _controllerConFirmPassword.dispose();
    super.dispose();
  }
}

