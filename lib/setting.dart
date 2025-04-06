import 'package:flutter/material.dart';
import 'package:project_2/app_styles.dart';
import 'package:project_2/home.dart';

import 'create_account_screen.dart'; // Import the Create Account Screen
import 'setting.dart'; // Import the setting page itself (if needed)
import 'wishlist.dart'; // Import other pages as needed
import 'ChatBotScreen.dart';
import 'InstructionPage.dart';
import 'Mango.dart';
import 'OrderHistoryPage.dart';
import 'PersonalCarePage.dart';
import 'SpecialOffersPage.dart';
import 'Strawberry.dart';
import 'cart.dart';
import 'notification.dart';

class setting extends StatefulWidget {
  const setting({super.key});

  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<setting> {
  int _currentIndex = 4; // Default selected index for the Settings screen

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.primarybackground,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppStyles.primarybackground,
      ),
      // body: Column(
      //   children: [
      //     // Top section with user info
      //     const CircleAvatar(
      //       radius: 50,
      //       backgroundImage: AssetImage(
      //         'assets/profile.jpg',
      //       ),
      //     ),
      //     const SizedBox(height: 10),
      //     const Text(
      //       "David Jerome",
      //       style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
      //     ),
      //     const Text(
      //       "David.j@gmail.com",
      //       style: TextStyle(fontSize: 16, color: Colors.white70),
      //     ),
      //     const SizedBox(height: 10),

      //     // Settings List
      //     Expanded(
      //       child: Container(
      //         padding: const EdgeInsets.all(20),
      //         decoration: const BoxDecoration(
      //           color: Colors.white,
      //           borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      //         ),
      //         child: Column(
      //           crossAxisAlignment: CrossAxisAlignment.start,
      //           children: [
      //             const Text(
      //               "Settings",
      //               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      //             ),
      //             const SizedBox(height: 20),

      //             // Settings Items
      //             const SettingsItem(icon: Icons.language, title: "Language", trailingText: "English (eng)"),
      //             const SettingsItem(icon: Icons.lock, title: "Privacy & Policy"),
      //             const SettingsItem(icon: Icons.help_outline, title: "Help"),
      //             const SettingsItem(icon: Icons.edit, title: "Profile Settings", trailingText: "Edit Profile"),
      //             SettingsItem(
      //               icon: Icons.logout,
      //               title: "Log out of account",
      //               trailingText: "Log Out?",
      //               isLogout: true,
      //               onTap: () {
      //                 // Navigate to the Create Account Screen when "Log out of account" is clicked
      //                 Navigator.pushReplacement(
      //                   context,
      //                   MaterialPageRoute(builder: (context) => const AuthScreen()),
      //                 );
      //               },
      //             ),
      //           ],
      //         ),
      //       ),
      //     ),
      //   ],
      // ),

