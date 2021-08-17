window["adrum-start-time"] = new Date().getTime();

// CONFIGURAÇÕES INICIAIS
(function (config) {
  config.adrumExtUrlHttp = "http://cdn.appdynamics.com";
  config.adrumExtUrlHttps = "https://cdn.appdynamics.com";

  config.appKey = "EUM-AAB-AUA";
  config.beaconUrlHttp =
    "http://labs-fhdumontcontroller-rqzqw02j.appd-cloudmachine.com:7001";
  config.beaconUrlHttps =
    "https://labs-fhdumontcontroller-rqzqw02j.appd-cloudmachine.com:7002";

  config.maxUrlLength = 512;
  config.xd = { enable: true };
  config.xhr = { maxPerPageView: "UNLIMITED" };
  config.channel = { bufferMode: false };

  config.spa = { spa2: true, clearResTiming: false };
  config.isZonePromise = true;
  config.angular = true;
})(window["adrum-config"] || (window["adrum-config"] = {}));

// CUSTOMIZAÇÕES LOADERS
(function (config) {
  let city = getCookie("location-city");
  let region = getCookie("location-region");
  let country = getCookie("location-country");
  let ipSource = getCookie("location-ipSource") || "192.168.1.100";

  if (city != undefined && region != undefined && country != undefined) {
    config.geo = {
      localIP: `${ipSource}`,
      city: `${city}`,
      region: `${region}`,
      country: `${country}`,
    };
  }
})(window["adrum-config"] || (window["adrum-config"] = {}));

function getCookie(cname) {
  let name = cname + "=";
  let decodedCookie = decodeURIComponent(document.cookie);
  let ca = decodedCookie.split(";");
  for (let i = 0; i < ca.length; i++) {
    let c = ca[i];
    while (c.charAt(0) == " ") {
      c = c.substring(1);
    }
    if (c.indexOf(name) == 0) {
      return c.substring(name.length, c.length);
    }
  }
  return "";
}

// CUSTOMIZAÇÕES EDITAL
(function (config) {
  (function (info) {
    info.PageView = appdCreatePageView;
  })(config.userEventInfo || (config.userEventInfo = {}));
})(window["adrum-config"] || (window["adrum-config"] = {}));

function appdCreatePageView() {
  let appdUserDataStr = {};

  // ITEM 4
  try {
    let userNameHTML = document.querySelector(".user-name");
    if (userNameHTML != undefined && userNameHTML != null) {
      userNameHTML = userNameHTML.innerText;
      appdUserDataStr["userNameHTML"] = userNameHTML;
    }
    console.log("=> userNameHTML:", userNameHTML);
  } catch (error) {
    console.error(error);
  }

  // ITEM 5 - META TAG
  try {
    // OUTROS EXEMPLOS
    // document.querySelector("meta[property='og:url']").getAttribute('content')
    // document.head.querySelector("[property~=video][content]").content;
    // document.querySelector('meta[name="description"]').content
    let meta = document.querySelector('meta[name="viewport"]');
    if (meta != undefined && meta != null && meta != "") {
      appdUserDataStr["metaViewport"] = meta.content;
    }
    console.log("=> metaViewport:", meta);
  } catch (error) {
    console.error(error);
  }

  // ITEM 5 - JAVASCRIPT VARIABLES
  try {
    let screenSize = window.screen.width + "x" + window.screen.height;
    appdUserDataStr["screenSize"] = screenSize;
    console.log("=> variableScreenSize:", screenSize);
  } catch (error) {
    console.error(error);
  }

  return {
    userData: appdUserDataStr,
  };
}

// AGENTE
document.write(
  '<script type="text/javascript" charset="UTF-8" src="//cdn.appdynamics.com/adrum/adrum-latest.js" ></script>'
);

// CAPTURA DE ERROS NO window.onerror
document.write("<script>ADRUM.listenForErrors();</script>");
