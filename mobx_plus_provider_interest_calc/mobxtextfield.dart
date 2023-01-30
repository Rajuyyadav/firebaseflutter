import 'package:firebasecrud/mobx_plus_provider_interest_calc/storeclassmobx.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:provider/provider.dart';

class MobxTextField extends StatelessWidget {
  const MobxTextField({Key? key}) : super(key: key);

  // final calculator = MobStore();     // creating constructor of mobx store

  @override
  Widget build(BuildContext context) {
    final calculator = Provider.of<MobStore>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Interest Calculator'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              const SizedBox(
                height: 15,
              ),
              const Text(
                'Interest Calculator',
                style: TextStyle(
                    fontSize: 25,
                    color: Colors.purple,
                    fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  calculator.principal = int.parse(value);
                  calculator.totalInterest();
                },
                decoration: const InputDecoration(
                    labelText: 'Principal', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  calculator.interestRate = double.parse(value);
                  calculator.totalInterest();
                },
                decoration: const InputDecoration(
                    labelText: 'interestRate', border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                keyboardType: TextInputType.number,
                onChanged: (value) {
                  calculator.mon = int.parse(value);
                  calculator.totalInterest();
                },
                decoration: const InputDecoration(
                    labelText: 'Months', border: OutlineInputBorder()),
              ),
              Image.asset('assets/img_1.png'),

              const SizedBox(
                height: 10,
              ),

              Observer(builder: (context) {
                return Text(
                  calculator.newval.toString(),
                );
              }),
              // TextButton(
              //     onPressed: calculator.totalInterest, child: const Text('submit')),
              const SizedBox(
                height: 15,
              ),
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.purple,
                ),
                padding: const EdgeInsets.only(
                  left: 10,
                  right: 10,
                ),
                child: TextButton(
                    onPressed: () {
                      // calculator.totalInterest();

                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (_) => const Newclass11()));
                    },
                    child: Text(
                      'Next'.toUpperCase(),
                      style: TextStyle(color: Colors.black),
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Newclass11 extends StatelessWidget {
  const Newclass11({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final calculator = Provider.of<MobStore>(context);
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 20),
            Card(
              child: Column(
                children: [
                  ListTile(
                    title: const Text("Principal Amount"),
                    trailing: Text(calculator.principal.toString()),
                  ),
                  ListTile(
                    title: const Text("Interest Rate"),
                    trailing: Text(calculator.interestRate.toString()),
                  ),
                  ListTile(
                    title: const Text("Months"),
                    trailing: Text(calculator.mon.toString()),
                  ),
                  ListTile(
                    title: const Text("Years"),
                    trailing: Text(calculator.years.toInt().toString()),
                  ),
                  // ListTile(
                  //   title: const Text("Total Amount"),
                  //   trailing: Text(calculator.newval.toString()),
                  // ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Image.asset('assets/img.png'),
            const SizedBox(
              height: 20,
            ),
            Card(
              clipBehavior: Clip.antiAlias, //===============
              child: ListTile(
                tileColor: Colors.black12,
                title: const Text(
                  "Total Amount",
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                ),
                trailing: Text(
                  calculator.newval.toString(),
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
