import 'package:aurasecure/screens/Dashboard.dart';

import 'package:aurasecure/screens/Privacy_policy.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignUpscreen extends StatefulWidget {
  const SignUpscreen({Key? key}) : super(key: key);
  // const SignUpscreen({super.key});

  @override
  State<SignUpscreen> createState() => _SignUpscreenState();
}

class _SignUpscreenState extends State<SignUpscreen> {
  bool _isChecked = false; //Track checkbox state
  bool _isPasswordVisible = false;
  String? _selectedGender; // Track selected gender
  final _formKey = GlobalKey<FormState>();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController houseNumberController =
      TextEditingController(); // Moved here
  final TextEditingController cityController = TextEditingController();
  final TextEditingController landmarkController = TextEditingController();
  final TextEditingController pincodeController =TextEditingController(); // Added for city name
final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

  String? confirmPasswordValidator(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please confirm your password';
    }
    if (value != passwordController.text) {
      return 'Passwords do not match';
    }
    return null;
  }

  
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
    final double height = MediaQuery.of(context).size.height;

    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          // Ensure the form scrolls
          child: Container(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            // Header
            Container(
              height: height * 0.12,
              padding: const EdgeInsets.only(top: 20.0),
              alignment: Alignment.center,
              decoration: const BoxDecoration(
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
                        style: GoogleFonts.comfortaa(
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
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // Email Field
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

            // const SizedBox(height: 20),
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


                // Confirm Password Field
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Container(
                    padding: const EdgeInsets.symmetric(vertical: 2.0, horizontal: 10.0),
                    decoration: BoxDecoration(
                      color: const Color(0xFFedf0f8),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: TextFormField(
                      controller: confirmPasswordController,
                      keyboardType: TextInputType.visiblePassword,
                      obscureText: !_isPasswordVisible,
                      validator: (value) {
                        return confirmPasswordValidator(value); // Validate confirm password
                      },
                      decoration: InputDecoration(
                        suffixIcon: IconButton(
                          icon: Icon(
                            _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                          ),
                          onPressed: () {
                            setState(() {
                              _isPasswordVisible = !_isPasswordVisible; // Toggle visibility
                            });
                          },
                        ),
                        border: InputBorder.none,
                        hintText: "Confirm Password",
                        hintStyle: GoogleFonts.comfortaa(
                            color: const Color(0xFFb2b7bf), fontSize: 18.0),
                      ),
                    ),
                  ),
                ),

            // First Name and Last Name Row
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

            // Phone Number Field
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
                  controller: phoneController,
                  keyboardType: TextInputType.phone,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Please enter your phone number';
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
                        color: const Color(0xFFb2b7bf), fontSize: 15.0),
                  ),
                ),
              ),
            ),

            // Gender Dropdown
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
                      .map((gender) => DropdownMenuItem<String>(
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

            // const SizedBox(height: 15),

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

            const SizedBox(height: 15),
            Text("by continuing, i agree to the "),
            Container(
              child: Row(
                children: [
                  Container(
                    width: 30, // Set the desired width here
                    child: CheckboxListTile(
                      value: _isChecked,
                      onChanged: (bool? value) {
                        setState(() {
                          _isChecked = value!;
                        });
                      },
                      controlAffinity: ListTileControlAffinity
                          .leading, // Checkbox before text
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            contentPadding: EdgeInsets.zero,
                            // Use a ConstrainedBox to limit the height of the dialog
                            content: ConstrainedBox(
                              constraints: BoxConstraints(
                                maxHeight: MediaQuery.of(context).size.height *
                                    0.8, // Limit height to 80% of screen height
                              ),
                              child: SingleChildScrollView(
                                physics:
                                    AlwaysScrollableScrollPhysics(), // Ensures it's always scrollable
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Text(
                                      privacyPolicyText), // Use the imported privacy policy text here
                                ),
                              ),
                            ),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context)
                                      .pop(); // Close the dialog
                                },
                                child: const Text("Close"),
                              ),
                            ],
                          );
                        },
                      );
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: const Text("Privacy and Policy"),
                    ),
                  ),
                ],
              ),
            ),

            // Sign Up Button
            Center(
              child: ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    // Perform sign-up logic
                    Get.to(Dashboard());
                    Get.snackbar('Success', 'Signed up successfully!',
                        snackPosition: SnackPosition.BOTTOM,
                        backgroundColor: Colors.green,
                        colorText: Colors.white);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 139, 3, 93),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 50.0, vertical: 15.0),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                child: Text(
                  "Sign Up",
                  style: GoogleFonts.comfortaa(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ]),
        ),
      )),
    );
  }
}
