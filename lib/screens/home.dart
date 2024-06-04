import 'package:firstflutter/component/card-payment.dart';
import 'package:firstflutter/component/line-chart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

import '../component/toggle-btn.dart';
import '../component/pie-chart.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

List<Map<String, String>> data = [
  {
    "title": "Shopping",
    "label": "Belanja kebutuhan Kost",
  },
  {"title": "Transfer", "label": "Bayar sewa Parkir"},
  {"title": "Markatable", "label": "Furniture Rumah"},
  {"title": "Sport", "label": "Bola Basket"},
];

List<Map<String, IconData>> dataIcon = [
  {
    "icons": Icons.leave_bags_at_home,
  },
  {
    "icons": Icons.chat_bubble_rounded,
  },
  {
    "icons": Icons.car_crash,
  },
  {
    "icons": Icons.sports,
  },
];

// class ApiService {
//   static final baseUrl = "https://api.example.com";

//   Future<Map<String, dynamic>> getData(String endpoint) async {
//     final url = Uri.parse("$baseUrl/$endpoint");
//     final response = await http.get(url);

//     if (response.statusCode == 200) {
//       final data = convert.jsonDecode(response.body) as Map<String, dynamic>;
//       return data;
//     } else {
//       // Handle error
//       throw Exception("Failed to get data: ${response.statusCode}");
//     }
//   }
// }

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static const platform = MethodChannel('samples.flutter.dev/battery');

  String selectedIndex = "Today"; // Initialize selected index
  List<String> labels = ["Today", "Week", "Month", "Year"];
  bool isSelected = false;
  List<LineData> dataLine = dataToday;
  var _data;
  String params = 'undefined';

  Future<void> handleNative() async {
    String batteryLevel = "notfound";
    try {
      print("<<<<< masuk sini ");
      final result = await platform
          .invokeMethod('getAlert', {'message': "test dari flutter yukkk"});
      batteryLevel = result;
      print(batteryLevel);
      print("<<<<keluar>>>>");
    } on PlatformException catch (e) {
      print(e.message);
    }

    setState(() {
      params = batteryLevel;
    });
  }

  void changeSelected(String data) {
    setState(() {
      selectedIndex = data;
    });

    if (selectedIndex == 'Today') {
      setState(() {
        dataLine = dataToday;
      });
    } else if (selectedIndex == 'Week') {
      setState(() {
        dataLine = dataWeek;
      });
    } else if (selectedIndex == 'Month') {
      setState(() {
        dataLine = dataMonth;
      });
    } else if (selectedIndex == 'Year') {
      setState(() {
        dataLine = dataYear;
      });
    }
    print(dataLine);
    print(selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                Colors.white,
                const Color.fromARGB(255, 179, 230, 254),
              ])),
        ),
        // PAGE VIEW
        SafeArea(
            child: Column(
          children: [
            // TIDAK BISA DI SCROOL
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                        color: Colors.blueGrey,
                        borderRadius: BorderRadius.circular(50)),
                    child: Icon(Icons.person),
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.keyboard_arrow_down_outlined,
                        color: Colors.black,
                      ),
                      Text(
                        "Mei",
                        style: TextStyle(
                            fontSize: 17, fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.notifications_active,
                      color: Colors.purple,
                    ),
                  )
                ],
              ),
            ),
            SizedBox(height: 5),
            Text("Acount Blance12"),
            SizedBox(height: 10),
            Text(
              "\$2145",
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                CardAmount(
                    isIncome: true, titleLabel: "Income", amount: "+\$3422"),
                CardAmount(
                    isIncome: false, titleLabel: "Outcome", amount: "-\$1422"),
              ],
            ),
            SizedBox(height: 10),
            Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Spend Frequency",
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    // CHART START
                    Container(
                      height: 185,
                      child: LineChart(
                        inputData: dataLine,
                      ),
                    ),
                    // CHART END
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          for (var i = 0; i < labels.length; i++)
                            ToggleBtn(
                              label: labels[i],
                              isSelected:
                                  selectedIndex == labels[i] ? true : false,
                              onTap: () => changeSelected(labels[i]),
                            )
                        ]),
                    SizedBox(
                      height: 10,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          " data dari Android: $params ",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: (17),
                          ),
                        ),
                        ElevatedButton(
                            onPressed: handleNative,
                            child: Text("get alert form native"))
                      ],
                    ),
                  ],
                )),
            Expanded(
              child: ListView.separated(
                padding: EdgeInsets.all(10),
                itemCount:
                    data.length, // Adjust for the number of CardPayment widgets
                itemBuilder: (context, index) {
                  final item = data[index];
                  final iconItem = dataIcon[index];
                  return CardPayment(
                    titleLabel: "${item["title"]}",
                    contentLabel: "${item["label"]}",
                    cardIcon: iconItem["icons"],
                    onTap: () {
                      Navigator.pushNamed(
                        context,
                        '/detail',
                        arguments: "${item["title"]}",
                      );
                    },
                  );
                },
                separatorBuilder: (context, index) => SizedBox(height: 10),
              ),
            )
          ],
        ))
      ],
    ));
  }
}

