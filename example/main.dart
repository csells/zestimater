// dart run zillow_scraper.dart "https://www.zillow.com/homedetails/12290-SW-Marion-St-Tigard-OR-97223/48604316_zpid/"

import 'dart:async';
import 'dart:convert';
import 'dart:io';

import 'package:zillow_scraper/zillow_scraper.dart';

Future<void> main(List<String> args) async {
  if (args.isEmpty) {
    stderr.writeln(
      'Usage: dart run zillow_scraper.dart "<zillow home details url>"',
    );
    exit(64);
  }
  final url = args.first.trim();
  try {
    final res = await scrapeZillow(url);
    if (res == null) {
      stderr.writeln('Failed to extract data. (Blocked? Structure changed?)');
      exit(1);
    }
    print(
      jsonEncode({
        'address': res.address,
        'zestimate': res.zestimate,
        'zestimate_formatted': res.zestimateFormatted,
      }),
    );
  } catch (e, st) {
    stderr.writeln('Error: $e');
    stderr.writeln(st);
    exit(1);
  }
}
