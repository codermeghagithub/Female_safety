import 'package:aurasecure/screens/authscreens/profile.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Dashboard extends StatefulWidget {
  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  late double height, width;

  List imageSource = [
    "assets/sos-button.png",
    "assets/panic1.png",
    "assets/camera.png",
    "assets/location.png",
  ];
  List dataTitle = ["SOS", "PANIC", "CAMERA", "LOCATION"];
  bool isSafe = true;
  bool isNotSafe = false;
// bool Primary;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: Drawer(
          child: Container(
              color: Theme.of(context).canvasColor,
              child: ListView(
                children: [
                  DrawerHeader(
                      padding: EdgeInsets.zero,
                      child: Container(
                          color: const Color.fromARGB(255, 224, 127, 160),
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundImage: NetworkImage(
                                    'https://purepng.com/public/uploads/large/purepng.com-female-studentstudentcollege-studentschool-studentfemale-student-14215269231647tn6r.png'),
                              ),
                              SizedBox(width: 10),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Rima Pal',
                                    style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Text('abc@gmail.com')
                                ],
                              )
                            ],
                          ))),
                  ListTile(
                    onTap: () {
                      Get.to(ProfileWidget());
                    },
                    leading: Icon(Icons.person),
                    title: const Text('Profile'),
                  ),
                  ListTile(
                    leading: Icon(Icons.phone),
                    title: const Text('SOS'),
                  ),
                  ListTile(
                    leading: Icon(Icons.warning),
                    title: const Text('Panic'),
                  ),
                  ListTile(
                    leading: Icon(Icons.camera_alt),
                    title: const Text('Camera'),
                  ),
                  ListTile(
                    leading:Icon(Icons.location_city) ,
                    title:const Text('Location')
                  ),
                  ListTile(
                  //   onTap(){
                  //     Get.to(LogoutWidget());
                  // },
                    leading: Icon(Icons.logout),
                    title: const Text('log out '),
                  )
                ],
              ))),
      body: Container(
        color: const Color.fromARGB(221, 234, 179, 213), // Background color
        height: height,
        width: width,
        child: SingleChildScrollView(
          // Allows for scrolling if content exceeds the screen height
          child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              children: [
                // Top section of the dashboard
                Container(
                  decoration: BoxDecoration(),
                  height: height * 0.35,
                  width: width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(
                          top: 35,
                          left: 20,
                          right: 20,
                        ),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Builder(
                                builder: (context) => InkWell(
                                  onTap: () {
                                    // Use the context to open the drawer
                                    Scaffold.of(context).openDrawer();
                                  },
                                  child: Icon(
                                    Icons.sort,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              ),
                              Container(
                                height: 60,
                                width: 50,
                                decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(25),
                                    color: Colors.white,
                                    image: DecorationImage(
                                        image: AssetImage(
                                      "assets/logo3.png",
                                    ))),
                              )
                            ]),
                      ),
                      Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                          left: 15,
                          right: 15,
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Dashbord",
                              style: TextStyle(
                                fontSize: 30,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(height: 2),
                            Text(
                              "Are You Safe ?",
                              style: TextStyle(
                                fontSize: 20,
                                color: Colors.white,
                                fontWeight: FontWeight.w500,
                                letterSpacing: 1,
                              ),
                            ),
                            SizedBox(height: 10),
                            Row(
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    setState(() {
                                      isNotSafe =
                                          !isNotSafe; // Toggle the "Not Safe" state
                                    });
                                    print(isNotSafe
                                        ? 'I am Not Safe activated'
                                        : 'I am Not Safe deactivated');
                                  },
                                  child: Text("I am Not Safe"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isNotSafe
                                        ? const Color.fromARGB(
                                            255, 234, 12, 12) // Red when active
                                        : const Color.fromARGB(255, 255, 255,
                                            255), // White when inactive

                                  ),
                                ),
                              ],

                              //         children: [
                              //         ElevatedButton(
                              //         onPressed: () {
                              //   setState(() {
                              //   isSafe = true; // Set "I am Safe" state to active
                              //   });
                              //   },
                              //     child: Text("I am Safe"),
                              //     style: ElevatedButton.styleFrom(
                              //       backgroundColor: isSafe
                              //           ? const Color.fromARGB(255, 131, 197, 82) // Green when safe
                              //           : Colors.grey,
                              //     ),
                              //   ),
                              //   SizedBox(width: 10),
                              //   ElevatedButton(
                              //     onPressed: () {
                              //       setState(() {
                              //         isSafe = false; // Set "I am Not Safe" state to active
                              //       });
                              //       print('Not Safe button clicked');
                              //     },
                              //     child: Text("I am Not Safe"),
                              //     style: ElevatedButton.styleFrom(
                              //       backgroundColor: !isSafe
                              //           ? const Color.fromARGB(255, 202, 56, 128) // Red when not safe
                              //           : Colors.grey,
                              //     )
                              //,
                              //   ),
                              // ],
                              //

                              // children: [
                              //
                              //    ElevatedButton(
                              //     onPressed:  () {S
                              //             setState(() {
                              //               isSafe =true;
                              //             });
                              //           },
                              //     child: Text("I am Safe"),
                              //     style: ElevatedButton.styleFrom(
                              //       backgroundColor:isSafe
                              //           ? const Color.fromARGB(
                              //               255, 131, 197, 82)
                              //           : Colors.grey,
                              //     ),
                              //   ),
                              //   SizedBox(width: 10),
                              //   ElevatedButton(
                              //     onPressed: isSafe
                              //         ? null
                              //         : () {
                              //             setState(() {
                              //               isSafe = true;
                              //             });
                              //             print('Not Safe button clicked');
                              //           },
                              //     child: Text(" I am Not Safe"),
                              //     style: ElevatedButton.styleFrom(
                              //       backgroundColor:isSafe
                              //           ? const Color.fromARGB(
                              //               255, 255, 255, 255)
                              //           : const Color.fromARGB(
                              //               255, 202, 56, 128),
                              //     ),
                              //   ),
                              // ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                // ],
                // ),
                // ),
                //
                //       ]
                //     ),
                //   ),

                // SizedBox(height: 30), // Adds space at the top
                // Row(
                //   mainAxisAlignment:
                //   MainAxisAlignment.start, // Align to start
                //   children: [
                //     InkWell(
                //       onTap: () {
                //         // Define action for the menu icon
                //       },
                //       child: Icon(
                //         Icons.sort,
                //         color: Colors.white,
                //         size: 40,
                //       ),
                //     ),
                //   ],
                // ),
                //     ],
                //   ),
                // ),// Bottom section of the dashboard


                Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  height: height * 0.75, // Take up 75% of the screen
                  width: width,
                  child: GridView.builder(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1.1,
                      mainAxisSpacing: 25,
                    ),
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemCount: imageSource.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {},
                          child: Container(
                              margin: EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 20),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black26,
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                  ),
                                ],
                              ),
                              child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Image.asset(
                                      imageSource[index],
                                      width: 100,
                                    ),
                                  ])));
                    },
                  ),
                ),
              ],
              // child: Center(
              //   // Ensure the image is centered
              //   child: Image.asset(
              //     height: 100,
              //     "assets/sos.png",
              //     fit: BoxFit.cover, // Adjust the fit as needed
              //   ),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}



