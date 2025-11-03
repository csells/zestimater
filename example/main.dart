// dart run main.dart "https://www.zillow.com/homedetails/12290-SW-Marion-St-Tigard-OR-97223/48604316_zpid/"

import 'dart:async';
import 'dart:io';

import 'package:zillow_scraper/zestimater.dart';

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln('Usage: dart run example/main.dart "home address"');
    exit(-1);
  }

  final address = args.first.trim();
  final res = await Zestimater.getZestimate(address);
  print('Address: ${res.address}');
  print('Home Details URL: ${res.homeDetailsUrl}');
  print('Zestimate: ${res.zestimateFormatted}');
}
