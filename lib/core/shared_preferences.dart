import 'package:matrix/core/constants/enums/role_enum_type.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppPreferences {
  static const String _roleKey = "user_role";

  /// Save Role
  static Future<void> setRole(RoleEnumType role) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_roleKey, role.name); // store enum as string
  }

  /// Get Role
  static Future<RoleEnumType?> getRole() async {
    final prefs = await SharedPreferences.getInstance();
    String? roleString = prefs.getString(_roleKey);

    if (roleString == null) return null;

    return RoleEnumType.values.firstWhere(
      (e) => e.name == roleString,
      orElse: () => RoleEnumType.parent, // default fallback
    );
  }

  /// Clear Role (optional)
  static Future<void> clearRole() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_roleKey);
  }
}
