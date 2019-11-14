import 'package:date_format/date_format.dart';

main() {
  print(formatDate(DateTime(1989, 2, 21), [yyyy, '-', mm, '-', dd]));//1989-02-21
  print(formatDate(DateTime(1989, 2, 21), [yy, '-', m, '-', dd]));//89-2-21
  print(formatDate(DateTime(1989, 2, 1), [yy, '-', m, '-', d]));//89-2-1

  print(formatDate(DateTime(1989, 2, 1), [yy, '-', MM, '-', d]));//89-February-1
  print(formatDate(DateTime(1989, 2, 21), [yy, '-', M, '-', d]));//89-Feb-21

  print(formatDate(DateTime(1989, 2, 1), [yy, '-', M, '-', d]));//89-Feb-1

  print(formatDate(DateTime(2018, 1, 14), [yy, '-', M, '-', DD]));//18-Jan-Sunday
  print(formatDate(DateTime(2018, 1, 14), [yy, '-', M, '-', D]));//18-Jan-Sun

  print(formatDate(DateTime(1989, 02, 1, 15, 40, 10), [HH, ':', nn, ':', ss]));//15:40:10

  print(formatDate(
      DateTime(1989, 02, 1, 15, 40, 10), [hh, ':', nn, ':', ss, ' ', am]));//03:40:10 PM

  print(formatDate(
      DateTime(1989, 02, 1, 15, 40, 10), [hh, ':', nn, ':', ss, ' ', am]));//03:40:10 PM

  print(formatDate(DateTime(1989, 02, 1, 15, 40, 10), [hh]));//03
  print(formatDate(DateTime(1989, 02, 1, 15, 40, 10), [h]));//3

  print(formatDate(DateTime(1989, 02, 1, 5), [am]));//AM
  print(formatDate(DateTime(1989, 02, 1, 15), [am]));//PM

  print(
      formatDate(DateTime(1989, 02, 1, 15, 40, 10), [HH, ':', nn, ':', ss, z]));//15:40:10+0800

  print(formatDate(
      DateTime(1989, 02, 1, 15, 40, 10), [HH, ':', nn, ':', ss, ' ', Z]));//15:40:10 中国标准时间

  print(formatDate(DateTime(1989, 02, 21), [yy, ' ', w]));//89 4
  print(formatDate(DateTime(1989, 02, 21), [yy, ' ', W]));//89 8

  print(formatDate(DateTime(1989, 12, 31), [yy, '-W', W]));//89-W53
  print(formatDate(DateTime(1989, 1, 1), [yy, '-', mm, '-w', W]));//89-01-w1

  print(formatDate(
      DateTime(1989, 02, 1, 15, 40, 10), [HH, ':', nn, ':', ss, ' ', Z]));//15:40:10 中国标准时间
}