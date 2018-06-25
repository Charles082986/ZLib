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

## Simple Objects

### Simple Object Constructors
| Object | Constructor | Arguments |
|---|---|---|
|Dropdown|```ZLib.Dropdown:new(AceGUI,dWidth,oOptions,oCallbacks)```|```AceGUI``` = an instance of LibStub("AceGUI-3.0").<br/>```dWidth``` = a decimal value between 0 and 1 that represents the portion of the row the dropdown will occupy.<br/>```oOptions``` = An associative array of data for the dropdown.  See [Dropdown Options](#dropdown-options).<br/>```oCallbacks``` = an assosiative array contianing the necessary callbacks for the dropdown.  Callbacks supported are OnValueChanged, OnEnter, and OnLeave.|
|EditBox|```ZLib.EditBox:new(AceGUI,dWidth,sDefaultValue,oCallbacks)```|```AceGUI``` = an instance of LibStub("AceGUI-3.0").<br/>```dWidth``` = a decimal value between 0 and 1 that represents the portion of the row the editbox will occupy.<br/>```sDefaultValue``` = The text the editbox will contain when it is created.<br/>```oCallbacks``` = an assosiative array contianing the necessary callbacks for the editbox.  Callbacks supported are OnEnterPressed, OnEnter, and OnLeave.|
|Heading|```ZLib.Heading:new(AceGUI,dWidth,sText)```|```AceGUI``` = an instance of LibStub("AceGUI-3.0").<br/>```dWidth``` = a decimal value between 0 and 1 that represents the portion of the row the heading will occupy.<br/>```sText``` = The text of the heading.|
|Interactive Label|```ZLib.InteractiveLabel:new(AceGUI,dWidth,sText,oCallbacks)```|```AceGUI``` = an instance of LibStub("AceGUI-3.0").<br/>```dWidth``` = a decimal value between 0 and 1 that represents the portion of the row the interactive label will occupy.<br/>```sText``` = The text the interactive label.<br/>```oCallbacks``` = an assosiative array contianing the necessary callbacks for the interactive label.  Callbacks supported are OnClick, OnEnter, and OnLeave.|
|Label|```ZLib.Heading:new(AceGUI,dWidth,sText)|```AceGUI``` = an instance of LibStub("AceGUI-3.0").<br/>```dWidth``` = a decimal value between 0 and 1 that represents the portion of the row the label will occupy.<br/>```sText``` = The text of the label.|
|Slider|```ZLib.Slider:new(AceGUI,dWidth,oOptions,oCallbacks)```|```AceGUI``` = an instance of LibStub("AceGUI-3.0").<br/>```dWidth``` = a decimal value between 0 and 1 that represents the portion of the row the label will occupy.<br/>```oOptions``` = An associative array of data for the slider. See [Slider Options](#slider-options).<br/>```oCallbacks``` = an associative array containing the necessary callbacks for the slider.  Callbacks supported are OnValueChanged.|

### Button 
Constructor: ZLib.Button:new(AceGUI,dWidth,sText,oCallbacks)
This is a single button that executes it's OnClick event when the button is clicked.

#### Arguments
|Argument|Type|Description|
|---|---|---|
|AceGUI|object|An instance of LibStub("AceGUI-3.0").|
|dWidth|decimal|A decimal value that represents the relative width of the control within it's parent row.|
|sText|string|The text that appears on the button.|
|oCallbacks|object|An object that defines the OnClick, OnEnter, and OnLeave callbacks.|

#### oCallbacks
##### OnClick
Stub: function(control)

|Arguments|Type|Description|
|---|---|---|
|control|object|A reference to the control that called this callback.|

##### OnEnter (Optional)
Stub: function(control)

|Arguments|Type|Description|
|---|---|---|
|control|object|A reference to the control that called this callback.|

##### OnLeave (Optional)
Stub: function(control)

|Arguments|Type|Description|
|---|---|---|
|control|object|A reference to the control that called this callback.|

### CheckBox
Constructor: ZLib.CheckBox:new(AceGUI,dWidth,bDefaultValue,oCallbacks)

#### Arguments
|Argument|Type|Description|
|---|---|---|
|AceGUI|object|An instance of LibStub("AceGUI-3.0").|
|dWidth|decimal|A decimal value that represents the relative width of the control within it's parent row.|
|bDefaultValue|boolean|A boolean value to set whether or not the checkbox is checked.|
|oCallbacks|object|An object that defines the OnValueChanged, OnEnter, and OnLeave callbacks.|

#### oCallbacks
##### OnValueChanged
Stub: function(control,_,value)

|Arguments|Type|Description|
|---|---|---|
|control|object|A reference to the control that called this callback.|
|_|?|Unknown|
|value|boolean|The new value of the control.



### Complex Object Constructors
| Object | Constructor | Arguments |
|---|---|---|
|DatePicker|||
|DateTimePicker|||
|Table||||
|TimePicker|||

#### Dropdown Options
 * Values = An associative array that represents the options in the dropdown.  The values in the associative array are the display text, and the keys are set as the dropdown's value when an option is chosen.
 * ValuesOrder = A standard array of keys in from the Values table in the order you wish them to appear in the drop down list.
 * Default Value = The key of the option you wish to have selected when the control is created.
 
 #### Slider Options
* Label = Text for the slider's built-in label.
* Min = The minimum value the slider will represent.
* Max = The maximum value the slider will represent.
* Step = The increment value of each step of the slider.
* DefaultValue = The default value of the slider when it is created.
