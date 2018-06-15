ZLib.TimePicker = {
    new = function(self,AceGUI,dWidth,oOptions,oCallbacks)
        if not AceGUI then AceGUI = LibStub("AceGUI-3.0"); end
        oOptions = self:__ValidateOptions(oOptions);
        oCallbacks = self:__ValidateCallbacks(oCallbacks);
        local root = AceGUI:Create("SimpleGroup");
        root:SetRelativeWidth(dWidth);
        root:SetLayout("Flow");
        root.__Time = oOptions.DefaultValue;
        root.OnValueChanged = self:__BuildValueChangedCallback(oCallbacks);
        root.SetValue = self:__BuildSetValueHandler();
        root.GetValue = self:__BuildGetValueHandler();
        root.HourDropdown = self:__CreateHoursDropdown(AceGUI,oOptions.DefaultValue.hour,root.OnValueChanged);
        root.MinDropdown = self:__CreateMinsDropdown(AceGUI,oOptions.DefaultValue.min,root.OnValueChanged);
        root.SecDropdown = self:__CreateSecsDropdown(AceGUI,oOptions.DefaultValue.sec,root.OnValueChanged);
        root:AddChild(root.HourDropdown);
        root:AddCHild(root.MinDropdown);
        root:AddChild(root.SecDropdown);
        return root;
    end,
    __BuildValueChangedCallback = function(self,oCallbacks)
        return function(self,timeKey,value)
            local t = time(self.__Time);
            self.__Time[timeKey] = value;
            if not ZLib:IsTimeValid(self.__Time) then
                self.__Time = date("*t",t);
                oCallbacks.OnValueChanged(self,self.__Date,timeKey,value,"Error: Time Not Valid");
            else
                oCallbacks.OnValueChanged(self,self.__Date,timeKey,value);
            end
        end
    end,
    __BuildSetValueHandler = function()
        return function(self,value)
            if ZLib:IsTimeValid(value) then
                self.HourDropdown:SetValue(value.hour);
                self.MinDropdown:SetValue(value.min);
                self.SecDropdown:SetValue(value.sec);
            end
        end
    end,
    __BuildGetValueHandler = function()
        return function(self)
            return self:__Time;
        end
    end,
    __CreateHoursDropdown = function(self,AceGUI,iDefaultValue,callback)
        local oOptions = {};
        local oCallbacks = {};
        oOptions.Values = ZLib:CreateIntegerList(0,23);
        oOptions.DefaultValue = iDefaultValue;
        oCallbacks.OnValueChanged = function(me,_,key,checked) callback("hour",key); end;
        return ZLib.Dropdown:Create(AceGUI,0.45,oOptions,oCallbacks);
    end,
    __CreateMinsDropdown = function(self,AceGUI,iDefaultValue,callback)
        local oOptions = {};
        local oCallbacks = {};
        oOptions.Values = ZLib:CreateIntegerList(0,59);
        oOptions.DefaultValue = iDefaultValue;
        oCallbacks.OnValueChanged = function(me,_,key,checked) callback("min",key); end;
        return ZLib.Dropdown:Create(AceGUI,0.45,oOptions,oCallbacks);
    end,
    __CreateHoursDropdown = function(self,AceGUI,iDefaultValue,callback)
        local oOptions = {};
        local oCallbacks = {};
        oOptions.Values = ZLib:__CreateIntegerList(0,59);
        oOptions.DefaultValue = iDefaultValue;
        oCallbacks.OnValueChanged = function(me,_,key,checked) callback("sec",key); end;
        return ZLib.Dropdown:Create(AceGUI,0.45,oOptions,oCallbacks);
    end,
    __ValidateOptions = function(self,oOptions)
        if oOptions  == nil then oOptions = {}; end
        if oOptions.MilitaryTime == nil then oOptions.MilitaryTime = false; end
        if not ZLib:IsTimevalid(oOptions.DefaultValue) then
            oOptions.DefaultValue = date("*t");
            oOptions.day = nil;
            oOptions.month = nil;
            oOptions.year = nil;
        end
        return oOptions;
    end,
    __ValidateCallbacks = function(self,oCallbacks)
        if oCallbacks == nil then oCallbacks = {}; end
        if not oCallbacks.OnValueChanged then oCallbacks.OnValueChanged = ZLib.EmptyFunction; end
        return oCallbacks;
    end
};
ZLib.Controls.TimePicker = ZLib.TimePicker;
