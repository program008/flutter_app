////named parameters
//void enableFlags({bool bold, bool hidden}) {
//  // Todo
//}
////Positional parameters
//String say(String from, String msg, [String device]) {
//  var result = '$from says $msg';
//  if (device != null) {
//    result = '$result with a $device';
//  }
//  return result;
//}
//
///// Sets the [bold] and [hidden] flags ...
//void enableFlags2({bool bold = false, bool hidden = false}) {}
//
//String say2(String from, String msg,
//    [String device = 'carrier pigeon', String mood]) {
//  var result = '$from says $msg';
//  if (device != null) {
//    result = '$result with a $device';
//  }
//  if (mood != null) {
//    result = '$result (in a $mood mood)';
//  }
//  return result;
//}
//
//void doStuff(
//    {List<int> list = const [1, 2, 3],
//    Map<String, String> gifts = const {
//      'first': 'paper',
//      'second': 'cotton',
//      'third': 'leather'
//    }}) {
//  print('list:  $list');
//  print('gifts: $gifts');
//}
//
///// Returns a function that adds [addBy] to the
///// function's argument.
//Function makeAdder(num addBy) {
//  return (num i) => addBy + i;
//}

void main() {
//  // Create a function that adds 2.
//  var add2 = makeAdder(2);
//
//  // Create a function that adds 4.
//  var add4 = makeAdder(4);

  //assert(add2(3) == 5);
 // assert(add4(3) == 7);
  var urlString = "https://flutter.dev";
  assert(urlString.startsWith('https'), 'URL ($urlString) should start with "https".');
  print(urlString.startsWith('https'));
}
