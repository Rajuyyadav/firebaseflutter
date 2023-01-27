import 'package:flutter/material.dart';

class Task1 extends StatefulWidget {
  const Task1({Key? key}) : super(key: key);

  @override
  State<Task1> createState() => _Task1State();
}

class _Task1State extends State<Task1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Alert Box'),
      ),
      body: Center(
        child: TextButton(
          onPressed: () {
            setState(() {});
            showDialog(
                context: context,
                builder: (context) => AlertDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(22),
                      ),
                      insetPadding: const EdgeInsets.symmetric(horizontal: 10),
                      contentPadding:
                          const EdgeInsets.symmetric(horizontal: 30),
                      icon: const Icon(
                        size: 30,
                        Icons.info_outline_rounded,
                        color: Color(0xe8a67815),
                      ),
                      title: const Text(
                        "KYC has failed due to one of following reasons",
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w600,
                            height: 1.5),
                      ),
                      backgroundColor: Colors.white,
                      content: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: const [
                          SizedBox(
                            height: 15,
                          ),
                          Flexible(
                            child: Text(
                              "* Kindly verify if entered Aadhaar number is same as your Aadhaar card",
                              style: TextStyle(
                                  color: Color(0xe82d2d2d),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400,
                                  height: 1.5),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            "* Your KYC doesn't exists. Please resume once the KYC is completed",
                            style: TextStyle(
                                color: Color(0xe82d2d2d),
                                fontSize: 18,
                                fontWeight: FontWeight.w400,
                                height: 1.5),
                          ),
                        ],
                      ),
                      actions: [
                        const Divider(
                          thickness: 2,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            TextButton(
                                onPressed: () {},
                                child: Text(
                                  'Retry Aadhar'.toUpperCase(),
                                  style: TextStyle(
                                    color: Colors.purple.shade600,
                                    fontWeight: FontWeight.w700,
                                    letterSpacing: 2,
                                  ),
                                )),
                            Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              decoration: BoxDecoration(
                                  color: Colors.purple.shade600,
                                  borderRadius: BorderRadius.circular(5)),
                              child: TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    'i will leave'.toUpperCase(),
                                    style: const TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700,
                                      letterSpacing: 2,
                                    ),
                                  )),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ));
          },
          child: const Text("data"),
        ),
      ),
    );
  }
}
