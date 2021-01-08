import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:promillo/tabs/tabbar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'classes/drink.dart';
import 'classes/person.dart';
import 'functions/functions.dart';

//final robert =
//    new Person(name: "robert", alter: 30, gewicht: 90, geschlecht: "m");
//final geschlecht = myGender(robert.geschlecht);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => DrinkList(
                prefs.getInt('weight') ?? 80, prefs.getInt('gender') ?? 0)),
      ],
      child: MyTabBar(),
    ),
  );
}

class DrinkList extends ChangeNotifier {
  List<DrinkAction> meineDrinkListe = [];

  DrinkList(int gewicht, int geschlecht) {
    this.gewicht = gewicht;
    this.geschlecht = geschlecht;
  }

  int gewicht;
  int geschlecht;

  adddrink(Drink drink) {
    meineDrinkListe.add(DrinkAction(drink: drink));
    notifyListeners();
  }

  calcpermille() {
    double calculate = 0;
    DateTime rightnow = DateTime.now();
    Duration onehour = new Duration(hours: 1, minutes: 0, seconds: 0);
    //Duration oneminute = new Duration(hours: 0, minutes: 1, seconds: 0);
    //Duration onesecond = new Duration(hours: 0, minutes: 0, seconds: 1);
    //Falls kein Gewicht eingeben wird
    //if (gewicht == 0) {
    //  gewicht = 80;
    //}
    for (var i = 0; i < meineDrinkListe.length; i++) {
      calculate = calculate +
          meineDrinkListe[i].drink.quantity *
              (meineDrinkListe[i].drink.volume / 100) *
              0.8 /
              (gewicht * (geschlecht == 0 ? 0.68 : 0.55));
      //Wenn i>0 dann Zeit-Differenz zum letzten Drink berechnen
      if (i > 0) {
        Duration difference =
            meineDrinkListe[i].time.difference(meineDrinkListe[i - 1].time);
        //Wenn Zeit-Differenz > 1 Stunde dann Stunden "extrahieren" und pro Stunde minus 0.1 rechnen
        if (difference > onehour) {
          int hours = difference.inHours;
          calculate = calculate - (hours / 10);
        }
      }
    }
    if (meineDrinkListe.isNotEmpty) {
      //Wenn letzter Drink dann Zeit-Differenz zu jetzt
      Duration difference = rightnow.difference(meineDrinkListe.last.time);
      //Wenn Zeit-Differenz > 1 Stunde dann Stunden "extrahieren" und pro Stunde minus 0.1 rechnen
      if (difference > onehour) {
        int hours = difference.inHours;
        calculate = calculate - (hours / 10);
      }
    }
    return calculate;
  }

  permillechecker() {
    double permille = calcpermille();
    String permillevalue = "";
    if (permille > 1) {
      permillevalue = "zu viel";
      return permillevalue;
    } else {
      permillevalue = permille.toStringAsFixed(2);
      return permillevalue;
    }
  }

  drivecarchecker() {
    double permille = calcpermille();
    //double cartime = 0;
    if (permille > 0.5) {
      double cartime = (permille - 0.5) / 0.1;
      //print(cartime);
      int carhours = int.parse(cartime.toString().split(".")[0]);
      int carminutes =
          (60 / 100 * int.parse(cartime.toStringAsFixed(2).split(".")[1]))
              .round();
      //carminutes = (60 / 100 * carminutes).round();
      DateTime whencanidrive = DateTime.now();

      print(carhours);
      print(carminutes);
      whencanidrive =
          whencanidrive.add(new Duration(hours: carhours, minutes: carminutes));
      print(whencanidrive);
      String formattedDate =
          DateFormat('yyyy-MM-dd – kk:mm').format(whencanidrive);
      //print(formattedDate);
      String drivecar =
          "Du darfst am " + formattedDate + " wieder ein Fahrzeug lenken.";
      return drivecar;
    } else {
      String drivecar =
          "Mit dem aktuellen Wert darfst Du ein Fahrzeug lenken. Sei vorsichtig";
      return drivecar;
    }
  }

  givemecolor() {
    double permille = calcpermille();
    if (permille > 0.5) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  void setWeight(int newweight) async {
    gewicht = newweight;
    var sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setInt("weight", newweight);
    notifyListeners();
  }

  void setGender(int newgender) async {
    geschlecht = newgender;
    var sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setInt("gender", newgender);
    notifyListeners();
  }

  void _init() async {
    var sharedPrefs = await SharedPreferences.getInstance();
    gewicht = sharedPrefs.getInt("weight");
    geschlecht = sharedPrefs.getInt("gender");
    print("ahoi");
    notifyListeners();
    //setWeight(sharedPrefs.getInt("weight"));
    //setWeight(sharedPrefs.getInt("gender"));
  }
}
