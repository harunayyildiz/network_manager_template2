import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:network_manager_template2/core/enums/request_type.dart';
import 'package:network_manager_template2/core/init/network/network_manager.dart';
import 'package:network_manager_template2/product/home/model/todo_model.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  List<TodoModel>? todoModel;
  @override
  void initState() {
    NetworkManager.instance.coreDio
        ?.send<List<TodoModel>, TodoModel>('todos/',
            requestType: RequestType.get, parseModel: TodoModel())
        .then((value) {
      setState(() {
        if (value.data != null) {
          todoModel = value.data;
        }
      });
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('network manager template 2'),
      ),
      body: Center(
          child: todoModel == null
              ? const CupertinoActivityIndicator()
              : Text(todoModel?.first.title ?? '')),
    );
  }
}