       body: Align(
          alignment: AlignmentDirectional(0, 0),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: 140,
                child: Stack(
                  children: [
                    Align(
                      alignment: AlignmentDirectional(0, 0),
                      child: Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 12, 0, 0),
                        child: Container(
                          width: 100,
                          height: 100,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: Padding(
                            padding: EdgeInsets.all(2),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                'https://images.unsplash.com/photo-1488161628813-04466f872be2?crop=entropy&cs=tinysrgb&fit=max&fm=jpg&ixid=M3w0NTYyMDF8MHwxfHNlYXJjaHwxMXx8bWFufGVufDB8fHx8MTczOTkxNzM4Mnww&ixlib=rb-4.0.3&q=80&w=1080',
                                width: 100,
                                height: 100,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 16, 0, 12),
                child: Text(
                  'David Jerome',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                  fontFamily: 'Inter Tight',
                  color: AppStyles.textLight,
                  fontSize: 24,
                  fontWeight: FontWeight.w600,
                  )
                ),
              ),
              Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 20),
                child: Text(
                  'David.j@gmail.com',
                  style: TextStyle(
                    fontFamily: 'Inter Tight',
                    color: Color(0xFFCCFFFFFF),
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                  ) ,
                ),
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  height: 400,
                  decoration: BoxDecoration(
                   color: AppStyles.backgroundColor,
                    boxShadow: [
                      BoxShadow(
                        blurRadius: 3,
                        color: Color(0x33000000),
                        offset: Offset(
                          0,
                          -1,
                        ),
                      )
                    ],
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(0),
                      bottomRight: Radius.circular(0),
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                  ),
                  child: Align(
                    alignment: AlignmentDirectional(0, -1),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(16, 16, 16, 0),
                            child: Column(
                              mainAxisSize: MainAxisSize.max,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 12),
                                  child: Text(
                                    'Settings',
                                    style:TextStyle(
                                      fontFamily: 'Inter Tight',
                                      fontSize:30,
                                    )
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 16, 8),
                                        child: Icon(
                                          Icons.language_rounded,
                                          color: AppStyles.textDark,
                                          size: 30,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 12, 0),
                                          child: Text(
                                            'Language',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                fontFamily: 'Inter Tight',
                                                fontSize: 20,
                                              )
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'English (eng)',
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color:AppStyles.primarybackground,
                                          fontSize: 16,
                                          ) 
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 16, 8),
                                        child: Icon(
                                          Icons.lock_open,
                                          color: AppStyles.textDark,
                                          size: 30,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 12, 0),
                                          child: Text(
                                            'Privacy & Policy ',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color:AppStyles.textDark,
                                                fontSize: 20,
                                              )
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 16, 8),
                                        child: Icon(
                                          Icons.help_outline_rounded,
                                          color: AppStyles.textDark,
                                          size: 30,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 12, 0),
                                          child: Text(
                                            'Help',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color:AppStyles.textDark,
                                                fontSize: 20,
                                              )
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 16, 8),
                                        child: Icon(
                                          Icons.edit,
                                          color: AppStyles.textDark,
                                          size: 30,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 12, 0),
                                          child: Text(
                                            'Profile Settings',
                                            textAlign: TextAlign.start,
                                            style: TextStyle(
                                                color: AppStyles.textDark,
                                                fontSize: 20,
                                              )
                                          ),
                                        ),
                                      ),
                                      Text(
                                        'Edit Profile',
                                        textAlign: TextAlign.center,
                                         style: TextStyle(
                                            color: AppStyles.primarybackground,
                                            fontSize: 16,
                                          )
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      0, 0, 0, 8),
                                  child: Row(
                                    mainAxisSize: MainAxisSize.max,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            0, 8, 16, 8),
                                        child: Icon(
                                          Icons.login_rounded,
                                           color: AppStyles.textDark,
                                          size: 30,
                                        ),
                                      ),
                                      Expanded(
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 12, 0),
                                          child: Text(
                                            'Log out of account',
                                            textAlign: TextAlign.start,
                                             style: TextStyle(
                                                color: AppStyles.textDark,
                                                fontSize: 20,
                                              )
                                          ),
                                        ),
                                      ),
                                     GestureDetector(
                                      onTap: () {
                                        Navigator.pushReplacement(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  AuthScreen()), // Or CreateAccountScreen if different
                                        );
                                      },
                                      child: MouseRegion(
                                        cursor: SystemMouseCursors.click,
                                        child: Text(
                                          'Log Out?',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            color: const Color.fromARGB(
                                                255, 221, 11, 11),
                                            fontSize: 16,
                                            decorationColor: Color.fromARGB(
                                                255, 221, 11, 11),
                                          ),
                                        ),
                                      ),
                                    ) 
                                    ],
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
              ),
            ],
          ),
      ),
     // Bottom Navigation Bar (Copied from the home screen)
        bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppStyles.backgroundColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex, // Track the selected index
        selectedItemColor: AppStyles.primarybackground, // Highlight the selected icon in blue
        unselectedItemColor: Colors.grey, // Unselected icons in grey
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            label: 'Cart',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.trolley),
            label: 'Controller',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: 'Order History',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Settings',
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index; // Update the selected index
          });

          // Handle tap events for bottom navigation icons
          if (index == 0) {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const home()),
            );
          } else if (index == 2) {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => InstructionPage()),
            );
          } else if (index == 3) {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => OrderHistoryPage()),
            );
          } else if (index == 1) {
            Navigator.pop(context);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => cart()),
            );
          } 
        },
      ),
    );
  }
}

// Reusable Settings Item Widget
class SettingsItem extends StatelessWidget {
  final IconData icon;
  final String title;
  final String? trailingText;
  final bool isLogout;
  final VoidCallback? onTap;

  const SettingsItem({
    super.key,
    required this.icon,
    required this.title,
    this.trailingText,
    this.isLogout = false,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(icon, color: Colors.grey[700]),
      title: Text(title, style: const TextStyle(fontSize: 16)),
      trailing: trailingText != null
          ? Text(
        trailingText!,
        style: TextStyle(color: isLogout ? Colors.red : AppStyles.primarybackground, fontWeight: FontWeight.bold),
      )
          : null,
      onTap: onTap, // Use the provided onTap callback
    );
  }
}