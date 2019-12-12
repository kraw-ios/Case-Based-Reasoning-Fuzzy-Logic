function [] = main()
     
    similarity_threshold = 0.9;
    formatSpec = '%s%s%f%s%f%s%s%f%f%f%f%f%f%f%f%f%f%f%s%f%f%s';
    
    filename = '11Melbourne_Samples.xlsx';
    case_library = readtable(filename);
    

    
    fprintf('\nFusificação...\n\n');
    
%     case_library = distancia_fuzzy(case_library);
    
    handles = GUI();

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
    new_case.buildingArea = get(handles.editbuildingArea, 'string');
    new_case.landSize = get(handles.editlandSize, 'string');
    
    new_case.yearBuilt = str2double(new_case.yearBuilt);
    new_case.bedroom2 = str2double(new_case.bedroom2);
    new_case.bathroom = str2double(new_case.bathroom);
    new_case.car = str2double(new_case.car);
    new_case.latitude = str2double(new_case.latitude);
    new_case.longitude = str2double(new_case.longitude);
    new_case.landSize = str2double(new_case.landSize);
    new_case.buildingArea = str2double(new_case.buildingArea);
    
    disp(new_case);
    
    
    fprintf('\nRetrieve...\n\n');
    
    [retrieved_indexes, similarities, new_case, similarityTable, NewCol] = retrieve(case_library, new_case, similarity_threshold);
    
    Top10SimilarProperties(similarityTable);
    
    
    retrieved_cases = case_library(retrieved_indexes, :);
    
    retrieved_cases.Similarity = similarities';
    
    fprintf('\nRetrieve completo!\n\n');
    
    fprintf('\nReuse1...\n\n');
    
    [new_case] = reuse1(case_library, retrieved_cases, similarities, new_case, similarityTable, NewCol);
    
    fprintf('\nReuse1 completo!\n\n');

    fprintf('\nRevise...\n\n');
    
    [new_case, historical] = revise(new_case);
    
    fprintf('\nRevise completo!\n\n');

    fprintf('\nRetain...\n\n');
    
    retain(new_case, historical, case_library);
    
    fprintf('\nRetain completo!\n\n');

end
