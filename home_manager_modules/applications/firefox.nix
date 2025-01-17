{ lib, inputs, config, ... }:

{
  options = { firefox.enable = lib.mkEnableOption "enables firefox"; };

  config = lib.mkIf config.firefox.enable {
    programs.firefox = {
      enable = true;
      policies = {
        "DisableTelemetry" = true;
        "NewTabPage" = false;
        "DisableFirefoxStudies" = true;
        "DontCheckDefaultBrowser" = true;
        "DisablePocket" = true;
        "PopupBlocking" = true;
      };

      profiles.kuranes = {
        id = 0;
        bookmarks = lib.importJSON ./firefox/bookmarks.json;
        settings = {
          "identity.fxaccounts.enabled" = false;
          "dom.security.https_only_mode" = true;
          "browser.startup.homepage" = "https://duckduckgo.com";
          "browser.download.panel.shown" = true;
          "browser.search.defaultenginename" = "DuckDuckGo";
          "browser.search.order.1" = "DuckDuckGo";
          "browser.newtabpage.pinned" = "";
          "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned" =
            "";
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSearch" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.activity-stream.system.showSponsored" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "browser.cache.desk.enable" = false;
          "browser.aboutConfig.showWarning" = false;
          "widget.disable-workspace-management" = true;
          "privacy.trackingprotection.enabled" = true;
          "extensions.pocket.enabled" = false;
          "browser.bookmarks.addedImportButton" = false;
          "browser.migrate.bookmarks-file.enabled" = false;
        };
        search = {
          force = true;
          default = "DuckDuckGo";
          order = [ "DuckDuckGo" "Google" ];
          engines = {
            "Bing".metaData.hidden = true;
            "Amazon.com".metaData.hidden = true;
            "eBay".metaData.hidden = true;
            "Wikipedia (en)".metaData.hidden = true;
          };
        };
        extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
          ublock-origin
          sponsorblock
          decentraleyes
          noscript
        ];
      };
      profiles.work = {
        id = 1;
        bookmarks = lib.importJSON ./firefox/bookmarks_work.json;
        settings = {
          "identity.fxaccounts.enabled" = false;
          "dom.security.https_only_mode" = true;
          "browser.startup.homepage" = "https://duckduckgo.com";
          "browser.download.panel.shown" = true;
          "browser.search.defaultenginename" = "DuckDuckGo";
          "browser.search.order.1" = "DuckDuckGo";
          "browser.newtabpage.pinned" = "";
          "browser.newtabpage.activity-stream.improvesearch.topSiteSearchShortcuts.havePinned" =
            "";
          "browser.newtabpage.activity-stream.showSponsored" = false;
          "browser.newtabpage.activity-stream.showSearch" = false;
          "browser.newtabpage.activity-stream.showSponsoredTopSites" = false;
          "browser.newtabpage.activity-stream.system.showSponsored" = false;
          "browser.newtabpage.activity-stream.telemetry" = false;
          "browser.cache.desk.enable" = false;
          "browser.aboutConfig.showWarning" = false;
          "widget.disable-workspace-management" = true;
          "privacy.trackingprotection.enabled" = true;
          "extensions.pocket.enabled" = false;
          "browser.bookmarks.addedImportButton" = false;
          "browser.migrate.bookmarks-file.enabled" = false;
        };

        search = {
          force = true;
          default = "DuckDuckGo";
          order = [ "DuckDuckGo" "Google" ];
          engines = {
            "Bing".metaData.hidden = true;
            "Amazon.com".metaData.hidden = true;
            "eBay".metaData.hidden = true;
            "Wikipedia (en)".metaData.hidden = true;
          };
        };
        extensions = with inputs.firefox-addons.packages."x86_64-linux"; [
          ublock-origin
          sponsorblock
          decentraleyes
          noscript
        ];
      };
    };
  };
}
