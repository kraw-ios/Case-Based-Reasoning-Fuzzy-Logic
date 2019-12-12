function [new_case] = reuse1(case_library, retrieved_cases, similarities, new_case, similarityTable, NewCol)

    
    best = similarityTable(1,:);
    price = table2array(best(1, 4));
    
    h = ReuseSimilar(best);
    
    answer = get(h, 'String');
    if(strcmp(answer, 'Save') == 0)
        new_case.price = price(1);
    end
    if(strcmp(answer, 'Calculate Price') == 0)
        [new_case] = reuse2(case_library, new_case, similarityTable, NewCol);
        new_case.price = (new_case.price + price(1))/2;
    end

        
     disp(answer);
     disp(new_case);
%     fprintf(['Based on the attributes Number of Persons and Duration of the retrieved cases,\n', ...
%                 'the estimated price for the new case is %.2f, instead of %.2f.'], new_price, new_case.price);

end