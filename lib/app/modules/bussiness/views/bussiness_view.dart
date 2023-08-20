import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/bussiness_controller.dart';

class BussinessView extends GetView<BussinessController> {
  const BussinessView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BussinessView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BussinessView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
