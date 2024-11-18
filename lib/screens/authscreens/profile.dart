// import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:get/get.dart';

class ProfileWidget extends StatefulWidget{
  const ProfileWidget({Key?key}) :super(key:key);
  @override

  State<ProfileWidget> createState()=> _ProfileWidgetState();
}

class _ProfileWidgetState extends State<ProfileWidget>
{
  final List<String> _places = ['Place 1', 'Place 2', 'Place 3']; // List of frequently visited places
  String? _selectedPlace; // Store selected place
  String? _selectedBloodGroup = 'A+';
  bool _isChecked=false;
  String? _selectedGender;
  DateTime? _selectedDate;

  final _formKey=GlobalKey<FormState>();
  final TextEditingController firstNameController=TextEditingController();
  final TextEditingController lastNameController=TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController  primarycontact= TextEditingController();
  final TextEditingController secondarycontact = TextEditingController();
  final TextEditingController _dateController=TextEditingController();
  final TextEditingController houseNumberController=TextEditingController();
  final TextEditingController cityController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController pincodeController =
  TextEditingController();
  final TextEditingController _bloodGroupController=TextEditingController();
  final TextEditingController _placeController=TextEditingController();
@override
void initState() {
  super.initState();
  _dateController.text = ""; // Optionally set an initial value
}
  Future<void> _selectDate(BuildContext context) async {
    DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      // Earliest date for selection
      lastDate: DateTime.now(), // Latest date for selection
    );


    if (pickedDate != null) {
      setState(() {
        _selectedDate = pickedDate;
        _dateController.text = DateFormat('yyyy-MM-dd').format(pickedDate);

      }
      );
    }
  }
  @override
