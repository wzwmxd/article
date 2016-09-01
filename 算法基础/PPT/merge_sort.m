function [ vec ] = merge_sort( vec )
%FUSION Merge Sort
% This function executes what I think is
% the merge sort algorithm invented by
% John von Neumann in 1945.
%
% It should be used like this:
% sorted = fusioned( somevector )
%
%
% @ ACx // February 2013



tam = length(vec);

if tam == 2
    
    if vec(1) > vec(2)
        t = vec(1);
        vec(1) = vec(2);
        vec(2) = t;
    end
    
elseif tam == 3
    
    lvec = vec(1:round(tam/2));
    rvec = vec(3);
    lvec = merge_sort(lvec);
    
    for i = 1:2
        if lvec(i) > rvec
            t = lvec(i);
            lvec(i) = rvec;
            rvec = t;
        end
    end
    vec = [lvec rvec];
    
elseif tam >= 4
    lvec = vec(1:round(tam/2));
    rvec = vec(round(tam/2)+1:tam);
    
    lvec = merge_sort(lvec);
    rvec = merge_sort(rvec);
    
    ltam = length(lvec);
    rtam = length(rvec);
    
    
    cl = 1;
    cr = 1;
    cv = 1;
    valid = true;
    
    while valid
        
        if cl <= ltam &&  cr <= rtam
            if lvec(cl) <= rvec(cr)
                vec(cv) = lvec(cl);  lvec(cl)=0;
                cl = cl + 1;
                cv = cv + 1;
            elseif lvec(cl) > rvec(cr)
                vec(cv) = rvec(cr);   rvec(cr)=0;
                cr = cr + 1;
                cv = cv + 1;
            end
            
        elseif cv <= tam
            if cl > ltam
                vec(cv) = rvec(cr);   rvec(cr)=0;
                cr = cr + 1;
                cv = cv + 1;
                
            elseif cr > rtam
                vec(cv) = lvec(cl);  lvec(cl)=0;
                cl = cl + 1;
                cv = cv + 1;
            end
            
        else
            valid = false;
        end
    end
    
end
