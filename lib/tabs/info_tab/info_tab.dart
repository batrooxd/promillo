import 'package:flutter/material.dart';

class InfoPageWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Information Alkoholmissbrauch'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Container(
              padding: EdgeInsets.all(5),
              color: Colors.grey,
              child: Text(
                  'Was ist Alkoholmissbrauch bzw. gesundheitsschädigender Alkoholkonsum?',
                  style: TextStyle(fontSize: 20))),
          Expanded(
            child: Container(
                padding: EdgeInsets.all(5),
                color: Colors.white,
                child: Text(
                    'Man spricht von Alkoholmissbrauch, wenn in den letzten 12 Monaten mindestens eines der folgenden Ereignisse aufgetreten ist: wiederholter Alkoholkonsum, der dazu geführt hat, dass wichtige Pflichten bei der Arbeit, in der Schule oder zu Hause nicht erfüllt werden konnten / wiederholter Alkoholkonsum in Situationen, in denen das für Leib und Leben gefährlich sein kann / wiederholte rechtliche Probleme wegen Alkohol / Alkoholkonsum trotz ständiger oder wiederholt auftretender zwischenmenschlicher oder sozialer Probleme, die durch die Wirkung des Alkohols verursacht oder verschärft werden. Alkoholmissbrauch wird von der Weltgesundheitsorganisation (WHO) als «gesundheitsschädigender Konsum» bezeichnet, und nur die physischen und psychischen Konsequenzen sind in der Definition enthalten. Die WHO betrachtet mit dem Alkoholkonsum verbundene soziale Probleme nicht als Kriterium für einen «gesundheitsschädigenden Konsum».')),
          ),
          Container(
            padding: EdgeInsets.all(5),
            color: Colors.grey,
            child: Text('Was ist Risikokonsum von Alkohol?',
                style: TextStyle(fontSize: 20)),
          ),
          Expanded(
            child: Container(
                padding: EdgeInsets.all(5),
                color: Colors.white,
                child: Text(
                    'Bacon ipsum dolor amet tenderloin tri-tip shoulder tail meatball brisket ball tip. Alcatra leberkas bresaola swine, doner chislic kevin buffalo sirloin flank cow beef ribs. Boudin shank sirloin, tongue picanha biltong leberkas rump corned beef shoulder. Chislic alcatra short ribs, prosciutto ball tip porchetta tri-tip. Turducken ham tail tongue corned beef cupim short loin chuck boudin. Spare ribs pancetta boudin burgdoggen jerky.')),
          ),
        ],
      ),
    );
  }
}
