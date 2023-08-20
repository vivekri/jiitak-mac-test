import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/punchin_controller.dart';

class PunchinView extends GetView<PunchinController> {
  const PunchinView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('PunchinView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'PunchinView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
