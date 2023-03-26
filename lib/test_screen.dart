import 'package:flutter/material.dart';
import 'package:teat33/register.dart';

class TestScreem extends StatefulWidget {
  const TestScreem({super.key});

  @override
  State<TestScreem> createState() => _TestScreemState();
}

class _TestScreemState extends State<TestScreem> {
  String name = 'Ahmed';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Test Screen'),
            const SizedBox(
              width: 200,
              height: 200,
              child: Image(
                image: AssetImage('assets/images/11.jpg'),
              ),
            ),
            const SizedBox(height: 20),
            const SizedBox(
              width: 200,
              height: 200,
              child: Image(
                image: NetworkImage(
                    'https://i.pinimg.com/236x/a5/16/6a/a5166aa4cc29f6de4b0232f443516ef5.jpg'),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => const REgisterScreen(),
                  ),
                
                );
              },
              child: const Text('Go To register Screen'),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            name = 'Mohamed';
          });
        },
        child: const Icon(Icons.add),
      ),
    );
  }

  void _showDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Go Back'),
          content: const Text('Are you sure?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('No'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text('Yes'),
            ),
          ],
        );
      },
    );
  }
}
