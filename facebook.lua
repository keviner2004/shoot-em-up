local facebook = require( "plugin.facebook.v4" )
local logger = require("logger")
local json = require("json")
local TAG = "facebook"
local FB = {}

FB.STATUS_LOGIN = "login"
FB.STATUS_LOGIN_FAILED = "loginFailed"
FB.STATUS_LOGIN_CANCELLED = "loginCancelled"
FB.STATUS_LOGOUT = "logout"

local loginCallBacks = {}
local requestCallBacks = {}

local function facebookListener(event)
  logger:info(TAG, "=============Receive fb event: ")
  logger:info(TAG, "=============Type: %s, phase: %s, response: %s", event.type or "", event.phase or "", event.response or "")
  if ( "session" == event.type ) then
    -- Handle login event
    if event.phase == FB.STATUS_LOGIN then
    elseif event.phase == FB.STATUS_LOGIN_FAILED then
    elseif event.phase == FB.STATUS_LOGIN_CANCELLED then
    elseif event.phase == FB.STATUS_LOGOUT then
    end
    if #loginCallBacks > 0 then
      local onComplete = loginCallBacks[1]
      table.remove( loginCallBacks, 1)
      onComplete(event.phase)
    end
  elseif ( "request" == event.type) then
    if #requestCallBacks > 0 then
      local onComplete = requestCallBacks[1]
      local decoded, pos, msg = json.decode(event.response)
      if not decoded then
        logger:error(TAG, "Decode failed at "..tostring(pos)..": "..tostring(msg) )
      end
      onComplete(deceded)
      table.remove( requestCallBacks, 1)
    else
      logger:info(TAG, "no callback found...")
    end
  elseif ( "dialog" == event.type ) then
      -- Dialog closed
  end
end

--set global callback
facebook.setFBConnectListener( facebookListener )

FB.login = function(onComplete)
  local accessToken = facebook.getCurrentAccessToken()
  if ( accessToken ) then
    logger:info(TAG, "Facebook user already logged in, User's access token: " .. accessToken.token )
    return onComplete(FB.STATUS_LOGIN)
  end
  if onComplete then
    loginCallBacks[#loginCallBacks+1] = onComplete
  end
  if system.getInfo( "environment" ) == "simulator" then
    local webView = native.newWebView( 0, 0, 320, 480 )
    local function webListener( event )
        if event.url then
            print( "You are visiting: " .. event.url )
            if string.find(event.url, "login_success") > 0 then
              webView:removeSelf()
              return
            end
        end

        if event.type then
            print( "The event.type is " .. event.type ) -- print the type of request
        end

        if event.errorCode then
            native.showAlert( "Error!", event.errorMessage, { "OK" } )
        end
    end
    webView:addEventListener( "urlRequest", webListener )
    webView:request( "https://www.facebook.com/dialog/oauth?client_id=119131358540933&redirect_uri=https://www.facebook.com/connect/login_success.html" )
  else
    --facebook.login(facebookListener)
    facebook.login()
  end
end

FB.logout = function(onComplete)
  if onComplete then
    loginCallBacks[#loginCallBacks+1] = onComplete
  end
  facebook.logout()
end

FB.getUserInfo = function(onComplete)
  local accessToken = facebook.getCurrentAccessToken()
  if not accessToken then
    logger:error(TAG, "Login first")
    return
  end
  requestCallBacks[#requestCallBacks+1] = onComplete
  facebook.request("me", "GET", {
    access_token = accessToken.token
  })
end

FB.getCurrentAccessToken = function()
  local accessToken = facebook.getCurrentAccessToken()
  return accessToken
end

FB.share = function()
  print("Share fb")
  --local shareParams = {
  --    link = "https://play.google.com/store/apps/details?id=com.nkfust.space_shooter",
  --    title = "SpaceShooter"
  --}
  --facebook.showDialog( "link", shareParams )
  local shareParams = {
      link = "https://play.google.com/store/apps/details?id=com.nkfust.space_shooter",
      title = "SpaceShooter",
      --picture = "https://play.google.com/store/apps/details?id=com.nkfust.space_shooter",
      description = "Share this game!"

  }
  facebook.showDialog( "link", shareParams )

end

return FB
