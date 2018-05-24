ZLib.EditBox = {
    new = function(self,AceGUI,width,OnEnterPressed,defaultValue)
        if not AceGUI then AceGUI = LibStub("AceGUI-3.0"); end
        if not not defaultValue then defaultValue = ""; end
        local input = AceGUI:Create("EditBox");
        input:SetRelativeWidth(width);
        input:SetText(defaultValue);
        input:SetCallback("OnEnterPressed",OnEnterPressed);
        return input;
    end
};
ZLib.Controls["EditBox"] = ZLib.EditBox;
