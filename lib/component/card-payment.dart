import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';

class CardPayment extends StatelessWidget {
  final String titleLabel;
  final String contentLabel;
  IconData? cardIcon;
  VoidCallback? onTap;

  CardPayment({
    super.key, 
    required this.titleLabel, 
    required this.contentLabel,
    this.cardIcon,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    
    return Container(
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(20),
      ),
      child:
       Padding(
         padding: const EdgeInsets.all(10),
         child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(16),
                color: Colors.yellow,
              ),
              child: Icon(cardIcon),
            ),
            SizedBox(
              width: 10,
            ),
            Expanded(
              child:
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [ 
                      Text(titleLabel),
                      InkWell(
                        onTap: onTap,
                        child: Text("See More..",
                        style: TextStyle(
                            fontSize: 12,
                            color: Colors.red,
                            decoration: TextDecoration.underline,
                            decorationColor: Colors.red,)
                          ),
                        )
                    ],
                  ),
                SizedBox(height: 5,),
                Text(contentLabel),
              ],) 
            )

          ],
               ),
       ),
    );
  }
}
