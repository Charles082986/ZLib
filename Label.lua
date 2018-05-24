ZLib.Label = {
    new = function(self,AceGUI,width,text)
        if not AceGUI then AceGUI = LibStub("AceGUI-3.0"); end
        local label = AceGUI:Create("Label");
        label:SetText(text);
        label:SetRelativeWidth(width);
        return label;
    end
};
ZLib.Controls["Label"] = ZLib.Label;