ZLib = {};
ZLib.Controls = {};
ZLib.EmptyFunction = function() end;
function ZLib.IsDateValid(self,date)
    return date ~= nil and date.month ~= nil and date.day ~= nil and date.year ~= nil and date.month >= 1 and date.month <= 12 and date.month % 1 == 0
            and (date.day <= 28
                or (date.day <= 30 and date.month ~= 2)
                or (date.day == 30 and (date.month == 4 or date.month == 6 or date.month == 9 or date.month == 11))
                or (date.day == 31 and (date.month == 1 or date.month == 3 or date.month == 5 or date.month == 7 or date.month == 8 or date.month == 10 or date.month == 12)));
end
function ZLib.IsDateTimeValid(self,dateTime)
    return self:IsDateValid(dateTime) and self:IsTimeValid(dateTime);
end
function ZLib.IsTableValid(self,list)
    return list ~= nil and type(list) == "table";
end
function ZLib.IsTimeValid(self,time)
    return time ~= nil and self:IsNumberValid(time.hour) and self:IsNumberValid(time.min) and self:IsNumberValid(time.sec)
        and time.hour >= 0 and time.hour <= 23 and time.min >= 0 and time.min <= 59 and time.sec >= 0 and time.sec <= 59;
end
function ZLib.IsNumberValid(self,value)
    return value ~= nil and tonumber(value) ~= nil;
end
