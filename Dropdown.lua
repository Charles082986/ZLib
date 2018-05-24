ZLib.Dropdown = {
    new = function(self,AceGUI,width,values,valuesOrder,OnValueChanged,defaultValue)
        if not AceGUI then AceGUI = LibStub("AceGUI-3.0"); end
        if not not defaultValue then defaultValue = valuesOrder[1]; end
        local dropdown = AceGUI:Create("Dropdown");
        dropdown:SetList(values,valuesOrder);
        dropdown:SetRelativeWidth(width);
        dropdown:SetValue(defaultValue);
        dropdown:SetCallback("OnValueChanged",OnValueChanged);
        return dropdown;
    end
};
ZLib.Controls["Dropdown"] = ZLib.Dropdown;