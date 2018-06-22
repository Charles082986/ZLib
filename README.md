# ZLib

### Helper Functions
|Helper Functions|Parameters|Description|
|---|---|---|
|```ZLib:IsDateValid(oDate)```|```oDate``` = date object, such as returned by ```date("*t")```| Returns true if the oDate argument is in the appropriate format and is a valid date.  Checks the ```year```, ```month```, and ```day``` properties.|
|```ZLib:IsTimeValid(oTime)```|```oTime``` = time object, such as returned by ```date("*t")```| Returns true if the oTime argument is in teh appropriate format and is a valid time.  Checks the ```hour```, ```min```, and ```sec``` properties.|
|```ZLib:IsDateTimeValid(oDateTime)```|```oDateTime``` = date/time object, such as returned by ```date("*t")```| Returns true if the oDateTime argument passes ```ZLib:IsValidDate(oDateTime)``` and ```ZLib:IsValidTime(oDateTime)``` tests.|
|```ZLib:IsTableValid(oTable)```|```oTable``` = a variable that you wish to test | Returns true if the ```oTable``` argument is not nil and has a type of table.|
|```ZLib:IsNumberValid(iNumber)```|```iNumber``` = a value to test.|```Returns true if ```iNumber``` is not nil and ```tonumber(iNumber)``` is not nil.  *Note:* This will validate both numbers and numeric strings.
|```ZLib:IsStringValid(sText)```|```sText``` = a value to test.|```Returns true if ```sText``` is not nil and contains characters other than spaces.|
|```ZLib:Trim(sText)```|```sText``` = variable to edit.|```Returns ```sText``` with all leading and trailing spaces removed.|
|```ZLib:CreateIntegerList(iMin,iMax)```|```iMin``` = minimum value of the list.<br/>```iMax``` = maximum value of the list.|Creates a list of whole numbers between and including ```iMin``` and ```iMax```|
|```ZLib:MakeTooltip(sLink[,sAnchor])```|```sLink``` = the link text to the tooltip's data source.<br/>```sAnchor``` *OPTIONAL* = The anchor for the tooltip.  Defaults to ```"ANCHOR_CURSOR"```.|Creates a tooltip.|
|```ZLib:ClearTooltip()```||Clears the current tooltip.|
|```ZLib:GetFullName(sName)```|```sName``` = name of the player.|Returns a unit name in name-realm format.|
|```ZLib:GetMatch(aTable,value[,sProperty])```|```aTable``` = The collection of values that may contain a match.<br/>```value``` = Value for which you are looking.<br/>```sProperty``` *OPTIONAL* = the name of the property to check against the ```value``` argument.  Required for assosiative arrays.|Returns the value of the first match.|
