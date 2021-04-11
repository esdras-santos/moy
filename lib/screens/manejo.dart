import 'package:flutter/material.dart';

import 'home.dart';

class Manejo extends StatefulWidget {
  @override
  _ManejoState createState() => _ManejoState();
}

class _ManejoState extends State<Manejo> with SingleTickerProviderStateMixin {
  final Duration duration = const Duration(milliseconds: 200);
  double screenWidth, screenHeight;
  bool isCollapsed = true;
  AnimationController _controller;
  Animation<double> _scaleAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: .8).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    screenWidth = size.width;
    screenHeight = size.height;
    return Scaffold(
      body: Stack(
        children: [
          WillPopScope(
              onWillPop: () {
                _controller.reverse();
                setState(() {
                  isCollapsed = !isCollapsed;
                });
                if (isCollapsed == false) Navigator.pop(context);
              },
              child: sidebarMenu(context)),
          menuPrincipal(context),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.brown[600],
        child: Icon(Icons.arrow_back),
        onPressed: () {
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget sidebarMenu(context) {
    return Material(
      child: Container(
        width: double.maxFinite,
        height: double.maxFinite,
        color: Colors.white,
        padding: const EdgeInsets.only(
          left: 25.0,
          top: 150.0,
        ),
        child: ListView(
          children: <Widget>[
            Container(
              padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
              child: Text(
                "olá User",
                style: TextStyle(fontSize: 20.0),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ListTile(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Home()),
                );
              },
              title: Text(
                "Menu Pincipal",
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget menuPrincipal(context) {
    return AnimatedPositioned(
      top: 0,
      bottom: 0,
      left: isCollapsed ? 0 : 0.6 * screenWidth,
      right: isCollapsed ? 0 : -0.4 * screenWidth,
      duration: duration,
      child: ScaleTransition(
        scale: _scaleAnimation,
        child: Material(
          animationDuration: duration,
          borderRadius: BorderRadius.all(Radius.circular(10)),
          elevation: 8.0,
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.only(left: 16, right: 16, top: 30),
                child: Row(
                  children: [
                    SizedBox(
                      width: 10,
                    ),
                    InkWell(
                        onTap: () {
                          if (isCollapsed)
                            _controller.forward();
                          else
                            _controller.reverse();
                          setState(() {
                            isCollapsed = !isCollapsed;
                          });
                        },
                        child: Icon(
                          Icons.menu,
                          color: Colors.black,
                          size: 35,
                        )),
                    SizedBox(
                      width: 50,
                    ),
                    Text(
                      "Manejo",
                      style: TextStyle(
                          color: Colors.brown[600],
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 110.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 4.0),
                                  blurRadius: 10.0,
                                ),
                              ],
                            ),
                            height: 162,
                            width: 162,
                            child: Container(
                              height: 140,
                              width: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 100,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.brown[300],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Funcionários",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 4.0),
                                    blurRadius: 10.0,
                                  ),
                                ],
                              ),
                              height: 160,
                              width: 160,
                              child: Container(
                                height: 140,
                                width: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 100,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.brown[300],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Talhões",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10)
                      ],
                    ),
                    SizedBox(height: 10),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        SizedBox(width: 10),
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10.0),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(0.0, 4.0),
                                  blurRadius: 10.0,
                                ),
                              ],
                            ),
                            height: 162,
                            width: 162,
                            child: Container(
                              height: 140,
                              width: 140,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.white,
                                  ),
                                ],
                              ),
                              child: Column(
                                children: [
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Container(
                                    height: 100,
                                    width: 130,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.brown[300],
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Veiculos",
                                    style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 20,
                        ),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {},
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10.0),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    offset: Offset(0.0, 4.0),
                                    blurRadius: 10.0,
                                  ),
                                ],
                              ),
                              height: 160,
                              width: 160,
                              child: Container(
                                height: 140,
                                width: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Container(
                                      height: 100,
                                      width: 130,
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        boxShadow: [
                                          BoxShadow(
                                            color: Colors.brown[300],
                                          ),
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Chamada",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
