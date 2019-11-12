//typedef Compare = int Function(Object a, Object b);
//
//class SortedCollection {
//  Compare compare;
//
//  SortedCollection(this.compare);
//}
//


import 'todo.dart';

//// Initial, broken implementation.
//int sort(Object a, Object b) => 0;
//
//void main() {
//  SortedCollection coll = SortedCollection(sort);
//  assert(coll.compare is Function);
//  assert(coll.compare is Compare);
//}


typedef Compare<T> = int Function(T a, T b);

int sort(int a, int b) => a - b;

void main() {
  assert(sort is Compare<int>); // True!
}

@Todo('seth', 'make this do something')
void doSomething() {
  print('do something');
}