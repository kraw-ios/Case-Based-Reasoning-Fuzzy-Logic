function [retrieved_indexes, similarities, new_case, similarityTable, NewCol] = retrieve(case_library, new_case, threshold)

 
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
                        
      weighting_factors = [60; 50; 50; 50; 50; 50; 50]; %distancia, year built, bedroom2, bathroom, car, landSize, buildingArea 
    
%     type_sim = get_type_similarities();
%     bedroom2 = get_bedroom_similarities();
    latlon = [new_case.latitude new_case.longitude];
    
    numberOfColumn = 29;
    
    for j=1:numberOfColumn
        NewCol(j) = calculate_euclidean_distance(latlon,LatLonCouncilArea(j,:));
        %d = calculate_euclidean_distance(latLonDistanciaMax(1,:),latLonDistanciaMax(2,:));
        NewCol(j) = 1 - (NewCol(j)/calculate_euclidean_distance(latLonDistanciaMax(1,:),latLonDistanciaMax(2,:))); % para obter a normalização 
    end
    max_values = get_max_values(case_library);
    
    retrieved_indexes = [];
    similarities = [];
    
    to_remove = [];
    
    weighting_factors(to_remove) = [];
    
    for i=1:size(case_library, 1)
        if(strcmp(case_library(i, 4), new_case.type) == 0)
            distances = zeros(1,7);

%             if isfield(new_case, 'type')
%                 distances(1,1) = calculate_local_distance(type_sim, ...
%                                     case_library{i,'Type'}, new_case.type);
%             end

            distances(1,1) = calculate_linear_distance_for_houses(case_library, NewCol, i);

            distances(1,2) = calculate_linear_distance(case_library{i,'YearBuilt'} / max_values('YearBuilt'), ... 
                                    new_case.yearBuilt / max_values('YearBuilt'));

            distances(1,3) = calculate_linear_distance( ...
                                    case_library{i,'Bedroom2'} / max_values('Bedroom2'), ...
                                    new_case.bedroom2 / max_values('Bedroom2'));

            distances(1,4) = calculate_linear_distance( ...
                                    case_library{i,'Bathroom'} / max_values('Bathroom'), ...
                                    new_case.bathroom / max_values('Bathroom'));

            distances(1,5) = calculate_linear_distance( ...
                                    case_library{i,'Car'} / max_values('Car'), ...
                                    new_case.car / max_values('Car'));                    

            distances(1,6) = calculate_linear_distance( ...
                                    case_library{i,'Landsize'} / max_values('Landsize'), ...
                                    new_case.landSize / max_values('Landsize'));

            distances(1,7) = calculate_linear_distance( ...
                                    case_library{i,'BuildingArea'} / max_values('BuildingArea'), ...
                                    new_case.buildingArea / max_values('BuildingArea'));                   

            distances(to_remove) = [];

            final_similarity = 1-(distances * weighting_factors) / sum(weighting_factors);   

            if final_similarity >= threshold
                retrieved_indexes = [retrieved_indexes i];
                similarities = [similarities final_similarity];

            end
        
        
%         fprintf('Case %d out of %d has a similarity of %.2f%%...\n', i, size(case_library,1), final_similarity*100);
    end
    end
    
    flag = 0;
    minor = 99999;
    for i=1:length(similarities)
        if flag == 10
            for j=1:size(aux, 1)
                current = aux(j, 1);
                if current < minor
                    minor = current;
                    pos = j;
                end
            end
            if minor < similarities(1,i)
                aux(pos, 1) = similarities(1,i);
                aux(pos, 2) = retrieved_indexes(1,i);
            end
        end
        if flag < 10
            aux(i, 1) = similarities(1,i);
            aux(i, 2) = retrieved_indexes(1,i);
            flag = flag + 1;
        end    
    end
    
%     aux = str2double(aux);
%     aux = sortrows(aux, 'descend');
    disp(aux);
    
    for a=1:size(aux, 1)
%         aux = sort(aux, 1); % testar se muda as linhas ou se so muda os valores da primeira coluna - tem que mudar as linha pois as duas colunas tem de estar sempre juntas
        similarityTable(a,1) = case_library(aux(a,2),1);
        similarityTable(a,2) = case_library(aux(a,2),2);
        similarityTable(a,3) = case_library(aux(a,2),4);
        similarityTable(a,4) = case_library(aux(a,2),5);
        similarityTable(a,5) = case_library(aux(a,2),11);
        similarityTable(a,6) = case_library(aux(a,2),12);
        similarityTable(a,7) = case_library(aux(a,2),13);
        similarityTable(a,8) = case_library(aux(a,2),14);
        similarityTable(a,9) = case_library(aux(a,2),15);
        similarityTable(a,10) = case_library(aux(a,2),16);
        similarityTable(a,11) = case_library(aux(a,2),22);
        
    end
    disp(similarityTable);
end

function [max_values] = get_max_values(case_library)

    key_set = {'YearBuilt', 'Bedroom2', 'Bathroom', 'Car', 'Landsize', 'BuildingArea'};
    value_set = {max(case_library{:,'YearBuilt'}), max(case_library{:,'Bedroom2'}), max(case_library{:,'Bathroom'}), ...
        max(case_library{:,'Car'}), max(case_library{:,'Landsize'}), max(case_library{:,'BuildingArea'})};
    max_values = containers.Map(key_set, value_set);
end

