// import 'package:flutter/material.dart';
// import 'package:hidden_drawer_menu/hidden_drawer_menu.dart';
// import 'package:flutter/services.dart';

// import 'home.dart';

// class Menu extends StatefulWidget {
//   @override
//   State<StatefulWidget> createState() {
//     return _MenuState();
//   }
// }

// class _MenuState extends State<Menu> {

//   List<ScreenHiddenDrawer> itens = [];

//   @override
//   void initState() {
//      itens.add(new ScreenHiddenDrawer(
//         new Container(
//                 padding: EdgeInsets.only(left: 10.0, bottom: 20.0),
//                 child: Text(
//                   "olá Esdras",
//                   style: TextStyle(fontSize: 20.0),
//                 ),
//               ),
//         Home()));
//     itens.add(new ScreenHiddenDrawer(
//         new ItemHiddenMenu(
//           name: "MenuPrincipal",
//           baseStyle: TextStyle( color: Colors.white.withOpacity(0.8), fontSize: 20.0 ),
//           colorLineSelected: Colors.teal,
//         ),
//         Home()));

//     super.initState();
//   }


//   @override
//   Widget build(BuildContext context) {
//     SystemChrome.setSystemUIOverlayStyle(
//       SystemUiOverlayStyle(
//         statusBarColor: Colors.transparent,
//         statusBarBrightness: Brightness.dark,
//         systemNavigationBarColor: Colors.white,
//         systemNavigationBarIconBrightness: Brightness.dark,
//       ),
//     );
//     return HiddenDrawerMenu(
//       backgroundColorMenu: Colors.brown[600],
//       backgroundColorAppBar: Colors.brown[600],
//       screens: itens,
//         //    typeOpen: TypeOpen.FROM_RIGHT,
//         //    disableAppBarDefault: false,
//         //    enableScaleAnimin: true,
//         //    enableCornerAnimin: true,
//            slidePercent: 50.0,
//         //    verticalScalePercent: 80.0,
//         //    contentCornerRadius: 10.0,
//         //    iconMenuAppBar: Icon(Icons.menu),
//         //    backgroundContent: DecorationImage((image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
//         //    whithAutoTittleName: true,
//         //    styleAutoTittleName: TextStyle(color: Colors.red),
//         //    actionsAppBar: <Widget>[],
//         //    backgroundColorContent: Colors.blue,
//             elevationAppBar: 8.0,
//         //    tittleAppBar: Center(child: Icon(Icons.ac_unit),),
//         //    enableShadowItensMenu: true,
//         //    backgroundMenu: DecorationImage(image: ExactAssetImage('assets/bg_news.jpg'),fit: BoxFit.cover),
//     );
//   }
// }
