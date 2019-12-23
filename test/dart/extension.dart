import 'extension/string_apis.dart';
//import 'extension/string_apis_2.dart' hide NumberParsing2;
import 'extension/string_apis_2.dart';
import 'extension/string_apis_3.dart' as red;
/// 解决扩展方法的冲突
///
/// 方法一  using show or hide to limit the exposed API
/// 方法二 applying the extension explicitly
/// 方法三 import using a prefix
main(){
  //You can’t invoke extension methods on variables of type dynamic
  //dynamic d = '2';
  var d = '2';
  //print(d.parseInt());


  //print('42'.parseInt()); // Doesn't work.
  // Use the ParseNumbers extension from string_apis.dart.
  print(NumberParsing('42').parseInt());
  // Use the ParseNumbers extension from string_apis_3.dart.
  print(red.NumberParsing('42').parseInt());
  print(NumberParsing2('42').parseInt());
  // Only string_apis_3.dart has parseDouble().
  print("3.14".parseDouble());


}