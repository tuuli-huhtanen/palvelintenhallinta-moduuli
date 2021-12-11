// This file can be used to configure global preferences for Firefox

// Tracking off
pref("privacy.trackingprotection.enabled", true);

// Asking to save psswds, autofill, suggestions and generation off
pref("signon.generation.enable", false);
pref("signon.rememberSignons", false);
pref("signon.autofillForms", false);

// Removing bookmark bar: "Import bookmarks..."
pref("browser.bookmarks.addedImportButton", false);

// Homepage DDG and new tabpage empty
pref("browser.startup.homepage", "https://duckduckgo.com");
pref("browser.newtabpage.enabled", false);
