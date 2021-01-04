import 'package:flutter/material.dart';

class InfoPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              padding: EdgeInsets.all(5),
              color: Colors.grey,
              child: Text(
                  'Woran kann ich Alkoholmissbrauch und -abhängigkeit erkennen?',
                  style: TextStyle(fontSize: 20))),
          Container(
            child: Container(
                padding: EdgeInsets.all(5),
                color: Colors.white,
                child: Text(
                    'Haben Sie manchmal den Eindruck, dass Sie deutlich zu viel Alkohol trinken? Kommt es vor, dass Sie nicht mehr aufhören können zu trinken, wenn Sie einmal angefangen haben? Der Selbsttest hat ergeben, dass Sie ein schädliches bzw. missbräuchliches Alkoholkonsumverhalten aufweisen? Doch was genau versteht man unter Alkoholmissbrauch, und was ist der Unterschied zwischen Alkoholmissbrauch und  Alkoholabhängigkeit? Und was können Sie gegen Alkoholmissbrauch tun? Hier finden Sie Antworten auf diese Fragen und viele nützliche Tipps, mit denen Sie Ihr Trinkverhalten ggf. ändern können.')),
          ),
          Container(
            padding: EdgeInsets.all(5),
            color: Colors.grey,
            child: Text(
                'Vom Alkoholmissbrauch zur Alkoholabhängigkeit – wo stehe ich?',
                style: TextStyle(fontSize: 20)),
          ),
          Container(
            child: Container(
                padding: EdgeInsets.all(5),
                color: Colors.white,
                child: Text(
                    'Die Übergänge von einem risikoarmen Alkoholkonsum über riskanten Alkoholkonsum und schädlichen Konsum zu einer Abhängigkeit sind fließend. Alkoholabhängigkeit ist nicht eine Frage der konsumierten Alkoholmenge, sondern der Unfähigkeit, den Alkoholkonsum dauerhaft nach eigenem Willen zu kontrollieren und zu steuern. Es gibt Alkoholabhängige, die zeitweise abstinent leben („Quartalsäufer“), und solche, die ihren täglichen Konsum zwar kontrollieren können, aber nicht in der Lage sind, auch nur für wenige Tage nichts zu trinken („Spiegeltrinker“). Alkoholmissbrauch ist jeder Alkoholkonsum, der – unabhängig von der getrunkenen Menge – zu Schäden führt. Das können soziale, psychische und gesundheitliche Folgen sein, aber auch Alkoholunfälle im Straßenverkehr oder am Arbeitsplatz. Alkoholmissbrauch ist häufig der Grund für finanzielle Probleme oder für Schwierigkeiten in Partnerschaft und Familie. Alkohol ist oft auch der Auslöser für Aggression und Gewalt gegen andere Menschen oder Sachen. Alkoholabhängigkeit ist eine Krankheit, bei der sich das Leben zunehmend um die Droge Alkohol dreht. Alkohol zu trinken, ist für Abhängige das Wichtigste, andere Interessen werden immer mehr vernachlässigt. Die Tage werden meist so geplant, dass Alkohol getrunken werden kann. Ein klarer Hinweis auf eine Abhängigkeit sind wiederholte, erfolglose Versuche, weniger oder gar nichts mehr zu trinken. Haben Alkoholabhängige einmal damit begonnen zu trinken, fällt es ihnen sehr schwer aufzuhören. Alkoholabhängig ist also, wer seinen Alkoholkonsum nicht mehr steuern kann.')),
          ),
          Container(
            padding: EdgeInsets.all(5),
            color: Colors.grey,
            child: Text('Vielleicht wollen Sie es nicht wahrhaben?',
                style: TextStyle(fontSize: 20)),
          ),
          Container(
            child: Container(
                padding: EdgeInsets.all(5),
                color: Colors.white,
                child: Text(
                    'Menschen mit einem Alkoholproblem versuchen häufig, ihre Schwierigkeiten vor sich und der Umwelt zu verheimlichen: „Das ist nicht schlimm. Ich könnte jederzeit aufhören, wenn ich wollte.“ Oft dauert es lange, bis sich Menschen mit Alkoholproblemen zu einer Änderung ihres Trinkverhaltens entschließen. Auf Tage, an denen – vielleicht ausgelöst durch einen „Kater“ – gute Vorsätze beschworen werden, folgen solche, an denen es gelingt, so weit Maß zu halten, dass der Alkohol das Leben nicht besonders zu behindern scheint. Die Entspannung durch den Alkohol oder der Spaß an der feuchtfröhlichen Runde scheinen dann die schlechten Gefühle am „Morgen danach“ aufzuwiegen. Möglich auch, dass andere Probleme wie z. B. Arbeitslosigkeit oder Trennung das Thema Alkohol vorübergehend in den Hintergrund drängen. Doch es dauert nicht lange, bis erneut deutlich wird, dass der Alkohol die bestehenden Probleme meist mit verursacht hat. Und es wird immer klarer, dass die eigene Lebenssituation nur verbessert werden kann, wenn es gelingt, auf Dauer weniger Alkohol zu trinken bzw. alkoholfrei zu leben.')),
          ),
          Container(
            padding: EdgeInsets.all(5),
            color: Colors.grey,
            child:
                Text('Lassen Sie sich beraten', style: TextStyle(fontSize: 20)),
          ),
          Container(
            child: Container(
                padding: EdgeInsets.all(5),
                color: Colors.white,
                child: Text(
                    'Wenn Sie merken, dass Sie Ihren Alkoholkonsum auf Dauer ohne Unterstützung nicht reduzieren können, scheuen Sie sich nicht und nehmen fachliche Unterstützung in Anspruch. Unter „Beratung“ erfahren Sie, wo Sie professionelle Hilfe erhalten. Die gibt es nicht nur für Alkoholabhängige: Viele Hilfsangebote wenden sich an Menschen, die neue Wege suchen, um weniger Alkohol zu trinken und ein gesünderes und glücklicheres Leben zu führen.')),
          ),
        ],
      ),
    ));
  }
}
