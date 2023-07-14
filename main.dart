import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:convert';
import 'dart:collection';
import 'dart:isolate';
import 'dart:async';
//import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:http/http.dart' as http;
import 'package:csv/csv.dart';
import 'dart:io';
import 'package:external_path/external_path.dart';
import 'package:permission_handler/permission_handler.dart';

String namee = "aa";
int count_devices_in_page = 10;
var devices_of_logged_user = [];
SalesData s = new SalesData('Feb', 35);
List<SalesData> received_data = [s];

//elements.add(s);
void main() => runApp(const MyApp());
 
class MyApp extends StatelessWidget 
{
  const MyApp({Key? key}) : super(key: key);
 
  @override
  Widget build(BuildContext context) 
  {
    return MaterialApp(
      builder: (context, widget) => ResponsiveWrapper.builder( //responsive
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: const [
          ResponsiveBreakpoint.resize(350, name: MOBILE),
          ResponsiveBreakpoint.autoScale(600, name: TABLET),
          ResponsiveBreakpoint.resize(800, name: DESKTOP),
          ResponsiveBreakpoint.autoScale(1700, name: 'XL'),
        ],
      ),
      title: 'Localizations Sample App',
      localizationsDelegates: [
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        Locale('fa'), 
      ],
      debugShowCheckedModeBanner: false,
      home: Scaffold(
      drawer: const NavigationDrawer(),
      //appBar: AppBar(title: const Text('منو'),
       //backgroundColor: Colors.red),
       appBar: null,
        body: const Login(),
      ),
        theme: ThemeData(
        primarySwatch: Colors.green,
      ),
    );
  }
}
/*class Chart1 extends StatefulWidget
{
  const Chart1({Key? key}) : super(key: key);
 
  @override
  State<Chart1> createState() => _Chart1();
}*/

class SalesData 
{
    SalesData(this.year, this.sales);
    final String year;
    final double sales;
}

/*class _Chart1 extends State<Chart1>
{

  
@override
  Widget build(BuildContext context) 
  {
    received_data = <SalesData>[
                    SalesData('Jan', 35),
                    SalesData('Feb', 28),
                    SalesData('Mar', 34),
                    SalesData('Apr', 32),
                    SalesData('May', 40),
                    SalesData('Sep', 65)
                  ];
    received_data.add(SalesData('Aug', 65));
    return Scaffold(
      body: Center(
          child: Container(
            child: SfCartesianChart(
              // Initialize category axis
              primaryXAxis: CategoryAxis(),

              series: <LineSeries<SalesData, String>>[
                LineSeries<SalesData, String>(
                  // Bind data source
                  dataSource:  received_data,
                  xValueMapper: (SalesData sales, _) => sales.year,
                  yValueMapper: (SalesData sales, _) => sales.sales
                )
              ]
            )
          )
        )
    );
  }
}*/
class Menu_device extends StatefulWidget
{
  const Menu_device({Key? key}) : super(key: key);
 
  @override
  State<Menu_device> createState() => _Menu_device();
}

class _Menu_device extends State<Menu_device>
{
  @override
  Widget build(BuildContext context)
  {
      MediaQueryData _mediaQueryData = MediaQuery.of(context);
      return new Scaffold
      (
        appBar: new AppBar
        (
            title: Text('منو وسیله ها'),
        ),
        drawer: const NavigationDrawer(),
         body: new Padding
    (
        padding: const EdgeInsets.all(20),
        child: Stack
        (
          alignment: Alignment.center,
          children: <Widget>[
            /*Icon
            (
              Icons.star,
              color: Colors.red[500],
              size: 600,
            ),*/
             
            ListView
            (
                scrollDirection: Axis.vertical,
                children: <Widget>
                [
                  Row
                  (
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: 
                      [
                          Container
                          (
                        //alignment: Alignment.,
                            padding: const EdgeInsets.all(10), //distance from up and down
                            child: Image.asset
                            ("images/logo.png",
                              fit: BoxFit.cover,
                              height: _mediaQueryData.size.height * 0.06,
                              width: _mediaQueryData.size.width * 0.14,
                            )
                          ),
                      ]
                  ),
                Row
                (
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>
                  [  
                    Container
              (
                width: 170.0,
                height: 200.0,
                child: Column
                (
                    children: <Widget>
                    [
                        Container
                      (
                        //alignment: Alignment.,
                        padding: const EdgeInsets.all(10), //distance from up and down
                          child: Image.asset("images/device.jpg",
                          fit: BoxFit.cover,
                          height: _mediaQueryData.size.height * 0.06,
                          width: _mediaQueryData.size.width * 0.04,
                        )
                      ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: const Text
                        (
                          'دستگاه 1',
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                        
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        
                Container
                (
                  height: 50,
                  padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                  child: ElevatedButton
                  (
                    child: const Text('device 1'),
                    onPressed: ()
                    {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => Main_page()),);
                    }
                  )
                )
                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white70,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),

              Container
              (
                width: 170.0,
                height: 200.0,
                child: Column
                (
                    children: <Widget>
                    [
                        Container
                      (
                        //alignment: Alignment.,
                        padding: const EdgeInsets.all(10), //distance from up and down
                          child: Image.asset("images/device.jpg",
                          fit: BoxFit.cover,
                          height: _mediaQueryData.size.height * 0.06,
                          width: _mediaQueryData.size.width * 0.04,
                        )
                      ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: const Text
                        (
                          'دستگاه 2',
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                        
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        
                        Container
                        (
                          height: 50,
                          padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                          child: ElevatedButton
                          (
                            child: const Text('device 2'),
                            onPressed: ()
                            {
                                Navigator.push(context,MaterialPageRoute(builder: (context) => Main_page2()),);
                            }
                          )
                        )


                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white70,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
                  ]
                ),
                ]
        )
          ]
    )
      )
      );
  }
}
class History extends StatefulWidget
{
  const History({Key? key}) : super(key: key);
 
  @override
  State<History> createState() => _History();
}
class _History extends State<History>
{
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool check_box_value = true;
  @override
  Widget build(BuildContext context)
  {
     MediaQueryData _mediaQueryData = MediaQuery.of(context);
     return new Scaffold
     (
        appBar: new AppBar
        (
           title: Text('تاریخچه'),
        ),
        body: new Padding
    (
        padding: const EdgeInsets.all(20), 
        child: Stack
        (
          alignment: Alignment.center,
          children: <Widget>[
            /*Icon
            (
              Icons.star,
              color: Colors.red[500],
              size: 600,
            ),*/
            Positioned
            (
                right: 5,
                top: 10,
                left: 0.0,
                bottom: 0.0,
                child: Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text
                (
                  'داشبورد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 20),
                )
              ) ,
            ),

            Positioned
            (
                right: 10,
                top: 0,
                child: Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text
                (
                  'داشبورد/',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )
              ) ,
            ),
            
            Positioned
            (
                right: 50,
                top: 0,
                child: Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text
                (
                  'صفحه اصلی',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )
              ) ,
            ),
            Positioned
            (
                top: 0,
                right: 110,
            
            child: SizedBox
            (
                height: 50,
                width: 240,
            child: Container
            (
              padding: const EdgeInsets.all(10),
                child: 
                TextField
                (
                  style: TextStyle(fontSize: 12),
                  controller: nameController,
                  decoration: const InputDecoration
                  (
                  border: OutlineInputBorder(), //frame
                  labelText: 'جستجو...',
                  ),
                ),  
            ),
            ),
            ),
            Center //Table
            (
              child: Container
              (
                width: _mediaQueryData.size.width * 0.5,
                height: _mediaQueryData.size.height * 0.5,
                child: ListView
                (
                    shrinkWrap: true, 
                    scrollDirection: Axis.vertical,
                    children: <Widget>
                    [
                         Container
              (
                width: _mediaQueryData.size.width * 0.9,
                height: _mediaQueryData.size.height * 0.05,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: Text
                (
                   'تاریخچه',
                  style: TextStyle
                  (
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
            
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.green,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),
                    SingleChildScrollView
                    (
                        scrollDirection: Axis.horizontal,
                        child: DataTable
                    (
                      columns:
                      [
                 DataColumn(
                   label: Text
                   (
                    'عنوان',  
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)  
                )
                ), 
                 DataColumn
                 (
                   label: Text
                  (  
                    'زمان',  
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)  
                )
                ),
                 DataColumn(label: Text(  
                    'وضعیت',  
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)  
                )),  
                 DataColumn(label: Text(  
                    'تاریخ',  
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)  
                )),
                DataColumn
                 (
                   label: Text
                  (  
                    '',  
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)  
                )
                ),
                      ],
                rows:
                [
                  DataRow(cells: [  
                  DataCell
                  (
                    Container
                      (
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   'ورودی 4 روشن شد',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                ))),  
                  DataCell(Container
                      (
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   '7:20 ب.ظ',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),
                DataCell(Container
              (
                width: 50.0,
                height: 20.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: const Text
                (
                   'ONLINE',
                  style: TextStyle
                  (
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                )),
            
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.green,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),),    
                DataCell
                    (
                      Container
                      (
                        //alignment: Alignment.,
                        padding: const EdgeInsets.all(0), //distance from up and down
                        child: Image.asset("images/download.jpg",
                          fit: BoxFit.cover,
                           height: _mediaQueryData.size.height * 0.03
                        )
                      )
                    ),

                 /*DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(0), //distance from up and down
                child: const Text
                (
                   '00/03/22',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),*/

                DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: TextButton
                (
                  child: const Text
                  (
                     'جزئیات',
                     style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 10),
                  ),
                  onPressed: () 
                  {
                   //details of history
                  },
                ))), 
                ]),
                 DataRow(cells: [  
                  DataCell
                  (
                    Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   'ورودی 4 خاموش شد',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                ))),  
                  DataCell(Container
                      (
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   '9:34 ب.ظ',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),
                DataCell(Container
              (
                width: 50.0,
                height: 20.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: const Text
                (
                   'ONLINE',
                  style: TextStyle
                  (
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                )),
            
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.green,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),),    
                 DataCell
                    (
                      Container
                      (
                padding: const EdgeInsets.all(0), //distance from up and down
                child: const Text
                (
                   '00/02/21',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),

                DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: TextButton
                (
                  child: const Text
                  (
                     'جزئیات',
                     style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 10),
                  ),
                  onPressed: () 
                  {
                   //details of history
                  },
                ))), 
                ]),
                DataRow(cells: [  
                  DataCell
                  (
                    Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   'ورودی 2 خاموش شد',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                ))),  
                  DataCell(Container
                      (
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   '9:34 ب.ظ',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),
                DataCell(Container
              (
                width: 50.0,
                height: 20.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: const Text
                (
                   'ONLINE',
                  style: TextStyle
                  (
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                )),
            
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.green,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),),    
                
                 DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(0), //distance from up and down
                child: const Text
                (
                   '00/02/21',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),

                DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: TextButton
                (
                  child: const Text
                  (
                     'جزئیات',
                     style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 10),
                  ),
                  onPressed: () 
                  {
                   //details of history
                  },
                ))), 
                ]),
                DataRow(cells: [  
                  DataCell
                  (
                    Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   'ورودی 1 روشن شد',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                ))),  
                  DataCell(Container
                      (
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   '2:20 بامداد',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),
                DataCell(Container
              (
                width: 50.0,
                height: 20.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: const Text
                (
                   'ONLINE',
                  style: TextStyle
                  (
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                )),
            
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.green,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),),    
                 DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(0), //distance from up and down
                child: const Text
                (
                   '00/02/20',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),

                DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: TextButton
                (
                  child: const Text
                  (
                     'جزئیات',
                     style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 10),
                  ),
                  onPressed: () 
                  {
                   //details of history
                  },
                ))), 
                ]),
                DataRow(cells: [  
                  DataCell
                  (
                    Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   'دستگاه آنلاین شد',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                ))),  
                  DataCell(Container
                      (
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   '6:54 ق.ب',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),
                DataCell(Container
              (
                width: 50.0,
                height: 20.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: const Text
                (
                   'ONLINE',
                  style: TextStyle
                  (
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                )),
            
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.green,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),),    
                
                 DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(0), //distance from up and down
                child: const Text
                (
                   '00/02/18',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),

                DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: TextButton
                (
                  child: const Text
                  (
                     'جزئیات',
                     style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 10),
                  ),
                  onPressed: () 
                  {
                   //details of history
                  },
                ))), 
                ]),
                DataRow(cells: [  
                  DataCell
                  (
                    Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   'دستگاه آفلاین شد',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                ))),  
                  DataCell(Container
                      (
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   '7:20 ق.ب',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),
                DataCell(Container
              (
                width: 50.0,
                height: 20.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: const Text
                (
                   'OFFLINE',
                  style: TextStyle
                  (
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                )),
            
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.black38,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),),    
                
                 DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(0), //distance from up and down
                child: const Text
                (
                   '00/02/17',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),

                DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: TextButton
                (
                  child: const Text
                  (
                     'جزئیات',
                     style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 10),
                  ),
                  onPressed: () 
                  {
                   //details of history
                  },
                ))), 
                ]),
                DataRow(cells: [  
                  DataCell
                  (
                    Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                  'ورودی 2 روشن شد',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                ))),  
                  DataCell(Container
                      (
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   '3:28 ب.ظ',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),
                DataCell(Container
              (
                width: 50.0,
                height: 20.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: const Text
                (
                   'ONLINE',
                  style: TextStyle
                  (
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                )),
            
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.green,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),),    
                
                 DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(0), //distance from up and down
                child: const Text
                (
                   '00/02/16',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),

                DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: TextButton
                (
                  child: const Text
                  (
                     'جزئیات',
                     style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 10),
                  ),
                  onPressed: () 
                  {
                   //details of history
                  },
                ))), 
                ]),
                DataRow(cells: [  
                  DataCell
                  (
                    Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   'ورودی 1 خاموش شد',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                ))),  
                  DataCell(Container
                      (
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   '1:28 ق.ب',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),
                DataCell(Container
              (
                width: 50.0,
                height: 20.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: const Text
                (
                   'ONLINE',
                  style: TextStyle
                  (
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                )),
            
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.green,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),),    

                 DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(0), //distance from up and down
                child: const Text
                (
                   '00/02/12',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),

                DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: TextButton
                (
                  child: const Text
                  (
                     'جزئیات',
                     style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 10),
                  ),
                  onPressed: () 
                  {
                   //details of history
                  },
                ))), 
                ]),
                DataRow(cells: [  
                  DataCell
                  (
                    Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   'خروجی 1 خاموش شد',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                ))),  
                  DataCell(Container
                      (
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                  '8:19 ب.ظ',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),
                DataCell(Container
              (
                width: 50.0,
                height: 20.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: const Text
                (
                   'ONLINE',
                  style: TextStyle
                  (
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                )),
            
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.green,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),),    

                 DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(0), //distance from up and down
                child: const Text
                (
                   '00/02/10',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),

                DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: TextButton
                (
                  child: const Text
                  (
                     'جزئیات',
                     style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 10),
                  ),
                  onPressed: () 
                  {
                   //details of history
                  },
                ))), 
                ]),

                DataRow(cells: [  
                  DataCell
                  (
                    Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   'خروجی 2 روشن شد',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                ))),  
                  DataCell(Container
                      (
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                    '4:28 ق.ب',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),
                DataCell(Container
              (
                width: 50.0,
                height: 20.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: const Text
                (
                   'ONLINE',
                  style: TextStyle
                  (
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                )),
            
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.green,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),),    

                 DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(0), //distance from up and down
                child: const Text
                (
                   '00/02/08',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),

                DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: TextButton
                (
                  child: const Text
                  (
                     'جزئیات',
                     style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 10),
                  ),
                  onPressed: () 
                  {
                   //details of history
                  },
                ))), 
                ]),
                DataRow(cells: [  
                  DataCell
                  (
                    Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   'ورودی 3 خاموش شد',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                ))),  
                  DataCell(Container
                      (
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   '2:46 ب.ظ',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),
                DataCell(Container
              (
                width: 50.0,
                height: 20.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: const Text
                (
                   'ONLINE',
                  style: TextStyle
                  (
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                )),
            
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.green,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),),    

                 DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(0), //distance from up and down
                child: const Text
                (
                   '00/02/05',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),

                DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: TextButton
                (
                  child: const Text
                  (
                     'جزئیات',
                     style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 10),
                  ),
                  onPressed: () 
                  {
                   //details of history
                  },
                ))), 
                ])
                ]     
                ),
                    )
                    

              
                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),
             
            ),
            
          ],
        )
   ),
     );
  } 
}

