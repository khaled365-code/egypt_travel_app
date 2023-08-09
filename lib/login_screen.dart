import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:ourprojectiti/login_cubit/eye_cubit.dart';

import 'create_account_screen.dart';


class Login extends StatelessWidget {


  var emailtext=TextEditingController();

  var passwordtext=TextEditingController();

  var loginformkey=GlobalKey<FormState>();

  @override
  Widget build(BuildContext context)
  {
    final cubit=context.read<EyeCubit>();
    return Scaffold(



       appBar: AppBar(
         backgroundColor: Colors.white,
         elevation: 0,
         systemOverlayStyle: const SystemUiOverlayStyle(
           statusBarColor: Colors.white,

         ),
       ),
      body:Form(
        key: loginformkey,
        child: Container(
          margin: const EdgeInsetsDirectional.only(top: 0),
          child: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,

              child:Column(
                  crossAxisAlignment: CrossAxisAlignment.start,

                  children: [

                    Container(
                      margin: const EdgeInsetsDirectional.only(start: 20,top: 5),
                      child: Row(

                        children:
                        [
                          Image.asset('assets/images/pyricon.jpg',
                            width: 80,
                            height: 50,
                            fit: BoxFit.contain,),
                          Container(
                              margin: const EdgeInsetsDirectional.only(start: 3,top: 20),
                              child: const Text('Egypt Travel',style: TextStyle(fontFamily:'flu',color: Colors.black,fontSize: 15,fontWeight: FontWeight.bold))),


                        ],
                      ),
                    ),
                    Container(
                      margin: const EdgeInsetsDirectional.only(start: 25,top: 45),
                      child: const Text('Welcome',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(height: 10),
                    Container(
                      margin: const EdgeInsetsDirectional.only(start: 25),
                      child: const Text('Back',style: TextStyle(color: Colors.black,fontSize: 30,fontWeight: FontWeight.bold)),

                    ),


                    const SizedBox(height: 35),

                   Padding(padding:const EdgeInsetsDirectional.only(start: 30,end: 30),

                   child: Column(
                     crossAxisAlignment: CrossAxisAlignment.start,

                     children: [

                      Container(

                          height:50,
                          child: TextFormField(
                              controller: emailtext,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value)
                              {
                                if(value!.isEmpty)
                                {
                                  return 'Emial address must be entered';
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                suffixIcon: Icon(
                                  Icons.email,
                                  color: Colors.black.withOpacity(.5),
                                ),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                labelText: 'Email Address',
                              ),
                            ),
                        ),

                        SizedBox(height: 25),
                       BlocBuilder<EyeCubit, EyeState>(
  builder: (context, state) {
    return Container(
                         height: 50,
                         child: TextFormField(
                           controller: passwordtext,
                           validator: (value)
                           {
                             if(value!.isEmpty)
                               {
                                  return 'Password must be entered';
                               }
                             return null;
                           },
                           keyboardType: TextInputType.visiblePassword,
                           obscureText: cubit.obsecurefun(),
                           decoration: InputDecoration(
                             suffixIcon:  BlocBuilder<EyeCubit, EyeState>(
  builder: (context, state) {
    return InkWell(
                               onTap: cubit.changeEye,

                                   child: Icon(
                                 Icons.remove_red_eye,color: Colors.black.withOpacity(.5),));
  },
),
                             border: OutlineInputBorder(
                               borderRadius: BorderRadius.circular(25)),
                             labelText: 'Password',



                           ),
                         ),
                       );
  },
),
                       const SizedBox(height: 20),
                       Container(
                           alignment: Alignment.center,
                           child: InkWell(
                             onTap: (){}, child: const Text('forgot password ?',style: TextStyle(fontFamily:'flu',color: Colors.grey,fontSize: 18)))),
                       const SizedBox(height: 20),

                       Container(
                         width: double.infinity,
                         height: 50,
                         decoration: BoxDecoration(
                           borderRadius: BorderRadius.circular(25),
                           border: Border.all(color: const Color(0xff8e3200)),
                           color: const Color(0xff8e3200),
                         ),
                         child: MaterialButton
                           (
                           onPressed: ()
                           {
                             if (loginformkey.currentState!.validate())
                               {
                                 print(emailtext.text);
                                 print(passwordtext.text);
                               }

                           },
                           child: const Text('sign in',style: TextStyle(color: Colors.white,fontSize: 18)),
                         ),
                       ),
                       const SizedBox(height: 25),

                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,

                         children: [
                           Container(
                             width: 120,
                             child: const Divider(
                               height: 20,
                               color: Colors.black,
                               thickness: 2,

                             ),
                           ),
                           const Text('   Or   ',style: TextStyle(fontSize: 15,fontWeight: FontWeight.bold,color: Colors.black),),
                           Container(
                             width: 120,
                             child: const Divider(
                               height: 20,
                               color: Colors.black,
                               thickness: 2,

                             ),
                           )

                         ],
                       ),
                       Container(
                         margin: const EdgeInsetsDirectional.only(start: 30,top: 5),
                         child: Row(
                           mainAxisAlignment:  MainAxisAlignment.center,
                           children: [
                             InkWell(
                            onTap:(){},
                               child: CircleAvatar(
                                 radius: 15,
                                 backgroundColor: Colors.white,
                                 child: Image.asset('assets/images/g.jpg',
                                   width: 100,
                                   height: 100,
                                 ),
                               ),
                             ),
                             const SizedBox(width: 30,),
                             InkWell(
                               onTap:(){},
                               child: CircleAvatar(
                                 radius: 20,
                                 backgroundColor: Colors.white,
                                 child: Image.asset('assets/images/insta1.jpg',
                                   width: 100,
                                   height: 100,
                                 ),
                               ),
                             ),
                             const SizedBox(width: 15,),
                             InkWell(
                               onTap:(){},
                               child: CircleAvatar(
                                 radius: 35,
                                 backgroundColor: Colors.white,
                                 child: Image.asset('assets/images/facebook.png',
                                   width: 100,
                                   height: 100,
                                 ),
                               ),
                             ),

                           ],
                         ),
                       ),
                       const SizedBox(height: 20),

                       Row(
                         mainAxisAlignment: MainAxisAlignment.center,
                         children: [
                           Text('New user ? ',style: TextStyle(color: Colors.black.withOpacity(.7),fontSize: 15),),
                           InkWell(
                               onTap: ()
                               {
                                 Navigator.push(context, MaterialPageRoute(builder: (context) => Createaccount() ));
                               },
                               child: Text('sign up',style: TextStyle(color: Colors.black.withOpacity(.8),fontSize: 15,fontWeight: FontWeight.bold),)),

                         ],
                       )


                     ],
                   ),
                   ),




                  ],





                ),
              ),
            ),
          ),
      ),



    );


  }
}