ZLib.EditBox = {
    new = function(self,AceGUI,dWidth,sDefaultValue,oCallbacks)
        if not AceGUI then AceGUI = LibStub("AceGUI-3.0"); end
        if not sDefaultValue then sDefaultValue = ""; end
        oCallbacks = self:__ValidateCallbacks(oCallbacks);
        local input = AceGUI:Create("EditBox");
        input:SetRelativeWidth(dWidth);
        input:SetText(sDefaultValue);
        input:SetCallback("OnEnterPressed",oCallbacks.OnEnterPressed);
        return input;
    end,
    __ValidateCallbacks = function(self,oCallbacks)
        if not oCallbacks then oCallbacks = {}; end
        if not oCallbacks.OnEnterPressed then oCallbacks.OnEnterPressed = function() end end
        return oCallbacks;
    end
};
ZLib.Controls["EditBox"] = ZLib.EditBox;
