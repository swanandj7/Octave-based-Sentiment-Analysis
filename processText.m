function word_indices = processText(text,flag)

if flag == 0
vocabHappy = getVocabList(0);
else
vocabSad = getVocabList(1);
endif


word_indices = [];
text = lower(text);

text = regexprep(text, '<[^<>]+>', ' ');
text = regexprep(text, '[0-9]+', 'number');
text = regexprep(text, ...
                           '(http|https)://[^\s]*', 'httpaddr');

text = regexprep(text, '[^\s]+@[^\s]+', 'emailaddr');

text = regexprep(text, '[$]+', 'dollar');
fprintf('\n==== Processed text ====\n\n');

l = 0;
while ~isempty(text)
   [str, text] = ...
       strtok(text, ...
              [' @$/#.-:&*+=[]?!(){},''">_<;%' char(10) char(13)]);
   
    str = regexprep(str, '[^a-zA-Z0-9]', '');
 

    if length(str) < 1
       continue;
    end

    if flag==0

	     for i = 1: length(vocabHappy)
		     if(strcmp(str,vocabHappy{i}))
			      word_indices = [word_indices;i];
		      end;
	     end;

 
    else
 
      for i = 1: length(vocabSad)

		    if(strcmp(str,vocabSad{i}))
			    word_indices = [word_indices;i];
		    end;
	    end;
    endif


    if (l + length(str) + 1) > 78
        fprintf('\n');
        l = 0;
    end
    fprintf('%s word indices\n\n\n', str);
    l = l + length(str) + 1;

end


end
