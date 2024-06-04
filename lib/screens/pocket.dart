import 'package:firstflutter/component/card-pocket.dart';
import 'package:firstflutter/component/toggle-btn.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class Pocket extends StatefulWidget {
  const Pocket({super.key});

  @override
  State<Pocket> createState() => _PocketState();
}

class _PocketState extends State<Pocket> {
  List<String> labels = ["Semua", "Kantong Saya", "Dibagi ke saya"];
  String selectedIndex = "Semua";
  bool _moneyVisible = true;
  int totalMoneyInt = 18788900;
  String totalMoneyString = "";

   List<Map<String, dynamic>> itemsPocket = [
    {
      "title": "Kantong Utama",
      "subType": "kantong utama",
      "saldo": "1782300",
      "image":"assets/images/house_icon.png"
    },
    {
      "title": "Dana Darurat",
      "subType": "kantong Belanja",
      "saldo": "1890000",
      "image":"assets/images/alert_icon.png"
    },
    {
      "title": "Dana Belanja",
      "subType": "kantong belanja",
      "saldo": "19837333",
      "image":"assets/images/cart_icon.png"
    },
    {
      "title": "Saham",
      "subType": "kantong belanja",
      "saldo": "19837333",
      "image":"assets/images/gift_icon.png"
    },
    {
      "title": "Tambah Kantong",
      "subType": "kantong belanja",
      "saldo": "19837333",
      "image":"assets/images/plus_icon.png"
    },
  ];

  @override
  void initState() {
    // TODO: implement setState
    print("Masuk");
    final resultMoney = formatRupiah(totalMoneyInt);
    setState(() {
      totalMoneyString = resultMoney;
    });
    super.initState();
  }

  void changeSelected(String name) {
    print("$name masuk");
    setState(() {
      selectedIndex = name;
    });
  }

  void changeMoneyVisible() {
    setState(() {
      _moneyVisible = !_moneyVisible;
    });
  }

  String formatRupiah(int totalMoney) {
    final formatter = NumberFormat.simpleCurrency(
        locale: 'id_ID', // Set locale Indonesia
        decimalDigits: 0);

    return formatter.format(totalMoney);
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
          SafeArea(
              child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              children: [
                SizedBox(height: 10),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Kantong",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(Icons.access_alarm))
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      for (var i = 0; i < labels.length; i++)
                        ToggleBtn(
                          label: labels[i],
                          isSelected: selectedIndex == labels[i] ? true : false,
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
                      "Saldo Saya",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Row(
                      children: [
                        Text(
                          "Rp17.984,000",
                            style: TextStyle(fontWeight: FontWeight.bold)),
                        IconButton(
                            onPressed: changeMoneyVisible,
                            icon: Icon(
                              _moneyVisible
                                  ? Icons.visibility
                                  : Icons.visibility_off,
                           ))
                      ],
                    ),
                  ],
                ),
                Expanded(
                  child:
                  GridView.count(
                        crossAxisCount: 2,
                        mainAxisSpacing: 8.0, // spacing between rows
                        crossAxisSpacing: 8.0, // spacing between columns
                        padding: EdgeInsets.all(8.0),
                        children: List.generate(itemsPocket.length, (index) {
                          return CardPocket(
                              backgroundColor: Colors.greenAccent,
                              widthCostume: 100,
                              heightCostume: 30,
                              titlePocket: "${itemsPocket[index]["title"]}",
                              saldoPocket: itemsPocket[index]["saldo"],
                              typePocket: "${itemsPocket[index]["subType"]}",
                              imageCostume: "${itemsPocket[index]["image"]}",
                            );
                        }))
                )
              ],  
            ),
          ))
        ],
      ),
    );
  }
}
