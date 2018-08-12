ZLib.DatePicker = {
    new = function(self,AceGUI,dWidth,oOptions,oCallbacks)
        ZLib.Debug:Print('Creating Date Picker');
        local currentDate = date("*t");
        if not AceGUI then AceGUI = LibStub("AceGUI-3.0"); end
        oOptions = self:__ValidateOptions(oOptions,currentDate);
        oCallbacks = self:__ValidateCallbacks(oCallbacks);
        local root = AceGUI:Create("SimpleGroup");
        root:SetRelativeWidth(dWidth);
        root:SetLayout("Flow");
        root.__Date = oOptions.DefaultValue;
        root.OnValueChanged = self:__BuildValueChangedCallback(oCallbacks);
        root.SetValue = self:__BuildSetValueHandler();
        root.GetValue = self:__BuildGetValueHandler();
        root.YearDropdown = self:__CreateYearsDropdown(AceGUI,oOptions.MinYear,oOptions.MaxYear,oOptions.DefaultValue.year,root.OnValueChanged);
        root.MonthDropdown = self:__CreateMonthsDropdown(AceGUI,oOptions.DefaultValue.month,root.OnValueChanged);
        root.DayDropdown = self:__CreateDaysDropdown(AceGUI,oOptions.DefaultValue.day,root.OnValueChanged);
        root:AddChild(root.YearDropdown);
        root:AddCHild(root.MonthDropdown);
        root:AddChild(root.DayDropdown);
        return root;
    end,
    __BuildValueChangedCallback = function(self,oCallbacks)
        return function(self,dateKey,value)
            local t = time(self.__Date);
            self.__Date[dateKey] = value;
            if not ZLib:IsDateValid(self.__Date) then
                self.__Date = date("*t",t);
                oCallbacks.OnValueChanged(self,self.__Date,dateKey,value,"Error: Date Not Valid");
            else
                oCallbacks.OnValueChanged(self,self.__Date,dateKey,value);
            end
        end
    end,
    __BuildSetValueHandler = function()
        return function(self,value)
            if ZLib:IsDateValid(value) then
                self.YearDropdown:SetValue(value.year);
                self.MonthDropdown:SetValue(value.month);
                self.DayDropdown:SetValue(value.day);
            end
        end
    end,
    __BuildGetValueHandler = function()
        return function(self)
            return self.__Date;
        end
    end,
    __ValidateOptions = function(self,oOptions,currentDate)
        if not currentDate then currentDate = date("*t"); end
        if not oOptions then oOptions = {} end
        if not ZLib:IsNumberValid(oOptions.MinYear) then oOptions.MinYear = 2018; end
        if not ZLib:IsNumberValid(oOptions.MaxYear) then oOptions.MaxYear = currentDate.year; end
        if not ZLib:IsDateValid(oOptions.DefaultValue) then
            oOptions.DefaultValue = date("*t");
            oOptions.hour = nil;
            oOptions.min = nil;
            oOptions.sec = nil;
        end
        return oOptions;
    end,
    __ValidateCallbacks = function(self,oCallbacks)
        if not oCallbacks then oCallbacks = {}; end
        if not oCallbacks.OnValueChanged then oCallbacks.OnValueChanged = ZLib.EmptyFunction; end
        return oCallbacks;
    end,
    __CreateYearsDropdown = function(self,AceGUI,iMinYear,iMaxYear,iDefaultYear,callback)
        local oOptions = {};
        local oCallbacks = {};
        oOptions.Values = ZLib:CreateIntegerList(iMinYear,iMaxYear);
        oOptions.DefaultValue = iDefaultYear;
        oCallbacks.OnValueChanged = function(me,_,key,checked) callback("year",key); end;
        return ZLib.Dropdown:Create(AceGUI,0.45,oOptions,oCallbacks);
    end,
    __CreateMonthsDropdown = function(self,AceGUI,iDefaultMonth,callback)
        local oOptions = {};
        local oCallbacks = {};
        oOptions.Values = { "JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC" }
        oOptions.DefaultValue = iDefaultMonth;
        oCallbacks.OnValueChanged = function(me,_,key,checked) callback("month",key); end;
        return ZLib.Dropdown:Create(AceGUI,0.35,oOptions,oCallbacks);
    end,
    __CreateDaysDropdown = function(self,AceGUI,iDefaultDay,callback)
        local oOptions = {};
        local oCallbacks = {};
        oOptions.Values = ZLib:CreateIntegerList(1,31);
        oOptions.DefaultValue = iDefaultDay;
        oCallbacks.OnValueChanged = function(me,_,key,checked) callback("day",key); end;
        return ZLib.Dropdown:Create(AceGUI,0.25,oOptions,oCallbacks);
    end,
};
ZLib.Controls["DatePicker"] = ZLib.DatePicker;