List<LineData> lineData = [
  LineData(2010, 35),
  LineData(2011, 13),
  LineData(2012, 34),
  LineData(2013, 27),
  LineData(2014, 40)
];

List<LineData> dataToday = [
  LineData(1, 35),
  LineData(2, 13),
  LineData(3, 34),
  LineData(4, 27),
  LineData(5, 40),
  LineData(6, 70),
  LineData(7, 40),
  LineData(8, 60),
  LineData(9, 40),
  LineData(10, 90),
];
List<LineData> dataWeek = [
  LineData(14, 35),
  LineData(28, 13),
  LineData(42, 34),
  LineData(56, 60),
  LineData(78, 23),
  LineData(84, 50),
];
List<LineData> dataMonth = [
  LineData(12, 65),
  LineData(22, 73),
  LineData(32, 34),
  LineData(42, 27),
  LineData(55, 40),
  LineData(55, 40),
  LineData(55, 40),
];
List<LineData> dataYear = [
  LineData(2010, 35),
  LineData(2011, 13),
  LineData(2012, 34),
  LineData(2013, 27),
  LineData(2014, 40)
];

class LineDataActiv {
  LineDataActiv(this.x, this.y);
  final int x;
  final double? y;
}

class CardAmount extends StatefulWidget {
  const CardAmount(
      {super.key, required this.isIncome, this.titleLabel, this.amount});
  final titleLabel;
  final amount;
  final bool isIncome;

  @override
  State<CardAmount> createState() => _CardAmountState();
}

class _CardAmountState extends State<CardAmount> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 130,
      height: 60,
      decoration: BoxDecoration(
          color: widget.isIncome ? Colors.green : Colors.deepOrangeAccent,
          borderRadius: BorderRadius.circular(20)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            "${widget.titleLabel}",
            style: TextStyle(
                fontSize: 12, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          Text("${widget.amount}",
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.white))
        ],
      ),
    );
  }
}

// class _HomePageState extends State<HomePage> {
//   String resultText = '';
//   int numb = 0;

//   // Define the method channel
//   static const platform = MethodChannel('sendParams');

//   // Method to call native code
//   Future<void> callNativeCode() async {
//     try {
//       // Call the method 'username' on the platform side

//       setState(() {
//         numb = numb + 2;
//       });
//       print("test<<<<<");
//       // final String result = await platform.invokeMethod('username');
//       // resultText = result;
//       // setState(() {
//       //   resultText = result;
//       //   numb = numb + 1;
//       // });
//     } on PlatformException catch (e) {
//       // Handle the error here
//       print("Error: '${e.message}'.");
//     }
//   }

//   }
// }

//  Center(
//   child: Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       Text("Data dari Native Android :" + resultText),
//       ElevatedButton(
//         child: const Text("Go To Detail Page"),
//         onPressed: () {
//           // Navigasi ke halaman lain ketika tombol ditekan
//           Navigator.pushNamed(
//             context,
//             '/detail',
//             arguments: 'test data dari home',
//           );
//         },
//       ),
//       ElevatedButton(
//         child: const Text("Received Data from Android"),
//         onPressed: () {
//           // Panggil kode native saat tombol ditekan
//           callNativeCode();
//         },
//       ),
//       Text(resultText + " ${numb} " + " <-ini dari android"),
//     ],
//   ),
// ),
