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
        appBar: AppBar(
          title: const Text("Counter App"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                height: 50,
                width: 50,
                decoration: const BoxDecoration(
                  color: Colors.blueGrey,
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
                child: Center(
                  child: Text(
                    numberProvider.numbers.last.toString(),
                    style: const TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
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
