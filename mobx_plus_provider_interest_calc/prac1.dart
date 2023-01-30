import 'package:firebasecrud/mobx_plus_provider_interest_calc/storeclassmobx.dart';
import 'package:firebasecrud/mobx_plus_provider_interest_calc/textinputbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class Prac1 extends StatefulWidget {
  const Prac1({Key? key}) : super(key: key);

  @override
  State<Prac1> createState() => _Prac1State();
}

class _Prac1State extends State<Prac1> {
  final TextEditingController _pcontroller = TextEditingController();
  final TextEditingController _tcontroller = TextEditingController();
  final TextEditingController _rcontroller = TextEditingController();
  final calculator = MobStore();
  int? na = 0;
  int newa = 0;
  int newb = 0;
  int newc = 0;
  int abcval = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            //=====================================
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (val) {
                newa = int.parse(val);
              },
              decoration: const InputDecoration(labelText: 'years'),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (val) {
                newb = int.parse(val);
              },
              decoration: const InputDecoration(labelText: 'years'),
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (val) {
                newc = int.parse(val);
              },
              decoration: const InputDecoration(labelText: 'years'),
            ),
            Text(abcval.toString()),

            TextButton(
                onPressed: () {
                  calabcval(newa, newb, newc);

                  setState(() {});
                },
                child: const Text('newna')),
            const Divider(
              thickness: 3,
              color: Colors.blue,
            ),

            //=====================================

            //=====================================
            TextInputBox(
              labeltext: 'amount',
              ontap: () {},
              controller: _pcontroller,
            ),
            const SizedBox(
              height: 10,
            ),
            TextInputBox(
              labeltext: 'time',
              ontap: () {},
              controller: _tcontroller,
            ),
            const SizedBox(
              height: 10,
            ),
            TextInputBox(
              labeltext: 'rate',
              ontap: () {},
              controller: _rcontroller,
            ),
            Text('${na.toString()} newwwww '),
            TextButton(
                onPressed: () {
                  calna();
                  setState(() {});
                },
                child: const Text('newna')),
            //=====================================
          ],
        ),
      ),
    );
  }

  void calabcval(int newa, int newb, int newc) {
    abcval = newa * newb * newc;
  }

  void calna() {
    na = int.parse(_pcontroller.text) *
        int.parse(_tcontroller.text) *
        int.parse(_rcontroller.text);
  }
}

// ==== create urs own class Widgets based on the requirement.
/*
class Cl extends StatefulWidget {
  const Cl({Key? key}) : super(key: key);

  @override
  State<Cl> createState() => _ClState();
}

class _ClState extends State<Cl> {
  @override
  Widget build(BuildContext context) {
    return bbb(
      ontap: () {},
      aaa: 'esdxfv',
      color: Colors.purple,
    );
  }
}

class bbb extends StatelessWidget {
  final String aaa;
  final VoidCallback ontap;
  final Color color;

  bbb({Key? key, required this.aaa, required this.color, required this.ontap})
      : super(key: key);

  @override
  Widget build(BuildContext context) => InkWell(
        onTap: ontap,
        child: Container(
          color: color,
          height: 50,
          child: Text(aaa),
        ),
      );
}
*/
