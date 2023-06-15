// This file has been generated by the reflectable package.
// https://github.com/dart-lang/reflectable.

import 'dart:core';
import 'dart:async' as prefix3;
import 'model/model.dart' as prefix1;
import 'package:lych/src/reflections.dart' as prefix0;
import 'package:lych/src/repository.dart' as prefix2;

// ignore_for_file: camel_case_types
// ignore_for_file: implementation_imports
// ignore_for_file: prefer_adjacent_string_concatenation
// ignore_for_file: prefer_collection_literals
// ignore_for_file: unnecessary_const

// ignore:unused_import
import 'package:reflectable/mirrors.dart' as m;
// ignore:unused_import
import 'package:reflectable/src/reflectable_builder_based.dart' as r;
// ignore:unused_import
import 'package:reflectable/reflectable.dart' as r show Reflectable;

final _data = <r.Reflectable, r.ReflectorData>{
  const prefix0.LReflectAnnotation(): r.ReflectorData(
      <m.TypeMirror>[
        r.NonGenericClassMirrorImpl(
            r'Thing',
            r'.Thing',
            134217735,
            0,
            const prefix0.LReflectAnnotation(),
            const <int>[0, 1, 30, 35],
            const <int>[36, 30, 37, 38, 39, 31, 32, 33, 34],
            const <int>[],
            -1,
            {},
            {},
            {
              r'': (bool b) =>
                  (id, [title]) => b ? prefix1.Thing(id, title) : null
            },
            -1,
            0,
            const <int>[],
            const <Object>[prefix0.Reflect],
            null),
        r.NonGenericClassMirrorImpl(
            r'TDevice',
            r'.TDevice',
            134217735,
            1,
            const prefix0.LReflectAnnotation(),
            const <int>[2, 3, 4, 5, 6, 7, 40, 53],
            const <int>[
              36,
              54,
              37,
              38,
              39,
              41,
              42,
              43,
              44,
              45,
              46,
              47,
              48,
              49,
              50,
              51,
              52
            ],
            const <int>[40],
            -1,
            {r'propertiesMap': () => prefix1.TDevice.propertiesMap},
            {},
            {
              r'': (bool b) => (url, href, attype, properties) =>
                  b ? prefix1.TDevice(url, href, attype, properties) : null
            },
            -1,
            1,
            const <int>[],
            const <Object>[prefix0.Reflect],
            null),
        r.NonGenericClassMirrorImpl(
            r'TProperty',
            r'.TProperty',
            134217735,
            2,
            const prefix0.LReflectAnnotation(),
            const <int>[8, 9, 10, 11, 12, 13, 67],
            const <int>[
              36,
              54,
              37,
              38,
              39,
              55,
              56,
              57,
              58,
              59,
              60,
              61,
              62,
              63,
              64,
              65,
              66
            ],
            const <int>[],
            -1,
            {},
            {},
            {
              r'': (bool b) => (href, title, type, enums) =>
                  b ? prefix1.TProperty(href, title, type, enums) : null
            },
            -1,
            2,
            const <int>[],
            const <Object>[prefix0.Reflect],
            null),
        r.NonGenericClassMirrorImpl(
            r'TPropertyType',
            r'.TPropertyType',
            138412039,
            3,
            const prefix0.LReflectAnnotation(),
            const <int>[14, 15, 16, 17, 73],
            const <int>[36, 54, 37, 38, 39, 74],
            const <int>[68, 69, 70, 71, 72],
            -1,
            {
              r'string': () => prefix1.TPropertyType.string,
              r'integer': () => prefix1.TPropertyType.integer,
              r'number': () => prefix1.TPropertyType.number,
              r'boolean': () => prefix1.TPropertyType.boolean,
              r'values': () => prefix1.TPropertyType.values
            },
            {},
            {},
            -1,
            3,
            const <int>[],
            const <Object>[prefix0.Reflect],
            null),
        r.GenericClassMirrorImpl(
            r'LRepository',
            r'.LRepository',
            134217735,
            4,
            const prefix0.LReflectAnnotation(),
            const <int>[19, 20, 21, 22, 23, 24, 75, 76, 77, 78, 91],
            const <int>[
              36,
              54,
              37,
              38,
              39,
              75,
              76,
              77,
              78,
              79,
              80,
              81,
              82,
              83,
              84,
              85,
              86,
              87,
              88,
              89,
              90
            ],
            const <int>[],
            -1,
            {},
            {},
            {
              r'': (bool b) => ([webServer = "http://localhost:8080/api/"]) =>
                  b ? prefix2.LRepository(webServer) : null
            },
            -1,
            4,
            const <int>[],
            const <Object>[prefix0.Reflect],
            null, (o) {
          return o is prefix2.LRepository;
        }, const <int>[6], 4),
        r.NonGenericClassMirrorImpl(
            r'LDataState',
            r'.LDataState',
            138412039,
            5,
            const prefix0.LReflectAnnotation(),
            const <int>[25, 26, 27, 28, 97],
            const <int>[36, 54, 37, 38, 39, 74],
            const <int>[92, 93, 94, 95, 96],
            -1,
            {
              r'UNKNOWN': () => prefix2.LDataState.UNKNOWN,
              r'REQUESTING': () => prefix2.LDataState.REQUESTING,
              r'OFFLINE': () => prefix2.LDataState.OFFLINE,
              r'AVAILABLE': () => prefix2.LDataState.AVAILABLE,
              r'values': () => prefix2.LDataState.values
            },
            {},
            {},
            -1,
            5,
            const <int>[],
            const <Object>[prefix0.Reflect],
            null),
        r.TypeVariableMirrorImpl(r'T', r'.LRepository.T',
            const prefix0.LReflectAnnotation(), -1, 4, <Object>[])
      ],
      <m.DeclarationMirror>[
        r.VariableMirrorImpl(
            r'id',
            134348805,
            0,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6,
            const <int>[],
            const <Object>[prefix0.Json]),
        r.VariableMirrorImpl(
            r'title',
            67239941,
            0,
            const prefix0.LReflectAnnotation(),
            -1,
            7,
            7,
            const <int>[],
            const <Object>[prefix0.Json]),
        r.VariableMirrorImpl(
            r'url',
            134348805,
            1,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6,
            const <int>[],
            const <Object>[prefix0.Json]),
        r.VariableMirrorImpl(
            r'href',
            134348805,
            1,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6,
            const <int>[],
            const <Object>[prefix0.Json]),
        r.VariableMirrorImpl(
            r'id',
            67239941,
            1,
            const prefix0.LReflectAnnotation(),
            -1,
            7,
            7,
            const <int>[],
            const <Object>[prefix0.Json]),
        r.VariableMirrorImpl(
            r'title',
            67239941,
            1,
            const prefix0.LReflectAnnotation(),
            -1,
            7,
            7,
            const <int>[],
            const <Object>[prefix0.Json]),
        r.VariableMirrorImpl(
            r'attype',
            151126021,
            1,
            const prefix0.LReflectAnnotation(),
            -1,
            8,
            9,
            const <int>[6],
            const <Object>[prefix0.Json]),
        r.VariableMirrorImpl(
            r'properties',
            151126021,
            1,
            const prefix0.LReflectAnnotation(),
            -1,
            10,
            11,
            const <int>[6, 2],
            const <Object>[prefix0.Json]),
        r.VariableMirrorImpl(
            r'href',
            134348805,
            2,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6,
            const <int>[],
            const <Object>[prefix0.Json]),
        r.VariableMirrorImpl(
            r'title',
            134348805,
            2,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6,
            const <int>[],
            const <Object>[prefix0.Json]),
        r.VariableMirrorImpl(
            r'type',
            134348805,
            2,
            const prefix0.LReflectAnnotation(),
            3,
            3,
            3,
            const <int>[],
            const <Object>[prefix0.Json]),
        r.VariableMirrorImpl(
            r'attype',
            67239941,
            2,
            const prefix0.LReflectAnnotation(),
            -1,
            7,
            7,
            const <int>[],
            const <Object>[prefix0.Json]),
        r.VariableMirrorImpl(
            r'enums',
            151126021,
            2,
            const prefix0.LReflectAnnotation(),
            -1,
            8,
            9,
            const <int>[6],
            const <Object>[prefix0.Json]),
        r.VariableMirrorImpl(
            r'value',
            67239941,
            2,
            const prefix0.LReflectAnnotation(),
            -1,
            12,
            12,
            const <int>[],
            const <Object>[prefix0.Json]),
        r.VariableMirrorImpl(
            r'string',
            134349973,
            3,
            const prefix0.LReflectAnnotation(),
            3,
            3,
            3, const <int>[], const []),
        r.VariableMirrorImpl(
            r'integer',
            134349973,
            3,
            const prefix0.LReflectAnnotation(),
            3,
            3,
            3, const <int>[], const []),
        r.VariableMirrorImpl(
            r'number',
            134349973,
            3,
            const prefix0.LReflectAnnotation(),
            3,
            3,
            3, const <int>[], const []),
        r.VariableMirrorImpl(
            r'boolean',
            134349973,
            3,
            const prefix0.LReflectAnnotation(),
            3,
            3,
            3, const <int>[], const []),
        r.VariableMirrorImpl(
            r'values',
            151127253,
            3,
            const prefix0.LReflectAnnotation(),
            -1,
            13,
            14,
            const <int>[3],
            const []),
        r.VariableMirrorImpl(
            r'state',
            134348805,
            4,
            const prefix0.LReflectAnnotation(),
            5,
            5,
            5,
            const <int>[],
            const <Object>[prefix0.Json]),
        r.VariableMirrorImpl(
            r'webServer',
            134348805,
            4,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6,
            const <int>[],
            const <Object>[prefix0.Json]),
        r.VariableMirrorImpl(
            r'fetchCommand',
            134348805,
            4,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6, const <int>[], const []),
        r.VariableMirrorImpl(
            r'stateCommand',
            134348805,
            4,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6, const <int>[], const []),
        r.VariableMirrorImpl(
            r'persistCommand',
            134348805,
            4,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6, const <int>[], const []),
        r.VariableMirrorImpl(
            r'removeCommand',
            134348805,
            4,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6, const <int>[], const []),
        r.VariableMirrorImpl(
            r'UNKNOWN',
            134349973,
            5,
            const prefix0.LReflectAnnotation(),
            5,
            5,
            5, const <int>[], const []),
        r.VariableMirrorImpl(
            r'REQUESTING',
            134349973,
            5,
            const prefix0.LReflectAnnotation(),
            5,
            5,
            5, const <int>[], const []),
        r.VariableMirrorImpl(
            r'OFFLINE',
            134349973,
            5,
            const prefix0.LReflectAnnotation(),
            5,
            5,
            5, const <int>[], const []),
        r.VariableMirrorImpl(
            r'AVAILABLE',
            134349973,
            5,
            const prefix0.LReflectAnnotation(),
            5,
            5,
            5, const <int>[], const []),
        r.VariableMirrorImpl(
            r'values',
            151127253,
            5,
            const prefix0.LReflectAnnotation(),
            -1,
            15,
            16,
            const <int>[5],
            const []),
        r.MethodMirrorImpl(
            r'toString',
            2097154,
            0,
            -1,
            6,
            6,
            const <int>[],
            const <int>[],
            const prefix0.LReflectAnnotation(),
            const <Object>[override]),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 0, 31),
        r.ImplicitSetterMirrorImpl(const prefix0.LReflectAnnotation(), 0, 32),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 1, 33),
        r.ImplicitSetterMirrorImpl(const prefix0.LReflectAnnotation(), 1, 34),
        r.MethodMirrorImpl(r'', 0, 0, -1, 0, 0, const <int>[],
            const <int>[0, 1], const prefix0.LReflectAnnotation(), const []),
        r.MethodMirrorImpl(r'==', 2097154, -1, -1, 17, 17, const <int>[],
            const <int>[4], const prefix0.LReflectAnnotation(), const []),
        r.MethodMirrorImpl(
            r'noSuchMethod',
            524290,
            -1,
            -1,
            -1,
            -1,
            const <int>[],
            const <int>[5],
            const prefix0.LReflectAnnotation(),
            const []),
        r.MethodMirrorImpl(r'hashCode', 2097155, -1, -1, 18, 18, const <int>[],
            const <int>[], const prefix0.LReflectAnnotation(), const []),
        r.MethodMirrorImpl(
            r'runtimeType',
            2097155,
            -1,
            -1,
            19,
            19,
            const <int>[],
            const <int>[],
            const prefix0.LReflectAnnotation(),
            const []),
        r.MethodMirrorImpl(
            r'propertiesMap',
            35651602,
            1,
            -1,
            10,
            11,
            const <int>[6, 2],
            const <int>[],
            const prefix0.LReflectAnnotation(),
            const []),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 2, 41),
        r.ImplicitSetterMirrorImpl(const prefix0.LReflectAnnotation(), 2, 42),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 3, 43),
        r.ImplicitSetterMirrorImpl(const prefix0.LReflectAnnotation(), 3, 44),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 4, 45),
        r.ImplicitSetterMirrorImpl(const prefix0.LReflectAnnotation(), 4, 46),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 5, 47),
        r.ImplicitSetterMirrorImpl(const prefix0.LReflectAnnotation(), 5, 48),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 6, 49),
        r.ImplicitSetterMirrorImpl(const prefix0.LReflectAnnotation(), 6, 50),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 7, 51),
        r.ImplicitSetterMirrorImpl(const prefix0.LReflectAnnotation(), 7, 52),
        r.MethodMirrorImpl(
            r'',
            0,
            1,
            -1,
            1,
            1,
            const <int>[],
            const <int>[6, 7, 8, 9],
            const prefix0.LReflectAnnotation(),
            const []),
        r.MethodMirrorImpl(r'toString', 2097154, -1, -1, 6, 6, const <int>[],
            const <int>[], const prefix0.LReflectAnnotation(), const []),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 8, 55),
        r.ImplicitSetterMirrorImpl(const prefix0.LReflectAnnotation(), 8, 56),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 9, 57),
        r.ImplicitSetterMirrorImpl(const prefix0.LReflectAnnotation(), 9, 58),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 10, 59),
        r.ImplicitSetterMirrorImpl(const prefix0.LReflectAnnotation(), 10, 60),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 11, 61),
        r.ImplicitSetterMirrorImpl(const prefix0.LReflectAnnotation(), 11, 62),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 12, 63),
        r.ImplicitSetterMirrorImpl(const prefix0.LReflectAnnotation(), 12, 64),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 13, 65),
        r.ImplicitSetterMirrorImpl(const prefix0.LReflectAnnotation(), 13, 66),
        r.MethodMirrorImpl(
            r'',
            0,
            2,
            -1,
            2,
            2,
            const <int>[],
            const <int>[16, 17, 18, 19],
            const prefix0.LReflectAnnotation(),
            const []),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 14, 68),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 15, 69),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 16, 70),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 17, 71),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 18, 72),
        r.MethodMirrorImpl(r'', 192, 3, -1, 3, 3, const <int>[], const <int>[],
            const prefix0.LReflectAnnotation(), const []),
        r.MethodMirrorImpl(r'index', 2097155, -1, -1, 18, 18, const <int>[],
            const <int>[], const prefix0.LReflectAnnotation(), const []),
        r.MethodMirrorImpl(
            r'checkState',
            35651586,
            4,
            -1,
            20,
            21,
            const <int>[5],
            const <int>[],
            const prefix0.LReflectAnnotation(),
            const []),
        r.MethodMirrorImpl(
            r'fetch',
            35651586,
            4,
            -1,
            22,
            23,
            null,
            const <int>[26, 27, 28],
            const prefix0.LReflectAnnotation(),
            const []),
        r.MethodMirrorImpl(r'persist', 35651586, 4, -1, 24, 25, null,
            const <int>[29], const prefix0.LReflectAnnotation(), const []),
        r.MethodMirrorImpl(r'remove', 35651586, 4, -1, 24, 25, null,
            const <int>[30], const prefix0.LReflectAnnotation(), const []),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 19, 79),
        r.ImplicitSetterMirrorImpl(const prefix0.LReflectAnnotation(), 19, 80),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 20, 81),
        r.ImplicitSetterMirrorImpl(const prefix0.LReflectAnnotation(), 20, 82),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 21, 83),
        r.ImplicitSetterMirrorImpl(const prefix0.LReflectAnnotation(), 21, 84),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 22, 85),
        r.ImplicitSetterMirrorImpl(const prefix0.LReflectAnnotation(), 22, 86),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 23, 87),
        r.ImplicitSetterMirrorImpl(const prefix0.LReflectAnnotation(), 23, 88),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 24, 89),
        r.ImplicitSetterMirrorImpl(const prefix0.LReflectAnnotation(), 24, 90),
        r.MethodMirrorImpl(r'', 0, 4, -1, 26, 4, null, const <int>[31],
            const prefix0.LReflectAnnotation(), const []),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 25, 92),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 26, 93),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 27, 94),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 28, 95),
        r.ImplicitGetterMirrorImpl(const prefix0.LReflectAnnotation(), 29, 96),
        r.MethodMirrorImpl(r'', 192, 5, -1, 5, 5, const <int>[], const <int>[],
            const prefix0.LReflectAnnotation(), const [])
      ],
      <m.ParameterMirror>[
        r.ParameterMirrorImpl(
            r'id',
            134349830,
            35,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'title',
            67245062,
            35,
            const prefix0.LReflectAnnotation(),
            -1,
            7,
            7,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_id',
            134348902,
            32,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_title',
            67240038,
            34,
            const prefix0.LReflectAnnotation(),
            -1,
            7,
            7,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'other',
            134348806,
            36,
            const prefix0.LReflectAnnotation(),
            -1,
            27,
            27,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'invocation',
            134348806,
            37,
            const prefix0.LReflectAnnotation(),
            -1,
            28,
            28,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'url',
            134349830,
            53,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'href',
            134349830,
            53,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'attype',
            151127046,
            53,
            const prefix0.LReflectAnnotation(),
            -1,
            8,
            9,
            const <int>[6],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'properties',
            151127046,
            53,
            const prefix0.LReflectAnnotation(),
            -1,
            10,
            11,
            const <int>[6, 2],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_url',
            134348902,
            42,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_href',
            134348902,
            44,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_id',
            67240038,
            46,
            const prefix0.LReflectAnnotation(),
            -1,
            7,
            7,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_title',
            67240038,
            48,
            const prefix0.LReflectAnnotation(),
            -1,
            7,
            7,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_attype',
            151126118,
            50,
            const prefix0.LReflectAnnotation(),
            -1,
            8,
            9,
            const <int>[6],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_properties',
            151126118,
            52,
            const prefix0.LReflectAnnotation(),
            -1,
            10,
            11,
            const <int>[6, 2],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'href',
            134349830,
            67,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'title',
            134349830,
            67,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'type',
            134349830,
            67,
            const prefix0.LReflectAnnotation(),
            3,
            3,
            3,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'enums',
            151127046,
            67,
            const prefix0.LReflectAnnotation(),
            -1,
            8,
            9,
            const <int>[6],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_href',
            134348902,
            56,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_title',
            134348902,
            58,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_type',
            134348902,
            60,
            const prefix0.LReflectAnnotation(),
            3,
            3,
            3,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_attype',
            67240038,
            62,
            const prefix0.LReflectAnnotation(),
            -1,
            7,
            7,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_enums',
            151126118,
            64,
            const prefix0.LReflectAnnotation(),
            -1,
            8,
            9,
            const <int>[6],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_value',
            67240038,
            66,
            const prefix0.LReflectAnnotation(),
            -1,
            12,
            12,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'offset',
            134354950,
            76,
            const prefix0.LReflectAnnotation(),
            -1,
            18,
            18,
            const <int>[],
            const [],
            0,
            null),
        r.ParameterMirrorImpl(
            r'limit',
            134354950,
            76,
            const prefix0.LReflectAnnotation(),
            -1,
            18,
            18,
            const <int>[],
            const [],
            50,
            null),
        r.ParameterMirrorImpl(
            r'filter',
            67244038,
            76,
            const prefix0.LReflectAnnotation(),
            -1,
            7,
            7,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'record',
            134217734,
            77,
            const prefix0.LReflectAnnotation(),
            -1,
            -1,
            -1,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'record',
            134217734,
            78,
            const prefix0.LReflectAnnotation(),
            -1,
            -1,
            -1,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'webServer',
            134355974,
            91,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            "http://localhost:8080/api/",
            null),
        r.ParameterMirrorImpl(
            r'_state',
            134348902,
            80,
            const prefix0.LReflectAnnotation(),
            5,
            5,
            5,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_webServer',
            134348902,
            82,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_fetchCommand',
            134348902,
            84,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_stateCommand',
            134348902,
            86,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_persistCommand',
            134348902,
            88,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null),
        r.ParameterMirrorImpl(
            r'_removeCommand',
            134348902,
            90,
            const prefix0.LReflectAnnotation(),
            -1,
            6,
            6,
            const <int>[],
            const [],
            null,
            null)
      ],
      <Type>[
        prefix1.Thing,
        prefix1.TDevice,
        prefix1.TProperty,
        prefix1.TPropertyType,
        prefix2.LRepository,
        prefix2.LDataState,
        String,
        String,
        const m.TypeValue<List<String>>().type,
        List,
        const m.TypeValue<Map<String, prefix1.TProperty>>().type,
        Map,
        Object,
        const m.TypeValue<List<prefix1.TPropertyType>>().type,
        List,
        const m.TypeValue<List<prefix2.LDataState>>().type,
        List,
        bool,
        int,
        Type,
        const m.TypeValue<prefix3.Future<prefix2.LDataState>>().type,
        prefix3.Future,
        const r.FakeType(r'dart.async.Future<List<T>>'),
        prefix3.Future,
        const m.TypeValue<prefix3.Future<dynamic>>().type,
        prefix3.Future,
        const r.FakeType(r'.LRepository<T>'),
        Object,
        Invocation
      ],
      6,
      {
        r'==': (dynamic instance) => (x) => instance == x,
        r'toString': (dynamic instance) => instance.toString,
        r'noSuchMethod': (dynamic instance) => instance.noSuchMethod,
        r'hashCode': (dynamic instance) => instance.hashCode,
        r'runtimeType': (dynamic instance) => instance.runtimeType,
        r'id': (dynamic instance) => instance.id,
        r'title': (dynamic instance) => instance.title,
        r'url': (dynamic instance) => instance.url,
        r'href': (dynamic instance) => instance.href,
        r'attype': (dynamic instance) => instance.attype,
        r'properties': (dynamic instance) => instance.properties,
        r'type': (dynamic instance) => instance.type,
        r'enums': (dynamic instance) => instance.enums,
        r'value': (dynamic instance) => instance.value,
        r'index': (dynamic instance) => instance.index,
        r'checkState': (dynamic instance) => instance.checkState,
        r'fetch': (dynamic instance) => instance.fetch,
        r'persist': (dynamic instance) => instance.persist,
        r'remove': (dynamic instance) => instance.remove,
        r'state': (dynamic instance) => instance.state,
        r'webServer': (dynamic instance) => instance.webServer,
        r'fetchCommand': (dynamic instance) => instance.fetchCommand,
        r'stateCommand': (dynamic instance) => instance.stateCommand,
        r'persistCommand': (dynamic instance) => instance.persistCommand,
        r'removeCommand': (dynamic instance) => instance.removeCommand
      },
      {
        r'id=': (dynamic instance, value) => instance.id = value,
        r'title=': (dynamic instance, value) => instance.title = value,
        r'url=': (dynamic instance, value) => instance.url = value,
        r'href=': (dynamic instance, value) => instance.href = value,
        r'attype=': (dynamic instance, value) => instance.attype = value,
        r'properties=': (dynamic instance, value) =>
            instance.properties = value,
        r'type=': (dynamic instance, value) => instance.type = value,
        r'enums=': (dynamic instance, value) => instance.enums = value,
        r'value=': (dynamic instance, value) => instance.value = value,
        r'state=': (dynamic instance, value) => instance.state = value,
        r'webServer=': (dynamic instance, value) => instance.webServer = value,
        r'fetchCommand=': (dynamic instance, value) =>
            instance.fetchCommand = value,
        r'stateCommand=': (dynamic instance, value) =>
            instance.stateCommand = value,
        r'persistCommand=': (dynamic instance, value) =>
            instance.persistCommand = value,
        r'removeCommand=': (dynamic instance, value) =>
            instance.removeCommand = value
      },
      null,
      [])
};

final _memberSymbolMap = null;

void initializeReflectable() {
  r.data = _data;
  r.memberSymbolMap = _memberSymbolMap;
}
