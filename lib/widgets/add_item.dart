import 'package:flutter/material.dart';

class AddItem extends StatelessWidget {
  const AddItem({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310,
      decoration: BoxDecoration(
        color: Color(0xffFFFFFF),
        borderRadius: BorderRadius.all(Radius.circular(10)),
        boxShadow: [
          // BoxShadow(
          //   color: Color.fromRGBO(188, 202, 224, 0.1),
          //   offset: Offset(0, -1),
          //   blurRadius: 4,
          //   spreadRadius: 0,
          // ),
          // BoxShadow(
          //   color: Color.fromRGBO(188, 202, 224, 0.4),
          //   offset: Offset(0, 2),
          //   blurRadius: 4,
          //   spreadRadius: 0,
          // )
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16),
        child: Column(
          children: [
            SizedBox(
              height: 14,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  // color: Colors.blue,
                  width: 64,
                  height: 64,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset('assets/images/img.png'),
                ),
                Text(
                  '1 x',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 17,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w500,
                    fontStyle: FontStyle.normal,
                    color: Color(0xff222B31),
                  ),
                ),
                Wrap(
                  direction: Axis.vertical,
                  children: [
                    Text(
                      'Sloppy Mac',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: Color(0xff393E46),
                      ),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    Text(
                      '\$ 12.00',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 13,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        fontStyle: FontStyle.normal,
                        color: Color(0xff4E535A),
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {},
                  child: Container(
                    height: 18,
                    width: 18,
                    child: Image.asset('assets/images/remove.png'),
                  ),
                )
              ],
            ),
            SizedBox(
              height: 13,
            ),
            Divider(
              color: Color(0xffE4E4E4).withOpacity(1),
              endIndent: 18,
              indent: 18,
              height: 1,
              thickness: 1,
            ),
            SizedBox(
              height: 9,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  // color: Colors.blue,
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset('assets/images/knife.png'),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    'Sloppy Joe Burgers, Kondhwa Budruk, Parge Nagar, Pune, 411048',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: Color(0xff4E535A),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 15,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  // color: Colors.blue,
                  width: 25,
                  height: 25,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                  ),
                  child: Image.asset('assets/images/clock.png'),
                ),
                SizedBox(
                  width: 8,
                ),
                Expanded(
                  child: Text(
                    'Sunday, 5th September 2021, 12:30 PM',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontSize: 13,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.normal,
                      fontStyle: FontStyle.normal,
                      color: Color(0xff4E535A),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Divider(
              color: Color(0xffE4E4E4).withOpacity(1),
              endIndent: 18,
              indent: 18,
              height: 1,
              thickness: 1,
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  'Quantity',
                  textAlign: TextAlign.justify,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.bold,
                    fontStyle: FontStyle.normal,
                    color: Color(0xff4E535A),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'EXTRAS:',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Color(0xff4E535A),
                      ),
                    ),
                    Text(
                      'TAX',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Color(0xff4E535A),
                      ),
                    ),
                    Container(
                      width: 50,
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      'Cheese',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Color(0xff4E535A),
                      ),
                    ),
                    Text(
                      'CGST',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Color(0xff4E535A),
                      ),
                    ),
                    Text(
                      'IGST',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Color(0xff4E535A),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RichText(
                      text: TextSpan(
                          text: '1 x',
                          style: TextStyle(
                            fontSize: 15,
                            fontFamily: 'Inter',
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.normal,
                            color: Color(0xff4E535A),
                          ),
                          children: [
                            TextSpan(
                              text: '\$ 0.5',
                              style: TextStyle(
                                fontSize: 15,
                                fontFamily: 'Inter',
                                fontStyle: FontStyle.normal,
                                fontWeight: FontWeight.normal,
                                color: Color(0xff4E535A),
                              ),
                            ),
                          ]),
                    ),
                    Text(
                      '\$ 0.5',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Color(0xff4E535A),
                      ),
                    ),
                    Text(
                      '\$ 0.5',
                      textAlign: TextAlign.justify,
                      style: TextStyle(
                        fontSize: 15,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.bold,
                        fontStyle: FontStyle.normal,
                        color: Color(0xff4E535A),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
