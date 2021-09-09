import 'package:flutter/material.dart';

class BookedScreen extends StatefulWidget {
  const BookedScreen({Key? key}) : super(key: key);

  @override
  _BookedScreenState createState() => _BookedScreenState();
}

class _BookedScreenState extends State<BookedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        body: Container(
          child: Container(
            padding: const EdgeInsets.only(left: 25, top: 0, right: 25),
            child: Column(
              children: <Widget>[
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                                child: Text(
                              "Congratulations!",
                              style: TextStyle(
                                  fontFamily: 'neosansbold', fontSize: 24),
                            )),
                            Container(
                                padding: const EdgeInsets.all(10),
                                child: Text(
                                  "Order Incoming",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontFamily: 'muli', fontSize: 18),
                                )),
                            Container(
                                margin: const EdgeInsets.only(
                                    top: 30, left: 10, bottom: 10),
                                width: 150,
                                height: 150,
                                decoration: BoxDecoration(
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.6),
                                        spreadRadius: 1,
                                        blurRadius: 8,
                                        offset: Offset(
                                            2, 6), // changes position of shadow
                                      ),
                                    ],
                                    color: Colors.white,
                                    border: Border.all(
                                      color: Colors.white,
                                    ),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(18))),
                                child: InkWell(
                                  child: Center(
                                    child: ClipRRect(
                                        borderRadius: BorderRadius.circular(18),
                                        child: Image.network(
                                          "https://picsum.photos/id/1005/367/267",
                                          fit: BoxFit.cover,
                                        )),
                                  ),
                                  onTap: () {},
                                )),
                            Container(
                                margin: const EdgeInsets.only(top: 10),
                                height: 90,
                                child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Text("Customer Name",
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontFamily: 'neosansbold',
                                            fontSize: 18,
                                          )),
                                      Container(
                                        margin: const EdgeInsets.only(top: 4),
                                        child: Text(
                                          "DKI Jakarta, Kembangan ",
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      // Container(
                                      //   margin: const EdgeInsets.only(top: 4),
                                      //   child: Text(
                                      //     "Rate: 4,5",
                                      //     textAlign: TextAlign.center,
                                      //   ),
                                      // ),
                                    ])),

                            // Container(
                            //     child: Row(
                            //   children: [
                            //     Expanded(
                            //       child: Text(
                            //         "Payment Status ",
                            //         style: TextStyle(
                            //             fontFamily: 'neosansbold',
                            //             fontSize: 15),
                            //       ),
                            //     ),
                            //     Expanded(
                            //       child: Text(
                            //         response['payment_status']
                            //             .toString(),
                            //         textAlign: TextAlign.right,
                            //         style: TextStyle(
                            //             fontFamily: 'muli',
                            //             fontSize: 15),
                            //       ),
                            //     ),
                            //   ],
                            // )),

                            //================================================
                            Container(
                                child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Type Konsultasi ",
                                    style: TextStyle(
                                        fontFamily: 'neosansbold',
                                        fontSize: 15),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    "type_consultaion",
                                    textAlign: TextAlign.right,
                                    style: TextStyle(
                                        fontFamily: 'muli', fontSize: 15),
                                  ),
                                ),
                              ],
                            )),

                            //================================================

                            Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Waktu Konsultasi ",
                                        style: TextStyle(
                                            fontFamily: 'neosansbold',
                                            fontSize: 15),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "time",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontFamily: 'muli', fontSize: 15),
                                      ),
                                    ),
                                  ],
                                )),
                            Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Waktu Mulai ",
                                        style: TextStyle(
                                            fontFamily: 'neosansbold',
                                            fontSize: 15),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "--",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontFamily: 'muli', fontSize: 15),
                                      ),
                                    ),
                                  ],
                                )),
                            Container(
                                margin: const EdgeInsets.only(top: 10),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        "Waktu Selesai ",
                                        style: TextStyle(
                                            fontFamily: 'neosansbold',
                                            fontSize: 15),
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        "--",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontFamily: 'muli', fontSize: 15),
                                      ),
                                    ),
                                  ],
                                )),
                            //================================================
                            //
                            Container(
                              margin: const EdgeInsets.all(10),
                              height: 1,
                              width: double.infinity,
                              color: Colors.grey[500],
                            ),
                            Container(
                                child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    "Harga",
                                    style: TextStyle(
                                        fontFamily: 'neosansbold',
                                        fontSize: 18),
                                  ),
                                ),
                                Expanded(
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.end,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Text(
                                        "IDR ",
                                        textAlign: TextAlign.right,
                                        style: TextStyle(
                                            fontFamily: 'mulibold',
                                            fontSize: 15),
                                      ),
                                      Container(
                                        padding: const EdgeInsets.only(left: 5),
                                        child: Text(
                                          "price",
                                          textAlign: TextAlign.right,
                                          style: TextStyle(
                                              fontFamily: 'muli', fontSize: 15),
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            )),
                          ]),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
