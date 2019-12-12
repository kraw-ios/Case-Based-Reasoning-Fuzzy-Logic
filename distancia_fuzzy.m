function [ case_library ] = distancia_fuzzy(case_library)
    
    filename = '11Melbourne_Samples.xlsx';
    
    
    
    numberOfColumn = 29;
    numberOfRow = 2060;
    councilArea = ['Port Phillip City Council', 'Stonnington City Council', 'Boroondara City Council', 'Yarra City Council', ...
        'Melbourne City Council', 'Monash City Council', 'Bayside City Council', 'Glen Eira City Council', 'Darebin City Council', ...
        'Moreland City Council', 'White Horse City Council', 'Moonee Valley City Council', 'Maribyrnong City Council', ...
        'Hobsons Bay City Council', 'Manningham City Council', 'Banyule City Council', 'Kingston City Council', 'Maroondah City Council',...
        'Greater Dandenong City Council', 'Knox City Council', 'Brimbank City Council', 'Casey City Council", "Frankstone City Council', ...
        'Nilumbik Shire Council', 'Hume City Council', 'Macedone Ranges Shire Council', 'Whittlesea City Council', 'Wyndham City Council',...
        'Melton City Council'];
    
    c = cellstr(councilArea);
    
    LatLonCouncilArea = [-37.849994 144.967331;
                         -37.850284 144.993991;
                         -37.834600 145.059641;
                         -37.803303 144.992040;
                         -37.814875 144.968582;
                         -37.894712 145.144058;
                         -37.959017 145.018254;
                         -37.880055 145.022671;
                         -37.733960 145.010852;
                         -37.728418 144.950999;
                         -37.817346 145.181354;
                         -37.764348 144.925319;
                         -37.804912 144.900693;
                         -37.863803 144.831016;
                         -37.786936 145.132497;
                         -37.766030 145.044489;
                         -37.933908 145.037475;
                         -37.808223 145.242424;
                         -37.988402 145.212371;
                         -37.871794 145.247949;
                         -37.783081 144.832184;
                         -38.019033 145.301150;
                         -38.147125 145.122796;
                         -37.700943 145.154828;
                         -37.591664 144.832581;
                         -37.263702 144.446540;
                         -37.646368 145.069023;
                         -37.878984 144.627534;
                         -37.687858 144.632517];
                     
      latLonDistanciaMax = [-37.511446 144.949080;
                            -38.433928 144.849885];
   
        
    xlswrite('11Melbourne_Samples.xlsx', c, 'RapidMiner Data', 'W1');
 
    
    for i=2:numberOfRow - 1
        
        lat1 = case_library{i,17};
        lon2 = case_library{i,18};
        latlon1 = [lat1 lon2] ;

        for j=1:numberOfColumn
            NewCol(j) = calculate_euclidean_distance(latlon1,LatLonCouncilArea(j,:));
            %d = calculate_euclidean_distance(latLonDistanciaMax(1,:),latLonDistanciaMax(2,:));
            NewCol(j) = 1 - (NewCol(j)/calculate_euclidean_distance(latLonDistanciaMax(1,:),latLonDistanciaMax(2,:))); % para obter a normalização 

            
        end
        pos = strcat('W', int2str(i));
        xlswrite('11Melbourne_Samples.xlsx',NewCol,'RapidMiner Data', pos); % Usar o c
        
    end
    case_library = readtable(filename);
end

function [res] = calculate_euclidean_distance(latlon1, latlon2)
   
    lat1 = latlon1(1);
    lon1 = latlon1(2);

    if lat1 == 0 && lon1 == 0
        res = -1;
        return;
    end
        
    lat2 = latlon2(1);
    lon2 = latlon2(2);
    
    if lat2 == 0 && lon2 == 0
        res = -1;
        return;
    end
    
    res = (sqrt(((lat1-lat2)^2) + ((lon1-lon2)^2)));
    
end