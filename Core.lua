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
function ZLib.IsStringValid(self,value)
    return value ~= nil and ZLib.trim(value):len() > 0
end
function ZLib.trim(self,s)
    -- from PiL2 20.4
    return (s:gsub("^%s*(.-)%s*$", "%1"))
end
function ZLib.CreateIntegerList(self,minValue,maxValue)
    local output = {};
    for i = minValue,maxValue do
        output[i] = i;
    end
    return output;
end
function ZLib.MakeTooltip(self,link)
    GameTooltip:SetOwner(self,"ANCHOR_CURSOR");
    GameTooltip:SetHyperlink(link);
    GameTolltip:Show();
end
function ZLib.ClearTooltip(self)
    GameTooltip:Hide();
end
function ZLib.GetFullName(self,name)
    if type(name) ~= "string" or type(realm) ~= "string" or string.match(name," ") then
        return nil;
    end
    if string.match(name,"-") then -- Name already full, do nothing :)
        return name;
    else
        return name .. "-" .. GetRealmName(); -- Name needs some TLC. Might accidentally get NPC's with one name. Oh well lol.
    end
end
function ZLib.GetMatch(self,table,value,property)
    if table == nil or value == nil then return nil; end
    if property == nil then
        for z = 1,#(table) do
            if table[z] == value then return table[z]; end
        end
    else
        for z = 1,#(table) do
            if table[z][property] == value then return table[z]; end
        end
    end
    return false;
end
function ZLib.TransformAssosiativeArray(self,table,callback,...)
    if table == nil or callback == nil then return nil; end
    local args = {...};
    local output = {};
    local i = 1;
    for k,v in pairs(table) do
        tinsert(output,callback(k,v,i,unpack(args)));
        i = i + 1;
    end
    return output;
end
function ZLib.TransformArray(self,table,callback,...)
    if table == nil or callback == nil then return nil; end
    local args = {...}
    local output = {};
    for i,v in ipairs(table) do
        tinsert(output,callback(i,v,unpack(args)));
    end
    return output;
end