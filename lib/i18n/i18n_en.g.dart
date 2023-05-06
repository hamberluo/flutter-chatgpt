part of 'i18n.g.dart';

// Path: <root>
class I18nEn implements BaseTranslations<AppLocale, I18nEn> {

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	I18nEn.build({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  );

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, I18nEn> $meta;

	late final I18nEn _root = this; // ignore: unused_field

	// Translations
	late final I18nHomeEn home = I18nHomeEn._(_root);
	late final I18nChatEn chat = I18nChatEn._(_root);
	late final I18nGeneralEn general = I18nGeneralEn._(_root);
	late final I18nApiKeyEn apiKey = I18nApiKeyEn._(_root);
	late final I18nSettingEn setting = I18nSettingEn._(_root);
}

// Path: home
class I18nHomeEn {
	I18nHomeEn._(this._root);

	final I18nEn _root; // ignore: unused_field

	// Translations
	String get hello => 'Hello 👋';
	String get guide => 'I’m Cogni.\nAs an AI language model, I can perform various tasks such as answering questions, generating text, translating languages, summarizing text, and more.';
	String get inputHint => 'Type a message...';
	String get styleCreative => 'Creative';
	String get styleBalance => 'Balance';
	String get stylePrecise => 'Precise';
	String get prompt1 => 'Explain quantum computing in simple terms';
	String get prompt2 => 'Got any creative ideas for a 10 year old\'s birthday?';
	String get prompt3 => 'How do I make an HTTP request in Javascript?';
}

// Path: chat
class I18nChatEn {
	I18nChatEn._(this._root);

	final I18nEn _root; // ignore: unused_field

	// Translations
	String get title => 'Chat';
	String get inputHint => 'Type your message here...';
	String get regenerate => 'Regenerate Response';
}

// Path: general
class I18nGeneralEn {
	I18nGeneralEn._(this._root);

	final I18nEn _root; // ignore: unused_field

	// Translations
	String get appName => 'Cogni Chat';
	String get ok => 'OK';
	String get cancel => 'Cancel';
	String get save => 'Save';
}

// Path: apiKey
class I18nApiKeyEn {
	I18nApiKeyEn._(this._root);

	final I18nEn _root; // ignore: unused_field

	// Translations
	String get title => 'Enter API Key';
	String get hint => 'API Key';
}

// Path: setting
class I18nSettingEn {
	I18nSettingEn._(this._root);

	final I18nEn _root; // ignore: unused_field

	// Translations
	String get apiKey => 'API Key';
	String get language => 'Language';
	String get about => 'About';
}
