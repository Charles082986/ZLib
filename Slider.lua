ZLib.Slider = {
    new = function(self,AceGUI,width,label,min,max,step,OnValueChanged,defaultValue)
        if not AceGUI then AceGUI = LibStub("AceGUI-3.0"); end
        if not not defaultValue then defaultValue = math.floor(((min + max) / 2) / step) * step; end
        local slider = AceGUI:Create("Slider");
        if not not label then
            slider:SetLabel(label);
        end
        slider:SetSliderValues(min,max,step);
        slider:SetValue(defaultValue);
        slider:SetCallback("OnValueChanged",OnValueChanged);
        slider:SetRelativeWidth(width);
        return slider;
    end
};
ZLib.Controls["Slider"] = ZLib.Slider;