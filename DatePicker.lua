ZLib.DatePicker = {
    new = function(self,AceGUI,dWidth,oOptions,oCallbacks)
        local currentDate = date("*t");
        if not AceGUI then AceGUI = LibStub("AceGUI-3.0"); end
        if not oDefaultValue then oDefaultValue = currentDate; end
        oOptions = self:__ValidateOptions(oOptions,currentDate);
        oCallbacks = self:__ValidateCallbacks(oCallbacks);
        local root = AceGUI:Create("SimpleGroup");
        root:SetRelativeWidth(dWidth);
        root:SetLayout("Flow");
        root.__Date = oDefaultValue;
        function root.OnValueChanged(self,dateKey,value)
            local t = time(self.__Date);
            self.__Date[dateKey] = value;
            if not ZLib:IsDateValid(self.__Date) then
                self.__Date = date("*t",t);
                oCallbacks.OnValueChanged(self,self.__Date,dateKey,value,"Error: Date Not Valid");
            else
                oCallbacks.OnValueChanged(self,self.__Date,dateKey,value);
            end
        end
        local years = self:__CreateYearsDropdown(AceGUI,oOptions.MinYear,oOptions.MaxYear,oDefaultValue.year,root.OnValueChanged);
        local months = self:__CreateMonthsDropdown(AceGUI,oDefaultValue.month,root.OnValueChanged);
        local days = self:__CreateDaysDropdown(AceGUI,oDefaultValue.day,root.OnValueChanged);
        root:AddChild(years);
        root:AddCHild(months);
        root:AddChild(days);
        root.YearDropdown = years;
        root.MonthDropdown = months;
        root.DayDropdown = days;
        function root.GetValue(self) return self.__Date end
        function root.SetValue(self,value)
            if ZLib:IsDateValid(value) then
                self.YearDropdown:SetValue(value.year);
                self.MonthDropdown:SetValue(value.month);
                self.DayDropdown:SetValue(value.day);
            end
        end
        return root;
    end,
    __ValidateOptions = function(self,oOptions,currentDate)
        if not currentDate then currentDate = date("*t"); end
        if not oOptions then oOptions = {} end
        if not ZLib:IsNumberValid(oOptions.MinYear) then oOptions.MinYear = 2018; end
        if not ZLib:IsNumberValid(oOptions.MaxYear) then oOptions.MaxYear = currentDate.year; end
        if not ZLib:IsDateValid(oOptions.DefaultValue) then oOptions.DefaultValue = date("*t"); end
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
        oOptions.Values = self:__CreateIntegerList(iMinYear,iMaxYear);
        oOptions.DefaultValue = iDefaultYear;
        oCallbacks.OnValueChanged = function(me,_,key,checked) callback("year",key); end;
        return ZLib.Dropdown:Create(AceGUI,0.45,oOptions,oCallbacks);
    end,
    __CreateIntegerList = function(self,minValue,maxValue)
        local output = {};
        for i = minValue,maxValue do
            output[i] = i;
        end
        return output;
    end,
    __CreateMonthsDropdown = function(self,AceGUI,iDefaultMonth,callback)
        local oOptions = {};
        local oCallbacks = {};
        oOptions.Values = { "JAN", "FEB", "MAR", "APR", "MAY", "JUN", "JUL", "AUG", "SEP", "OCT", "NOV", "DEC" }
        oOptions.DefaultValue = iDefaultMonth;
        oCallbacks.OnValueChanged = function(me,_,key,checked) callback("month",key); end;
        return ZLib.Dropdown:Create(AceGUI,0.35,oOptions,oCallbacks);
    end,
    __CreateMonthsDropdown = function(self,AceGUI,iDefaultDay,callback)
        local oOptions = {};
        local oCallbacks = {};
        oOptions.Values = self:__CreateIntegerList(1,31);
        oOptions.DefaultValue = iDefaultDay;
        oCallbacks.OnValueChanged = function(me,_,key,checked) callback("day",key); end;
        return ZLib.Dropdown:Create(AceGUI,0.25,oOptions,oCallbacks);
    end
};
ZLib.Controls["DatePicker"] = ZLib.DatePicker;