function a = quick_sort(a, p, r) 
if(p < r) 
    %   以a[p]为基准元素将a[p,…,r]划分为3段, 并获得下标q. 
    [a, q] = partition(a, p, r);  
    %   递归调用. 对左半段数组进行排序. 
    a = quick_sort(a, p, q-1); 
 %   递归调用. 对右半段数组进行排序. 
    a = quick_sort(a, q+1, r); 
end; 


function [b, q] = partition(a, p, r) 
i = p; j = r;   %   获得最左下标i和最右下标j. 
ref = a(p);     %   以元素a[p]作为基准ref. 
%   将不大于ref的元素交换到左边区域,  
%   将不小于ref的元素交换到右边区域. 
while(1) 
    %   从数组左端开始扫描,找到不小于ref的元素的下标i 
    while(a(i)<ref)  
        i = i + 1;           %   向右扫描. 
        if(i>=r) break;  end;%   如果到数组右端,则跳出循环 
    end; 
    %   从数组右端开始扫描,找到不大于ref的元素的下标i 
    while(a(j)>ref) 
        j = j-1;        %   向左扫描 
    end; 
    if(i>=j) break; end; %   如果i>=j, 跳出循环. 
    %   交换a(i)和a(j)的值 
    a = swap(a, i, j); 
end; 
%   计算函数返回值. 
b = a; 
q = j; 
%disp(num2str(a));   %   显示处理结果. 

function b = swap(a, i, j) 
tmp = a(i); a(i)=a(j); a(j) = tmp; 
b = a; 

