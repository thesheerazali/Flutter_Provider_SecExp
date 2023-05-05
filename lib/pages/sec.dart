import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../providers/homepage_provider.dart';

class SecondScreen extends StatelessWidget {
  const SecondScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, numberListProvider, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            numberListProvider.updateValue();
          },
        ),
        appBar: AppBar(
          title: const Text("Counter App"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Center(
              child: Text(
                numberListProvider.numbers.last.toString(),
                style: const TextStyle(fontSize: 25),
              ),
            ),
            SizedBox(
              height: 200,
              width: double.infinity,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: numberListProvider.numbers.length,
                itemBuilder: (context, index) {
                  return Text(
                    numberListProvider.numbers[index].toString(),
                    style: TextStyle(fontSize: 25),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
