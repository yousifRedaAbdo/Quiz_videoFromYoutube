import 'package:flutter/material.dart';
import 'package:taskk/MyApplication.dart';
import 'package:taskk/chosee/chose_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passowrdController = TextEditingController();

  late bool _passwordVisible;


  var formKey = GlobalKey<FormState>();

  @override
  void initState() {
    _passwordVisible = false;
  }

  @override
  Widget build(BuildContext context) {
          return Scaffold(
              appBar: AppBar(),
              body: Center(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Form(
                      key: formKey,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children:[
                          const Text(
                            'Login',
                            style: TextStyle(
                                fontSize: 40,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text(
                            'Login now to browser our hot offers',
                            style: TextStyle(
                                fontSize: 17,
                                fontWeight: FontWeight.bold,
                                color: Colors.black45
                            ),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextFormField(
                            controller: emailController,
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                                prefixIcon: Icon( Icons.email),
                                labelText: 'Email Address',
                                border: OutlineInputBorder()
                            ),
                            validator: (String? value)
                            {
                              if (value!.isEmpty ||
                                  !RegExp(r'^[\w-\.]+@gmail.com')
                                      .hasMatch(value)) {
                                return "Enter Correct email";
                              } else {
                                 return null;;
                              }
                            },
                          ),
                          const SizedBox(
                            height: 15,
                          ),
                          TextFormField(
                            controller: passowrdController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: !_passwordVisible,
                            onFieldSubmitted: (value)
                            {

                            },
                            decoration: InputDecoration(
                                prefixIcon: const Icon( Icons.lock),
                                suffixIcon:IconButton(
                            icon: Icon(
                            _passwordVisible
                            ? Icons.visibility
                              : Icons.visibility_off,
                            ),
                            onPressed: () {
                              setState(() {
                                _passwordVisible = !_passwordVisible;
                              });
                            },
                          ),
                                labelText: 'Password',
                                border: const OutlineInputBorder()
                            ),

                            validator: (String? value)
                            {
                              if(value!.isEmpty)
                              {
                                return 'password is too short';
                              }
                            },
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                           Container(
                              width: double.infinity,
                              height: 40,
                              child: ElevatedButton(
                                style: const ButtonStyle(
                                  alignment: Alignment.center,
                                ),
                                onPressed: (){
                                  if(formKey.currentState!.validate()) {
                                    myApplication.navigateToReplace(
                                        const ChoseScreene(), context);
                                  }
                                    },
                                child: const Text(
                                    "LOGIN",
                                    style:TextStyle(fontWeight: FontWeight.bold)
                                ),
                              ),
                            ),
                          const SizedBox(
                            height: 15,
                          ),
                          Container(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 10.0),
                              child: TextButton(
                                onPressed: () { },
                                child: const Text("Forgot Passowrd?"),
                              ),

                            ),
                          ),
                          Row(
                            children: [
                              const Text('Do not have an account?',style:TextStyle(fontWeight: FontWeight.bold)),
                              TextButton(
                                  onPressed: (){
                                  }, child: const Text("REGISTER"))
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              )
          );
        }
}
