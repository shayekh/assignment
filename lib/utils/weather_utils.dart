import 'package:intl/intl.dart';

String getFormattedDate(int dt, String format) =>
    DateFormat(format).format(DateTime.fromMillisecondsSinceEpoch(dt * 1000));