class Get_Device extends StatefulWidget
{
  const Get_Device({Key? key}) : super(key: key);
  
  @override
  State<Get_Device> createState() => _Get_Device();
}
class _Get_Device extends State<Get_Device>
{
  bool check_box_value = true;
  @override
  Widget build(BuildContext context)
  {
     
     MediaQueryData _mediaQueryData = MediaQuery.of(context);
     return new Scaffold
     (
        appBar: new AppBar
        (
           title: Text('تاریخچه'),
        ),
        body: new Padding
    (
        padding: const EdgeInsets.all(20), 
        child: Stack
        (
          alignment: Alignment.center,
          children: <Widget>[
            /*Icon
            (
              Icons.star,
              color: Colors.red[500],
              size: 600,
            ),*/
            Positioned
            (
                right: 5,
                top: 10,
                left: 0.0,
                bottom: 0.0,
                child: Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text
                (
                  'داشبورد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 20),
                )
              ) ,
            ),

            Positioned
            (
                right: 10,
                top: 0,
                child: Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text
                (
                  'داشبورد/',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )
              ) ,
            ),
            
            Positioned
            (
                right: 50,
                top: 0,
                child: Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text
                (
                  'صفحه اصلی',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )
              ) ,
            ),
            Positioned
            (
                top: 0,
                right: 110,
            
            child: SizedBox
            (
                height: 50,
                width: 240,
            child: Container
            (
              padding: const EdgeInsets.all(10),
                child: 
                TextField
                (
                  style: TextStyle(fontSize: 12),
                  decoration: const InputDecoration
                  (
                  border: OutlineInputBorder(), //frame
                  labelText: 'جستجو...',
                  ),
                ),  
            ),
            ),
            ),
            Center //Table
            (
              child: Container
              (
                width: _mediaQueryData.size.width * 0.5,
                height: _mediaQueryData.size.height * 0.5,
                child: ListView
                (
                    shrinkWrap: true, 
                    scrollDirection: Axis.vertical,
                    children: <Widget>
                    [
                         Container
              (
                width: _mediaQueryData.size.width * 0.9,
                height: _mediaQueryData.size.height * 0.05,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: Text
                (
                   'تاریخچه',
                  style: TextStyle
                  (
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                ),
              ),
            
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.green,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),
                    SingleChildScrollView
                    (
                        scrollDirection: Axis.horizontal,
                        child: DataTable
                    (
                      columns:
                      [
                 DataColumn(
                   label: Text
                   (
                    'عنوان',  
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)  
                )
                ), 
                 DataColumn
                 (
                   label: Text
                  (  
                    'زمان',  
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)  
                )
                ),
                 DataColumn(label: Text(  
                    'وضعیت',  
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)  
                )),  
                 DataColumn(label: Text(  
                    'تاریخ',  
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)  
                )),
                DataColumn
                 (
                   label: Text
                  (  
                    '',  
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold)  
                )
                ),
                      ],
                rows:
                [
                  DataRow(cells: [  
                  DataCell
                  (
                    Container
                      (
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: Text
                (
                  
                   namee,
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                ))),  
                  DataCell(Container
                      (
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   '7:20 ب.ظ',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),
                DataCell(Container
              (
                width: 50.0,
                height: 20.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: const Text
                (
                   'ONLINE',
                  style: TextStyle
                  (
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                )),
            
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.green,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),),    
                DataCell
                    (
                      Container
                      (
                        //alignment: Alignment.,
                        padding: const EdgeInsets.all(0), //distance from up and down
                        child: Image.asset("images/download.jpg",
                          fit: BoxFit.cover,
                           height: _mediaQueryData.size.height * 0.03
                        )
                      )
                    ),

                 /*DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(0), //distance from up and down
                child: const Text
                (
                   '00/03/22',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),*/

                DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: TextButton
                (
                  child: const Text
                  (
                     'جزئیات',
                     style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 10),
                  ),
                  onPressed: () 
                  {
                   //details of history
                  },
                ))), 
                ]),
                 DataRow(cells: [  
                  DataCell
                  (
                    Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   'ورودی 4 خاموش شد',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                ))),  
                  DataCell(Container
                      (
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   '9:34 ب.ظ',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),
                DataCell(Container
              (
                width: 50.0,
                height: 20.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: const Text
                (
                   'ONLINE',
                  style: TextStyle
                  (
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                )),
            
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.green,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),),    
                 DataCell
                    (
                      Container
                      (
                padding: const EdgeInsets.all(0), //distance from up and down
                child: const Text
                (
                   '00/02/21',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),

                DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: TextButton
                (
                  child: const Text
                  (
                     'جزئیات',
                     style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 10),
                  ),
                  onPressed: () 
                  {
                   //details of history
                  },
                ))), 
                ]),
                DataRow(cells: [  
                  DataCell
                  (
                    Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   'ورودی 2 خاموش شد',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                ))),  
                  DataCell(Container
                      (
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   '9:34 ب.ظ',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),
                DataCell(Container
              (
                width: 50.0,
                height: 20.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: const Text
                (
                   'ONLINE',
                  style: TextStyle
                  (
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                )),
            
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.green,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),),    
                
                 DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(0), //distance from up and down
                child: const Text
                (
                   '00/02/21',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),

                DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: TextButton
                (
                  child: const Text
                  (
                     'جزئیات',
                     style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 10),
                  ),
                  onPressed: () 
                  {
                   //details of history
                  },
                ))), 
                ]),
                DataRow(cells: [  
                  DataCell
                  (
                    Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   'ورودی 1 روشن شد',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                ))),  
                  DataCell(Container
                      (
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   '2:20 بامداد',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),
                DataCell(Container
              (
                width: 50.0,
                height: 20.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: const Text
                (
                   'ONLINE',
                  style: TextStyle
                  (
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                )),
            
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.green,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),),    
                 DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(0), //distance from up and down
                child: const Text
                (
                   '00/02/20',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),

                DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: TextButton
                (
                  child: const Text
                  (
                     'جزئیات',
                     style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 10),
                  ),
                  onPressed: () 
                  {
                   //details of history
                  },
                ))), 
                ]),
                DataRow(cells: [  
                  DataCell
                  (
                    Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   'دستگاه آنلاین شد',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                ))),  
                  DataCell(Container
                      (
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   '6:54 ق.ب',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),
                DataCell(Container
              (
                width: 50.0,
                height: 20.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: const Text
                (
                   'ONLINE',
                  style: TextStyle
                  (
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                )),
            
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.green,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),),    
                
                 DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(0), //distance from up and down
                child: const Text
                (
                   '00/02/18',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),

                DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: TextButton
                (
                  child: const Text
                  (
                     'جزئیات',
                     style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 10),
                  ),
                  onPressed: () 
                  {
                   //details of history
                  },
                ))), 
                ]),
                DataRow(cells: [  
                  DataCell
                  (
                    Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   'دستگاه آفلاین شد',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                ))),  
                  DataCell(Container
                      (
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   '7:20 ق.ب',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),
                DataCell(Container
              (
                width: 50.0,
                height: 20.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: const Text
                (
                   'OFFLINE',
                  style: TextStyle
                  (
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                )),
            
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.black38,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),),    
                
                 DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(0), //distance from up and down
                child: const Text
                (
                   '00/02/17',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),

                DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: TextButton
                (
                  child: const Text
                  (
                     'جزئیات',
                     style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 10),
                  ),
                  onPressed: () 
                  {
                   //details of history
                  },
                ))), 
                ]),
                DataRow(cells: [  
                  DataCell
                  (
                    Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                  'ورودی 2 روشن شد',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                ))),  
                  DataCell(Container
                      (
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   '3:28 ب.ظ',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),
                DataCell(Container
              (
                width: 50.0,
                height: 20.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: const Text
                (
                   'ONLINE',
                  style: TextStyle
                  (
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                )),
            
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.green,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),),    
                
                 DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(0), //distance from up and down
                child: const Text
                (
                   '00/02/16',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),

                DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: TextButton
                (
                  child: const Text
                  (
                     'جزئیات',
                     style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 10),
                  ),
                  onPressed: () 
                  {
                   //details of history
                  },
                ))), 
                ]),
                DataRow(cells: [  
                  DataCell
                  (
                    Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   'ورودی 1 خاموش شد',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                ))),  
                  DataCell(Container
                      (
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   '1:28 ق.ب',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),
                DataCell(Container
              (
                width: 50.0,
                height: 20.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: const Text
                (
                   'ONLINE',
                  style: TextStyle
                  (
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                )),
            
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.green,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),),    

                 DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(0), //distance from up and down
                child: const Text
                (
                   '00/02/12',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),

                DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: TextButton
                (
                  child: const Text
                  (
                     'جزئیات',
                     style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 10),
                  ),
                  onPressed: () 
                  {
                   //details of history
                  },
                ))), 
                ]),
                DataRow(cells: [  
                  DataCell
                  (
                    Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   'خروجی 1 خاموش شد',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                ))),  
                  DataCell(Container
                      (
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                  '8:19 ب.ظ',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),
                DataCell(Container
              (
                width: 50.0,
                height: 20.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: const Text
                (
                   'ONLINE',
                  style: TextStyle
                  (
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                )),
            
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.green,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),),    

                 DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(0), //distance from up and down
                child: const Text
                (
                   '00/02/10',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),

                DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: TextButton
                (
                  child: const Text
                  (
                     'جزئیات',
                     style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 10),
                  ),
                  onPressed: () 
                  {
                   //details of history
                  },
                ))), 
                ]),

                DataRow(cells: [  
                  DataCell
                  (
                    Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   'خروجی 2 روشن شد',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                ))),  
                  DataCell(Container
                      (
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                    '4:28 ق.ب',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),
                DataCell(Container
              (
                width: 50.0,
                height: 20.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: const Text
                (
                   'ONLINE',
                  style: TextStyle
                  (
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                )),
            
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.green,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),),    

                 DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(0), //distance from up and down
                child: const Text
                (
                   '00/02/08',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),

                DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: TextButton
                (
                  child: const Text
                  (
                     'جزئیات',
                     style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 10),
                  ),
                  onPressed: () 
                  {
                   //details of history
                  },
                ))), 
                ]),
                DataRow(cells: [  
                  DataCell
                  (
                    Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   'ورودی 3 خاموش شد',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                ))),  
                  DataCell(Container
                      (
                padding: const EdgeInsets.all(2), //distance from up and down
                alignment: Alignment.centerRight,
                child: const Text
                (
                   '2:46 ب.ظ',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),
                DataCell(Container
              (
                width: 50.0,
                height: 20.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: const Text
                (
                   'ONLINE',
                  style: TextStyle
                  (
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 8),
                )),
            
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.green,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),),    

                 DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(0), //distance from up and down
                child: const Text
                (
                   '00/02/05',
                   style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                ))),

                DataCell
                    (
                      Container
                      (
                //alignment: Alignment.,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: TextButton
                (
                  child: const Text
                  (
                     'جزئیات',
                     style: TextStyle
                    (
                      color: Colors.black,
                      fontSize: 10),
                  ),
                  onPressed: () 
                  {
                   //details of history
                  },
                ))), 
                ])
                ]     
                ),
                    )
                    

              
                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 0.0,
                  ),
               ),
            ),
             
            ),
            
          ],
        )
   ),
     );
  } 
}

