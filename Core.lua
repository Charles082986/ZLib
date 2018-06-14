ZLib = {};
ZLib.Controls = {};
ZLib.EmptyFunction = function() end;
function ZLib.IsDateValid(self,date)
    if date.month >= 1 and date.month <= 12 and date.month % 1 == 0 then
        if date.day <= 28
                or (date.day <= 30 and date.month ~= 2)
                or (date.day == 30 and (date.month == 4 or date.month == 6 or date.month == 9 or date.month == 11))
                or (date.day == 31 and (date.month == 1 or date.month == 3 or date.month == 5 or date.month == 7 or date.month == 8 or date.month == 10 or date.month == 12))
            then
            return true;
        end
    end
    return false;
end