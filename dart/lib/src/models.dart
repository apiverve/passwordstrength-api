/// Response models for the Password Strength API.

/// API Response wrapper.
class PasswordstrengthResponse {
  final String status;
  final dynamic error;
  final PasswordstrengthData? data;

  /// Set only when the current plan locks one or more fields; null otherwise.
  final PremiumInfo? premium;

  PasswordstrengthResponse({
    required this.status,
    this.error,
    this.data,
    this.premium,
  });

  factory PasswordstrengthResponse.fromJson(Map<String, dynamic> json) => PasswordstrengthResponse(
    status: json['status'] as String? ?? '',
    error: json['error'],
    data: json['data'] != null ? PasswordstrengthData.fromJson(json['data']) : null,
    premium: json['premium'] != null ? PremiumInfo.fromJson(json['premium']) : null,
  );

  Map<String, dynamic> toJson() => {
    'status': status,
    if (error != null) 'error': error,
    if (data != null) 'data': data,
    if (premium != null) 'premium': premium!.toJson(),
  };
}

/// Describes fields the current plan does not unlock. Locked fields arrive as null
/// in [data], and [lockedFields] names them (nested ones use dot paths).
class PremiumInfo {
  final String? message;
  final String? upgradeUrl;
  final List<String>? lockedFields;

  PremiumInfo({this.message, this.upgradeUrl, this.lockedFields});

  factory PremiumInfo.fromJson(Map<String, dynamic> json) => PremiumInfo(
    message: json['message'] as String?,
    upgradeUrl: json['upgrade_url'] as String?,
    lockedFields: (json['locked_fields'] as List?)?.map((e) => e.toString()).toList(),
  );

  Map<String, dynamic> toJson() => {
    if (message != null) 'message': message,
    if (upgradeUrl != null) 'upgrade_url': upgradeUrl,
    if (lockedFields != null) 'locked_fields': lockedFields,
  };
}

/// Response data for the Password Strength API.

class PasswordstrengthData {
  String? strength;
  num? score;
  PasswordstrengthDataPasswordinfo? passwordInfo;
  List<String>? recommendations;
  num? entropyBits;

  PasswordstrengthData({
    this.strength,
    this.score,
    this.passwordInfo,
    this.recommendations,
    this.entropyBits,
  });

  factory PasswordstrengthData.fromJson(Map<String, dynamic> json) => PasswordstrengthData(
      strength: json['strength'],
      score: json['score'],
      passwordInfo: json['passwordInfo'] != null ? PasswordstrengthDataPasswordinfo.fromJson(json['passwordInfo']) : null,
      recommendations: (json['recommendations'] as List?)?.cast<String>(),
      entropyBits: json['entropyBits'],
    );
}

class PasswordstrengthDataPasswordinfo {
  num? length;
  bool? hasSpecialCharacters;
  bool? hasNumbers;
  bool? hasLowercase;
  bool? hasUppercase;
  bool? hasSpaces;
  bool? hasSequentialChars;
  bool? hasRepeatedChars;

  PasswordstrengthDataPasswordinfo({
    this.length,
    this.hasSpecialCharacters,
    this.hasNumbers,
    this.hasLowercase,
    this.hasUppercase,
    this.hasSpaces,
    this.hasSequentialChars,
    this.hasRepeatedChars,
  });

  factory PasswordstrengthDataPasswordinfo.fromJson(Map<String, dynamic> json) => PasswordstrengthDataPasswordinfo(
      length: json['length'],
      hasSpecialCharacters: json['hasSpecialCharacters'],
      hasNumbers: json['hasNumbers'],
      hasLowercase: json['hasLowercase'],
      hasUppercase: json['hasUppercase'],
      hasSpaces: json['hasSpaces'],
      hasSequentialChars: json['hasSequentialChars'],
      hasRepeatedChars: json['hasRepeatedChars'],
    );
}

class PasswordstrengthRequest {
  String password;

  PasswordstrengthRequest({
    required this.password,
  });

  Map<String, dynamic> toJson() => {
      'password': password,
    };
}
