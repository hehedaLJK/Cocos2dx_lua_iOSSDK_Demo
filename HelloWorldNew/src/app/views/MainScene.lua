local MainScene      = class("MainScene", cc.load("mvc").ViewBase)
local Cocos2dxiOSLuaSDK = require("app.models.Cocos2dxiOSLuaSDK")

function MainScene:onCreate()

    --此处只声明了，未调用，调用由OC进行
    local function wakeUpCallBack(result)
        cc.Label:createWithSystemFont("OC拉起lua回调，回传内容:"..result, "Arial", 40)
            :move(display.cx, display.cy - 100)
            :addTo(self)
    end

    local button1 = cc.MenuItemImage:create("PlayButton.png", "PlayButton.png")
        :onClicked(function()
            local productId = "1234567890"
            Cocos2dxiOSLuaSDK:showDetailPageWithProductId(productId, wakeUpCallBack)
        end)
    local button2 = cc.MenuItemImage:create("start.png", "start.png")
        :onClicked(function()
            Cocos2dxiOSLuaSDK:showDetailPage()
        end)
    cc.Menu:create(button1)
        :move(display.cx, display.cy + 100)
        :addTo(self)

    cc.Menu:create(button2)
        :move(display.cx, display.cy + 200)
        :addTo(self)
end

return MainScene
