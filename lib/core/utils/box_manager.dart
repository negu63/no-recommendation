import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';

dynamic loadFromHive(String name, String key) async {
  Box box;
  try {
    box = Hive.box(name);
  } catch (error) {
    box = await Hive.openBox(name);
    debugPrint(error.toString());
  }

  return box.get(key);
}

void saveToHive(String name, String key, dynamic value) async {
  Box box = await Hive.openBox(name);
  box.put(key, value);
}
