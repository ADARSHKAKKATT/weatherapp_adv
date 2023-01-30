import 'package:flutter/material.dart';
import 'package:weatherapp_adv/weatherapi_datacls.dart';
import 'package:weatherapp_adv/weathr_model.dart';

class Weather extends StatefulWidget {
  const Weather({Key? key}) : super(key: key);

  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  temp(String day, String time, IconData icn, String tmp) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Container(
        color: Colors.yellow,
        child: Row(
          children: [
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      day,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    Text(
                      time,
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    )
                  ],
                ),
                Icon(
                  icn,
                  color: Colors.white,
                  size: 40,
                ),
                Text(
                  tmp,
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  wind(String cond, String spid) {
    return Container(
      child: Row(
        children: [
          Column(
            children: [
              Text(
                cond,
                style: TextStyle(color: Colors.white70),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                spid,
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
        ],
      ),
    );
  }

  WhetherData service = WhetherData();
  Wether w = new Wether();

  String cond = '';
  String tme = '';
  String iccon = '';
  double temper = 0;
  double laat = 0;
  double long = 0;

  List<String> country = ['India', 'London', 'Kerala', 'Delhi', 'USA'];
  String valueChoose='';


  @override
  void initState() {
    super.initState();
    getWhether();
  }

  void getWhether() async {
    w = await service.getWhetherData('Kerala');
    print(w.temp_c);
    print(w.lat);
    print(w.lon);
    print(w.condition);
    print(w.timee);
    print(w.icn);

    setState(() {
      laat = w.lat;
      long = w.lon;
      temper = w.temp_c;
      cond = w.condition;
      tme = w.timee;
      iccon = w.icn;
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      /*appBar: AppBar(
        backgroundColor: Colors.black,
      ),
      drawer: Drawer(
        child: Container(),
      ),*/
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 30, top: 30),
            child: Row(
              children: [
                Text(
                  "${tme}",
                  style: TextStyle(color: Colors.white, fontSize: 20),
                ),
              ],
            ),
          ),
          SizedBox(height: 50),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              DropdownButton(
                value: valueChoose,
                  onChanged: (String? newValue){
                  setState(() {
                    valueChoose=newValue!;
                  });
              },
              items:
              country.map((valueItem){
                return DropdownMenuItem(
                value: valueItem,
                child: Text(valueItem),
                );
    }).toList(),
              ),
              Text(
                "${valueChoose}",
                // "Kerala",
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 8,
                    color: Colors.white,
                    fontSize: 40),
              ),
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${w.condition}",
                style: TextStyle(
                    color: Colors.white,
                    letterSpacing: 5,
                    fontSize: 25,
                    fontWeight: FontWeight.w600),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.wb_cloudy_outlined,
                size: 50,
                color: Colors.grey,
              ),
              // Image.network('${iccon}'),
              /* Container(
                height: 100,
                width: 100,
                child: NetworkImage("${iccon}"),
              )*/
              /* Container(
                height: 80,
                width: 80,
                child: Image.network('${iccon}'),
              ),*/
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "${w.temp_c}",
                style: TextStyle(fontSize: 60, color: Colors.white),
              ),
              Text(
                "°C",
                style: TextStyle(color: Colors.white),
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Column(
                children: [
                  Text(
                    "Latitude",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${laat}",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              ),
              SizedBox(
                width: 20,
              ),
              Container(
                height: 40,
                width: 2,
                color: Colors.white,
              ),
              SizedBox(
                width: 20,
              ),
              Column(
                children: [
                  Text(
                    "Longitude",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text(
                    "${long}",
                    style: TextStyle(color: Colors.white),
                  )
                ],
              )
            ],
          ),
          SizedBox(
            height: 20,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                temp("Thu", "5PM", Icons.thunderstorm, "29°C"),
                temp("Thu", "5PM", Icons.thunderstorm, "29°C"),
                temp("Thu", "5PM", Icons.thunderstorm, "29°C"),
                temp("Thu", "5PM", Icons.thunderstorm, "29°C"),
                // temp("Thu", "5PM", Icons.thunderstorm, "29°C"),
              ],
            ),
          ),
          SizedBox(
            height: 30,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                wind("Wind Speed", "5.1 m/s"),
                wind("Sun Rise", "5:54 AM"),
                wind("SunSet", "6:47 PM"),
                wind("Humidity", "52%"),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
