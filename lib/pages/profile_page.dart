import 'package:first_app/core/utils/app_settings.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final _dataList = <int>[];
  final _globalAnimatedListKey = GlobalKey<AnimatedListState>();

  void _removeItem(int index) {
    _globalAnimatedListKey.currentState!.removeItem(index,
        (context, animation) {
      return SizeTransition(
        sizeFactor: animation,
        child: Card(
          elevation: 5,
          child: ListTile(
            minVerticalPadding: 30,
            tileColor: Colors.orange,
            title: Text('Deletd $index',
                style: const TextStyle(color: Colors.white)),
            trailing: IconButton(
              onPressed: () {},
              icon: const Icon(Icons.delete),
              color: Colors.white,
            ),
          ),
        ),
      );
    }, duration: const Duration(milliseconds: 500));
    _dataList.remove(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('App Map'),
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: FittedBox(
              fit: BoxFit.cover,
              child: Container(
                color: Colors.transparent,
                child: Align(
                  child: IconButton(
                    onPressed: () {
                      _dataList.insert(0, _dataList.length + 1);
                      _globalAnimatedListKey.currentState?.insertItem(0,
                          duration: const Duration(milliseconds: 500));
                    },
                    icon: const Icon(Icons.add),
                    iconSize: 32,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
        ),
        body: Padding(
          padding: EdgeInsets.all(AppSettings.defaultPadding),
          child: AnimatedList(
            key: _globalAnimatedListKey,
            initialItemCount: 0,
            itemBuilder: (context, index, animation) {
              return SizeTransition(
                key: UniqueKey(),
                sizeFactor: animation,
                child: Card(
                  elevation: 5,
                  child: ListTile(
                    minVerticalPadding: 30,
                    tileColor: AppSettings.primaryColor,
                    title: Text('Item ${_dataList[index]}',
                        style: const TextStyle(color: Colors.white)),
                    trailing: IconButton(
                      onPressed: () {
                        _removeItem(index);
                      },
                      icon: const Icon(Icons.delete),
                      color: Colors.white,
                    ),
                  ),
                ),
              );
            },
          ),
        ));
  }
}
