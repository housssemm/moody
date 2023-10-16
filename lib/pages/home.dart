
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:moody/pages/quiz.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter/services.dart';


class Home extends StatefulWidget {
  // File? pickedFile;
  // ImagePicker imagePicker = ImagePicker();
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late User user;

  late String email;

  late String username;

  late String name;

  late final String _formattedDate;
  final TextEditingController _dateController = TextEditingController();

  @override
  void initState() {
    super.initState();
    user = FirebaseAuth.instance.currentUser!;
    email = user.email!;
    username = email.substring(0, email.indexOf('@'));
    name = username.split('.').map((word) => capitalize(word)).join(' ');

    _formattedDate = DateFormat('yyyy-MM-dd ').format(DateTime.now());
  }

  String capitalize(String word) {
    return '${word[0].toUpperCase()}${word.substring(1)}';
  }

  @override
  void dispose() {
    _dateController.dispose();
    super.dispose();
    SystemChrome.setEnabledSystemUIMode(
        SystemUiMode.manual, overlays: SystemUiOverlay.values);
  }

  Future<void> _selectDate() async {
    DateTime? selectedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    );
    if (selectedDate != null) {
      String formattedDate = DateFormat('dd/MM/yyyy').format(selectedDate);
      _dateController.text = formattedDate;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


        body: ListView(children: [
          Container(
              width: MediaQuery
                  .of(context)
                  .size
                  .width,
              height: MediaQuery
                  .of(context)
                  .size
                  .height,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/bg.png"),
                  fit: BoxFit.cover,
                ),
              ),
              child: Column(
                children: [
                  SizedBox(
                      height: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            alignment: Alignment.centerRight,
                            padding: EdgeInsets.only(right: 60),
                            child: Column(
                              children: [
                                Text('Hi !$name',
                                    style: textStyle(
                                        40, FontWeight.w800, Colors.white)),

                              ],
                            ),
                          )
                        ],
                      )),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
                    height: MediaQuery
                        .of(context)
                        .size
                        .height - 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.vertical(
                          top: Radius.circular(30)),
                      color: Colors.white,
                    ),
                    child: Column(children: [
                      mainCard(context),
                      SizedBox(height: 40),
                      Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context, builder: (context) =>
                                    AlertDialog(
                                      title: Text('deppresed'),
                                      content: Text(
                                          "let's found out the issue"),
                                      actions: [
                                        TextButton(onPressed: () {
                                          Navigator.pop(context);
                                        },
                                          child: Text('no'),),
                                        TextButton(onPressed: () {
                                          Navigator.pushNamed(context, '/quiz');
                                        },
                                          child: Text('yes'),),
                                      ],
                                    ),
                                );
                              },
                              child: regularCard('assets/deppresed.svg',
                                  'depressed'),
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context, builder: (context) =>
                                    AlertDialog(
                                      title: Text('angry'),
                                      content: Text(
                                          "- Take a deep breath and count to ten: This can help you calm down and take a moment to think before reacting impulsively."),
                                      actions: [
                                        TextButton(onPressed: () {
                                          Navigator.pop(context);
                                        },
                                          child: Text('close'),),
                                      ],
                                    ),
                                );
                              },
                              child: regularCard('images/angry.svg', 'angry'),
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                  context: context, builder: (context) =>
                                    AlertDialog(
                                      title: Text('bored'),
                                      content: Text(
                                          "Engage in a hobby: If you have a hobby that you enjoy, such as painting, writing, or playing an instrument, try spending some time doing that."),
                                      actions: [
                                        TextButton(onPressed: () {
                                          Navigator.pop(context);
                                        },
                                          child: Text('close'),),
                                      ],
                                    ),
                                );
                              },
                              child: regularCard('images/bored.svg', 'bored'),
                            ),
                          ]),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () {
                              showDialog(context: context, builder: (context) =>
                                  AlertDialog(
                                    title: Text('happy'),
                                    content: Text('keep your smile senshine'),
                                    actions: [
                                      TextButton(onPressed: () {
                                        Navigator.pop(context);
                                      },
                                        child: Text('close'),),
                                    ],
                                  ),
                              );
                            },
                            child: regularCard('assets/happy.svg', 'happy'),
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(context: context, builder: (context) =>
                                  AlertDialog(
                                    title: Text('fine'),
                                    content: Text(
                                        "let's improve that and make it even better"),
                                    actions: [
                                      TextButton(onPressed: () {
                                        Navigator.pop(context);
                                      },
                                        child: Text('no'),),
                                      TextButton(onPressed: () {
                                        Navigator.pushNamed(context, '/quiz');
                                      },
                                        child: Text('yes'),),
                                    ],
                                  ),
                              );
                            },
                            child: regularCard('assets/fine.svg', 'fine'),
                          ),
                          GestureDetector(
                            onTap: () {
                              showDialog(context: context, builder: (context) =>
                                  AlertDialog(
                                    title: Text('confused'),
                                    content: Text("letus find out togather"),
                                    actions: [
                                      TextButton(onPressed: () {
                                        Navigator.pop(context);
                                      },
                                        child: Text('no'),),
                                      TextButton(onPressed: () {
                                        Navigator.pushNamed(context, '/quiz');
                                      },
                                        child: Text('yes'),),
                                    ],
                                  ),
                              );
                            },
                            child: regularCard('assets/idk.svg', 'confused'),
                          ),
                        ],
                      )
                    ]),
                  ),
                ],
              )),
        ]));
  }

  SizedBox regularCard(String iconName, String cardLabel) {
    return SizedBox(
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Container(
          padding: EdgeInsets.symmetric(horizontal: 25, vertical: 30),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.grey[100],
            boxShadow: [
              BoxShadow(
                  color: Colors.grey, offset: Offset.zero, blurRadius: 20)
            ],
          ),
          child: SvgPicture.asset(iconName, width: 50),
        ),
        SizedBox(height: 5),
        Text(cardLabel,
            textAlign: TextAlign.center,
            style: textStyle(16, FontWeight.w600, Colors.black))
      ]),
    );
  }

  Container mainCard(context) {
    return Container(
        padding: EdgeInsets.only(left: 20, right: 20, top: 20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.grey[100],
          boxShadow: [
            BoxShadow(
                color: Colors.grey, offset: Offset.zero, blurRadius: 20)
          ],
        ),
        child: Row(children: [
          Container(
            alignment: Alignment.bottomCenter,
            width: (MediaQuery
                .of(context)
                .size
                .width - 80) / 2,
            height: 140,
            child: Image.asset(
              "assets/doctor.png",
            ),
          ),
          SizedBox(
            width: (MediaQuery
                .of(context)
                .size
                .width - 80) / 2,
            height: 150,
            child:
            Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Text('How do you feel today ',
                  style: textStyle(24, FontWeight.w800, Colors.black)),
              SizedBox(height: 16),
              Text('can you choose your mood',
                  style: textStyle(16, FontWeight.w800, Colors.grey))
            ]),
          ),
        ]));
  }

  TextStyle textStyle(double size, FontWeight fontWeight, Color colorName) =>
      TextStyle(
        fontFamily: 'QuickSand',
        color: colorName,
        fontSize: size,
        fontWeight: fontWeight,
      );

  // Widget bottomSheet(BuildContext context) {
  //   Size size = MediaQuery
  //       .of(context)
  //       .size;
  //   return Container(
  //     width: double.infinity,
  //     height: size.height * 0.2,
  //     margin: const EdgeInsets.symmetric(
  //       vertical: 20,
  //       horizontal: 10,
  //     ),
  //     child: Column(
  //       children: [
  //         Text("Choose Profile Photo",
  //           style: TextStyle(
  //             fontSize: 20, fontWeight: FontWeight.bold,
  //           ),
  //         ),
  //         SizedBox(
  //           height: 50,
  //         ),
  //         Row(
  //           mainAxisAlignment: MainAxisAlignment.center,
  //           children: [
  //             InkWell(
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Icon(Icons.image),
  //                     SizedBox(
  //                       height: 5,
  //                     ),
  //                     Text("Gallery",
  //                       style: TextStyle(
  //                         fontSize: 20,
  //                         fontWeight: FontWeight.bold,
  //                       ),)
  //                   ],
  //                 ),
  //                 onTap: () {
  //                   // takephoto(ImageSource.gallery);
  //                 }
  //             ),
  //
  //             const SizedBox(
  //               width: 80,
  //             ),
  //             InkWell(
  //                 child: Column(
  //                   mainAxisAlignment: MainAxisAlignment.center,
  //                   children: [
  //                     Icon(Icons.camera),
  //                     SizedBox(
  //                       height: 5,
  //                     ),
  //                     Text("Camera",
  //                       style: TextStyle(
  //                         fontSize: 20,
  //                         fontWeight: FontWeight.bold,
  //                       ),)
  //                   ],
  //                 ),
  //                 onTap: () {
  //                   //takephoto(ImageSource.camera);
  //
  //
  //                 }
  //             ),
  //           ],
  //         )
  //       ],
  //     ),
  //   );
  // }

}