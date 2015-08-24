 clear ; close all; clc

 happy_indices  = processText('i am very happy and glad to tell you that our team has won the match we are celebrating tonight Do come and greet us painful',0);
happy_features= extractFeatures(happy_indices,0);
happy_features(834)

