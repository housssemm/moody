import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:intl/intl.dart';
class Sign_out extends StatefulWidget {
  const Sign_out({Key? key}) : super(key: key);


  @override
  State<Sign_out> createState() => _Sign_outState();
}

class _Sign_outState extends State<Sign_out> {
  late final String _formattedDate;
  final TextEditingController _dateController = TextEditingController();
  @override
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
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: SingleChildScrollView(
        child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('can you complete this formula',
                          style: TextStyle(
                            fontSize: 18
                          ),
                      ),
                      Padding(
                      padding: EdgeInsets.fromLTRB(40.0, 40.0, 40.0, 0.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Center(
                            child:CircleAvatar(
                              //backgroundImage: AssetImage('assets/luffy.jpg'),
                              radius: 50.0,
                            ),

                          ),
                          Positioned(
                            bottom: 0,
                              child: InkWell(
                                child: Icon(Icons.add_circle),
                                onTap: (){
                               showModalBottomSheet(
                                   context: context, builder:  (context) =>  bottomSheet(context));
                                },
                              ),
                          ),
                        ],
                          ),
                    ),
                          SizedBox(
                            height: 10.0,
                          ),
                          //name
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextField(
                                 // controller: _emailController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'name',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          //age
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextField(
                                 // controller: _emailController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'age',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          //date de naicence
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextFormField(
                                 // controller: _dateController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Date of Birth',
                                  ),
                                  onTap: _selectDate,
                                ),
                              ),
                            ),
                          ),
                      SizedBox(height: 10.0),
                          //locaiton
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextField(
                                  // controller: _emailController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'location',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                           //phone number
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 25.0),
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                                child: TextField(
                                  // controller: _emailController,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'phone number',
                                  ),
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          ElevatedButton(
                            onPressed: (){},
                            child: Text('submit'),
                          ),
                          GestureDetector(
                            onTap: () {
                              FirebaseAuth.instance.signOut();

                                Navigator.of(context).pushReplacementNamed('/login_screen');

                            },
                            child: Icon( Icons.logout_outlined, ),
                          )


                        ],
                      ),
      ),




    );
  }
  Widget bottomSheet(BuildContext context) {
    Size size = MediaQuery
        .of(context)
        .size;
    return Container(
      width: double.infinity,
      height: size.height * 0.2,
      margin: const EdgeInsets.symmetric(
        vertical: 20,
        horizontal: 10,
      ),
      child: Column(
        children: [
          Text("Choose Profile Photo",
            style: TextStyle(
              fontSize: 20, fontWeight: FontWeight.bold,
            ),
          ),
          SizedBox(
            height: 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.image),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Gallery",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),)
                    ],
                  ),
                  onTap: () {
                    // takephoto(ImageSource.gallery);
                  }
              ),

              const SizedBox(
                width: 80,
              ),
              InkWell(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.camera),
                      SizedBox(
                        height: 5,
                      ),
                      Text("Camera",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),)
                    ],
                  ),
                  onTap: () {
                    //takephoto(ImageSource.camera);


                  }
              ),
            ],
          )
        ],
      ),
    );
  }
}


// Future<void> takephoto(ImageSource source) async {
//   final pickedImage = await  imagePicker.pickImage(source:source, imageQuality:100);
//  pickedFile=File(pickedImage!.path);
//  print(pickedFile);
// }
