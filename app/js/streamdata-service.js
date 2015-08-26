'use strict';

function Streamdata(xigniteURL, streamdataAppToken, currency) {
  var data = [];
  var eventSource = streamdataio.createEventSource(xigniteURL, streamdataAppToken);

  eventSource.onOpen(function() {
    data = [];
    bus.trigger('connectionOpenEvent');
  }).onData(function(snapshot) {
    data = snapshot;
    bus.trigger(currency, data);

  }).onPatch(function(patches) {
    jsonpatch.apply(data, patches);
    bus.trigger(currency, data);

  }).onError(function(error) {
    console.error(error);
    bus.trigger('errorQuoteEvent', error);
    eventSource.close();
  });

  return eventSource;
}

function StreamdataService(streamdataAppToken, xigniteToken, bus) {
  var eventSources = {};

  function fetchJson(currency) {
    var xigniteURL = "https://globalcurrencies.xignite.com/xGlobalCurrencies.json/GetRealTimeRate";
    //Build URL with proper params
    xigniteURL = xigniteURL + "?Symbol=" + currency + "&_token=" + xigniteToken;
    
    var eventSource = new Streamdata(xigniteURL, streamdataAppToken, currency);

    eventSources[currency] = eventSource;

    eventSource.open();
  }

  function stopFetchJson(currency) {
    eventSources[currency].close();
  }

  return {
    fetchJson: fetchJson,
    stopFetchJson: stopFetchJson
  }
}