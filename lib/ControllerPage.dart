import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter_bluetooth_serial/flutter_bluetooth_serial.dart';
import 'package:project_2/app_styles.dart';
import 'package:project_2/home.dart';
import 'ControllerPage.dart' as Super;
import 'setting.dart';
import 'OrderHistoryPage.dart';
import 'cart.dart';

class ControllerPage extends StatefulWidget {
  @override
  _ControllerPageState createState() => _ControllerPageState();
}

@override
void initState(){
  Super.initState();
  _checkBluetoothState();
}

class _checkBluetoothState {
}

class _ControllerPageState extends State<ControllerPage> {
  int _currentIndex = 2; // Default selected index
  BluetoothDevice? selectedDevice;
  BluetoothConnection? connection;
  bool isConnected = false;

  // دالة اختيار الجهاز والاتصال به
  Future<bool> selectDevice() async {
    List<BluetoothDevice> devices = await FlutterBluetoothSerial.instance.getBondedDevices();
    bool deviceSelected = false;

    await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text("اختر جهاز Bluetooth"),
          content: SingleChildScrollView(
            child: Column(
              children: devices.map((device) {
                return ListTile(
                  title: Text(device.name ?? "غير معروف"),
                  subtitle: Text(device.address),
                  onTap: () {
                    Navigator.pop(context);
                    connectToDevice(device);
                    deviceSelected = true;
                  },
                );
              }).toList(),
            ),
          ),
        );
      },
    );

    return deviceSelected;
  }

  // دالة الاتصال بالجهاز
  void connectToDevice(BluetoothDevice device) async {
    try {
      BluetoothConnection connectionInstance = await BluetoothConnection.toAddress(device.address);
      setState(() {
        selectedDevice = device;
        connection = connectionInstance;
        isConnected = true;
      });
      print("تم الاتصال بـ ${device.name}");
    } catch (e) {
      print("فشل الاتصال: $e");
    }
  }

  // دالة قطع الاتصال
  void disconnect() {
    connection?.close();
    setState(() {
      isConnected = false;
      selectedDevice = null;
    });
    print("تم قطع الاتصال");
  }

  // إرسال الأوامر للعربة عبر البلوتوث
  void sendCommand(String command) {
    if (isConnected && connection != null) {
      connection!.output.add(Uint8List.fromList(command.codeUnits));
      connection!.output.allSent.then((_) => print("تم إرسال: $command"));
    } else {
      print("لم يتم الاتصال بأي جهاز");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyles.backgroundColor,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppStyles.primarybackground,
        title: Text("Controller",
            style: TextStyle(color: Colors.white, fontSize: 36, fontWeight: FontWeight.w500)),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.network(
            "https://img.freepik.com/vetores-gratis/carrinho-de-compras-com-marketing-conjunto-de-icones_24877-50248.jpg",
            width: 300,
            height: 300,
            errorBuilder: (context, error, stackTrace) {
              return Icon(Icons.broken_image, size: 100, color: Colors.grey);
            },
          ),
          SizedBox(height: 20),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Connect to Bluetooth", style: TextStyle(fontSize: 16)),
              Switch(
                value: isConnected,
                activeColor: Colors.orange,
                onChanged: (bool value) async {
                  if (value) {
                    bool deviceSelected = await selectDevice();
                    if (!deviceSelected) {
                      setState(() {
                        isConnected = false;
                      });
                    }
                  } else {
                    disconnect();
                  }
                },
              ),
            ],
          ),

          if (selectedDevice != null)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text("متصل بـ: ${selectedDevice!.name}"),
            ),

          SizedBox(height: 20),

          Column(
            children: [
              _arrowButton(Icons.arrow_upward, () => sendCommand("F")),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _arrowButton(Icons.arrow_back, () => sendCommand("L")),
                  Container(
                    width: 60,
                    height: 60,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      shape: BoxShape.circle,
                    ),
                  ),
                  _arrowButton(Icons.arrow_forward, () => sendCommand("R")),
                ],
              ),
              _arrowButton(Icons.arrow_downward, () => sendCommand("B")),
            ],
          ),
        ],
      ),

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: AppStyles.backgroundColor,
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        selectedItemColor: AppStyles.primarybackground,
        unselectedItemColor: Colors.grey,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_cart), label: 'Cart'),
          BottomNavigationBarItem(icon: Icon(Icons.trolley), label: 'Controller'),
          BottomNavigationBarItem(icon: Icon(Icons.history), label: 'Order History'),
          BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });

          if (index == 0) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => home()));
          } else if (index == 1) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => cart()));
          } else if (index == 3) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => OrderHistoryPage()));
          } else if (index == 4) {
            Navigator.push(context, MaterialPageRoute(builder: (context) => setting()));
          }
        },
      ),
    );
  }

  Widget _arrowButton(IconData icon, VoidCallback onPressed) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: AppStyles.buttonColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          padding: EdgeInsets.all(15),
          minimumSize: Size(60, 60),
        ),
        onPressed: onPressed,
        child: Icon(icon, color: Colors.white, size: 30),
      ),
    );
  }
}