class Login extends StatefulWidget
{
  const Login({Key? key}) : super(key: key);
 
  @override
  State<Login> createState() => _Login();
}
class _Login extends State<Login>
{
  void status()
  async
  {
      //final response_get = await http.get(Uri.parse('http://localhost:10000/pin2_on'));
      final response_get = await http.get(Uri.parse('http://192.168.135.229/?LED=on'));
  }
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool check_box_value = true;
  Widget build (BuildContext context) 
  {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold(
      appBar: new AppBar(
        //toolbarHeight: 20,
        title: new Text('ورود'),
      ),
      body: new Padding
    (
        padding: const EdgeInsets.all(20),
        child: Stack
        (
          alignment: Alignment.center,
          children: <Widget>[
            /*Icon
            (
              Icons.star,
              color: Colors.red[500],
              size: 600,
            ),*/
            Positioned
            (
                top: 0,
                left: 0,
                child: Container
                          (
                        //alignment: Alignment.,
                            padding: const EdgeInsets.all(10), //distance from up and down
                            child: Image.asset
                            ("images/logo.png",
                              fit: BoxFit.cover,
                              height: _mediaQueryData.size.height * 0.06,
                              width: _mediaQueryData.size.width * 0.14,
                            )
                          ),
                
            ),
            Positioned
            (
                bottom: 20,
                left: 0,
                child: TextButton
                (
                  child: const Text(
                    'درباره ما',
                    style: TextStyle(fontSize: 10 , color: Colors.black),
                  ),
                  onPressed: () 
                  {
                    //about us
                  },
                ),
            ),
            Positioned
            (
                bottom: 20,
                left: 80,
                child: TextButton
                (
                  child: const Text(
                    'پشتیبانی',
                    style: TextStyle(fontSize: 10 , color: Colors.black),
                  ),
                  onPressed: () 
                  {
                    //supportness
                  },
                ),
            ),
            Positioned
            (
             top: 0,
             right: 0,
             child: Container
              (
                width: _mediaQueryData.size.width * 0.75,
                height: 50.0,
                child: Stack
                (
                    children: <Widget>
                    [
              Positioned(
                top: 0,
                right: 0,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   'داشبورد انحصاری فناوران شریف',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 10),
                ))),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'پشتیبانی',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
                )),
                

                Positioned
              (
                top:3,
                left:5,
                child: SizedBox
                (
                height: _mediaQueryData.size.height / 20,
                width: _mediaQueryData.size.width / 5,
                //padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton
                (
                  onPressed: () 
                  {

                  },
                  style: ElevatedButton.styleFrom
                  (
                  shape: RoundedRectangleBorder
                  (
                    borderRadius: BorderRadius.circular(12),
                  ),
                  primary: Colors.black,
                  side: BorderSide
                  (
                      width: 2,
                      color: Colors.black,
                  )
                  ),
                  child: const Text
                  (
                    'آشنایی با ما',
                     style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 10)
                  ),
                )
            ),
                ),
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white10,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
            ),
             
              //scrollDirection: Axis.vertical,
              Center
                (
                    
                    child: Container
              (
                width: _mediaQueryData.size.width * 0.9,
                height: _mediaQueryData.size.height * 0.6,
                    child: ListView
                (
                    shrinkWrap: true, 
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      
                      Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   ''
                )),
              Container
              (
              padding: const EdgeInsets.all(10),
                child: TextField
                (
                  controller: usernameController,
                  decoration: const InputDecoration
                  (
                  border: OutlineInputBorder(), //frame
                  labelText: ' نام کاربری',
                  ),
                ),  
              ),
              Container
            (
              padding: const EdgeInsets.all(10),
                child: TextField
                (
                  controller: passwordController,
                  decoration: const InputDecoration
                  (
                  border: OutlineInputBorder(), //frame
                  labelText: 'رمز عبور',
                  ),
                ),  
            ),
            
             CheckboxListTile
             (
                title: Text("من را به یاد داشته باش"),
                activeColor: Colors.green,
                value: check_box_value,
                onChanged: (newValue)
                {
                setState(() 
                {
                if(check_box_value == false)
                {
                  check_box_value = true;
                }
                else
                {
                  check_box_value = false;
                }
    });
  },
  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
),
           
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('ورود'),
                  onPressed: ()
                  
                   async
                   {
                    final response = await http.post(Uri.parse('http://185.255.90.31:10000/login'),
                    headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},
                    body: jsonEncode(<String, String>{'username': usernameController.text , 'password': passwordController.text ,}),);
                    print(response.statusCode);
                    print(response.body);
                    if (response.body == 'not found')
                    {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => UserNotFound()),);
                    }
                    else if(response.body == 'error')
                    {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => IncorrectPass()),);
                    }
                    else if(response.body == 'admin')
                    {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => Admin_Main_page()),);
                    }
                   else
                    {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => Menu_device()),);    
                    }
                    //final response_get = await http.get(Uri.parse('http://185.255.90.31:10000/get_device'));
                    //print(response_get.body);
                    //devices_of_logged_user = response_get.body.split('-');
                    //print(devices_of_logged_user);
                  },
                )
            ),
            Row(
              children: <Widget>[
                const Text('حساب کاربری ندارید؟'),
                TextButton(
                  child: const Text(
                    'ثبت نام',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () 
                  {
                    //signup screen
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Sign_in()),);
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
              ]
                ),                 
                
                decoration: BoxDecoration
                (
                  color: Colors.black12,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
                ),
              
            
            /*Positioned
            (
             top: _mediaQueryData.size.width * 0.14,
             right: _mediaQueryData.size.width * 0.18,
             child: Container
              (
                width: _mediaQueryData.size.width * 0.6,
                height: _mediaQueryData.size.height * 0.15,
                child: ListView
                (
                    children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   'داشبورد انحصاری فناوران شریف',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
            Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'به پلتفرم فناوران شریف خوش آمدید',
                  style: TextStyle
                  (
                    color: Colors.white,
                    fontSize: 10),
                )),
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.pink,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
            ),*/
            
          ],
          
        ),
        
   )
      
    );
  }
  
} 
class Main_page extends StatefulWidget
{
  const Main_page({Key? key}) : super(key: key);
  @override
  State<Main_page> createState() => _Main_page();
  
}
class _Main_page extends State<Main_page> 
{
  void mypin1_on()
  async
  {
      final response_get = await http.get(Uri.parse('http://185.255.90.31:10000/pin1_on'));
  }

  void mypin1_off()
  async
  {
      final response_get = await http.get(Uri.parse('http://185.255.90.31:10000/pin1_off'));
  }
  void mypin2_on()
  async
  {
      //final response_get = await http.get(Uri.parse('http://localhost:10000/pin2_on'));
      try
      {
          final response_get = await http.get(Uri.parse('http://192.168.135.229/?LED=on')); 
          print('try');
          print('try');
          print('try');
      }
      catch(error)
      {
          print('gettttttttttt');
          print('gettttttttttt');
          print('gettttttttttt');
      }
      
  
  }

