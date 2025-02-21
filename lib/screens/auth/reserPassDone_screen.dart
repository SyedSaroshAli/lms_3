import 'package:flutter/material.dart';
import 'package:lms/widgets/buttonWidget.dart';

class ResetPassDoneScreen extends StatefulWidget {
  const ResetPassDoneScreen({super.key});

  @override
  State<ResetPassDoneScreen> createState() => _ResetPassDoneScreenState();
}

class _ResetPassDoneScreenState extends State<ResetPassDoneScreen> {
  @override
  Widget build(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 20),
        height: double.infinity,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('assets/reset_pass_done.png'),
            SizedBox(
              height: height / 18,
            ),
            Text(
              'Your Password has been updated Succesfully!',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: height / 18,
            ),
            ButtonWidget(text: "DONE")
          ],
        ),
      ),
    );
  }
}
