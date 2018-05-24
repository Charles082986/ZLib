ZLib.CheckBox = {
    new = function(self,AceGUI,width,callback,defaultValue)
        if not AceGUI then AceGUI = LibStub("AceGUI-3.0"); end
        if not not defaultValue then defaultValue = false; end
        local toggle = AceGUI:Create("CheckBox");
        toggle:SetRelativeWidth(width);
        toggle:SetValue(defaultValue);
        toggle:SetCallback("OnValueChanged",callback);
        return toggle;
    end
};
ZLib.Controls["CheckBox"] = ZLib.CheckBox;