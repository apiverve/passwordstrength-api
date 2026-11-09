# Password Strength API - Dart/Flutter Client

Password Strength is a password strength checker API that scores how strong a password is. It returns a strength label and score, a breakdown of the character types used, weak-pattern detection, theoretical entropy in bits, and recommendations to improve it.

[![pub package](https://img.shields.io/pub/v/apiverve_passwordstrength.svg)](https://pub.dev/packages/apiverve_passwordstrength)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)

This is the Dart/Flutter client for the [Password Strength API](https://apiverve.com/marketplace/passwordstrength?utm_source=dart&utm_medium=referral&utm_content=readme).

## Installation

Add this to your `pubspec.yaml`:

```yaml
dependencies:
  apiverve_passwordstrength: ^1.2.5
```

Then run:

```bash
dart pub get
# or for Flutter
flutter pub get
```

## Usage

```dart
import 'package:apiverve_passwordstrength/apiverve_passwordstrength.dart';

void main() async {
  final client = PasswordstrengthClient('YOUR_API_KEY');

  try {
    final response = await client.execute({
      'password': 'Password123'
    });

    print('Status: ${response.status}');
    print('Data: ${response.data}');
  } catch (e) {
    print('Error: $e');
  }
}
```

## Response

```json
{
  "status": "ok",
  "error": null,
  "data": {
    "strength": "weak",
    "score": 1,
    "passwordInfo": {
      "length": 11,
      "hasSpecialCharacters": false,
      "hasNumbers": true,
      "hasLowercase": true,
      "hasUppercase": true,
      "hasSpaces": false,
      "hasSequentialChars": true,
      "hasRepeatedChars": false
    },
    "recommendations": [
      "Use at least 12 characters",
      "Add special characters",
      "Avoid sequential characters (e.g. abc, 123)"
    ],
    "entropyBits": 65.5
  }
}
```

## API Reference

- **API Home:** [Password Strength API](https://apiverve.com/marketplace/passwordstrength?utm_source=dart&utm_medium=referral&utm_content=readme)
- **Documentation:** [docs.apiverve.com/ref/passwordstrength](https://docs.apiverve.com/ref/passwordstrength?utm_source=dart&utm_medium=referral&utm_content=readme)

## Authentication

All requests require an API key. Get yours at [apiverve.com](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme).

## License

MIT License - see [LICENSE](LICENSE) for details.

---

Built with Dart for [APIVerve](https://apiverve.com?utm_source=dart&utm_medium=referral&utm_content=readme)