//         color: const Color.fromARGB(221, 234, 179, 213), // Background color
//         height: height,
//         width: width,
//         child: SingleChildScrollView(
//           // Allows for scrolling if content exceeds the screen height
//           child: Padding(
//             padding: const EdgeInsets.all(5.0),
//             child: Column(
//               children: [
//                 // Top section of the dashboard
//                 Container(
//                   height: height * 0.25,
//                   width: width,
//                   child: Column(
//                     children: [
//                       SizedBox(height: 30), // Adds space at the top
//                       Row(
//                         mainAxisAlignment:
//                             MainAxisAlignment.start, // Align to start
//                         children: [
//                           InkWell(
//                             onTap: () {
//                               // Define action for the menu icon
//                             },
//                             child: Icon(
//                               Icons.sort,
//                               color: Colors.white,
//                               size: 40,
//                             ),
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//
//                 // Bottom section of the dashboard
//                 Container(
//                   decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.only(
//                       topLeft: Radius.circular(30),
//                       topRight: Radius.circular(30),
//                     ),
//                   ),
//                   height: height * 0.75, // Take up 75% of the screen
//                   width: width, // Full width of the screen
//                   child: Center(
//                     // Ensure the image is centered
//                     child: Image.asset(
//                       height: 100,
//                       "assets/sos.png",
//                       fit: BoxFit.cover, // Adjust the fit as needed
//                     ),
//                   ),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }
