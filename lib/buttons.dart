import 'package:flutter/material.dart';

class FloatButton extends StatelessWidget {
  final GestureTapCallback func;
  bool condition;
  String tooltip1, tooltip2;
  Widget child;
  FloatButton(
      this.child, this.func, this.condition, this.tooltip1, this.tooltip2);
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      child: child,
      tooltip: condition ? tooltip1 : tooltip2,
      onPressed: condition ? func : null,
      backgroundColor: condition ? Colors.brown[600] : Colors.grey[700],
      elevation: condition ? 6 : 0,
      splashColor: condition ? null : Colors.grey,
    );
  }
}

class Counter extends StatefulWidget {
  String desc;
  int add;
  Counter(this.desc, this.add);

  @override
  _CounterState createState() => _CounterState(desc, add);
}

class _CounterState extends State<Counter> {
  String desc;
  int add;
  _CounterState(this.desc, this.add);
  int count = 0;
  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(5),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5), color: Colors.teal[400]),
        child: Column(
          children: [
            Row(
              children: [
                count > 0
                    ? InkWell(
                        onTap: () {
                          setState(() {
                            count -= add;
                          });
                        },
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                          size: 26,
                        ))
                    : Container(
                        width: 26,
                      ),
                Container(
                  margin: EdgeInsets.symmetric(horizontal: 3),
                  padding: EdgeInsets.symmetric(horizontal: 3, vertical: 2),
                  width: 33,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      color: Colors.white),
                  child: Text(
                    count < 10 ? '0${count}' : '${count}',
                    style: TextStyle(color: Colors.black, fontSize: 20),
                    textAlign: TextAlign.center,
                  ),
                ),
                InkWell(
                    onTap: () {
                      setState(() {
                        count += add;
                      });
                    },
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 26,
                    )),
              ],
            ),
            Text(
              desc,
              style: TextStyle(color: Colors.white),
            ),
          ],
        ));
  }
}
