# Xignite - riotjs and Streamdata.io demo

An event-driven app based on Riot (a React-like user interface micro-library) and Streamdata.io to turn Xignite API into a streaming API (http://streamdata.io/). For 
further reading, you can read the blog entry explanation at [streamdata blog]( http://streamdata.io/blog/realtime-event-driven-app-with-riot-xignite-and-streamdata-io).

## Steps

1- Create an account on Xignite https://www.xignite.com/ to get your Xignite Developer token that will let you call Xignite's APIs. Our demo uses XigniteGlobalCurrencies API. If you are using a Xignite trial account, please make sure that you have set appropriate permission for this API and that maximum hits limit have not been reached. See https://www.xignite.com/MyAccount/#/api/trials for more details.

2- Create an free account on streamdata.io https://portal.streamdata.io/#/register to get an App token.

3- Edit index.html and replace [YOUR_XIGNITE_TOKEN] and [YOUR_STREAMDATAIO_APP_TOKEN] with the corresponding keys.

4- Launch the app with your favorite server
  * the simplest way, if Python is installed on your machine, is the executing the command `python -m SimpleHTTPServer 8080` 
  * if you are an npm afficionados, you can use http-server
  
  ```
  npm install http-server
  node_modules/http-server/bin/http-server .
  ```  

5- Open your favorite browser (works with Chrome, Firefox, Safari, and IE 10+) at `http://localhost:8080`

