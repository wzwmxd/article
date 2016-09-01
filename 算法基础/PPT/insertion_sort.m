function sorted = insertion_sort(unsorted)
    array_size = size(unsorted,2);
    for pivot = 2:array_size
	key = unsorted(pivot);
	j = pivot - 1;
	while (j > 0 && unsorted(j) > key)
		unsorted(j + 1) = unsorted(j);
	j = j - 1;
	end
	unsorted(j + 1) = key;
    end
    sorted = unsorted;
end
