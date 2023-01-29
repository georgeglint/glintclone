// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return prefer_self_in_static_references

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {
  /// Localizable.strings
  ///   GlintTest
  /// 
  ///   Created by George Leadbeater on 24/01/2023.
  internal static let aBuyOrSell = L10n.tr("Localizable", "a_buy_or_sell", fallback: "Buy or sell")
  /// Card
  internal static let aCard = L10n.tr("Localizable", "a_card", fallback: "Card")
  /// Currencies
  internal static let aCurrencies = L10n.tr("Localizable", "a_currencies", fallback: "Currencies")
  /// Glint it!
  internal static let aGlintIt = L10n.tr("Localizable", "a_glint_it", fallback: "Glint it!")
  /// Help
  internal static let aHelp = L10n.tr("Localizable", "a_help", fallback: "Help")
  /// Markets
  internal static let aMarkets = L10n.tr("Localizable", "a_markets", fallback: "Markets")
  /// Profile
  internal static let aProfile = L10n.tr("Localizable", "a_profile", fallback: "Profile")
  /// Top up
  internal static let aTopUp = L10n.tr("Localizable", "a_top_up", fallback: "Top up")
  /// Currencies
  internal static let dCurrencies = L10n.tr("Localizable", "d_currencies", fallback: "Currencies")
  /// I hope this Glint clone demonstrates my attention to detail, that I deliver quickly and that I will always go the extra mile.
  /// 
  /// I would look forward to the opportunity to work with you and thank you for considering me!
  /// 
  /// George
  internal static let dThankYouDescription = L10n.tr("Localizable", "d_thank_you_description", fallback: "I hope this Glint clone demonstrates my attention to detail, that I deliver quickly and that I will always go the extra mile.\n\nI would look forward to the opportunity to work with you and thank you for considering me!\n\nGeorge")
  /// Thank you
  internal static let dThankYouTitle = L10n.tr("Localizable", "d_thank_you_title", fallback: "Thank you")
  /// To start using your Glint account, please verify your ID
  internal static let dVerifyIdDescription = L10n.tr("Localizable", "d_verify_id_description", fallback: "To start using your Glint account, please verify your ID")
  /// Verify ID
  internal static let dVerifyIdTitle = L10n.tr("Localizable", "d_verify_id_title", fallback: "Verify ID")
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg..., fallback value: String) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: value, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle: Bundle = {
    #if SWIFT_PACKAGE
    return Bundle.module
    #else
    return Bundle(for: BundleToken.self)
    #endif
  }()
}
// swiftlint:enable convenience_type
