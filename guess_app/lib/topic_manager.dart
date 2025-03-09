import 'package:flutter/material.dart';
import 'package:guess_app/db_service.dart';

class TopicManager extends ChangeNotifier {
  final DBService _service;

  TopicManager(this._service) {
    print("INIT TopicManager");
  }

  summary() {
    return "HEJ";
  }
}
