import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'package:dzikirapp/component/wrapperDzikir.dart';
import 'package:dzikirapp/pages/index.dart';

class DzikirDetail extends StatefulWidget {
  final String dzikirType;
  DzikirDetail({required this.dzikirType, Key? key}) : super(key: key);
  @override
  _DzikirDetail createState() => _DzikirDetail();
}

class _DzikirDetail extends State<DzikirDetail>
    with SingleTickerProviderStateMixin {
  List _items = [];
  late TabController _tabController;
  late int _activeTabIndex;

  @override
  void initState() {
    super.initState();
    _activeTabIndex = 0;
    readJson().then((result) {
      _tabController = new TabController(vsync: this, length: _items.length);
      void _setActiveTabIndex() {
        setState(() {
          _activeTabIndex = _tabController.index;
        });
      }

      _tabController.addListener(_setActiveTabIndex);
    });
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  Future<void> readJson() async {
    final String dzikirPagi = 'assets/dzikirpagi.json';
    final String dzikirPetang = 'assets/dzikirpetang.json';
    final String response = await rootBundle
        .loadString(widget.dzikirType == 'pagi' ? dzikirPagi : dzikirPetang);
    final data = await json.decode(response);
    setState(() {
      _items = data["items"];
    });
  }

  @override
  Widget build(BuildContext context) {
    String _dzikirLength = _items.length.toString();
    String _dzikirType = widget.dzikirType;
    return DefaultTabController(
      length: _items.length,
      child: Scaffold(
        appBar: AppBar(
          leading: new IconButton(
              icon: new Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.of(context).pop(AppIndex);
              }),
          backgroundColor: Color(0xff24573F),
          elevation: 0,
          title: Text(
            'Dzikir $_dzikirType',
            style: const TextStyle(color: Colors.white),
          ),
        ),
        body: Column(children: [
          Flexible(
            child: Container(
              child: _items.isNotEmpty
                  ? TabBarView(
                controller: _tabController,
                children:
                List<Widget>.generate(_items.length, (int index) {
                  return WrapperDzikir(data: _items[index]);
                }),
              )
                  : Container(),
            ),
          ),
          Container(
            height: 45,
            width: double.infinity,
            color: Color(0xff24573F),
            child: Center(
              child: Text("${_activeTabIndex + 1} / $_dzikirLength",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  )),
            ),
          ),
        ]),
      ),
    );
  }
}