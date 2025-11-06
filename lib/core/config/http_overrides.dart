import 'dart:io';

import 'package:structure_mvvm/core/config/environment.dart';
import 'package:structure_mvvm/res/log/app_logger.dart';

/// Custom HTTP override class to handle SSL certificate validation.
/// This is primarily useful for development environments where you might
/// use self-signed or invalid certificates.
///
/// ⚠️ WARNING:
/// Never allow bad certificates in production environments —
/// this bypasses SSL verification and can expose users to MITM attacks.
class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    // Create the default HttpClient using the parent implementation.
    final client = super.createHttpClient(context);

    // ✅ Allow bad/self-signed certificates ONLY in local or development mode.
    // This helps when testing APIs on localhost or using self-signed SSL certs.
    if (Environment.config.envName == "LOCAL" ||
        Environment.config.envName == "STAGING") {
      client.badCertificateCallback =
          (X509Certificate cert, String host, int port) {
            // Returning `true` means "accept all certificates" (unsafe).
            // Use only for internal testing — DO NOT enable in production.
            return true;
          };

      // Log a message for debugging (optional, safe to remove later).
      AppLogger.info("⚠️ SSL certificate validation is disabled in dev mode!");
    }

    // Return the configured client.
    return client;
  }
}