Widget build(BuildContext context) {
  final double height = MediaQuery.of(context).size.height;
  return Scaffold(

    backgroundColor: Colors.white,
    body: SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, children:
       [
            Container(
              height: height * 0.12,
              padding: const EdgeInsets.only(top: 20.0),
              alignment: Alignment.center,
              decoration: const BoxDecoration
                (
                color: Color.fromARGB(255, 255, 244, 252),
              ),
              child: Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(FontAwesomeIcons.chevronLeft),
                  ),

                  Container(
                    margin: const EdgeInsets.fromLTRB(60, 0, 0, 0),
                    child: RichText(
                      text: TextSpan(
                          style: GoogleFonts.comfortaa
                            (
                            fontSize: 30.0,
                            color: Colors.black,
                          ),

                          children: const <TextSpan>[
                            TextSpan(
                              text: 'Aura',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Color(0xFFfba7fc),
                              ),
                            ),
                            TextSpan(
                              text: 'Secure',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                          ]
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Row(
                children: [
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFedf0f8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextFormField(
                        controller: firstNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your first name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Your First Name",
                          hintStyle: GoogleFonts.comfortaa(
                              color: const Color(0xFFb2b7bf), fontSize: 15.0),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Flexible(
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 2.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFedf0f8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: TextFormField(
                        controller: lastNameController,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your last name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Enter Your Last Name",
                          hintStyle: GoogleFonts.comfortaa(
                              color: const Color(0xFFb2b7bf), fontSize: 15.0),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                padding:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFedf0f8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                      return 'Please enter a valid email address';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "Enter Your Email id",
                    hintStyle: GoogleFonts.comfortaa(
                        color: const Color(0xFFb2b7bf), fontSize: 15.0),
                  ),
                ),
              ),
            ),




            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                padding:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFedf0f8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(border: InputBorder.none),
                  hint: Text(
                    "Select Your Gender",
                    style: GoogleFonts.comfortaa(
                      color: const Color(0xFFb2b7bf),
                      fontSize: 15.0,
                    ),
                  ),
                  value: _selectedGender,
                  items: ['Male', 'Female', 'Other']
                      .map((gender) =>
                      DropdownMenuItem<String>(
                        value: gender,
                        child: Text(gender),
                      ))
                      .toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedGender = value;
                    });
                  },
                  validator: (value) =>
                  value == null ? "Please select your gender" : null,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                padding: const EdgeInsets.symmetric(
                    vertical: 2.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFedf0f8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: TextFormField(
                  controller: _dateController,
                  readOnly: true,
                  // This makes the field non-editable
                  decoration: InputDecoration(
                    hintText: "Select Your Date of Birth",
                    hintStyle: GoogleFonts.comfortaa(
                      color: const Color(0xFFb2b7bf),
                      fontSize: 15.0,
                    ),
                    border: InputBorder.none,
                    suffixIcon: Icon(Icons.calendar_today, color: Color(
                        0xFFb2b7bf)),
                  ),
                  onTap: () {
                    _selectDate(context);
                  },
                  validator: (value) =>
                  value == null || value.isEmpty
                      ? "Please select your date of birth"
                      : null,
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                padding:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFedf0f8), // Light background color
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                child: TextFormField(
                  controller: houseNumberController, // Assign the controller
                  keyboardType:
                  TextInputType.number, // Input type restricted to numbers
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter house number or flat';
                    }
                    if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                      return 'Please enter a valid house number'; // Only allows numbers
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none, // Remove the default underline
                    hintText: "House Number/flat/building", // Placeholder text
                    hintStyle: GoogleFonts.comfortaa(
                      color: const Color(0xFFb2b7bf), // Placeholder text color
                      fontSize: 15.0, // Placeholder text size
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                padding:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFedf0f8), // Light background color
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                child: TextFormField(
                  controller: cityController, // Assign the controller
                  keyboardType:
                  TextInputType.number, // Input type restricted to numbers
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your city or village name';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none, // Remove the default underline
                    hintText: "City /Village Name", // Placeholder text
                    hintStyle: GoogleFonts.comfortaa(
                      color: const Color(0xFFb2b7bf), // Placeholder text color
                      fontSize: 15.0, // Placeholder text size
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                padding:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFedf0f8), // Light background color
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                child: TextFormField(
                  controller: landmarkController, // Assign the controller
                  keyboardType:
                  TextInputType.number, // Input type restricted to numbers
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Landmark';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: InputBorder.none, // Remove the default underline
                    hintText: " Enter Your Landmark", // Placeholder text
                    hintStyle: GoogleFonts.comfortaa(
                      color: const Color(0xFFb2b7bf), // Placeholder text color
                      fontSize: 15.0, // Placeholder text size
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                padding:
                const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFedf0f8), // Light background color
                  borderRadius: BorderRadius.circular(8), // Rounded corners
                ),
                child: TextFormField(
                  controller: pincodeController, // Assign the controller
                  keyboardType: TextInputType.number,
                  maxLength: 6, // Input type restricted to numbers
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your Pincode';
                    }
                    if (value.length < 6) {
                      return 'Please enter 6 digits pincode';
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    counterText: "", //hide the charectercounter
                    border: InputBorder.none, // Remove the default underline
                    hintText: "Enter Pincode", // Placeholder text
                    hintStyle: GoogleFonts.comfortaa(
                      color: const Color(0xFFb2b7bf), // Placeholder text color
                      fontSize: 15.0, // Placeholder text size
                    ),
                  ),
                ),
              ),
            ),

            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                decoration: BoxDecoration(
                  color: const Color(0xFFedf0f8),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonFormField<String>(
                  decoration: const InputDecoration(border: InputBorder.none),
                  hint: Text(
                    "Select Your Blood Group",
                    style: GoogleFonts.comfortaa(
                      color: const Color(0xFFb2b7bf),
                      fontSize: 15.0,
                    ),
                  ),
                  value: _selectedBloodGroup,
                  items: ['A+', 'A-', 'B+', 'B-', 'AB+', 'AB-', 'O+', 'O-']
                      .map((bloodGroup) => DropdownMenuItem<String>(
                    value: bloodGroup,
                    child: Text(bloodGroup),
                  ))
                      .toList(),
                  onChanged: (String? value) {
                    setState(() {
                      _selectedBloodGroup = value;
                    }
                    );
                  },
                  validator: (value) =>
                  value == null ? "Please select your blood group" : null,
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Container(
                      padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                      decoration: BoxDecoration(
                        color: const Color(0xFFedf0f8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      
                child:TextFormField(
                  controller :_placeController,
                  keyboardType:TextInputType.number,
                  validator:(String?value){
                    if(value==null||value.isEmpty)
                    {
                       return "Please Enter your freaquently visited Place";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border:InputBorder.none,
                 hintText: " Enter your freaquently visited place", // Placeholder text
                    hintStyle: GoogleFonts.comfortaa(
                      color: const Color(0xFFb2b7bf), // Placeholder text color
                      fontSize: 15.0,
                  )
                  ),
                )
              ),
            ),



          ],
          ),
        ),
      ),
    ),
  );
}

}




















// class Profile extends StatelessWidget {
//   const Profile({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//
//   }
// }
