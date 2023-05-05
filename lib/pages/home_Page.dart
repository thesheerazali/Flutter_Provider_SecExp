import 'package:flutter/material.dart';
import 'package:flutter_provider2/pages/sec.dart';
import 'package:flutter_provider2/providers/homepage_provider.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<HomePageProvider>(
      builder: (context, numberProvider, child) => Scaffold(
        floatingActionButton: FloatingActionButton(
          child: Icon(Icons.add),
          onPressed: () {
            numberProvider.updateValue();
          },
        ),
        appBar: AppBar(),
        body: Column(
          children: [
            Center(
              child: Text(
                numberProvider.numbers.last.toString(),
                style: const TextStyle(fontSize: 25),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: numberProvider.numbers.length,
                itemBuilder: (context, index) {
                  return Text(
                    numberProvider.numbers[index].toString(),
                    style: TextStyle(fontSize: 25),
                  );
                },
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                  builder: (context) => SecondScreen(),
                ));
              },
              child: Text("Second Screen"),
            )
          ],
        ),
      ),
    );
  }
}
