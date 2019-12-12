function [new_case] = reuse2(case_library, new_case, similarityTable, NewCol)

    PricesCouncilArea = [10944.2 3599.8;
                         10906.6 2630.2;
                         10094.5 3346.1;
                         9871.2 2004.2;
                         9779.0 5050.3;
                         8911.2 2433.7;
                         8904.0 2815.5;
                         7882.5 2906.8;
                         7582.3 2667.4;
                         7334.3 2484.6;
                         7161.6 1916.6;
                         7057.8 2547.2;
                         6914.4 2117.4;
                         6588.9 2602.4;
                         6561.9 1982.4;
                         6344.5 1713.8;
                         6048.3 2023.2;
                         5845.8 1297.6;
                         5246.0 1194.7;
                         5141.5 1248.3;
                         4578.8 1264.2;
                         4249.8 1082.1;
                         4139.5 1035.8;
                         4133.2 1168.1;
                         4018.7 1070;
                         3993.3 58.4;
                         3725.4 1263.9;
                         3635.7 1038.2;
                         2642.7 785.7];
    
%PASSO 1: crie a estrutura FIS de nome fis_gorjeta
%COMPLETAR
fis_price = newfis('price');

%PASSO 2: criar variaveis linguisticas
fis_price=addvar(fis_price,'input','councilArea',[0 29]);
fis_price=addvar(fis_price,'output','priceProperty',[2000 12000]);
fis_price=addvar(fis_price,'output','priceLand',[0 6000]);
%COMPLETAR

%PASSO 3: fun??es de perten?a para cada vari?vel criada anteriormente
fis_price=addmf(fis_price,'input',1,'Port Phillip City Council','gaussmf',[1.5 0]);
fis_price=addmf(fis_price,'input',1,'Stonnington City Council','gaussmf',[1.5 1]);
fis_price=addmf(fis_price,'input',1,'Boroondara City Council','gaussmf',[1.5 2]);
fis_price=addmf(fis_price,'input',1,'Yarra City Council','gaussmf',[1.5 3]);
fis_price=addmf(fis_price,'input',1,'Melbourne City Council','gaussmf',[1.5 4]);
fis_price=addmf(fis_price,'input',1,'Monash City Council','gaussmf',[1.5 5]);
fis_price=addmf(fis_price,'input',1,'Bayside City Council','gaussmf',[1.5 6]);
fis_price=addmf(fis_price,'input',1,'Glen Eira City Council','gaussmf',[1.5 7]);
fis_price=addmf(fis_price,'input',1,'Darebin City Council','gaussmf',[1.5 8]);
fis_price=addmf(fis_price,'input',1,'Moreland City Council','gaussmf',[1.5 9]);
fis_price=addmf(fis_price,'input',1,'Whitehorse City Council','gaussmf',[1.5 10]);
fis_price=addmf(fis_price,'input',1,'Moonee Valley City Council','gaussmf',[1.5 11]);
fis_price=addmf(fis_price,'input',1,'Maribyrnong City Council','gaussmf',[1.5 12]);
fis_price=addmf(fis_price,'input',1,'Hobsons Bay City Council','gaussmf',[1.5 13]);
fis_price=addmf(fis_price,'input',1,'Manningham City Council','gaussmf',[1.5 14]);
fis_price=addmf(fis_price,'input',1,'Banyule City Council','gaussmf',[1.5 15]);
fis_price=addmf(fis_price,'input',1,'Kingston City Council','gaussmf',[1.5 16]);
fis_price=addmf(fis_price,'input',1,'Maroondah City Council','gaussmf',[1.5 17]);
fis_price=addmf(fis_price,'input',1,'Greater Dandenong City Council','gaussmf',[1.5 18]);
fis_price=addmf(fis_price,'input',1,'Knox City Council','gaussmf',[1.5 19]);
fis_price=addmf(fis_price,'input',1,'Brimbank City Council','gaussmf',[1.5 20]);
fis_price=addmf(fis_price,'input',1,'Casey City Council','gaussmf',[1.5 21]);
fis_price=addmf(fis_price,'input',1,'Frankston City Council','gaussmf',[1.5 22]);
fis_price=addmf(fis_price,'input',1,'Nillumbik Shire Council','gaussmf',[1.5 23]);
fis_price=addmf(fis_price,'input',1,'Hume City Council','gaussmf',[1.5 24]);
fis_price=addmf(fis_price,'input',1,'Macedon Ranges Shire Council','gaussmf',[1.5 25]);
fis_price=addmf(fis_price,'input',1,'Whittlesea City Council','gaussmf',[1.5 26]);
fis_price=addmf(fis_price,'input',1,'Wyndham City Council','gaussmf',[1.5 27]);
fis_price=addmf(fis_price,'input',1,'Melton City Council','gaussmf',[1.5 28]);
 
%priceProperty
fis_price=addmf(fis_price,'output',1,'muito baixo','gaussmf',[1.5 2000]);
fis_price=addmf(fis_price,'output',1,'baixo','gaussmf',[1.5 4000]);
fis_price=addmf(fis_price,'output',1,'medio','gaussmf',[1.5 6000]);
fis_price=addmf(fis_price,'output',1,'alto','gaussmf',[1.5 8000]);
fis_price=addmf(fis_price,'output',1,'muito alto','gaussmf',[1.5 10000]);

%priceLand 
fis_price=addmf(fis_price,'output',2,'muito baixo','gaussmf',[1.5 0]);
fis_price=addmf(fis_price,'output',2,'baixo','gaussmf',[1.5 1200]);
fis_price=addmf(fis_price,'output',2,'medio','gaussmf',[1.5 2400]);
fis_price=addmf(fis_price,'output',2,'alto','gaussmf',[1.5 3600]);
fis_price=addmf(fis_price,'output',2,'muito alto','gaussmf',[1.5 4800]);


regras=[1 5 3 1 0; 2 5 4 1 0; 3 5 3 1 0; 4 4 2 1 0; 5 4 5 1 0; 6 4 3 1 0; 7 4 3 1 0; 8 3 3 1 0; ...
        9 3 3 1 0; 10 3 3 1 0; 11 3 2 1 0; 12 3 3 1 0; 13 3 2 1 0; 14 3 3 1 0; 15 3 2 1 0; 16 3 2 1 0; ...
        17 3 2 1 0; 18 2 2 1 0; 19 2 2 1 0; 20 2 2 1 0; 21 2 2 1 0; 22 2 1 1 0; 23 2 1 1 0; 24 2 1 1 0; ...
        25 2 1 1 0; 26 1 1 1 0; 27 1 2 1 0; 28 1 1 1 0; 29 1 1 1 0];
fis_price = addrule(fis_price, regras);

%PASSO 5: avaliar novos valores inseridos de servico e comida com evalfis

bigger = 0;
for i=1:size(NewCol)
    entrada = [i];
    price = evalfis(entrada, fis_price);

    if(bigger < NewCol(i))
        bigger = NewCol(i);
        priceBigger = price;
        indexBigger = i;
    end
end

new_case.price = ((priceBigger(1) * new_case.buildingArea) + (priceBigger(2) * new_case.landSize));


disp(new_case.price);

end