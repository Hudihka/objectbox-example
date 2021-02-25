// GENERATED CODE - DO NOT MODIFY BY HAND

// Currently loading model from "JSON" which always encodes with double quotes
// ignore_for_file: prefer_single_quotes

import 'dart:typed_data';

import 'package:objectbox/objectbox.dart';
import 'package:objectbox/flatbuffers/flat_buffers.dart' as fb;
export 'package:objectbox/objectbox.dart'; // so that callers only have to import this file
import 'package:objectbox/internal.dart'; // generated code can access "internal" functionality
import 'Models/User.dart';

ModelDefinition getObjectBoxModel() {
  final model = ModelInfo.fromMap({
    "entities": [
      {
        "id": "1:1832078332004714090",
        "lastPropertyId": "4:8630611726086961990",
        "name": "User",
        "properties": [
          {"id": "1:68379167268536772", "name": "id", "type": 6, "flags": 1},
          {"id": "2:3649932714180222825", "name": "name", "type": 9},
          {"id": "3:5415255559237254566", "name": "phone", "type": 9},
          {"id": "4:8630611726086961990", "name": "email", "type": 9}
        ],
        "relations": [],
        "backlinks": []
      }
    ],
    "lastEntityId": "1:1832078332004714090",
    "lastIndexId": "0:0",
    "lastRelationId": "0:0",
    "lastSequenceId": "0:0",
    "modelVersion": 5
  }, check: false);

  final bindings = <Type, EntityDefinition>{};
  bindings[User] = EntityDefinition<User>(
      model: model.getEntityByUid(1832078332004714090),
      toOneRelations: (User object) => [],
      toManyRelations: (User object) => {},
      getId: (User object) => object.id,
      setId: (User object, int id) {
        object.id = id;
      },
      objectToFB: (User object, fb.Builder fbb) {
        final offsetname =
            object.name == null ? null : fbb.writeString(object.name);
        final offsetphone =
            object.phone == null ? null : fbb.writeString(object.phone);
        final offsetemail =
            object.email == null ? null : fbb.writeString(object.email);
        fbb.startTable();
        fbb.addInt64(0, object.id ?? 0);
        fbb.addOffset(1, offsetname);
        fbb.addOffset(2, offsetphone);
        fbb.addOffset(3, offsetemail);
        fbb.finish(fbb.endTable());
        return object.id ?? 0;
      },
      objectFromFB: (Store store, Uint8List fbData) {
        final buffer = fb.BufferContext.fromBytes(fbData);
        final rootOffset = buffer.derefObject(0);

        final object = User();
        object.id = fb.Int64Reader().vTableGet(buffer, rootOffset, 4);
        object.name = fb.StringReader().vTableGet(buffer, rootOffset, 6);
        object.phone = fb.StringReader().vTableGet(buffer, rootOffset, 8);
        object.email = fb.StringReader().vTableGet(buffer, rootOffset, 10);
        return object;
      });

  return ModelDefinition(model, bindings);
}

class User_ {
  static final id =
      QueryIntegerProperty(entityId: 1, propertyId: 1, obxType: 6);
  static final name =
      QueryStringProperty(entityId: 1, propertyId: 2, obxType: 9);
  static final phone =
      QueryStringProperty(entityId: 1, propertyId: 3, obxType: 9);
  static final email =
      QueryStringProperty(entityId: 1, propertyId: 4, obxType: 9);
}
