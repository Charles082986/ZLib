ZLib.Heading = {
    new = function(self,AceGUI,width,text)
        if not AceGUI then AceGUI = LibStub("AceGUI-3.0"); end
        local heading = AceGUI:Create("Heading");
        ZLM:Debug("Heading " .. text,1);
        heading:SetText(text);
        heading:SetFullWidth(true);
        return heading;
    end
};
ZLib.Controls["Heading"] = ZLib.Heading;