/*
 * @Author: Tan Dong 
 * @Date: 2019-02-22 22:28:46 
 * @Last Modified by:   Tan Dong 
 * @Last Modified time: 2019-02-22 22:28:46 
 */
import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttersamples/utils/PageLocalizations.dart';

class GlobalPagesLocalizations
    extends LocalizationsDelegate<PageLocalizations> {
  const GlobalPagesLocalizations();

  @override
  bool isSupported(Locale locale) {
    return ['en', 'zh'].contains(locale.languageCode);
  }

  @override
  Future<PageLocalizations> load(Locale locale) {
    return new SynchronousFuture<PageLocalizations>(
        new PageLocalizations(locale));
  }

  @override
  bool shouldReload(LocalizationsDelegate<PageLocalizations> old) {
    return false;
  }

  static GlobalPagesLocalizations delegate = const GlobalPagesLocalizations();
}
