import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SearchView extends StatelessWidget {
  SearchView({
    super.key,
  });
  final _controller = TextEditingController();
  // String? textName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/imgs-1633839686.webp'),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TextFormField(
                // onChanged: (value) {
                //   textName = value;
                //   log('$textName');
                // },
                controller: _controller,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 30,
                  color: Colors.white,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  hintText: 'Шаарды жазыныз',
                  hintStyle: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.w400,
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.greenAccent,
                    ),
                    borderRadius: BorderRadius.circular(
                      50.0,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      width: 3,
                      color: Colors.yellow,
                    ),
                    borderRadius: BorderRadius.circular(
                      50.0,
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            TextButton(
                style: ButtonStyle(
                    padding: MaterialStateProperty.all(EdgeInsets.symmetric(
                      horizontal: 35,
                      vertical: 15,
                    )),
                    backgroundColor:
                        MaterialStateProperty.all(Colors.blueGrey)),
                onPressed: () {
                  if (_controller.text.isNotEmpty) {
                    Get.back(result: _controller.text);
                  }
                  FocusManager.instance.primaryFocus?.unfocus();
                },
                child: Text(
                  'Шаарды тап',
                  style: TextStyle(fontSize: 30, color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
