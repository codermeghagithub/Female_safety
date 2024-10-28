import 'package:aurasecure/screens/Dashboard.dart';

import 'package:aurasecure/screens/authscreens/SignpuScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';
import 'package:country_code_picker/country_code_picker.dart';

class Loginscreen extends StatefulWidget {
  const Loginscreen({super.key});

  @override
  State<Loginscreen> createState() => _LoginscreenState();
}

class _LoginscreenState extends State<Loginscreen> {
  String? selectedCountryCode; // Default country code
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  bool _isPasswordVisible = false;
  String? _validationMessage;

  // Validator method for password
  String? passwordValidator(String? value) {
    // Regular expression for password validation
    final RegExp passwordRegEx = RegExp(
      r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$',
    );

    if (value == null || value.isEmpty) {
      return 'Please enter your password';
    } else if (!passwordRegEx.hasMatch(value)) {
      return 'Password must be at least 8 characters long, contain at least one uppercase letter, one lowercase letter, one digit, and one special character.';
    }
    return null;
  }

  void _validatePassword() {
    setState(() {
      _validationMessage = passwordValidator(passwordController.text);
    });
  }

  @override
  Widget build(BuildContext context) {
    // Get the screen dimensions
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
      appBar: AppBar(
        flexibleSpace: Container(
          height: height * 0.15,
          padding: const EdgeInsets.only(top: 20.0),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RichText(
                text: TextSpan(
                  style: GoogleFonts.comfortaa(
                    fontSize: 30.0,
                    color: Colors.black,
                  ),
                  children: <TextSpan>[
                    TextSpan(
                      text: 'Aura',
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: const Color(0xFFfba7fc)),
                    ),
                    TextSpan(
                      text: 'Secure',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, color: Colors.black),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey, // Added a form for validation purposes
          child: SingleChildScrollView(
            // Added scroll view for better responsiveness
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Container(
                      height: 50,
                      width: 120,
                      decoration: BoxDecoration(
                        color: const Color(0xFFedf0f8),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: CountryCodePicker(
                        onChanged: (code) {
                          setState(() {
                            selectedCountryCode = code.dialCode!;
                          });
                        },
                        initialSelection:
                            'IN', // Set initial selection based on country code
                        showCountryOnly:
                            true, // Change to true to only show country names
                        favorite: const [
                          '+91', // Default favorite country code
                        ],
                        textStyle: TextStyle(
                          color: Colors.black, // Ensure text color is visible
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Expanded(
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                            vertical: 2.0, horizontal: 10.0),
                        decoration: BoxDecoration(
                          color: const Color(0xFFedf0f8),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: TextFormField(
                          controller: phoneController,
                          keyboardType: TextInputType.number,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter your phone number';
                            }
                            if (!RegExp(r'^[0-9]+$').hasMatch(value)) {
                              return 'Please enter a valid phone number';
                            }
                            if (!RegExp(r'^\d{10}$').hasMatch(value)) {
                              return 'Please enter a valid 10-digit phone number';
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Phone Number",
                            hintStyle: GoogleFonts.comfortaa(
                                color: const Color(0xFFb2b7bf), fontSize: 18.0),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                Container(
                  padding: const EdgeInsets.symmetric(
                      vertical: 2.0, horizontal: 10.0),
                  decoration: BoxDecoration(
                    color: const Color(0xFFedf0f8),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    obscureText: !_isPasswordVisible,
                    validator: (value) {
                      return passwordValidator(value); // Validate password here
                    },
                    decoration: InputDecoration(
                      suffixIcon: IconButton(
                        icon: Icon(
                          _isPasswordVisible
                              ? Icons.visibility_off
                              : Icons.visibility,
                        ),
                        onPressed: () {
                          setState(() {
                            _isPasswordVisible =
                                !_isPasswordVisible; // Toggle password visibility
                          });
                        },
                      ),
                      border: InputBorder.none,
                      hintText: "Password",
                      hintStyle: GoogleFonts.comfortaa(
                          color: const Color(0xFFb2b7bf), fontSize: 18.0),
                    ),
                  ),
                ),

                // Validation message displayed outside the Container
                if (_validationMessage != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      _validationMessage!,
                      style: TextStyle(color: Colors.red),
                    ),
                  ),

                const SizedBox(height: 20),

                GestureDetector(
                  onTap: () {
                    if (_formKey.currentState?.validate() == true) {
                      _validatePassword(); // Validate password on button tap
                      if (_validationMessage == null) {
                        Get.to(Dashboard());
                        // print(
                        //     'Phone number: ${selectedCountryCode}${phoneController.text}');
                        // print('Password: ${passwordController.text}');
                      }
                    }
                  },
                  child: Container(
                    width: width * 0.80, // Make the button width responsive
                    height: height * 0.06, // Make the button height responsive
                    child: Material(
                      borderRadius: BorderRadius.circular(10.0),
                      color: const Color.fromARGB(255, 245, 174, 221),
                      elevation: 0.0,
                      child: Center(
                        child: Text(
                          'Login',
                          style: GoogleFonts.comfortaa(
                            color: Colors.white,
                            fontSize: 18.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ),
                ).centered(),

                SizedBox(
                  height: 20,
                ),

                // RichText(
                //   text: TextSpan(
                //     style: GoogleFonts.comfortaa(
                //       fontSize: 17.0,
                //       color: Colors.black,
                //     ),
                //     children: const <TextSpan>[
                //       TextSpan(
                //         text: 'by continuing, i agree to the',
                //         style: TextStyle(
                //             fontWeight: FontWeight.w100, color: Colors.black),
                //       ),
                //       TextSpan(
                //         text: ' Terms of Use',
                //         style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             color: Color.fromARGB(255, 238, 75, 75)),
                //       ),
                //       TextSpan(
                //         text: ' &',
                //         style: TextStyle(
                //             fontWeight: FontWeight.w100, color: Colors.black),
                //       ),
                //       TextSpan(
                //         text: ' Policy',
                //         style: TextStyle(
                //             fontWeight: FontWeight.bold,
                //             color: Color.fromARGB(255, 238, 75, 75)),
                //       ),
                //     ],
                //   ),
                // ),

                SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.all(5),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment
                        .center, // Center the text horizontally
                    children: [
                      Text(
                        "Don't have an account? ",
                        style: GoogleFonts.comfortaa(fontSize: 17),
                      ),
                      InkWell(
                        onTap: () {
                          // Add your navigation or action logic here
                          Get.to(SignUpscreen());
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(
                            color: Colors.blue,
                            // Change the text color to indicate it's clickable
                            fontSize: 20,
                            fontWeight:
                                FontWeight.bold, // Make the "Sign Up" text bold
                          ),
                        ),
                      ),
                    ],
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
