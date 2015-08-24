function x = extractFeatures(word_indices,flag)

if flag==0
n = 2005;
else
n=4781;
endif

x = zeros(n, 1);

for i = 1: length(word_indices)

	x(word_indices(i))=1;
end;


end
