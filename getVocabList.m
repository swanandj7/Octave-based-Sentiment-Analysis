function vocabList = getVocabList(flag)


if flag==0
fid = fopen('C:\swanand\Octave\Octave-4.0.0\bin\sentimentAnalysis/positive words.txt');
n = 2005;
else
fid = fopen('C:\swanand\Octave\Octave-4.0.0\bin\sentimentAnalysis/negative words.txt');
n=4781;
endif

vocabList = cell(n, 1);
for i = 1:n
    fscanf(fid, '%d', i);
    vocabList{i} = fscanf(fid, '%s', 1);
end
fclose(fid);

end
