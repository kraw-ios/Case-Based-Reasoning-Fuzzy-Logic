function [new_case, historical] = revise(new_case)
    
    handles = DataReview(new_case);
    
    new_case.type = get(handles.edittype, 'string');
    new_case.councilArea = get(handles.editcouncilarea, 'string');
    new_case.yearBuilt = get(handles.edityearbuilt, 'string');
    new_case.bedroom2 = get(handles.editbedroom2, 'string');
    new_case.suburb = get(handles.editsuburb, 'string');
    new_case.address = get(handles.editaddress, 'string');
    new_case.bathroom = get(handles.editbathroom, 'string');
    new_case.car = get(handles.editcar, 'string');
    new_case.latitude = get(handles.editlatitude, 'string');
    new_case.longitude = get(handles.editlongitude, 'string');
    new_case.buildingArea = get(handles.editbuildingarea, 'string');
    new_case.landSize = get(handles.editlandsize, 'string');
    new_case.price = get(handles.editprice, 'string');
    
    new_case.yearBuilt = str2double(new_case.yearBuilt);
    new_case.bedroom2 = str2double(new_case.bedroom2);
    new_case.bathroom = str2double(new_case.bathroom);
    new_case.car = str2double(new_case.car);
    new_case.latitude = str2double(new_case.latitude);
    new_case.longitude = str2double(new_case.longitude);
    new_case.landSize = str2double(new_case.landSize);
    new_case.buildingArea = str2double(new_case.buildingArea);
    new_case.price = str2double(new_case.price);

    suburb = cellstr(new_case.suburb);
    address = cellstr(new_case.address);
    councilArea = cellstr(new_case.councilArea);
    type = cellstr(new_case.type);

%         historical = table(suburb,address, 'x', type,new_case.price,'x', 'x', 'x', 'x', 'x', new_case.bedroom2, ...
%                 new_case.bathroom,new_case.car,new_case.landSize,new_case.buildingArea,new_case.yearBuilt, ...
%                 new_case.latitude, new_case.longitude, 'x', 'x', 'x', councilArea);
            
        historical = table(suburb,address, type,new_case.price, new_case.bedroom2, ...
                new_case.bathroom,new_case.car,new_case.landSize,new_case.buildingArea,new_case.yearBuilt, ...
                new_case.latitude, new_case.longitude, councilArea);
end