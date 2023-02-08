import 'package:flutter/material.dart';

class ChartElement extends StatefulWidget {
  String title;
  double count;
  double percentCount;

  ChartElement(
      {super.key,
      required this.title,
      required this.count,
      required this.percentCount});

  @override
  _ChartElementState createState() => _ChartElementState();
}

class _ChartElementState extends State<ChartElement> {
  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Column(
        children: [
          FittedBox(
              child: Text('${widget.count} руб.')),
          Padding(
            padding: const EdgeInsets.all(5.0),
            child: SizedBox(
              width: 10,
              height: 60,
              child: Stack(
                alignment: Alignment.bottomCenter,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[300],
                      border: Border.all(
                        color: Colors.black12,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  FractionallySizedBox(
                    heightFactor: widget.percentCount,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Text(widget.title),
        ],
      ),
    );
  }
}
