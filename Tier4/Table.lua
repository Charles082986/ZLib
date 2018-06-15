ZLib.Table = {
    new = function(self,AceGUI,dWidth,oTableStructure,oOptions)
        if not AceGUI then AceGUI = LibStub("AceGUI-3.0"); end
        local root = AceGUI:Create("SimpleGroup");
        root.Header = self:__BuildHeaderRow(AceGUI,oTableStructure);
        root.Data = self:__BuildTableData(self,AceGUI,oTableStructure);
        root.AddRow = self:__BuildAddRowFunction();
        root:AddChild(root.Header);
        root:AddChild(root.Data);
        return root;
    end,
    __BuildCell = function(self,AceGUI,type,oCellOptions)
        if not AceGUI then AceGUI = LibStub("AceGUI-3.0"); end
        if type == "Button" then
            return ZLib.Button:new(AceGUI,oCellOptions.Width,oCellOptions.Text,oCellOptions.Callbacks);
        elseif type == "CheckBox" then
            return ZLib.CheckBox:new(AceGUI,oCellOptions.DefaultValue,oCellOptions.Callbacks);
        elseif type == "DatePicker" then
            return ZLib.DatePicker:new(AceGUI,oCellOptions.Width,oCellOptions,oCellOptions.Callbacks);
        elseif type == "DateTimePicker" then
            return ZLib.DateTimePicker:new(AceGUI,oCellOptions.Width,oCellOptions,oCellOptions.Callbacks);
        elseif type == "Dropdown" then
            return ZLib.Dropdown:new(AceGUI,oCellOptions.Width,oCellOptions,oCellOptions.Callbacks);
        elseif type == "EditBox" then
            return ZLib.EditBox:new(AceGUI,oCellOptions.Width,oCellOptions.DefaultValue,oCellOptions.Callbacks);
        elseif type == "Heading" then
            return ZLib.Heading:new(AceGUI,oCellOptions.Width,oCellOptions.Text);
        elseif type == "InteractiveLabel" then
            return ZLib.InteractiveLabel:new(AceGUI,oCellOptions.Width,oCellOptions.Text,oCellOptions.Callbacks);
        elseif type == "Label" then
            return ZLib.Label:new(AceGUI,oCellOptions.Width,oCellOptions.Text);
        elseif type == "Slider" then
            return ZLib.Slider:new(AceGUI,oCellOptions.Width,oCellOptions,oCellOptions.Callbacks)
        elseif type == "TimePicker" then
            return ZLib.TimePicker:new(AceGUI,oCellOptions.Width,oCellOptions,oCellOptions.Callbacks);
        end
    end,
    __BuildAddRowFunction = function()
        return function(self,AceGUI,values)
            if not AceGUI then AceGUI = LibStub("AceGUI-3.0"); end
            local row = AceGUI:Create("SimpleGroup");
            for i,v in ipairs(self.__TableStructure) do
                v.DefaultValue = values[i];
                row:AddChild(self:__BuildCell(AceGUI,v.Type,v));
            end
            self.Data:AddChild(row);
            return row;
        end
    end,
    __BuildHeaderRow = function(self,AceGUI,oTableStructure)
        if not AceGUI then AceGUI = LibStub("AceGUI-3.0"); end
        local header = AceGUI:Create("SimpleGroup");
        header:SetRelativeWidth(1);
        header:SetLayout("Flow");
        for i,v in ipairs(oTableStructure) do
            header:AddChild(ZLib.Label:new(AceGUI,v.Width,v.Title));
        end
        return header;
    end,
    __BuildTableData = function(self,AceGUI,oTableStructure)
        if not AceGUI then AceGUI = LibStub("AceGUI-3.0"); end
        local data = AceGUI:Create("SimpleGroup");
        data:SetRelativeWidth(1);
        data:SetFullHeight(true);
        data:SetLayout("Flow");
        return data;
    end,
    __BuildRemoveRowFunction = function()
        return function(self,rowIndex)
            tremove(self.Data.children,rowIndex);
            self.Data:DoLayout();
        end
    end
}

