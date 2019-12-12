function retain(new_case, historical, case_library)

    h = SaveProperties(historical);
    
    [rows columns] = size(case_library);
    
    historical = table2cell(historical);
    
    answer = get(h, 'String');
    if(strcmp(answer, 'Save') == 0)
        pos = strcat('A', int2str(rows + 2));
        xlswrite('11Melbourne_Samples.xlsx',historical,'RapidMiner Data', pos);
    end

end