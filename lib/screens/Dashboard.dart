import 'package:flutter/material.dart';

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
// bool Primary;

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;

    return Scaffold(
      drawer: Drawer(
        // Add a ListView to the drawer. This ensures the user can scroll
        // through the options in the drawer if there isn't enough vertical
        // space to fit everything.
        child: ListView(
          // Important: Remove any padding from the ListView.
          padding: EdgeInsets.zero,
          children: [
            const DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.pinkAccent,
              ),
              child: Text(
                'Drawer Header',
                style: TextStyle(color: Colors.white, fontSize: 24),
              ),
            ),
            ListTile(
              title: const Text('Profile'),
              leading: Icon(Icons.person),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('SOS'),
              leading: Icon(Icons.phone),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('panic'),
              leading: Icon(Icons.warning),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('camera'),
              leading: Icon(Icons.camera_alt),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('Location'),
              leading: Icon(Icons.location_history),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            ListTile(
              title: const Text('log out'),
              leading: Icon(Icons.logout),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: Container(
        // child:Column(
        //   children: [
        //     Container(
        //       decoration:BoxDecoration(
        //         color:const Color.fromARGB(255, 247, 187, 207)
        //       )
        //     )
        //     SizedBox(
        //       height:height*0.25,
        //       width:width
        //     )
        //   ],
        // )

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
                                  onPressed: isSafe
                                      ? null
                                      : () {
                                          setState(() {
                                            isSafe = true;
                                          });
                                          print('Safe button clicked');
                                        },
                                  child: Text("I am Safe"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: isSafe
                                        ? const Color.fromARGB(
                                            255, 255, 255, 255)
                                        : const Color.fromARGB(
                                            255, 202, 56, 128),
                                  ),
                                ),
                                SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: isSafe
                                      ? () {
                                          setState(() {
                                            isSafe = false;
                                          });
                                          print('Not Safe button clicked');
                                        }
                                      : null,
                                  child: Text(" I am Not Safe"),
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: !isSafe
                                        ? const Color.fromARGB(
                                            255, 255, 255, 255)
                                        : const Color.fromARGB(
                                            255, 202, 56, 128),
                                  ),
                                ),
                              ],
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
                // ),

                // Bottom section of the dashboard
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
