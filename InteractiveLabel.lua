ZLib.InteractiveLabel = {
    new = function(self, AceGUI, width, text, OnClick, OnEnter, OnLeave)
        if not AceGUI then AceGUI = LibStub("AceGUI-3.0"); end
        local label = AceGUI:Create("InteractiveLabel");
        label:SetText(text);
        label:SetRelativeWidth(width);
        if not not OnClick then
            label:SetCallback("OnClick",OnClick);
        end
        if not not OnEnter then
            label:SetCallback("OnEnter",OnEnter);
        end
        if not not OnLeave then
            label:SetCallback("OnLeave",OnLeave);
        end
        return label;
    end
};
ZLib.Controls["InteractiveLabel"] = ZLib.InteractiveLabel;