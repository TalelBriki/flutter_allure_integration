// flutter_test_config.dart
import 'dart:async';
import 'package:alchemist/alchemist.dart';
import 'package:alchemist_test_reporter/alchemist_test_reporter.dart';
import 'package:allure_report/allure_report.dart';

Future<void> testExecutable(FutureOr<void> Function() testMain) {
  const isRunningInCi = bool.fromEnvironment('CI', defaultValue: false);

  // Wrap the golden test runner so that diffs are reported as Allure attachments
  goldenTestRunner = GoldenTestRunnerWithReports(
    inner: goldenTestRunner,
    onAttachmentCreated: Allure.diff, // Attach diffs to Allure
  );

  return AlchemistConfig.runWithConfig(
    config: AlchemistConfig(
      platformGoldensConfig: PlatformGoldensConfig(
        platforms: {HostPlatform.current()},
        enabled: !isRunningInCi, // Disable goldens in CI if needed
      ),
    ),
    run: () async {
      await testMain();
    },
  );
}