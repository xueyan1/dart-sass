// Copyright 2016 Google Inc. Use of this source code is governed by an
// MIT-style license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.

import '../visitor/value.dart';
import '../value.dart';

class SassList extends Value {
  final List<Value> contents;

  final ListSeparator separator;

  SassList(Iterable<Value> contents, this.separator)
      : contents = new List.unmodifiable(contents);

  /*=T*/ accept/*<T>*/(ValueVisitor/*<T>*/ visitor) =>
      visitor.visitList(this);

  // TODO: parenthesize nested lists if necessary
  String toString() =>
      contents.join(separator == ListSeparator.comma ? ", " : " ");
}

class ListSeparator {
  static const space = const ListSeparator._("space");
  static const comma = const ListSeparator._("comma");
  static const none = const ListSeparator._("none");

  final String name;

  const ListSeparator._(this.name);

  String toString() => name;
}