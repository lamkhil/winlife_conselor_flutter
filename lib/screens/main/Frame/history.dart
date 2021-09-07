import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class FrameHistory extends StatefulWidget {
  const FrameHistory({Key? key}) : super(key: key);

  @override
  _FrameHistoryState createState() => _FrameHistoryState();
}

Future<void> _refresh() async {
  //_restsend();
}

class _FrameHistoryState extends State<FrameHistory> {
  @override
  Widget build(BuildContext context) {
    var screenHeight = MediaQuery.of(context).size.height;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Center(
          child: Text(
            "History",
            textAlign: TextAlign.center,
            style: TextStyle(fontFamily: 'neosansbold', color: Colors.black87),
          ),
        ),
      ),
      backgroundColor: Colors.grey[100],
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: _refresh,
          child: Container(
              color: Colors.white,
              padding: const EdgeInsets.all(10),
              child: true
                  ? ConstrainedBox(
                      constraints: BoxConstraints(
                        minHeight: MediaQuery.of(context).size.height,
                      ),
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Center(
                              child: Container(
                                width: 300,
                                child: Image.asset("assets/icon_empty.png"),
                              ),
                            ),
                            Container(
                              padding: const EdgeInsets.all(10),
                              child: Text(
                                "Empty",
                                style: TextStyle(
                                    fontFamily: "neosansbold", fontSize: 20),
                              ),
                            ),
                            InkWell(
                              onTap: () {
                                _refresh();
                              },
                              child: Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Text("Reload")),
                            ),
                          ],
                        ),
                      ),
                    )
                  : ListView.builder(
                      itemCount: 4,
                      itemBuilder: (contex, index) {
                        return exploreview(context, null);
                      })),
        ),
      ),
    );
  }

  Widget exploreview(BuildContext context, data) {
    return InkWell(
      onTap: () {},
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.6),
                spreadRadius: 1,
                blurRadius: 8,
                offset: Offset(2, 6), // changes position of shadow
              ),
            ],
            color: Colors.white,
            border: Border.all(
              color: Colors.white,
            ),
            borderRadius: BorderRadius.all(Radius.circular(7))),
        margin: const EdgeInsets.only(top: 10, bottom: 10, left: 15, right: 15),
        child: Column(
          children: [
            Container(
                padding: const EdgeInsets.all(15),
                width: double.infinity,
                height: 45,
                decoration: BoxDecoration(
                    color: Colors.green[700],
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(7),
                        topRight: Radius.circular(7))),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        "data['data6'].toString()",
                        style: TextStyle(
                            fontFamily: 'neosansbold', color: Colors.white),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        "data['data7'].toString()",
                        textAlign: TextAlign.right,
                        style: TextStyle(
                            fontFamily: 'muli',
                            color: Colors.white,
                            fontSize: 14),
                      ),
                    ),
                  ],
                )),
            Container(
                padding: const EdgeInsets.all(5),
                margin: const EdgeInsets.all(5),
                child: Row(
                  children: [
                    Expanded(
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                          Text(
                            " data['data2']",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                              fontFamily: 'neosansbold',
                              color: Colors.black87,
                            ),
                          ),
                          Text(
                            "data['data3']",
                            textAlign: TextAlign.left,
                            style: TextStyle(
                                fontFamily: 'muli',
                                color: Colors.black87,
                                fontSize: 12),
                          ),
                          Container(
                            margin: const EdgeInsets.only(
                              top: 10,
                              bottom: 10,
                            ),
                            width: 100,
                            color: Colors.green,
                            height: 2,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Problem: ",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: 'mulibold',
                                    color: Colors.black87,
                                    fontSize: 12),
                              ),
                              Text(
                                "data['data4']",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                    fontFamily: 'muli',
                                    color: Colors.black87,
                                    fontSize: 12),
                              ),
                            ],
                          )
                        ])),
                    Container(
                      margin:
                          const EdgeInsets.only(top: 5, left: 10, bottom: 10),
                      width: 70,
                      height: 70,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.6),
                              spreadRadius: 1,
                              blurRadius: 8,
                              offset:
                                  Offset(2, 6), // changes position of shadow
                            ),
                          ],
                          color: Colors.white,
                          border: Border.all(
                            color: Colors.white,
                          ),
                          borderRadius: BorderRadius.all(Radius.circular(18))),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8.0),
                        child: Image.network("data['data5'].toString()"),
                      ),
                    ),
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
