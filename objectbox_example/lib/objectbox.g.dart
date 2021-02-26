// GENERATED CODE - DO NOT MODIFY BY HAND

// Currently loading model from "JSON" which always encodes with double quotes
// ignore_for_file: prefer_single_quotes

import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';
import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'Models/Word.dart';
import 'Models/ThemeWords.dart';

ModelDefinition getObjectBoxModel() {
  final model = ModelInfo.fromMap({
    "entities": [
      {
        "id": "2:1563426567342707021",
        "lastPropertyId": "2:3917263042737748949",
        "name": "ThemeWords",
        "properties": [
          {"id": "1:2108749214765119852", "name": "id", "type": 6, "flags": 1},
          {"id": "2:3917263042737748949", "name": "name", "type": 9}
        ],
        "relations": [],
        "backlinks": []
      },
      {
        "id": "3:9126585433488109095",
        "lastPropertyId": "6:8036402140679728775",
        "name": "Word",
        "properties": [
          {"id": "1:2701206202448723969", "name": "id", "type": 6, "flags": 1},
          {"id": "2:6019318246698606961", "name": "engValue", "type": 9},
          {"id": "3:8763352492482075257", "name": "rusValue", "type": 9},
          {"id": "4:1305068114717429134", "name": "descript", "type": 9},
          {"id": "5:3592302357319691855", "name": "theme", "type": 9},
          {"id": "6:8036402140679728775", "name": "favorit", "type": 1}
        ],
        "relations": [],
        "backlinks": []
      }
    ],
    "lastEntityId": "3:9126585433488109095",
    "lastIndexId": "0:0",
    "lastRelationId": "0:0",
    "lastSequenceId": "0:0",
    "modelVersion": 5
  }, check: false);

  final bindings = <Type, EntityDefinition>{};
  bindings[ThemeWords] = EntityDefinition<ThemeWords>(
      model: model.getEntityByUid(1563426567342707021),
      toOneRelations: (ThemeWords object) => [],
      toManyRelations: (ThemeWords object) => {},
      getId: (ThemeWords object) => object.id,
      setId: (ThemeWords object, int id) {
        object.id = id;
      },
      objectToFB: (ThemeWords object, fb.Builder fbb) {
        final offsetname =
            object.name == null ? null : fbb.writeString(object.name);
        fbb.startTable();
        fbb.addInt64(0, object.id ?? 0);
        fbb.addOffset(1, offsetname);
        fbb.finish(fbb.endTable());
        return object.id ?? 0;
      },
      objectFromFB: (Store store, Uint8List fbData) {
        final buffer = fb.BufferContext.fromBytes(fbData);
        final rootOffset = buffer.derefObject(0);

        final object = ThemeWords();
        object.id = fb.Int64Reader().vTableGet(buffer, rootOffset, 4);
        object.name = fb.StringReader().vTableGet(buffer, rootOffset, 6);
        return object;
      });
  bindings[Word] = EntityDefinition<Word>(
      model: model.getEntityByUid(9126585433488109095),
      toOneRelations: (Word object) => [],
      toManyRelations: (Word object) => {},
      getId: (Word object) => object.id,
      setId: (Word object, int id) {
        object.id = id;
      },
      objectToFB: (Word object, fb.Builder fbb) {
        final offsetengValue =
            object.engValue == null ? null : fbb.writeString(object.engValue);
        final offsetrusValue =
            object.rusValue == null ? null : fbb.writeString(object.rusValue);
        final offsetdescript =
            object.descript == null ? null : fbb.writeString(object.descript);
        final offsettheme =
            object.theme == null ? null : fbb.writeString(object.theme);
        fbb.startTable();
        fbb.addInt64(0, object.id ?? 0);
        fbb.addOffset(1, offsetengValue);
        fbb.addOffset(2, offsetrusValue);
        fbb.addOffset(3, offsetdescript);
        fbb.addOffset(4, offsettheme);
        fbb.addBool(5, object.favorit);
        fbb.finish(fbb.endTable());
        return object.id ?? 0;
      },
      objectFromFB: (Store store, Uint8List fbData) {
        final buffer = fb.BufferContext.fromBytes(fbData);
        final rootOffset = buffer.derefObject(0);

        final object = Word();
        object.id = fb.Int64Reader().vTableGet(buffer, rootOffset, 4);
        object.engValue = fb.StringReader().vTableGet(buffer, rootOffset, 6);
        object.rusValue = fb.StringReader().vTableGet(buffer, rootOffset, 8);
        object.descript = fb.StringReader().vTableGet(buffer, rootOffset, 10);
        object.theme = fb.StringReader().vTableGet(buffer, rootOffset, 12);
        object.favorit = fb.BoolReader().vTableGet(buffer, rootOffset, 14);
        return object;
      });

  return ModelDefinition(model, bindings);
}

class ThemeWords_ {
  static final id =
      QueryIntegerProperty(entityId: 2, propertyId: 1, obxType: 6);
  static final name =
      QueryStringProperty(entityId: 2, propertyId: 2, obxType: 9);
}

class Word_ {
  static final id =
      QueryIntegerProperty(entityId: 3, propertyId: 1, obxType: 6);
  static final engValue =
      QueryStringProperty(entityId: 3, propertyId: 2, obxType: 9);
  static final rusValue =
      QueryStringProperty(entityId: 3, propertyId: 3, obxType: 9);
  static final descript =
      QueryStringProperty(entityId: 3, propertyId: 4, obxType: 9);
  static final theme =
      QueryStringProperty(entityId: 3, propertyId: 5, obxType: 9);
  static final favorit =
      QueryBooleanProperty(entityId: 3, propertyId: 6, obxType: 1);
}
