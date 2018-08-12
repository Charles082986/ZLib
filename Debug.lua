ZLib.Debug = {
    IsDev = true,
    Print = function(self,message)
        if self.IsDev then
            print("ZLib Debug: " .. message);
        end
    end
}