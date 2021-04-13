import 'package:flutter/material.dart';

import 'home.dart';

class RegistrarBalaios extends StatefulWidget {
  @override
  _RegistrarBalaiosState createState() => _RegistrarBalaiosState();
}

class _RegistrarBalaiosState extends State<RegistrarBalaios>
    with SingleTickerProviderStateMixin {
  final Duration duration = const Duration(milliseconds: 200);
  double screenWidth, screenHeight;
  bool isCollapsed = true;
  AnimationController _controller;
  Animation<double> _scaleAnimation;

  bool abrirCarreta = false;
  int balaios = 0;
  double sliderval = 0.0;
  //a capacidade deve ser verificada no backend
  int capacidade = 100;

  //esses itens devem ser tirados do backend
  List<ListItem> _motoristasItens = [
    ListItem(0, "Selecione o motorista"),
    ListItem(1, "First Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item"),
  ];

  //esses itens devem ser puxados do backend
  List<ListItem> _veiculosItens = [
    ListItem(0, "Selecione o veiculo"),
    ListItem(1, "First Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item"),
  ];

  //esses itens devem ser puxados do backend
  List<ListItem> _trabalhadorItens = [
    ListItem(0, "Selecione o trabalhador"),
    ListItem(1, "First Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item"),
  ];

  //esses itens devem ser puxados do backend
  List<ListItem> _talhaoItens = [
    ListItem(0, "Selecione Talhão"),
    ListItem(1, "First Value"),
    ListItem(2, "Second Item"),
    ListItem(3, "Third Item"),
    ListItem(4, "Fourth Item"),
  ];

  List<DropdownMenuItem<ListItem>> _motoristasMenuItens;
  ListItem _selectedMotoristaItem;

  List<DropdownMenuItem<ListItem>> _veiculosMenuItens;
  ListItem _selectedVeiculoItem;

  List<DropdownMenuItem<ListItem>> _trabalhadorMenuItens;
  ListItem _selectedTrabalhadorItem;

  List<DropdownMenuItem<ListItem>> _talhaoMenuItens;
  ListItem _selectedTalhaoItem;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: duration);
    _scaleAnimation = Tween<double>(begin: 1, end: .8).animate(_controller);
    _motoristasMenuItens = buildDropDownMenuItems(_motoristasItens);
    _selectedMotoristaItem = _motoristasMenuItens[0].value;
    _veiculosMenuItens = buildDropDownMenuItems(_veiculosItens);
    _selectedVeiculoItem = _veiculosMenuItens[0].value;
    _trabalhadorMenuItens = buildDropDownMenuItems(_trabalhadorItens);
    _selectedTrabalhadorItem = _trabalhadorMenuItens[0].value;
    _talhaoMenuItens = buildDropDownMenuItems(_talhaoItens);
    _selectedTalhaoItem = _talhaoMenuItens[0].value;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  List<DropdownMenuItem<ListItem>> buildDropDownMenuItems(List listItems) {
    List<DropdownMenuItem<ListItem>> items = [];
    for (ListItem listItem in listItems) {
      items.add(
        DropdownMenuItem(
          child: Text(
            listItem.name,
            style: TextStyle(fontSize: 20),
          ),
          value: listItem,
        ),
      );
    }
    return items;
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
          registrarBalaios(context),
        ],
      ),
      floatingActionButton: isCollapsed
          ? FloatingActionButton(
              heroTag: "pop",
              backgroundColor: Colors.brown[600],
              child: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.pop(context);
              },
            )
          : Container(),
    );
  }

  Widget opcoesCarreta(context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: 10,
            ),
            Text(
              "CarretaID",
              style: TextStyle(
                color: Colors.brown,
                fontSize: 18,
              ),
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              children: [
                Text(
                  "Capacidade",
                  style: TextStyle(
                      color: Colors.brown,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 10),
                Text(
                  "$balaios/$capacidade",
                  style: TextStyle(
                    color: Colors.brown,
                    fontSize: 18,
                  ),
                ),
              ],
            ),
            SizedBox(
              width: 40,
            ),
            Icon(Icons.settings),
            SizedBox(
              width: 10,
            ),
          ],
        ),
        SizedBox(
          height: 5,
        ),
        DropdownButton<ListItem>(
          value: _selectedTrabalhadorItem,
          items: _trabalhadorMenuItens,
          onChanged: (value) {
            setState(() {
              _selectedTrabalhadorItem = value;
            });
          },
        ),
        SizedBox(height: 10),
        Center(
          child: Text(
            "Balaios",
            style: TextStyle(
                color: Colors.brown, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        SizedBox(height: 10),
        Row(
          children: [
            SizedBox(
              width: 80,
            ),
            balaios == 0
                ? SizedBox(width: 40)
                : Container(
                    height: 40,
                    width: 40,
                    child: FittedBox(
                      child: FloatingActionButton(
                        heroTag: "less",
                        backgroundColor: Colors.brown,
                        child: Text(
                          "-",
                          style: TextStyle(
                            fontSize: 50,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            balaios -= 1;
                          });
                        },
                      ),
                    ),
                  ),
            SizedBox(width: 40),
            Text(
              "$balaios",
              style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
            ),
            SizedBox(width: 40),
            capacidade == balaios? SizedBox(width: 40): Container(
              height: 40,
              width: 40,
              child: FittedBox(
                child: FloatingActionButton(
                  heroTag: "plus",
                  backgroundColor: Colors.brown,
                  child: Text("+",
                      style:
                          TextStyle(fontSize: 50, fontWeight: FontWeight.bold)),
                  onPressed: () {
                    setState(() {
                      balaios += 1;
                    });
                  },
                ),
              ),
            ),
          ],
        ),
        SizedBox(
          height: 10,
        ),
        Center(
          child: Text(
            "Preço",
            style: TextStyle(
                color: Colors.brown, fontSize: 20, fontWeight: FontWeight.bold),
          ),
        ),
        Text(
          "R\$ ${sliderval.round()}",
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        Slider(
          activeColor: Colors.brown,
          value: sliderval,
          max: 40,
          divisions: 40,
          onChanged: (double value) {
            setState(() {
              sliderval = value;
            });
          },
        ),
        DropdownButton<ListItem>(
          value: _selectedTalhaoItem,
          items: _talhaoMenuItens,
          onChanged: (value) {
            setState(() {
              _selectedTalhaoItem = value;
            });
          },
        ),
        SizedBox(
          height: 10,
        ),
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
            height: 40,
            width: 160,
            child: Container(
              height: 100,
              width: 140,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                boxShadow: [
                  BoxShadow(
                    color: Colors.brown[600],
                  ),
                ],
              ),
              child: Column(
                children: [
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Imprimir",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
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

  Widget registrarBalaios(context) {
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
                    Expanded(
                      flex: 1,
                      child: Text(
                        "Registrar Balaios",
                        style: TextStyle(
                            color: Colors.brown[600],
                            fontSize: 22.0,
                            fontWeight: FontWeight.bold),
                      ),
                    )
                  ],
                ),
              ),
              SizedBox(height: 10),
              Material(
                child: Column(
                  children: <Widget>[
                    DropdownButton<ListItem>(
                      value: _selectedMotoristaItem,
                      items: _motoristasMenuItens,
                      onChanged: (value) {
                        setState(() {
                          _selectedMotoristaItem = value;
                        });
                      },
                    ),
                    DropdownButton<ListItem>(
                      value: _selectedVeiculoItem,
                      items: _veiculosMenuItens,
                      onChanged: (value) {
                        setState(() {
                          _selectedVeiculoItem = value;
                        });
                      },
                    ),
                    SizedBox(height: 5),
                    Row(
                      children: [
                        SizedBox(width: 10),
                        Expanded(
                          flex: 1,
                          child: GestureDetector(
                            onTap: () {
                              setState(() {
                                abrirCarreta = true;
                              });
                            },
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
                              height: 40,
                              width: 160,
                              child: Container(
                                height: 100,
                                width: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.brown[600],
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Abrir Carreta",
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold,
                                          fontSize: 18,
                                          color: Colors.white),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 20),
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
                              height: 40,
                              width: 160,
                              child: Container(
                                height: 100,
                                width: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.brown[600],
                                    ),
                                  ],
                                ),
                                child: Column(
                                  children: [
                                    SizedBox(
                                      height: 10,
                                    ),
                                    Text(
                                      "Fechar Carreta",
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontSize: 18,
                                        color: Colors.white,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                      ],
                    ),
                    SizedBox(height: 10),
                  ],
                ),
              ),
              abrirCarreta ? opcoesCarreta(context) : Container(),
            ],
          ),
        ),
      ),
    );
  }
}

class ListItem {
  int value;
  String name;

  ListItem(this.value, this.name);
}