  void mypin2_off()
  async
  {
      //final response_get = await http.get(Uri.parse('http://localhost:10000/pin2_off'));
      //final response_get = await http.get(Uri.parse('http://192.168.135.229/?LED=off'));
  }

  
  
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool check_box_value = true;
  String onoff_input1 = 'روشن';
  String onoff_input2 = 'خاموش';
  String onoff_input3 = 'روشن';
  String onoff_input4 = 'روشن';
  String onoff_output1 = 'off';
  String onoff_output2 = 'on';
  String onoff_button_output1 = 'off';
  String onoff_button_output2 = 'off';
  String temperature = '0';
  String humid = '0';
  String ph = '0';
  String lux = '0';
  String temperature2 = '0';
  String humid2 = '0';
  String ph2 = '0';
  String lux2 = '0';
  final List<String> history = <String>[];
  final List<String> date = <String>[];
  int int1 = 1544;
  int int3 = 1445;
  int int4 = 1544;
  Color color1 = Colors.grey;
  Color color2 = Colors.grey;
  @override
  Widget build(BuildContext context) 
  {
    int time1 = 2;
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    
    Timer _everySecond = Timer.periodic(Duration(seconds: time1), (Timer t)
    async
    {
      try
      {
            final response_get1 = await http.get(Uri.parse('http://185.255.90.31:10000/receive_dev1'));
            final all_sensors = response_get1.body.split('&');
            // print(response_get1.body);
            // print(all_sensors);
            setState(()
            {
            temperature = all_sensors[2].split('=')[1];
            humid = all_sensors[3].split('=')[1];
            ph = all_sensors[4].split('=')[1];
            lux = all_sensors[5].split('=')[1];
            time1 = 60;
            });
        
      }
      catch(Exception)
      {
          
      }

      /*try
      {
            final response_get2 = await http.get(Uri.parse('http://185.255.90.31:10000/receive_dev2'));
            final all_sensors2 = response_get2.body.split('&');
            print(response_get2.body);
            print(all_sensors2);
            setState(()
            {
            temperature2 = all_sensors2[2].split('=')[1];
            humid2 = all_sensors2[3].split('=')[1];
            ph2 = all_sensors2[4].split('=')[1];
            lux2 = all_sensors2[5].split('=')[1];
            });
        
      }
      catch(Exception)
      {
          
      }*/
    },
    );
                          
                          

                  
      /*
    history.add('ورودی 4 روشن شد');
    date.add('22 خرداد 7:20 ب.ظ');
    history.add('ورودی 4 خاموش شد');
    date.add('31 اردیبهشت 9:34 ب.ظ');
    history.add('ورودی 2 خاموش شد');
    date.add('21 اردیبهشت 9:34 ب.ظ');
    history.add('ورودی 1 روشن شد');
    date.add('20 اردیبهشت 2:20 بامداد');
    history.add('دستگاه آنلاین شد');
    date.add('18 اردیبهشت 4:54 ق.ب');
    history.add('دستگاه آفلاین شد');
    date.add('17 اردیبهشت 7:20 ب.ظ');
    history.add('ورودی 2 روشن شد');
    date.add('16 اردیبهشت 3:28 ب.ظ');*/
    
   /* Timer _everySecond = Timer.periodic(Duration(seconds: 10), (Timer t)
                  {
                        receive_dev1().then((String result)
                        {
                        setState(()
                        {
                          temperature = result;
                        });
});

                  });*/
    return new Scaffold
    (
       appBar: new AppBar
       (
        title: Text('دستگاه 1'),
       ),
       //drawer: const NavigationDrawer(),
    body: new Padding
    (
        padding: const EdgeInsets.all(20),
        child: Stack
        (
          alignment: Alignment.center,
          children: <Widget>[
            /*Icon
            (
              Icons.star,
              color: Colors.red[500],
              size: 600,
            ),*/
             
            ListView
            (
                scrollDirection: Axis.vertical,
                children: <Widget>
                [
                  Row
                  (
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: 
                      [
                          Container
                          (
                            height: 50,
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ElevatedButton
                            (
                              child: const Text('تاریخچه سنسورها'),
                              onPressed: ()
                              //final response = await http.get(Uri.parse('http://185.255.90.31:10000/getExcel1'));
                              async
                              {
                                     try
                                     {
                                          // var httpClient = new HttpClient();
                                          // var request = await httpClient.getUrl(Uri.parse('http://185.255.90.31:10000/getExcel1'));
                                          // var response = await request.close();
                                          // var bytes = await consolidateHttpClientResponseBytes(response);
                                          Map<Permission, PermissionStatus> statuses = await [
                                          Permission.storage,
                                        ].request();
                                          String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
                                          HttpClient client = new HttpClient();
                                          var _downloadData = StringBuffer();
                                          
                                          client.getUrl(Uri.parse('http://185.255.90.31:10000/getExcel1'))
                                            .then((HttpClientRequest request) {
                                              return request.close();
                                            })
                                            .then((HttpClientResponse response) {
                                              response.transform(utf8.decoder).listen((d) => _downloadData.write(d),
                                                onDone: ()
                                                 {
                                                  //print('QQQQQQQQQQQQQQQQQQQQQ');
                                                  //print(_downloadData.toString());
                                                  String all_excel = _downloadData.toString();
                                                  var all_rows = all_excel.split('&');
                                                  List<List<dynamic>> new_rows = [];
                                                  List<dynamic> new_row = [];
                                                  new_row.add("lux");
                                                  new_row.add("tmp");
                                                  new_row.add("ph");
                                                  new_row.add("humid");
                                                  new_row.add("date");
                                                  new_row.add("time");
                                                  new_rows.add(new_row);
                                                  for(int i=0; i<all_rows.length; i++)
                                                  {
                                                      String row = all_rows[i];
                                                      List<dynamic> new_row = [];
                                                      var cells = row.split(',');
                                                      if(cells.length > 4)
                                                      {
                                                          new_row.add(cells[0]);
                                                          new_row.add(cells[1]);
                                                          new_row.add(cells[2]);
                                                          new_row.add(cells[3]);
                                                          new_row.add(cells[4]);
                                                          new_row.add(cells[5]);
                                                          new_rows.add(new_row); 
                                                      }
                                                        
                                                  }
                    
                                                  String csv = const ListToCsvConverter().convert(new_rows);

                                                  
                                                  //String dir = '/storage/emulated/0/Download';
                                                  //String dir = 'E:\\';
                                                  String file = "$dir";
                                                  //print(file);
                                                  File f = File(file + "/history_device1.csv");
                                                  f.writeAsString(csv); 
                                                  Navigator.push(context,MaterialPageRoute(builder: (context) => SuccessfulDownload()),);
                                                 }
                                              );
                                            });
                                
                                }
                                
                                catch(error)
                                {
                                    //print('can not download');
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => FailedDownload()));
                                }
                                   
                              }
                            )
                          ),
                          Container
                          (
                        //alignment: Alignment.,
                            padding: const EdgeInsets.all(10), //distance from up and down
                            child: Image.asset
                            ("images/logo.png",
                              fit: BoxFit.cover,
                              height: _mediaQueryData.size.height * 0.06,
                              width: _mediaQueryData.size.width * 0.14,
                            )
                          ),
                          
                      ]
                  ),
                  Row
                  (
                    mainAxisAlignment: MainAxisAlignment.end,
                      children: 
                      [
                TextButton
                (
                  child: Icon
            (
              Icons.add_alert_rounded,
              color: Colors.black,
              size: 20,
            ),
                  onPressed: () 
                  {
                    //zangule
                  },
                ),
                TextButton
                (
                  child: Icon
            (
              Icons.settings,
              color: Colors.black,
              size: 20,
            ),
                  onPressed: () 
                  {
                    //settings
                  },
                ),
                TextButton
                (
                  child: const Text(
                    'خروج',
                    style: TextStyle(fontSize: 10 , color: Colors.black),
                  ),
                  onPressed: () 
                  {
                    //exit
                    Navigator.pop(context);
                  },
                ),
                      ],
                  ),
                  Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   '',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
             Container
              (
                width: 350.0,
                height: 200.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   'وضعیت دستگاه :',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
            Container
            (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'آخرین بروزرسانی :',
                  style: TextStyle
                  (
                    color: Colors.white,
                    fontSize: 15),
                )),
                 Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   'خطای دستگاه :',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
                 Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   'تاریخ فعال سازی : ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.black54,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
            Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   '',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
                /*Row
                (
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>
                  [  
                    Container
              (
                width: 170.0,
                height: 200.0,
                child: Column
                (
                    children: <Widget>
                    [
                        Icon
                        (
                          Icons.output,
                          color: Colors.red[500],
                          size: 60,
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: const Text
                        (
                          'خروجی 2',
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5), //distance from up and down
                        child: Text
                        (
                          onoff_output2,
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 10),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        
                         TextButton
                        (
        child: Text(onoff_button_output2),
        style: TextButton.styleFrom(
        backgroundColor: color2,
        primary: Colors.black,
      ),
        onPressed: ()
         {
          setState(() 
          {
            if (onoff_button_output2 == "on") 
            {
              onoff_button_output2 = "off";
              color2 = Colors.grey;
              mypin2_off();
            } 
            else
            {
              onoff_button_output2 = "on";
              color2 = Colors.pink;
              mypin2_on();
            }
          });
                    })

                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white70,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),

              Container
              (
                width: 170.0,
                height: 200.0,
                child: Column
                (
                    children: <Widget>
                    [
                        Icon
                        (
                          Icons.output,
                          color: Colors.red[500],
                          size: 60,
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: const Text
                        (
                          'خروجی 1',
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5), //distance from up and down
                        child: Text
                        (
                          onoff_output1,
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 10),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        
                       TextButton
                        (
        child: Text(onoff_button_output1),
        style: TextButton.styleFrom(
        backgroundColor: color1,
        primary: Colors.black,
      ),
        onPressed: ()
         {
          setState(() 
          {
            if (onoff_button_output1 == "on") 
            {
              onoff_button_output1 = "off";
              color1 = Colors.grey;
              mypin1_off();
            } 
            else
            {
              onoff_button_output1 = "on";
              color1 = Colors.pink;
              //final response_get = await http.get(Uri.parse('http://localhost:10000/pin1_on'));
              mypin1_on();
            }
          });
                    }),


                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white70,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
                  ]
                ),*/
                Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   '',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
                Row
                (
                  children: <Widget>
                  [
              
              Container
              (
                width: 170.0,
                height: 250.0,
                child: Column
                (
                    children: <Widget>
                    [
                        Container
                      (
                        //alignment: Alignment.,
                        padding: const EdgeInsets.all(12), //distance from up and down
                          child: Image.asset("images/lux.jpg",
                          fit: BoxFit.cover,
                          height: _mediaQueryData.size.height * 0.05,
                          width: _mediaQueryData.size.width * 0.05,
                        )
                      ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(12), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: const Text
                        (
                          'روشنایی',
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        /*Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: ElevatedButton
                (
                  onPressed: ()
                  {

                  },
                  /*async
                  {
                    final response_get2 = await http.get(Uri.parse('http://localhost:10000/receive_dev1'));
                    setState(()
                    {
                          final all_sensors = response_get2.body.split('&');
                          print('aliii');
                          print(response_get2.body);
                          print(all_sensors);
                          temperature = all_sensors[2].split('=')[1];
                          humid = all_sensors[3].split('=')[1];
                          ph = all_sensors[4].split('=')[1];
                          lux = all_sensors[5].split('=')[1];
                    });
                  },*/
                  style: ElevatedButton.styleFrom
                  (
                  shape: RoundedRectangleBorder
                  (
                    borderRadius: BorderRadius.circular(12),
                  ),
                  primary: Colors.black,
                  side: BorderSide
                  (
                      width: 2,
                      color: Colors.black,
                  )
                  ),
                  child: const Text
                  (
                    'دریافت',
                     style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 10)
                  ),
                )
                        /*Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )*/
                        ),*/
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          lux,
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white70,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
              Container
              (
                width: 170.0,
                height: 250.0,
                child: Column
                (
                    children: <Widget>
                    [
                        Container
                      (
                        //alignment: Alignment.,
                        padding: const EdgeInsets.all(10), //distance from up and down
                          child: Image.asset("images/temp.jpg",
                          fit: BoxFit.cover,
                          height: _mediaQueryData.size.height * 0.09,
                          width: _mediaQueryData.size.width * 0.03,
                        )
                      ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: const Text
                        (
                          'دما',
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                        
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          temperature,
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white70,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
                ]
            ),
            Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   '',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
            Row
            (
               children: <Widget>
               [
              Container
              (
                width: 170.0,
                height: 250.0,
                child: Column
                (
                    children: <Widget>
                    [
                        Container
                      (
                        //alignment: Alignment.,
                        padding: const EdgeInsets.all(10), //distance from up and down
                          child: Image.asset("images/ph.jpg",
                          fit: BoxFit.cover,
                          height: _mediaQueryData.size.height * 0.06,
                          width: _mediaQueryData.size.width * 0.04,
                        )
                      ),
                        Container
                        (
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: const Text
                        (
                          'ph',
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          ph,
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white70,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
            
              Container
              (
                width: 170.0,
                height: 250.0,
                child: Column
                (
                    children: <Widget>
                    [
                        Container
                      (
                        //alignment: Alignment.,
                        padding: const EdgeInsets.all(10), //distance from up and down
                          child: Image.asset("images/humid.jpg",
                          fit: BoxFit.cover,
                          height: _mediaQueryData.size.height * 0.07,
                          width: _mediaQueryData.size.width * 0.04,
                        )
                      ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: const Text
                        (
                          'رطوبت',
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          humid,
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white70,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
                ]
            ),

             Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   '',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
                
                 
            Row
            (
             children: <Widget>
             [   
             Container
              (
                width: 340.0,
                height: 500,
                child: Stack
                (
                    children: <Widget>
                    [

              Positioned
              (
                top: 5,
                right: 5,
                child: Container
              (
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text
                (
                   'تاریخچه',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
              ),
              Positioned
              (
                top:15,
                left:60,
                child: SizedBox
                (
                height: 50,
                width: 80,
                child: ElevatedButton
                (
                  onPressed: () 
                  {

                  },
                  style: ElevatedButton.styleFrom
                  (
                  shape: RoundedRectangleBorder
                  (
                    borderRadius: BorderRadius.circular(12),
                  ),
                  primary: Colors.white,
                  side: BorderSide
                  (
                      width: 2,
                      color: Colors.pink,
                  )
                  ),
                  child: const Text
                  (
                    'نمایش همه',
                     style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.w500,
                      fontSize: 10)
                  ),
                )
            ),
                ), 

                
/*
                Positioned
                (
                  top: 60,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ورودی 4 روشن شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 85,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '22 خرداد 7:20 ب.ظ',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),),

                 Positioned
                (
                  top: 120,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ورودی 4 خاموش شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 145,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '31 اردیبهشت 9:34 ب.ظ',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),), 
               
                 Positioned
                (
                  top: 180,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ورودی 2 خاموش شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 205,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '21 اردیبهشت 9:34 ب.ظ',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),), 

                 Positioned
                (
                  top: 240,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ورودی 1 روشن شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 265,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '20 اردیبهشت 2:20 بامداد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),), 

                 Positioned
                (
                  top: 300,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'دستگاه آنلاین شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 325,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '18 اردیبهشت 4:54 ق.ب',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),), 

                 Positioned
                (
                  top: 360,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'دستگاه آفلاین شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 385,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '17 اردیبهشت 7:20 ب.ظ',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),), 

                 Positioned
                (
                  top: 420,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ورودی 2 روشن شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 445,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '16 اردیبهشت 3:28 ب.ظ',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),), 

                Positioned
                (
                   top: 80,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ),  

                Positioned
                (
                   top: 140,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ), 

                Positioned
                (
                   top: 200,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ), 

                Positioned
                (
                   top: 260,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ), 

                Positioned
                (
                   top: 320,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ), 

                Positioned
                (
                   top: 380,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ),

                 Positioned
                (
                   top: 440,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ), */
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
                ]
            ),
            Row
            (
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>
                [
                  TextButton
                (
                  child: const Text
                  (
                     'پشتیبانی',
                    style: TextStyle(fontSize: 10 , color: Colors.black),
                  ),
                  onPressed: () 
                  {
                    //supportness
                  },
                ),
            TextButton
                (
                  child: const Text(
                    'درباره ما',
                    style: TextStyle(fontSize: 10 , color: Colors.black),
                  ),
                  onPressed: () 
                  {
                    //about us
                  },
                ),
                ],
            )
                ]
            )
          ],
        )
        
    )
   );
  
  }
}

class Main_page2 extends StatefulWidget
{
  const Main_page2({Key? key}) : super(key: key);
  @override
  State<Main_page2> createState() => _Main_page2();
  
}
class _Main_page2 extends State<Main_page2> 
{
  void mypin1_on()
  async
  {
      final response_get = await http.get(Uri.parse('http://185.255.90.31:10000/pin1_on'));
  }

  void mypin1_off()
  async
  {
      final response_get = await http.get(Uri.parse('http://185.255.90.31:10000/pin1_off'));
  }
  void mypin2_on()
  async
  {
      //final response_get = await http.get(Uri.parse('http://localhost:10000/pin2_on'));
      try
      {
          final response_get = await http.get(Uri.parse('http://192.168.135.229/?LED=on')); 
          print('try');
          print('try');
          print('try');
      }
      catch(error)
      {
          print('gettttttttttt');
          print('gettttttttttt');
          print('gettttttttttt');
      }
      
  
  }

  void mypin2_off()
  async
  {
      //final response_get = await http.get(Uri.parse('http://localhost:10000/pin2_off'));
      //final response_get = await http.get(Uri.parse('http://192.168.135.229/?LED=off'));
  }

  
  
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool check_box_value = true;
  String onoff_input1 = 'روشن';
  String onoff_input2 = 'خاموش';
  String onoff_input3 = 'روشن';
  String onoff_input4 = 'روشن';
  String onoff_output1 = 'off';
  String onoff_output2 = 'on';
  String onoff_button_output1 = 'off';
  String onoff_button_output2 = 'off';
  String temperature = '0';
  String humid = '0';
  String ph = '0';
  String lux = '0';
  String temperature2 = '0';
  String humid2 = '0';
  String ph2 = '0';
  String lux2 = '0';
  final List<String> history = <String>[];
  final List<String> date = <String>[];
  int int1 = 1544;
  int int3 = 1445;
  int int4 = 1544;
  Color color1 = Colors.grey;
  Color color2 = Colors.grey;
  @override
  Widget build(BuildContext context) 
  {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    int time1 = 2;
    Timer _everySecond = Timer.periodic(Duration(seconds: time1), (Timer t)
    async
    {
      try
      {
            final response_get1 = await http.get(Uri.parse('http://185.255.90.31:10000/receive_dev2'));
            final all_sensors = response_get1.body.split('&');
            // print(response_get1.body);
            // print(all_sensors);
            setState(()
            {
            temperature = all_sensors[2].split('=')[1];
            humid = all_sensors[3].split('=')[1];
            ph = all_sensors[4].split('=')[1];
            lux = all_sensors[5].split('=')[1];
            time1 = 60;
            });
        
      }
      catch(Exception)
      {
          
      }

      /*try
      {
            final response_get2 = await http.get(Uri.parse('http://185.255.90.31:10000/receive_dev2'));
            final all_sensors2 = response_get2.body.split('&');
            print(response_get2.body);
            print(all_sensors2);
            setState(()
            {
            temperature2 = all_sensors2[2].split('=')[1];
            humid2 = all_sensors2[3].split('=')[1];
            ph2 = all_sensors2[4].split('=')[1];
            lux2 = all_sensors2[5].split('=')[1];
            });
        
      }
      catch(Exception)
      {
          
      }*/
    },
    );
                          
                          

                  
      /*
    history.add('ورودی 4 روشن شد');
    date.add('22 خرداد 7:20 ب.ظ');
    history.add('ورودی 4 خاموش شد');
    date.add('31 اردیبهشت 9:34 ب.ظ');
    history.add('ورودی 2 خاموش شد');
    date.add('21 اردیبهشت 9:34 ب.ظ');
    history.add('ورودی 1 روشن شد');
    date.add('20 اردیبهشت 2:20 بامداد');
    history.add('دستگاه آنلاین شد');
    date.add('18 اردیبهشت 4:54 ق.ب');
    history.add('دستگاه آفلاین شد');
    date.add('17 اردیبهشت 7:20 ب.ظ');
    history.add('ورودی 2 روشن شد');
    date.add('16 اردیبهشت 3:28 ب.ظ');*/
    
   /* Timer _everySecond = Timer.periodic(Duration(seconds: 10), (Timer t)
                  {
                        receive_dev1().then((String result)
                        {
                        setState(()
                        {
                          temperature = result;
                        });
});

                  });*/
    return new Scaffold
    (
       appBar: new AppBar
       (
        title: Text('دستگاه 2'),
       ),
       //drawer: const NavigationDrawer(),
    body: new Padding
    (
        padding: const EdgeInsets.all(20),
        child: Stack
        (
          alignment: Alignment.center,
          children: <Widget>[
            /*Icon
            (
              Icons.star,
              color: Colors.red[500],
              size: 600,
            ),*/
             
            ListView
            (
                scrollDirection: Axis.vertical,
                children: <Widget>
                [
                  Row
                  (
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: 
                      [
                          Container
                          (
                            height: 50,
                            padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                            child: ElevatedButton
                            (
                              child: const Text('تاریخچه سنسورها'),
                              onPressed: ()
                              //final response = await http.get(Uri.parse('http://185.255.90.31:10000/getExcel1'));
                              async
                              {
                                     try
                                     {
                                          // var httpClient = new HttpClient();
                                          // var request = await httpClient.getUrl(Uri.parse('http://185.255.90.31:10000/getExcel1'));
                                          // var response = await request.close();
                                          // var bytes = await consolidateHttpClientResponseBytes(response);
                                          Map<Permission, PermissionStatus> statuses = await [
                                          Permission.storage,
                                        ].request();
                                          String dir = await ExternalPath.getExternalStoragePublicDirectory(ExternalPath.DIRECTORY_DOWNLOADS);
                                          HttpClient client = new HttpClient();
                                          var _downloadData = StringBuffer();
                                          
                                          client.getUrl(Uri.parse('http://185.255.90.31:10000/getExcel2'))
                                            .then((HttpClientRequest request) {
                                              return request.close();
                                            })
                                            .then((HttpClientResponse response) {
                                              response.transform(utf8.decoder).listen((d) => _downloadData.write(d),
                                                onDone: ()
                                                 {
                                                  //print('QQQQQQQQQQQQQQQQQQQQQ');
                                                  //print(_downloadData.toString());
                                                  String all_excel = _downloadData.toString();
                                                  var all_rows = all_excel.split('&');
                                                  List<List<dynamic>> new_rows = [];
                                                  List<dynamic> new_row = [];
                                                  new_row.add("lux");
                                                  new_row.add("tmp");
                                                  new_row.add("ph");
                                                  new_row.add("humid");
                                                  new_row.add("date");
                                                  new_row.add("time");
                                                  new_rows.add(new_row);
                                                  for(int i=0; i<all_rows.length; i++)
                                                  {
                                                      String row = all_rows[i];
                                                      List<dynamic> new_row = [];
                                                      var cells = row.split(',');
                                                      if(cells.length > 4)
                                                      {
                                                          new_row.add(cells[0]);
                                                          new_row.add(cells[1]);
                                                          new_row.add(cells[2]);
                                                          new_row.add(cells[3]);
                                                          new_row.add(cells[4]);
                                                          new_row.add(cells[5]);
                                                          new_rows.add(new_row); 
                                                      }
                                                        
                                                  }
                    
                                                  String csv = const ListToCsvConverter().convert(new_rows);

                                                  
                                                  //String dir = '/storage/emulated/0/Download';
                                                  //String dir = 'E:\\';
                                                  String file = "$dir";
                                                  //print(file);
                                                  File f = File(file + "/history_device2.csv");
                                                  f.writeAsString(csv); 
                                                  Navigator.push(context,MaterialPageRoute(builder: (context) => SuccessfulDownload()),);
                                                 }
                                              );
                                            });
                                
                                }
                                
                                catch(error)
                                {
                                    //print('can not download');
                                    Navigator.push(context,MaterialPageRoute(builder: (context) => FailedDownload()));
                                }
                                   
                              }
                            )
                          ),
                          Container
                          (
                        //alignment: Alignment.,
                            padding: const EdgeInsets.all(10), //distance from up and down
                            child: Image.asset
                            ("images/logo.png",
                              fit: BoxFit.cover,
                              height: _mediaQueryData.size.height * 0.06,
                              width: _mediaQueryData.size.width * 0.14,
                            )
                          ),
                      ]
                  ),
                  Row
                  (
                    mainAxisAlignment: MainAxisAlignment.end,
                      children: 
                      [
                TextButton
                (
                  child: Icon
            (
              Icons.add_alert_rounded,
              color: Colors.black,
              size: 20,
            ),
                  onPressed: () 
                  {
                    //zangule
                  },
                ),
                TextButton
                (
                  child: Icon
            (
              Icons.settings,
              color: Colors.black,
              size: 20,
            ),
                  onPressed: () 
                  {
                    //settings
                  },
                ),
                TextButton
                (
                  child: const Text(
                    'خروج',
                    style: TextStyle(fontSize: 10 , color: Colors.black),
                  ),
                  onPressed: () 
                  {
                    //exit
                    Navigator.pop(context);
                  },
                ),
                      ],
                  ),
                  Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   '',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
             Container
              (
                width: 350.0,
                height: 200.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   'وضعیت دستگاه :',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
            Container
            (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'آخرین بروزرسانی :',
                  style: TextStyle
                  (
                    color: Colors.white,
                    fontSize: 15),
                )),
                 Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   'خطای دستگاه :',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
                 Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   'تاریخ فعال سازی : ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.black54,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
            Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   '',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
                /*Row
                (
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>
                  [  
                    Container
              (
                width: 170.0,
                height: 200.0,
                child: Column
                (
                    children: <Widget>
                    [
                        Icon
                        (
                          Icons.output,
                          color: Colors.red[500],
                          size: 60,
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: const Text
                        (
                          'خروجی 2',
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5), //distance from up and down
                        child: Text
                        (
                          onoff_output2,
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 10),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        
                         TextButton
                        (
        child: Text(onoff_button_output2),
        style: TextButton.styleFrom(
        backgroundColor: color2,
        primary: Colors.black,
      ),
        onPressed: ()
         {
          setState(() 
          {
            if (onoff_button_output2 == "on") 
            {
              onoff_button_output2 = "off";
              color2 = Colors.grey;
              mypin2_off();
            } 
            else
            {
              onoff_button_output2 = "on";
              color2 = Colors.pink;
              mypin2_on();
            }
          });
                    })

                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white70,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),

              Container
              (
                width: 170.0,
                height: 200.0,
                child: Column
                (
                    children: <Widget>
                    [
                        Icon
                        (
                          Icons.output,
                          color: Colors.red[500],
                          size: 60,
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: const Text
                        (
                          'خروجی 1',
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5), //distance from up and down
                        child: Text
                        (
                          onoff_output1,
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 10),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        
                       TextButton
                        (
        child: Text(onoff_button_output1),
        style: TextButton.styleFrom(
        backgroundColor: color1,
        primary: Colors.black,
      ),
        onPressed: ()
         {
          setState(() 
          {
            if (onoff_button_output1 == "on") 
            {
              onoff_button_output1 = "off";
              color1 = Colors.grey;
              mypin1_off();
            } 
            else
            {
              onoff_button_output1 = "on";
              color1 = Colors.pink;
              //final response_get = await http.get(Uri.parse('http://localhost:10000/pin1_on'));
              mypin1_on();
            }
          });
                    }),


                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white70,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
                  ]
                ),*/
                Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   '',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
                Row
                (
                  children: <Widget>
                  [
              
              Container
              (
                width: 170.0,
                height: 250.0,
                child: Column
                (
                    children: <Widget>
                    [
                        Container
                      (
                        //alignment: Alignment.,
                        padding: const EdgeInsets.all(12), //distance from up and down
                          child: Image.asset("images/lux.jpg",
                          fit: BoxFit.cover,
                          height: _mediaQueryData.size.height * 0.05,
                          width: _mediaQueryData.size.width * 0.05,
                        )
                      ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(12), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: const Text
                        (
                          'روشنایی',
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        /*Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: ElevatedButton
                (
                  onPressed: ()
                  {

                  },
                  /*async
                  {
                    final response_get2 = await http.get(Uri.parse('http://localhost:10000/receive_dev1'));
                    setState(()
                    {
                          final all_sensors = response_get2.body.split('&');
                          print('aliii');
                          print(response_get2.body);
                          print(all_sensors);
                          temperature = all_sensors[2].split('=')[1];
                          humid = all_sensors[3].split('=')[1];
                          ph = all_sensors[4].split('=')[1];
                          lux = all_sensors[5].split('=')[1];
                    });
                  },*/
                  style: ElevatedButton.styleFrom
                  (
                  shape: RoundedRectangleBorder
                  (
                    borderRadius: BorderRadius.circular(12),
                  ),
                  primary: Colors.black,
                  side: BorderSide
                  (
                      width: 2,
                      color: Colors.black,
                  )
                  ),
                  child: const Text
                  (
                    'دریافت',
                     style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 10)
                  ),
                )
                        /*Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )*/
                        ),*/
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          lux,
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white70,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
              Container
              (
                width: 170.0,
                height: 250.0,
                child: Column
                (
                    children: <Widget>
                    [
                        Container
                      (
                        //alignment: Alignment.,
                        padding: const EdgeInsets.all(10), //distance from up and down
                          child: Image.asset("images/temp.jpg",
                          fit: BoxFit.cover,
                          height: _mediaQueryData.size.height * 0.09,
                          width: _mediaQueryData.size.width * 0.03,
                        )
                      ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: const Text
                        (
                          'دما',
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                        
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          temperature,
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white70,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
                ]
            ),
            Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   '',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
            Row
            (
               children: <Widget>
               [
              Container
              (
                width: 170.0,
                height: 250.0,
                child: Column
                (
                    children: <Widget>
                    [
                        Container
                      (
                        //alignment: Alignment.,
                        padding: const EdgeInsets.all(10), //distance from up and down
                          child: Image.asset("images/ph.jpg",
                          fit: BoxFit.cover,
                          height: _mediaQueryData.size.height * 0.06,
                          width: _mediaQueryData.size.width * 0.04,
                        )
                      ),
                        Container
                        (
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: const Text
                        (
                          'ph',
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          ph,
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white70,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
            
              Container
              (
                width: 170.0,
                height: 250.0,
                child: Column
                (
                    children: <Widget>
                    [
                        Container
                      (
                        //alignment: Alignment.,
                        padding: const EdgeInsets.all(10), //distance from up and down
                          child: Image.asset("images/humid.jpg",
                          fit: BoxFit.cover,
                          height: _mediaQueryData.size.height * 0.07,
                          width: _mediaQueryData.size.width * 0.04,
                        )
                      ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: const Text
                        (
                          'رطوبت',
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          humid,
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white70,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
                ]
            ),

             Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   '',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
                
                 
            Row
            (
             children: <Widget>
             [   
             Container
              (
                width: 340.0,
                height: 500,
                child: Stack
                (
                    children: <Widget>
                    [

              Positioned
              (
                top: 5,
                right: 5,
                child: Container
              (
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text
                (
                   'تاریخچه',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
              ),
              Positioned
              (
                top:15,
                left:60,
                child: SizedBox
                (
                height: 50,
                width: 80,
                child: ElevatedButton
                (
                  onPressed: () 
                  {

                  },
                  style: ElevatedButton.styleFrom
                  (
                  shape: RoundedRectangleBorder
                  (
                    borderRadius: BorderRadius.circular(12),
                  ),
                  primary: Colors.white,
                  side: BorderSide
                  (
                      width: 2,
                      color: Colors.pink,
                  )
                  ),
                  child: const Text
                  (
                    'نمایش همه',
                     style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.w500,
                      fontSize: 10)
                  ),
                )
            ),
                ), 

                
/*
                Positioned
                (
                  top: 60,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ورودی 4 روشن شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 85,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '22 خرداد 7:20 ب.ظ',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),),

                 Positioned
                (
                  top: 120,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ورودی 4 خاموش شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 145,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '31 اردیبهشت 9:34 ب.ظ',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),), 
               
                 Positioned
                (
                  top: 180,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ورودی 2 خاموش شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 205,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '21 اردیبهشت 9:34 ب.ظ',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),), 

                 Positioned
                (
                  top: 240,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ورودی 1 روشن شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 265,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '20 اردیبهشت 2:20 بامداد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),), 

                 Positioned
                (
                  top: 300,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'دستگاه آنلاین شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 325,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '18 اردیبهشت 4:54 ق.ب',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),), 

                 Positioned
                (
                  top: 360,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'دستگاه آفلاین شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 385,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '17 اردیبهشت 7:20 ب.ظ',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),), 

                 Positioned
                (
                  top: 420,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ورودی 2 روشن شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 445,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '16 اردیبهشت 3:28 ب.ظ',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),), 

                Positioned
                (
                   top: 80,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ),  

                Positioned
                (
                   top: 140,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ), 

                Positioned
                (
                   top: 200,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ), 

                Positioned
                (
                   top: 260,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ), 

                Positioned
                (
                   top: 320,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ), 

                Positioned
                (
                   top: 380,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ),

                 Positioned
                (
                   top: 440,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ), */
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
                ]
            ),
            Row
            (
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>
                [
                  TextButton
                (
                  child: const Text
                  (
                     'پشتیبانی',
                    style: TextStyle(fontSize: 10 , color: Colors.black),
                  ),
                  onPressed: () 
                  {
                    //supportness
                  },
                ),
            TextButton
                (
                  child: const Text(
                    'درباره ما',
                    style: TextStyle(fontSize: 10 , color: Colors.black),
                  ),
                  onPressed: () 
                  {
                    //about us
                  },
                ),
                ],
            )
                ]
            )
          ],
        )
        
    )
   );
  
  }
}


class Admin_Main_page extends StatefulWidget
{
  const Admin_Main_page({Key? key}) : super(key: key);
 
  @override
  State<Admin_Main_page> createState() => _Admin_Main_page();
}
class _Admin_Main_page extends State<Admin_Main_page> 
{
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool check_box_value = true;
  String onoff_input1 = 'روشن';
  String onoff_input2 = 'خاموش';
  String onoff_input3 = 'روشن';
  String onoff_input4 = 'روشن';
  String onoff_output1 = 'off';
  String onoff_output2 = 'on';
  String onoff_button_output1 = 'off';
  String onoff_button_output2 = 'on';
  final List<String> history = <String>[];
  final List<String> date = <String>[];
  int int1 = 1445;
  int int2 = 1544;
  int int3 = 1445;
  int int4 = 1544;
  Color color1 = Colors.white10;
  Color color2 = Colors.pink;
  @override
  Widget build(BuildContext context) 
  {
    /*
    history.add('ورودی 4 روشن شد');
    date.add('22 خرداد 7:20 ب.ظ');
    history.add('ورودی 4 خاموش شد');
    date.add('31 اردیبهشت 9:34 ب.ظ');
    history.add('ورودی 2 خاموش شد');
    date.add('21 اردیبهشت 9:34 ب.ظ');
    history.add('ورودی 1 روشن شد');
    date.add('20 اردیبهشت 2:20 بامداد');
    history.add('دستگاه آنلاین شد');
    date.add('18 اردیبهشت 4:54 ق.ب');
    history.add('دستگاه آفلاین شد');
    date.add('17 اردیبهشت 7:20 ب.ظ');
    history.add('ورودی 2 روشن شد');
    date.add('16 اردیبهشت 3:28 ب.ظ');*/
    return new Scaffold
    (
       appBar: new AppBar
       (
        title: Text('صفحه اصلی'),
       ),
       drawer: const Admin_NavigationDrawer(),
    body: new Padding
    (
        padding: const EdgeInsets.all(20),
        child: Stack
        (
          alignment: Alignment.center,
          children: <Widget>[
            /*Icon
            (
              Icons.star,
              color: Colors.red[500],
              size: 600,
            ),*/
             
            ListView
            (
                scrollDirection: Axis.vertical,
                children: <Widget>
                [
                  Row
                  (
                    mainAxisAlignment: MainAxisAlignment.end,
                      children: 
                      [
                TextButton
                (
                  child: Icon
            (
              Icons.add_alert_rounded,
              color: Colors.black,
              size: 20,
            ),
                  onPressed: () 
                  {
                    //zangule
                  },
                ),
                TextButton
                (
                  child: Icon
            (
              Icons.settings,
              color: Colors.black,
              size: 20,
            ),
                  onPressed: () 
                  {
                    //settings
                  },
                ),
                TextButton
                (
                  child: const Text(
                    'خروج',
                    style: TextStyle(fontSize: 10 , color: Colors.black),
                  ),
                  onPressed: () 
                  {
                    //exit
                    Navigator.pop(context);
                  },
                ),
                      ],
                  ),
                  Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   '',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
             Container
              (
                width: 350.0,
                height: 200.0,
                child: ListView
                (
                    children: <Widget>[
              Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   'وضعیت دستگاه : ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
            Container
            (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'آخرین بروزرسانی : ',
                  style: TextStyle
                  (
                    color: Colors.white,
                    fontSize: 15),
                )),
                 Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   'خطای دستگاه :',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
                 Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   'تاریخ فعال سازی : ',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.black54,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
            Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   '',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
                Row
                (
                  //mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>
                  [  
                    Container
              (
                width: 170.0,
                height: 200.0,
                child: Column
                (
                    children: <Widget>
                    [
                        Icon
                        (
                          Icons.output,
                          color: Colors.red[500],
                          size: 60,
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: const Text
                        (
                          'خروجی 2',
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5), //distance from up and down
                        child: Text
                        (
                          onoff_output2,
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 10),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        
                         TextButton
                        (
                      child: Text(onoff_button_output2),
        style: TextButton.styleFrom(
        backgroundColor: color2,
        primary: Colors.black,
      ),
        onPressed: ()
         {
          setState(() 
          {
            if (onoff_button_output2 == "on") 
            {
              onoff_button_output2 = "off";
              color2 = Colors.grey;
            } 
            else
            {
              onoff_button_output2 = "on";
              color2 = Colors.pink;
            }
          });
                    })

                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white70,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),

              Container
              (
                width: 170.0,
                height: 200.0,
                child: Column
                (
                    children: <Widget>
                    [
                        Icon
                        (
                          Icons.output,
                          color: Colors.red[500],
                          size: 60,
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: const Text
                        (
                          'خروجی 1',
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(5), //distance from up and down
                        child: Text
                        (
                          onoff_output1,
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 10),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        
                       TextButton
                        (
        child: Text(onoff_button_output1),
        style: TextButton.styleFrom(
        backgroundColor: color1,
        primary: Colors.black,
      ),
        onPressed: ()
         {
          setState(() 
          {
            if (onoff_button_output1 == "on") 
            {
              onoff_button_output1 = "off";
              color1 = Colors.grey;
            } 
            else
            {
              onoff_button_output1 = "on";
              color1 = Colors.pink;
            }
          });
                    }),


                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white70,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
                  ]
                ),
                Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   '',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
                Row
                (
                  children: <Widget>
                  [
              
              Container
              (
                width: 170.0,
                height: 200.0,
                child: Column
                (
                    children: <Widget>
                    [
                        Icon
                        (
                          Icons.input,
                          color: Colors.red[500],
                          size: 60,
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: const Text
                        (
                          'روشنایی',
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          onoff_input2,
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 10),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          int2.toString(),
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white70,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
              Container
              (
                width: 170.0,
                height: 200.0,
                child: Column
                (
                    children: <Widget>
                    [
                        Icon
                        (
                          Icons.input,
                          color: Colors.red[500],
                          size: 60,
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: const Text
                        (
                          'دما',
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          onoff_input1,
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 10),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          int1.toString(),
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white70,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
                ]
            ),
            Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   '',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
            Row
            (
               children: <Widget>
               [
              Container
              (
                width: 170.0,
                height: 200.0,
                child: Column
                (
                    children: <Widget>
                    [
                        Icon
                        (
                          Icons.input,
                          color: Colors.red[500],
                          size: 60,
                        ),
                        Container
                        (
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: const Text
                        (
                          'ph',
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          onoff_input3,
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 10),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          int3.toString(),
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white70,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
            
              Container
              (
                width: 170.0,
                height: 200.0,
                child: Column
                (
                    children: <Widget>
                    [
                        Icon
                        (
                          Icons.input,
                          color: Colors.red[500],
                          size: 60,
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: const Text
                        (
                          'رطوبت',
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          onoff_input4,
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 10),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          '',
                           style: TextStyle
                           (
                            color: Colors.black54,
                            fontWeight: FontWeight.w500,
                            fontSize: 0),
                        )
                        ),
                        Container
                        (
                
                        alignment: Alignment.center,
                        padding: const EdgeInsets.all(10), //distance from up and down
                        child: Text
                        (
                          int4.toString(),
                           style: TextStyle
                           (
                            color: Colors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 15),
                        )
                        ),
                    ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white70,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
                ]
            ),

             Container
              (
                alignment: Alignment.topRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   '',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )), 
            Row
            (
             children: <Widget>
             [   
             Container
              (
                width: 340.0,
                height: 500,
                child: Stack
                (
                    children: <Widget>
                    [

              Positioned
              (
                top: 5,
                right: 5,
                child: Container
              (
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text
                (
                   'تاریخچه',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
              ),
              Positioned
              (
                top:15,
                left:60,
                child: SizedBox
                (
                height: 50,
                width: 80,
                child: ElevatedButton
                (
                  onPressed: () 
                  {

                  },
                  style: ElevatedButton.styleFrom
                  (
                  shape: RoundedRectangleBorder
                  (
                    borderRadius: BorderRadius.circular(12),
                  ),
                  primary: Colors.white,
                  side: BorderSide
                  (
                      width: 2,
                      color: Colors.pink,
                  )
                  ),
                  child: const Text
                  (
                    'نمایش همه',
                     style: TextStyle(
                      color: Colors.pink,
                      fontWeight: FontWeight.w500,
                      fontSize: 10)
                  ),
                )
            ),
                ), 

                
/*
                Positioned
                (
                  top: 60,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ورودی 4 روشن شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 85,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '22 خرداد 7:20 ب.ظ',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),),

                 Positioned
                (
                  top: 120,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ورودی 4 خاموش شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 145,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '31 اردیبهشت 9:34 ب.ظ',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),), 
               
                 Positioned
                (
                  top: 180,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ورودی 2 خاموش شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 205,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '21 اردیبهشت 9:34 ب.ظ',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),), 

                 Positioned
                (
                  top: 240,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ورودی 1 روشن شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 265,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '20 اردیبهشت 2:20 بامداد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),), 

                 Positioned
                (
                  top: 300,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'دستگاه آنلاین شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 325,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '18 اردیبهشت 4:54 ق.ب',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),), 

                 Positioned
                (
                  top: 360,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'دستگاه آفلاین شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 385,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '17 اردیبهشت 7:20 ب.ظ',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),), 

                 Positioned
                (
                  top: 420,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'ورودی 2 روشن شد',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 15),
                )),
                ),

                Positioned
                (
                  top: 445,
                  right: 15,
                  child: Container
                (
                //alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  '16 اردیبهشت 3:28 ب.ظ',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontSize: 10),
                )),), 

                Positioned
                (
                   top: 80,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ),  

                Positioned
                (
                   top: 140,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ), 

                Positioned
                (
                   top: 200,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ), 

                Positioned
                (
                   top: 260,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ), 

                Positioned
                (
                   top: 320,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ), 

                Positioned
                (
                   top: 380,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ),

                 Positioned
                (
                   top: 440,
                   left: 15,
                   child: new InkWell
                   (
                      child: new Text('PDF'),
                      onTap: () => launch('#')
                   ),
                ), */
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
                ]
            ),
            Row
            (
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>
                [
                  TextButton
                (
                  child: const Text
                  (
                     'پشتیبانی',
                    style: TextStyle(fontSize: 10 , color: Colors.black),
                  ),
                  onPressed: () 
                  {
                    //supportness
                  },
                ),
            TextButton
                (
                  child: const Text(
                    'درباره ما',
                    style: TextStyle(fontSize: 10 , color: Colors.black),
                  ),
                  onPressed: () 
                  {
                    //about us
                  },
                ),
                ],
            )
                ]
            )
          ],
        )
    )
   );
  }
}

class  Sign_in extends StatefulWidget 
{
  const Sign_in({Key? key}) : super(key: key);
 
  @override
  State<Sign_in> createState() => _Sign_in();
}

class _Sign_in extends State<Sign_in> 
{
  @override
  TextEditingController nameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmpasswordController = TextEditingController();
  bool check_box_value = true;
  
  Widget build (BuildContext context) 
  {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold(
      appBar: new AppBar(
        //toolbarHeight: 20,
        title: new Text('ثبت نام'),
      ),
      body: new Padding
    (
        padding: const EdgeInsets.all(20),
        child: Stack
        (
          alignment: Alignment.center,
          children: <Widget>[
            /*Icon
            (
              Icons.star,
              color: Colors.red[500],
              size: 600,
            ),*/
            Positioned
            (
             top: 0,
             right: 0,
             child: Container
              (
                width: _mediaQueryData.size.width * 0.9,
                height: 50.0,
                child: Stack
                (
                    children: <Widget>
                    [
              Positioned(
                top: 0,
                right: 0,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   'داشبورد انحصاری فناوران شریف',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 10),
                ))),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'پشتیبانی',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
                )),
                

                Positioned
              (
                top:3,
                left:5,
                child: SizedBox
                (
                height: _mediaQueryData.size.height / 20,
                width: _mediaQueryData.size.width / 5,
                //padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton
                (
                  onPressed: () 
                  {

                  },
                  style: ElevatedButton.styleFrom
                  (
                  shape: RoundedRectangleBorder
                  (
                    borderRadius: BorderRadius.circular(12),
                  ),
                  primary: Colors.black,
                  side: BorderSide
                  (
                      width: 2,
                      color: Colors.black,
                  )
                  ),
                  child: const Text
                  (
                    'آشنایی با ما',
                     style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 10)
                  ),
                )
            ),
                ),
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white10,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
            ),
              Center
            (
              //scrollDirection: Axis.vertical,
              child:SingleChildScrollView
                (
                    scrollDirection: Axis.vertical,
                    child: Container
              (
                width: _mediaQueryData.size.width * 0.9,
                height: _mediaQueryData.size.height * 0.7,
                    child: ListView
                (
                    shrinkWrap: true, 
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      
                      Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   ''
                )),
              Container
              (
              padding: const EdgeInsets.all(10),
                child: TextField
                (
                  controller: nameController,
                  decoration: const InputDecoration
                  (
                  border: OutlineInputBorder(), //frame
                  labelText: 'نام',
                  ),
                ),  
              ),
              Container
            (
              padding: const EdgeInsets.all(10),
                child: TextField
                (
                  controller: lastnameController,
                  decoration: const InputDecoration
                  (
                  border: OutlineInputBorder(), //frame
                  labelText: 'نام خانوادگی',
                  ),
                ),  
            ),
            Container
            (
              padding: const EdgeInsets.all(10),
                child: TextField
                (
                  controller: usernameController,
                  decoration: const InputDecoration
                  (
                  border: OutlineInputBorder(), //frame
                  labelText: 'نام کاربری',
                  ),
                ),  
            ),
            Container
            (
              padding: const EdgeInsets.all(10),
                child: TextField
                (
                  controller: phoneController,
                  decoration: const InputDecoration
                  (
                  border: OutlineInputBorder(), //frame
                  labelText: 'شماره تماس',
                  ),
                ),  
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'رمز عبور',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: confirmpasswordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'تایید رمز عبور',
                ),
              ),
            ),
             CheckboxListTile
             (
                title: Text("من با شرایط و ضوابط موافقم"),
                activeColor: Colors.green,
                value: check_box_value,
                onChanged: (newValue)
                {
                setState(() 
                {
                if(check_box_value == false)
                {
                  check_box_value = true;
                }
                else
                {
                  check_box_value = false;
                }
    });
  },
  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
),
           
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('ثبت نام'),
                  onPressed: ()
                   async
                   {   //for using await
             
                    if (passwordController.text == confirmpasswordController.text)
                    {
                      try
                      {
                        final response = await http.post(Uri.parse('http://185.255.90.31:10000/signin'),
                        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},
                        body: jsonEncode(<String, String>{'firstname': nameController.text , 'lastname': lastnameController.text , 'username': usernameController.text , 'phone': phoneController.text , 'password': passwordController.text , 'confirmpassword': confirmpasswordController.text}),);
                        if(response.body == 'ok')
                        {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => SuccessfulSignIn()),);
                        }
                        else
                        {
                            Navigator.push(context,MaterialPageRoute(builder: (context) => FailedSignIn()),);
                        }
                      }
                      catch(error)
                      {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => FailedSignIn()),);
                      }
                    }
                    else
                    {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => IncorrectPass()),);
                    }
                    //print(response.statusCode);
                    //print(response.body);
                  },
                )
            ),
            Row(
              children: <Widget>[
                const Text('حساب کاربری ندارید؟'),
                TextButton(
                  child: const Text(
                    'ورود',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () 
                  {
                    //signup screen
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
              ]
                ),                 
                
                decoration: BoxDecoration
                (
                  color: Colors.black12,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
                ),
              
            ),
            
            Positioned
            (
             top: _mediaQueryData.size.width * 0.14,
             right: _mediaQueryData.size.width * 0.18,
             child: Container
              (
                width: _mediaQueryData.size.width * 0.6,
                height: _mediaQueryData.size.height * 0.15,
                child: ListView
                (
                    children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   'داشبورد انحصاری فناوران شریف',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
            Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'مشخصات زیر را وارد کنید',
                  style: TextStyle
                  (
                    color: Colors.white,
                    fontSize: 10),
                )),
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.pink,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
            )
            
          ],
        )
   )
      
    );
  }
}

class Device extends StatefulWidget
{
  const Device({Key? key}) : super(key: key);
 
  @override
  State<Device> createState() => _Device();
}
class _Device extends State<Device>
{
  TextEditingController serialController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  bool check_box_value = true;
  Widget build (BuildContext context) 
  {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold(
      appBar: new AppBar(
        //toolbarHeight: 20,
        title: new Text('افزودن دستگاه'),
      ),
      body: new Padding
    (
        padding: const EdgeInsets.all(20),
        child: Stack
        (
          alignment: Alignment.center,
          children: <Widget>[
            /*Icon
            (
              Icons.star,
              color: Colors.red[500],
              size: 600,
            ),*/
            
              //scrollDirection: Axis.vertical,
              Center
                (
                    
                    child: Container
              (
                width: _mediaQueryData.size.width * 0.9,
                height: _mediaQueryData.size.height * 0.6,
                    child: ListView
                (
                    shrinkWrap: true, 
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      
                      Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   ''
                )),
              Container
              (
              padding: const EdgeInsets.all(10),
                child: TextField
                (
                  controller: serialController,
                  decoration: const InputDecoration
                  (
                  border: OutlineInputBorder(), //frame
                  labelText: 'سریال دستگاه',
                  ),
                ),  
              ),
              Container
              (
                padding: const EdgeInsets.all(10),
                  child: TextField
                  (
                    controller: passwordController,
                    decoration: const InputDecoration
                    (
                    border: OutlineInputBorder(), //frame
                    labelText: 'رمز دستگاه',
                    ),
                  ),  
              ),

              Container
              (
                padding: const EdgeInsets.all(10),
                  child: TextField
                  (
                    controller: nameController,
                    decoration: const InputDecoration
                    (
                    border: OutlineInputBorder(), //frame
                    labelText: 'نام دستگاه',
                    ),
                  ),  
              ),
           
            Container
            (
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('افزودن دستگاه'),
                  onPressed: ()
                  
                   async
                   {
                    final response = await http.post(Uri.parse('http://185.255.90.31:10000/add_device'),
                    headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},
                    body: jsonEncode(<String, String>{'serial': serialController.text , 'password': passwordController.text , 'name': nameController.text,}),);
                    // print(response.statusCode);
                    // print(response.body);
                    if (response.body == 'not found')
                    {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => DeviceNotFound()),);
                    }
                    else if(response.body == 'error')
                    {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => IncorrectPass()),);
                    }
                    else
                    {
                        Navigator.push(context,MaterialPageRoute(builder: (context) => Success_page()),);
                    }
                  },
                )
            ),
            
              ]
                ),                 
                
                decoration: BoxDecoration
                (
                  color: Colors.black12,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
                ),
              
            
            Positioned
            (
             top: _mediaQueryData.size.width * 0.14,
             right: _mediaQueryData.size.width * 0.18,
             child: Container
              (
                width: _mediaQueryData.size.width * 0.6,
                height: _mediaQueryData.size.height * 0.15,
                child: ListView
                (
                    children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   'داشبورد انحصاری فناوران شریف',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
            Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'به پلتفرم فناوران شریف خوش آمدید',
                  style: TextStyle
                  (
                    color: Colors.white,
                    fontSize: 10),
                )),
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.pink,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
            ),
            
          ],
          
        ),
        
   )
      
    );
  }
  
} 

class Admin_Device extends StatefulWidget 
{
  const Admin_Device({Key? key}) : super(key: key);
 
  @override
  State<Admin_Device> createState() => _Admin_Device();
}

class _Admin_Device extends State<Admin_Device> 
{
  @override
  TextEditingController modelController = TextEditingController();
  TextEditingController serialController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController inputController = TextEditingController();
  TextEditingController outputController = TextEditingController();
  String path_image = '';
  bool check_box_value = true;
  
  Widget build (BuildContext context) 
  {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold(
      appBar: new AppBar(
        //toolbarHeight: 20,
        title: new Text('افزودن دستگاه'),
      ),
      body: new Padding
    (
        padding: const EdgeInsets.all(20),
        child: Stack
        (
          alignment: Alignment.center,
          children: <Widget>[
            /*Icon
            (
              Icons.star,
              color: Colors.red[500],
              size: 600,
            ),*/
              SingleChildScrollView
              (
              scrollDirection: Axis.vertical,
              child: Center
                (
                    
                    child: Container
              (
                width: _mediaQueryData.size.width * 0.9,
                height: _mediaQueryData.size.height * 0.7,
                    child: ListView
                (
                    shrinkWrap: true, 
                    scrollDirection: Axis.vertical,
                    children: <Widget>[
                      
                      Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   ''
                )),
              Container
              (
              padding: const EdgeInsets.all(10),
                child: TextField
                (
                  controller: modelController,
                  decoration: const InputDecoration
                  (
                  border: OutlineInputBorder(), //frame
                  labelText: 'مدل دستگاه',
                  ),
                ),  
              ),
              Container
            (
              padding: const EdgeInsets.all(10),
                child: TextField
                (
                  controller: serialController,
                  decoration: const InputDecoration
                  (
                  border: OutlineInputBorder(), //frame
                  labelText: 'سریال دستگاه',
                  ),
                ),  
            ),
            Container
            (
              padding: const EdgeInsets.all(10),
                child: TextField
                (
                  controller: passwordController,
                  decoration: const InputDecoration
                  (
                  border: OutlineInputBorder(), //frame
                  labelText: 'رمز دستگاه',
                  ),
                ),  
            ),
            Container
            (
              padding: const EdgeInsets.all(10),
                child: TextField
                (
                  controller: outputController,
                  decoration: const InputDecoration
                  (
                  border: OutlineInputBorder(), //frame
                  labelText: 'تعداد خروجی',
                  ),
                ),  
            ),
            Container
            (
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField(
                obscureText: true,
                controller: inputController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'تعداد ورودی',
                ),
              ),
            ),
            Container
            (
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: ElevatedButton
              (
                style: ElevatedButton.styleFrom
                (
                  primary: Colors.deepPurpleAccent
                ),
                onPressed: () async
                {
                      final result = await FilePicker.platform.pickFiles(allowMultiple: true );
                      if (result == null) //No file selected
                      {
                        print("No file selected");
                      } 
                      else 
                      {
                        path_image = result.paths[0].toString();
                        print(path_image);
                      }
                  },
                   child: const Text("انتخاب عکس"),
              ),
            ),
              /* RaisedButton(
      child: Text('UPLOAD FILE'),
      onPressed: () async {
        var picked = await FilePicker.platform.pickFiles();

        if (picked != null) {
          print(picked.files.first.name);
        }
      },
    ),*/
             CheckboxListTile
             (
                title: Text("من با شرایط و ضوابط موافقم"),
                activeColor: Colors.green,
                value: check_box_value,
                onChanged: (newValue)
                {
                setState(() 
                {
                if(check_box_value == false)
                {
                  check_box_value = true;
                }
                else
                {
                  check_box_value = false;
                }
    });
  },
  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
),
           
            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('اضافه کردن دستگاه'),
                  onPressed: ()
                   async
                   {   //for using await
                   
                    final response = await http.post(Uri.parse('http://185.255.90.31:10000/admin_add_device'),
                    headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},
                    body: jsonEncode(<String, String>{'model': modelController.text , 'serial': serialController.text , 'password': passwordController.text , 'output': outputController.text , 'input': inputController.text , 'image': path_image , }),);
                    //print(response.statusCode);
                    //print(response.body);
                  },
                )
            ),
            
              ]
                ),                 
                
                decoration: BoxDecoration
                (
                  color: Colors.black12,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
                ),
              
            ),
            
            Positioned
            (
             top: _mediaQueryData.size.width * 0.14,
             right: _mediaQueryData.size.width * 0.18,
             child: Container
              (
                width: _mediaQueryData.size.width * 0.6,
                height: _mediaQueryData.size.height * 0.15,
                child: ListView
                (
                    children: <Widget>[
              Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   'داشبورد انحصاری فناوران شریف',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
            Container(
                alignment: Alignment.centerRight,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'مشخصات زیر را وارد کنید',
                  style: TextStyle
                  (
                    color: Colors.white,
                    fontSize: 10),
                )),
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.pink,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
            )
            
          ],
        )
   )
      
    );
  }
}

class Success_page extends StatelessWidget 
{
    @override
  Widget build(BuildContext context) 
  {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold
    (
        appBar: new AppBar
        (
          title: Text('با موفقیت انجام شد'),
        ),
    );
  }
}

class DeviceNotFound extends StatelessWidget 
{
    @override
  Widget build(BuildContext context) 
  {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold
    (
        appBar: new AppBar
        (
          title: Text('وسیله یافت نشد'),
        ),
    );
  }
}

//user not found
class UserNotFound extends StatelessWidget 
{
    @override
  Widget build(BuildContext context) 
  {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold
    (
        appBar: new AppBar
        (
          title: Text('کاریری یافت نشد'),
        ),
    );
  }
}

class SuccessfulSignIn extends StatelessWidget 
{
    @override
  Widget build(BuildContext context) 
  {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold
    (
        appBar: new AppBar
        (
          title: Text('ثبت نام با موفقیت انجام شد'),
        ),
    );
  }
}

class FailedSignIn extends StatelessWidget 
{
    @override
  Widget build(BuildContext context) 
  {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold
    (
        appBar: new AppBar
        (
          title: Text('ثبت نام ناموفق بود'),
        ),
    );
  }
}

class SuccessfulDownload extends StatelessWidget 
{
    @override
  Widget build(BuildContext context) 
  {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold
    (
        appBar: new AppBar
        (
          title: Text('دانلود فایل با موفقیت انجام شد'),
        ),
    );
  }
}

class FailedDownload extends StatelessWidget 
{
    @override
  Widget build(BuildContext context) 
  {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold
    (
        appBar: new AppBar
        (
          title: Text('دانلود فایل ناموفق بود'),
        ),
    );
  }
}

//page when password is incorrect
class IncorrectPass extends StatelessWidget 
{
    @override
  Widget build(BuildContext context) 
  {
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return new Scaffold
    (
        appBar: new AppBar
        (
          title: Text('رمز اشتباه است'),
        ),
    );
  }
}
class MyStatefulWidget extends StatefulWidget
{
  const MyStatefulWidget({Key? key}) : super(key: key);
 
  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class NavigationDrawer extends StatelessWidget
{
  const NavigationDrawer({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) => Drawer
    (
        child: SingleChildScrollView
        (
            child: Column
            (
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>
                [
                    buildHeader(context),
                    buildMenuItems(context),
                ],
            ),
        ),
    );
    Widget buildHeader(BuildContext context)
    {
       return Container
       (
          padding: EdgeInsets.only
          (
            top: MediaQuery.of(context).padding.top,
          ),
       );
    }

    Widget buildMenuItems(BuildContext context)
    {
      return Container
      (
       child: Column
       (
          children: <Widget>
          [
              ListTile
              (
                 //leading: const Icon(),
                 title: const Text('ورود'),
                 onTap: () => 
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Login()),),
              ),
              
              ListTile
              (
                 //leading: const Icon(),
                 title: const Text('ثبت نام'),
                 onTap: () => 
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Sign_in()),),
              ),
              
              ListTile
              (
                 //leading: const Icon(),
                 title: const Text('تاریخچه'),
                 onTap: () => 
                    Navigator.push(context,MaterialPageRoute(builder: (context) => History()),),
              ),
              ListTile
              (
                 //leading: const Icon(),
                 title: const Text('وسیله‌ها'),
                 onTap: () => 
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Get_Device()),),
              ),
              ListTile
              (
                 //leading: const Icon(),
                 title: const Text('اضافه کردن وسیله'),
                 onTap: () => 
                    Navigator.push(context,MaterialPageRoute(builder: (context) => Device()),),
              ),
          ],
      ));
    }
}

class Admin_NavigationDrawer extends StatelessWidget
{
  const Admin_NavigationDrawer({Key? key}) : super(key: key);

    @override
    Widget build(BuildContext context) => Drawer
    (
        child: SingleChildScrollView
        (
            child: Column
            (
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>
                [
                    buildHeader(context),
                    buildMenuItems(context),
                ],
            ),
        ),
    );
    Widget buildHeader(BuildContext context)
    {
       return Container
       (
          padding: EdgeInsets.only
          (
            top: MediaQuery.of(context).padding.top,
          ),
       );
    }

    Widget buildMenuItems(BuildContext context)
    {
      return Container
      (
       child: Column
       (
          children: <Widget>
          [
              ListTile
              (
                 //leading: const Icon(),
                 title: const Text('ورود'),
                 onTap: () => 
                    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Login()),
  ),
              ),
              
              ListTile
              (
                 //leading: const Icon(),
                 title: const Text('ثبت نام'),
                 onTap: () => 
                    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Sign_in()),
  ),
              ),
              ListTile
              (
                 //leading: const Icon(),
                 title: const Text('تاریخچه'),
                 onTap: () => 
                    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => History()),
  ),
              ),
              ListTile
              (
                 //leading: const Icon(),
                 title: const Text('اضافه کردن وسیله'),
                 onTap: () => 
                    Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Admin_Device()),
  ),
              ),
          ],
      ));
    }
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool check_box_value = true;
 
  @override
  Widget build(BuildContext context)
  {
    
    MediaQueryData _mediaQueryData = MediaQuery.of(context);
    return Scaffold
    (
      drawer: const NavigationDrawer(),
    body: Padding
    (
        padding: const EdgeInsets.all(20),
        child: Stack
        (
          alignment: Alignment.center,
          children: <Widget>[
            /*Icon
            (
              Icons.star,
              color: Colors.red[500],
              size: 600,
            ),*/
            
            Positioned
            (
                bottom: 10,
                left: 30,
                child: TextButton
                (
                  child: const Text(
                    'درباره ما',
                    style: TextStyle(fontSize: 10 , color: Colors.black),
                  ),
                  onPressed: () 
                  {
                    //about us
                  },
                ),
            ),
            Positioned
            (
                bottom: 10,
                left: 80,
                child: TextButton
                (
                  child: const Text(
                    'پشتیبانی',
                    style: TextStyle(fontSize: 10 , color: Colors.black),
                  ),
                  onPressed: () 
                  {
                    //supportness
                  },
                ),
            ),
            Center
            (
              child: Container
              (
                width: _mediaQueryData.size.width * 0.9,
                height: _mediaQueryData.size.height * 0.6,
                child: ListView
                (
                    children: <Widget>[
                      Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10), //distance from up and down
                child: const Text(
                   ''
                )),
            Container(
              padding: const EdgeInsets.all(10),
                child: 
                TextField
                (
                  controller: nameController,
                  decoration: const InputDecoration
                  (
                  border: OutlineInputBorder(), //frame
                  labelText: 'نام کاربری',
                  ),
                ),  
            ),
            Container
            (
              padding: const EdgeInsets.fromLTRB(10, 10, 10, 0),
              child: TextField
              (
                obscureText: true,
                controller: passwordController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'رمز عبور',
                ),
              ),
            ),
             CheckboxListTile
             (
                title: Text("من را به یاد داشته باش"),
                activeColor: Colors.green,
                value: check_box_value,
                onChanged: (newValue)
                {
                setState(() 
                {
                if(check_box_value == false)
                {
                  check_box_value = true;
                }
                else
                {
                  check_box_value = false;
                }
    });
  },
  controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
),
            TextButton(
              onPressed: () 
              {
                //forgot password screen
              },
              child: const Text('رمز عبور را فراموش کرده ام',),
            ),
            Container(
                height: 50,
                width: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('ورود'),
                  onPressed: ()
                   {
                    // print(nameController.text);
                    // print(passwordController.text);
                  },
                )
            ),
            Row(
              children: <Widget>[
                const Text('حساب کاربری ندارید؟'),
                TextButton(
                  child: const Text(
                    'ثبت نام',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () 
                  {
                    //signup screen
                  },
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.center,
            ),
              ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.black12,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
            ),
            Positioned
            (
             top: 0,
             //right: 140,
             right: 0,
             child: Container
              (
                width: _mediaQueryData.size.width * 0.9,
                height: 50.0,
                child: Stack
                (
                    children: <Widget>
                    [
              Positioned(
                top: 0,
                right: 0,
              child: Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: const Text(
                   'داشبورد انحصاری فناوران شریف',
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w500,
                      fontSize: 10),
                ))),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'پشتیبانی',
                  style: TextStyle
                  (
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 12),
                )),
                

                Positioned
              (
                top:3,
                left:5,
                child: SizedBox
                (
                height: _mediaQueryData.size.height / 20,
                width: _mediaQueryData.size.width / 5,
                child: ElevatedButton
                (
                  onPressed: () 
                  {

                  },
                  style: ElevatedButton.styleFrom
                  (
                  shape: RoundedRectangleBorder
                  (
                    borderRadius: BorderRadius.circular(12),
                  ),
                  primary: Colors.black,
                  side: BorderSide
                  (
                      width: 2,
                      color: Colors.black,
                  )
                  ),
                  child: const Text
                  (
                    'آشنایی با ما',
                     style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 7)
                  ),
                )
            ),
                ),
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.white10,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
            ),

             Positioned
            (
             //top: 70,
             //right: 440,
             top: _mediaQueryData.size.width * 0.25,
             right: _mediaQueryData.size.width * 0.18,
             child: Container
              (
                //width: 350.0,
                //height: 110.0,
                width: _mediaQueryData.size.width / 2,
                height: _mediaQueryData.size.height * 0.12,
                child: ListView
                (
                    children: <Widget>[
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5), //distance from up and down
                child: const Text(
                   'داشبورد فناوران شریف',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontSize: 15),
                )),
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(5),
                child: const Text(
                  'به پلتفرم فناوران شریف خوش آمدید',
                  style: TextStyle
                  (
                    color: Colors.white,
                    fontSize: 7),
                )),
            ]
                ),
                decoration: BoxDecoration
                (
                  color: Colors.pink,
                  borderRadius: BorderRadius.only
                  (
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                    bottomLeft: Radius.circular(20),
                    bottomRight: Radius.circular(20)
                  ),
                  boxShadow: [
                  BoxShadow
                  (
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
    ],
                  border: Border.all
                  (
                    color: Colors.black,
                    width: 3.0,
                  ),
               ),
            ),
            )
            
          ],
        )
   )
    );
  }
}

