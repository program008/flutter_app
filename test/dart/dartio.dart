import 'dart:convert';
import 'dart:io';
//Reading a file as text
Future main() async {
  var config = File('config.txt');
  var contents;

  // Put the whole file in a single string.
  contents = await config.readAsString();
  print('The file is ${contents.length} characters long.');

  // Put each line of the file into its own string.
  contents = await config.readAsLines();
  print('The file is ${contents.length} lines long.');
}
//Reading a file as binary
Future main2() async {
  var config = File('config.txt');

  var contents = await config.readAsBytes();
  print('The file is ${contents.length} bytes long.');
}

///Handling errors
Future main3() async {
  var config = File('config.txt');
  try {
    var contents = await config.readAsString();
    print(contents);
  } catch (e) {
    print(e);
  }
}

///Streaming file contents
Future main4() async {
  var config = File('config.txt');
  Stream<List<int>> inputStream = config.openRead();

  var lines =
  utf8.decoder.bind(inputStream).transform(LineSplitter());
  try {
    await for (var line in lines) {
      print('Got ${line.length} characters from stream');
    }
    print('file is now closed');
  } catch (e) {
    print(e);
  }
}
///Writing file contents
void main5() async{
  var logFile = File('log.txt');
  var sink = logFile.openWrite();
  //var sink = logFile.openWrite(mode: FileMode.append);
  sink.write('FILE ACCESSED ${DateTime.now()}\n');
  await sink.flush();
  await sink.close();
}

///Listing files in a directory
Future main6() async {
  var dir = Directory('tmp');

  try {
    var dirList = dir.list();
    await for (FileSystemEntity f in dirList) {
      if (f is File) {
        print('Found file ${f.path}');
      } else if (f is Directory) {
        print('Found dir ${f.path}');
      }
    }
  } catch (e) {
    print(e.toString());
  }
}


