ZLib.Button = {
    new = function(self,AceGUI,width,text,func)
        if not AceGUI then AceGUI = LibStub("AceGUI-3.0"); end
        if not width then width = 1; end
        local button = AceGUI:Create("Button");
        button:SetText(text);
        button:SetCallback("OnClick",func);
        button:SetRelativeWidth(width);
        return button;
    end
};
ZLib.Controls["Button"] = ZLib.Button;
