import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_harf_ve_sayi_yarisi/oyun_harf_ve_sayi_yarisi.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(harfSayiConfig.title.length, 33);
    expect(harfSayiConfig.tagline.length, 33);
    for (final s in harfSayiConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(harfSayiConfig.gameId, harfSayiId);
    expect(harfSayiRules.gameId, harfSayiId);
  });

  test('bölümler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(harfSayiRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: harfSayiId, optionalMechanics: harfSayiRules.optionalMechanics);
    for (final l in ['tr', 'en']) {
      harfSayiRules.lang = l;
      for (final lv in [1, 77, 1500, 33333, 99999]) {
        expect(harfSayiRules.build(planner.spec(lv)).validation.ok, isTrue, reason: '$l bölüm $lv');
      }
    }
  });
}