function [res] = calculate_linear_distance_for_houses(case_library, NewCol, index)
    
    for i=1:29
        value1 = table2array(case_library(index, 22 + i));
        value2 = NewCol(i);
        array(i) = (abs(value1 - value2));
    end
    
    res = min(array);
end
% function [type_sim] = get_type_similarities()
% 
%     type_sim.categories = categorical({'h', 'br', 'u', 't', 'devsite', 'res'});
% 
%     type_sim.similarities = [
%         %   h      br     u       t      devsite    res
%            1.0     0.4   0.6     0.8       0.1      0.2    % h
%            0.4     1.0   0.8     0.6       0.6      0.8    % br
%            0.6     0.8   1.0     0.8       0.4      0.6    % u
%            0.8     0.6   0.8     1.0       0.2      0.4    % t
%            0.1     0.6   0.4     0.2       1.0      0.8    % devsite
%            0.2     0.8   0.6     0.4       0.8      1.0    % res
%     ];
% end

function [res] = calculate_linear_distance(val1, val2)

    res = (abs(val1-val2));
end

function [res] = calculate_local_distance(sim, val1, val2)

    i1 = find(sim.categories == val1);
    i2 = find(sim.categories == val2);
    res = 1-sim.similarities(i1, i2);
    
end

% function [bedroom2_sim] = get_bedroom2_similarities()
% 
%     bedroom2_sim.categories = categorical({'1', '2', '3', '4', '5', '6', '7'});
% 
%     bedroom2_sim.similarities = [
%         %  1     2     3     4     5     6     7
%           1.0   0.9   0.8   0.7   0.6   0.5   0.4    % 1
%           0.9   1.0   0.9   0.8   0.7   0.6   0.5    % 2
%           0.8   0.9   1.0   0.9   0.8   0.7   0.6    % 3
%           0.7   0.8   0.9   1.0   0.9   0.8   0.7    % 4
%           0.6   0.7   0.8   0.9   1.0   0.9   0.8    % 5
%           0.5   0.6   0.7   0.8   0.9   1.0   0.9    % 6
%           0.4   0.5   0.6   0.7   0.8   0.9   1.0    % 7
%     ];
% end
% 
% function [year_built_sim] = get_year_built_similarities()
% 
%     year_built_sim.categories = categorical({'186', '187', '188', '189', '190', '191', '192', '193', '194', ...
%          '195', '196', '197', '198', '199', '200', '201'});
% 
%     year_built_sim.similarities = [
%         % 186    187    188    189    190    191    192    193    194    195    196    197    198    199    200    201
%           1.00   0.95   0.90   0.85   0.80   0.75   0.70   0.65   0.60   0.55   0.50   0.45   0.40   0.35   0.30   0.25   % 186
%           0.95   1.00   0.95   0.90   0.85   0.80   0.75   0.70   0.65   0.60   0.55   0.50   0.45   0.40   0.35   0.30   % 187
%           0.90   0.95   1.00   0.95   0.90   0.85   0.80   0.75   0.70   0.65   0.60   0.55   0.50   0.45   0.40   0.35   % 188
%           0.85   0.90   0.95   1.00   0.95   0.90   0.85   0.80   0.75   0.70   0.65   0.60   0.55   0.50   0.45   0.40   % 189
%           0.80   0.85   0.90   0.95   1.00   0.95   0.90   0.85   0.80   0.75   0.70   0.65   0.60   0.55   0.50   0.45   % 190
%           0.75   0.80   0.85   0.90   0.95   1.00   0.95   0.90   0.85   0.80   0.75   0.70   0.65   0.60   0.55   0.50   % 191
%           0.70   0.75   0.80   0.85   0.90   0.95   1.00   0.95   0.90   0.85   0.80   0.75   0.70   0.65   0.60   0.55   % 192
%           0.65   0.70   0.75   0.80   0.85   0.90   0.95   1.00   0.95   0.90   0.85   0.80   0.75   0.70   0.65   0.60   % 193
%           0.60   0.65   0.70   0.75   0.80   0.85   0.90   0.95   1.00   0.95   0.90   0.85   0.80   0.75   0.70   0.65   % 194
%           0.55   0.60   0.65   0.70   0.75   0.80   0.85   0.90   0.95   1.00   0.95   0.90   0.85   0.80   0.75   0.70   % 195
%           0.50   0.55   0.60   0.65   0.70   0.75   0.80   0.85   0.90   0.95   1.00   0.95   0.90   0.85   0.80   0.75   % 196
%           0.45   0.50   0.55   0.60   0.65   0.70   0.75   0.80   0.85   0.90   0.95   1.00   0.95   0.90   0.85   0.80   % 197
%           0.40   0.45   0.50   0.55   0.60   0.65   0.70   0.75   0.80   0.85   0.90   0.95   1.00   0.95   0.90   0.85   % 198
%           0.35   0.40   0.45   0.50   0.55   0.60   0.65   0.70   0.75   0.80   0.85   0.90   0.95   1.00   0.95   0.90   % 199
%           0.30   0.35   0.40   0.45   0.50   0.55   0.60   0.65   0.70   0.75   0.80   0.85   0.90   0.95   1.00   0.95   % 200
%           0.25   0.30   0.35   0.40   0.45   0.50   0.55   0.60   0.65   0.70   0.75   0.80   0.85   0.90   0.95   1.00   % 201
%     ];
% end


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