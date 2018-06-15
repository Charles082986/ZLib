ZLib.DateTimePicker = {
    new = function(self,AceGUI,dWidth,oOptions,oCallbacks)
        if not AceGUI then AceGUI = LibStub("AceGUI-3.0"); end
        oOptions = self:__ValidateOptions(oOptions);
        oCallbacks = self:__ValidateCallbacks(oCallbacks);
        local frame = AceGUI:Create("SimpleGroup");
        frame:SetRelativeWidth(dWidth);
        frame.__DateTime = oOptions.DefaultValue;
        local pickerWidth = 0.5;
        if oOptions.Multiline then pickerWidth = 1; end
        function frame.OnValueChanged(self,picker,dtObject,key,value,error)
            self.__DateTime[key] = dtObject[key];
            oCallbacks.OnValueChanged(self,picker,self.__DateTime,key,value,error);
        end
        frame:AddChild(ZLib.DatePicker:new(AceGUI,pickerWidth,oOptions,{ OnValueChanged = frame.OnValueChanged }));
        frame:AddChild(ZLib.TimePicker:new(AceGUI,pickerWidth,oOptions,{ OnValueChanged = frame.OnValueChanged }));
        frame.DatePicker = frame.children[1];
        frame.TimePicker = frame.children[2];
        function frame.GetValue(self) return self.__DateTime() end
        function frame.SetValue(self,value)
            self.DatePicker:SetValue(value);
            self.TimePicker:SetValue(value);
        end
    end,
    __ValidateOptions = function(self,oOptions)
        if not oOptions then oOptions = {}; end
        if not oOptions.Multiline then oOptions.Multiline = false; end
        if not ZLib:IsDateTimeValid(oOptions.DefaultValue) then oOptions.DefaultValue = date("*t"); end
        return oOptions;
    end,
    __ValidateCallbacks = function(self,oCallbacks)
        if not oCallbacks then oCallbacks = {}; end
        if not oCallbacks.OnValueChanged then oCallbacks.OnVlaueChanged = function() end end;
    end
};
ZLib.Controls["DateTimePicker"] = ZLib.DateTimePicker;
