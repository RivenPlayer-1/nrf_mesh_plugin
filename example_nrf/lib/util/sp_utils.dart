import 'dart:convert';
import 'dart:io';

import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:xml/xml.dart';

class SpUtils{
  void copyS() async {
    // Obtain shared preferences.
    // await Permission.manageExternalStorage.request();
    //
    // if(!await Permission.manageExternalStorage.isGranted){
    //   print("bbb");
    // }
    // final SharedPreferences prefs = await SharedPreferences.getInstance();
    // final appDir = await getApplicationDocumentsDirectory();
    // await prefs.setStringList("0x01", [ "0x03", "0x04", "0x05", "0x06", "0x07", "0x08", "0x09", "0x0A", "0x0B", "0x0C", "0x0D", "0x0E", "0x0F", "0x10"]);
    //
    // final spPath = join(
    //   appDir.parent.path,
    //   'shared_prefs/FlutterSharedPreferences.xml',
    // );
    // var spFile = File(spPath);

    var exportPath = await getExternalStorageDirectory();
    if (exportPath == null) {
      print("not exit");
      return;
    }
    var exportFile = File(
      join(exportPath.path, "FlutterSharedPreferences2.xml"),
    );
    if (!exportFile.existsSync()) {
      exportFile.createSync();
    }
    // await exportFile.writeAsBytes(spFile.readAsBytesSync());
    importPrefsWithEncodedStringList(exportFile);
  }


  Future<void> importPrefsWithEncodedStringList(File xmlFile) async {
    final prefs = await SharedPreferences.getInstance();
    final xml = await xmlFile.readAsString();
    final doc = XmlDocument.parse(xml);

    for (final node in doc.rootElement.children) {
      if (node is! XmlElement) continue;

      final rawKey = node.getAttribute('name');
      if (rawKey == null) continue;
      final key = rawKey.startsWith('flutter.') ? rawKey.substring(8) : rawKey;

      final valueText = node.innerText;

      try {
        // 检查是否是 Base64 + ! 前缀
        final separatorIndex = valueText.indexOf('!');
        if (separatorIndex > 0) {
          final prefixBase64 = valueText.substring(0, separatorIndex);
          final decodedPrefix = utf8.decode(base64.decode(prefixBase64));

          if (decodedPrefix == 'This is the prefix for a list.') {
            final jsonPart = valueText.substring(separatorIndex + 1);
            final decoded = jsonDecode(jsonPart);
            if (decoded is List) {
              final list = decoded.map((e) => e.toString()).toList();
              await prefs.setStringList(key, list);
              print('✅ StringList written: $key → $list');
              continue;
            }
          }
        }

        // 如果不是列表格式，按其他基本类型处理
        switch (node.name.toString()) {
          case 'string':
            await prefs.setString(key, valueText);
            break;
          case 'int':
          case 'long':
            await prefs.setInt(key, int.parse(valueText));
            break;
          case 'boolean':
            await prefs.setBool(key, valueText == 'true');
            break;
          default:
            print('⚠️ 不支持的节点类型: ${node.name}');
        }
      } catch (e) {
        print('❌ 导入失败 key: $key → $e');
      }
    }

    print('✅ SharedPreferences 导入完成');
    var a =  prefs.getStringList("0x01");
    print(a);
    var b = await prefs.setStringList("key", ["a","b"]);
  }
}