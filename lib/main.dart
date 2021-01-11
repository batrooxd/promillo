import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:promillo/tabs/tabbar.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'classes/drink.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  var prefs = await SharedPreferences.getInstance();
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
            create: (_) => DrinkList(
                //Shared Preferences laden
                prefs.getInt('weight') ?? 80,
                prefs.getInt('gender') ?? 0)),
      ],
      child: MyTabBar(),
    ),
  );
}

//"Globale" Datenklasse für DrinkListe
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

  //Algoryhtmus zur Berechnung der Promille inkl. "Zerfall"
  calcpermille() {
    double calculate = 0;
    DateTime rightnow = DateTime.now();
    Duration onehour = new Duration(hours: 1, minutes: 0, seconds: 0);
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

  //Grüne/rote Box mit Anzeige des Wertes. Wenn > 1 kein Wert mehr anzeigen
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

  //Textgeneriung für "wann darf man wieder Auto fahren"
  drivecarchecker() {
    double permille = calcpermille();
    if (permille > 0.5) {
      double cartime = (permille - 0.5) / 0.1;
      int carhours = int.parse(cartime.toString().split(".")[0]);
      int carminutes =
          (60 / 100 * int.parse(cartime.toStringAsFixed(2).split(".")[1]))
              .round();
      DateTime whencanidrive = DateTime.now();
      whencanidrive =
          whencanidrive.add(new Duration(hours: carhours, minutes: carminutes));
      String formattedDate =
          DateFormat('yyyy-MM-dd – kk:mm').format(whencanidrive);
      String drivecar =
          "Du darfst am " + formattedDate + " wieder ein Fahrzeug lenken.";
      return drivecar;
    } else {
      String drivecar =
          "Mit dem aktuellen Wert darfst Du ein Fahrzeug lenken. Sei vorsichtig";
      return drivecar;
    }
  }

  //Promillebox rot oder grün einfärben je nach Promillewert
  givemecolor() {
    double permille = calcpermille();
    if (permille > 0.5) {
      return Colors.red;
    } else {
      return Colors.green;
    }
  }

  //Shared Preferences setzen
  void setWeight(int newweight) async {
    gewicht = newweight;
    var sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setInt("weight", newweight);
    notifyListeners();
  }

//Shared Preferences setzen
  void setGender(int newgender) async {
    geschlecht = newgender;
    var sharedPrefs = await SharedPreferences.getInstance();
    sharedPrefs.setInt("gender", newgender);
    notifyListeners();
  }
}
