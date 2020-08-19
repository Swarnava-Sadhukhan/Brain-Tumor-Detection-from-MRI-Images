clc
close all
clear all

p='brain_tumor_dataset/no/'
for z=1:91
    str = strcat(p,int2str(z));
    str = strcat(str,'.jpg');
    %[I,path]=uigetfile('*.jpg','select a input image');
    %str=strcat(path,I);
    s=imread(str);
    

    num_iter = 10;
        delta_t = 1/7;
        kappa = 15;
        option = 2;
        %disp('Preprocessing image please wait . . .');
        inp = anisodiff_function(s,num_iter,delta_t,kappa,option);
        inp = uint8(inp);

    inp=imresize(inp,[256,256]);
    if size(inp,3)>1
        inp=rgb2gray(inp);
    end

    sout=imresize(inp,[256,256]);
    t0=mean(s(:));
    th=t0+((max(inp(:))+min(inp(:)))./2);
    for i=1:1:size(inp,1)
        for j=1:1:size(inp,2)
            if inp(i,j)>th
                sout(i,j)=1;
            else
                sout(i,j)=0;
            end
        end
    end

    label=bwlabel(sout);
    stats=regionprops(logical(sout),'Solidity','Area','BoundingBox');
    density=[stats.Solidity];
    area=[stats.Area];
    high_dense_area=density>0.7;
    max_area=max(area(high_dense_area));
    %tumor_label=find(area==max_area);
    %tumor=ismember(label,tumor_label);

    if max_area>200
       disp(str)
    else
        
    end
            
end


