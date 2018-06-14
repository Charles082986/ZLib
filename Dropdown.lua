ZLib.Dropdown = {
    new = function(self,AceGUI,dWidth,oOptions,oCallbacks)
        if not AceGUI then AceGUI = LibStub("AceGUI-3.0"); end
        oCallbacks = self:__ValidateCallbacks(oCallbacks);
        oOptions = self:__ValidateOptions(oOptions);
        local dropdown = AceGUI:Create("Dropdown");
        dropdown:SetList(oOptions.Values,oOptions.ValuesOrder);
        dropdown:SetRelativeWidth(dWidth);
        dropdown:SetValue(oOptions.DefaultValue);
        dropdown:SetCallback("OnValueChanged",oCallbacks.OnValueChanged);
        if oCallbacks.OnEnter then dropdown:SetCallback("OnEnter",oCallbacks.OnEnter); end
        if oCallbacks.OnLEave then dropdown:SetCallback("OnLeave",oCallbacks.OnLeave); end
        return dropdown;
    end,
    __ValidateCallbacks = function(oCallbacks)
        if not oCallbacks then oCallbacks = {}; end
        if not oCallbacks.OnValueChanged then oCallbacks.OnValueChanged = ZLib.EmptyFunction; end
        return oCallbacks;
    end,
    __ValidateOptions = function(oOptions)
        if not oOptions then oOptions = {}; end
        if not oOptions.Values then
            oOptions.Values = {};
            for i = 1,10 do
                oOptions[i] = i;
            end
        end
        if not oOptions.ValuesOrder then
            oOptions.ValuesOrder = {};
            for k,v in oOptions.Values do
                tinsert(oOptions.ValuesOrder,k);
            end
        end
        if not oOptions.DefaultValue then oOptions.DefaultValue = oOptions.ValuesOrder[1]; end
    end
};
ZLib.Controls["Dropdown"] = ZLib.Dropdown;