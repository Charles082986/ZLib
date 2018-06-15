ZLib.TimePicker = {
    new = function(self,AceGUI,oOptions,oCallbacks)
        if not AceGUI then AceGUI = LibStub("AceGUI-3.0"); end
        oOptions = self:__ValidateOptions(oOptions);
        oCallbacks = self:__ValidateCallbacks(oCallbacks);

    end,
    __ValidateOptions = function(self,oOptions)
        if oOptions  == nil then oOptions = {}; end
        if oOptions.MilitaryTime == nil then oOptions.MilitaryTime = false; end
        if not ZLib:IsTimevalid(oOptions.DefaultValue) then oOptions.DefaultValue = date("*t"); end
        return oOptions;
    end,
    __ValidateCallbacks = function(self,oCallbacks)
        if oCallbacks == nil then oCallbacks = {}; end
        if not oCallbacks.OnValueChanged then oCallbacks.OnValueChanged = ZLib.EmptyFunction; end
        return oCallbacks;
    end
};
ZLib.Controls.TimePicker = ZLib.TimePicker;
