import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class news extends StatelessWidget {
  const news({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: TextButton(
            onPressed: () {
              context.go("/");
            },
            child: Text(
              "News Page",
              style: Theme.of(context).textTheme.bodyLarge,
            )),
      ),
    );
  }
}
