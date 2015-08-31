function vocabList = getVocabList(flag)

if flag==0
fid = fopen('positive words.txt');
n=2005;

else
fid = fopen('negative words.txt');
n=4781;
endif

vocabList = cell(n, 1);
for i = 1:n
    fscanf(fid, '%d', 1);
    vocabList{i} = fscanf(fid, '%s', 1);
end
fclose(fid);

end
