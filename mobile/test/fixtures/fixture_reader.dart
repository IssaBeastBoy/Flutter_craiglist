import 'dart:io';

String fixture(String fileLocation) =>
    File("test/fixtures/$fileLocation").readAsStringSync();
