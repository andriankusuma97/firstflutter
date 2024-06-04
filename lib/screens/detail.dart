import 'dart:ffi';

import 'package:firstflutter/bloc/requestApi.dart';
import 'package:firstflutter/component/pie-chart.dart';
import 'package:flutter/material.dart';
import 'package:firstflutter/component/card-payment.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;

class DetailPage extends StatefulWidget {
  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  var channel = const MethodChannel("name");

  CounterCubit myDataCount = CounterCubit();

  showToast() {
    channel.invokeMethod("shwoToast");
  }

  void fetchData() async {
    var url = Uri.https('zb5bb2z0-6970.asse.devtunnels.ms', 'getperson');
    var response = await http.get(url);

    if (response.statusCode == 200) {
      final dataFetch =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      print("$dataFetch <<<<<<<, ini dari response 200");
      // return setState(() {
      //   _data = dataFetch;
      // });
    } else {
      // Handle error
      throw Exception("Failed to get data: ${response.statusCode}");
    }
  }

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // This part attempts to access arguments (data) that might have been passed when navigating to the current route
    final String queryParams =
        ModalRoute.of(context)?.settings.arguments as String;

    return Scaffold(
      appBar: AppBar(title: const Text("Detail Page")),
      body: Center(
        child: Expanded(
          child: Column(
            children: [
              SizedBox(
                height: 100,
              ),
              if (queryParams != null) // Periksa apakah query parameters ada
                Column(
                  // children: queryParams.entries.map((entry) {
                  //   return Text('${entry.key}: ${entry.value}');
                  // }).toList(),
                  children: [
                    Text(
                      queryParams,
                      style:
                          TextStyle(fontSize: 28, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: 250,
                child: PieChart(),
              ),
              ElevatedButton(
                  child: const Text("Go To Home Screen"), onPressed: showToast),
              BlocBuilder<CounterCubit, int>(
                  bloc: myDataCount,
                  builder: (context, state) {
                    return Text(
                      "$state",
                      style: TextStyle(fontSize: 32),
                    );
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        myDataCount.decrement();
                      },
                      icon: Icon(Icons.remove)),
                  IconButton(
                      onPressed: () {
                        myDataCount.increment();
                      },
                      icon: Icon(Icons.add)),
                ],
              ),
              SizedBox(
                height: 10,
              ),
              Expanded(
                child: ListView.separated(
                  padding: EdgeInsets.all(10),
                  itemCount: data
                      .length, // Adjust for the number of CardPayment widgets
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
          ),
        ),
      ),
    );
  }
}

List<Map<String, String>> data = [
  {
    "title": "Shopping",
    "label": "Belanja kebutuhan Kost",
  },
  {"title": "Transfer", "label": "Bayar sewa Parkir"},
  {"title": "Markatable", "label": "Furniture Rumah"},
  {"title": "Sport", "label": "Bola Basket"},
  {"title": "Sport", "label": "Bola Basket"},
  {"title": "Sport", "label": "Bola Basket"},
  {"title": "Sport", "label": "Bola Basket"},
  {"title": "Sport", "label": "Bola Basket"},
  {"title": "Sport", "label": "Bola Basket"},
  {"title": "Sport", "label": "Bola Basket"},
  {"title": "Markatable", "label": "Furniture Rumah"},
  {"title": "Markatable", "label": "Furniture Rumah"},
  {"title": "Markatable", "label": "Furniture Rumah"},
  {"title": "Markatable", "label": "Furniture Rumah"},
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
  {
    "icons": Icons.sports,
  },
  {
    "icons": Icons.sports,
  },
  {
    "icons": Icons.sports,
  },
  {
    "icons": Icons.sports,
  },
  {
    "icons": Icons.sports,
  },
  {
    "icons": Icons.sports,
  },
  {
    "icons": Icons.car_crash,
  },
  {
    "icons": Icons.car_crash,
  },
  {
    "icons": Icons.car_crash,
  },
  {
    "icons": Icons.car_crash,
  },
];
