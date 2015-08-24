clear ; close all; clc
fprintf('\nSample text (happy.txt)\n');

text = readFile('happy.txt');

happy_indices  = processText(text,0);
sad_indices  = processText(text,1);
fprintf('Happy indices: \n');
fprintf(' %d', happy_indices);
fprintf('\n\n');

fprintf('Sad indices: \n');
fprintf(' %d', sad_indices);
fprintf('\n\n');


happy_features= extractFeatures(happy_indices,0);
sad_features= extractFeatures(sad_indices,1);
happy_features=happy_features';

fprintf('Length of Happy feature vector: %d\n', length(happy_features));
fprintf('Number of non-zero entries: %d\n', sum(happy_features > 0));

fprintf('Length of Sad feature vector: %d\n', length(sad_features));
fprintf('Number of non-zero entries: %d\n', sum(sad_features > 0));

C = 0.1;
phappy5 = phappy3 = phappy1 = 0;
psad5 = psad3= psad1 = 0;

%happy
if length(happy_indices)>0
  yhappy5=zeros(5000,1);
  yhappy5(1:2500)=1;

  yhappy3=zeros(5000,1);
  yhappy3(1:2500)=1;

  yhappy1=zeros(5000,1);
  yhappy1(1:2500)=1;

  Xhappy5 = TestData5(2005);
  Xhappy5=Xhappy5';

  Xhappy3 = TestData3(2005);
  Xhappy3=Xhappy3';

  Xhappy1 = TestData1(2005);
  Xhappy1=Xhappy1';
  %happy
  fprintf('\nTraining Linear SVM (Emotion Classifier #happy5)\n');
  modelhappy5 = svmTrain(Xhappy5, yhappy5, C, @linearKernel);
  p = svmPredict(modelhappy5, Xhappy5);
  fprintf('Training Accuracy(Emotion Classifier #happy5): %f\n', mean(double(p == yhappy5)) * 100);

  fprintf('\nTraining Linear SVM (Emotion Classifier #happy3)\n');
  modelhappy3 = svmTrain(Xhappy3, yhappy3, C, @linearKernel);
  p = svmPredict(modelhappy3, Xhappy3);
  fprintf('Training Accuracy(Emotion Classifier #happy3): %f\n', mean(double(p == yhappy3)) * 100);

  fprintf('\nTraining Linear SVM (Emotion Classifier #happy1)\n');
  modelhappy1 = svmTrain(Xhappy1, yhappy1, C, @linearKernel);
  p = svmPredict(modelhappy1, Xhappy1);
  fprintf('Training Accuracy(Emotion Classifier #happy1): %f\n', mean(double(p == yhappy1)) * 100);

  phappy5 = svmPredict(modelhappy5,happy_features); 
  phappy3 = svmPredict(modelhappy3,happy_features);
  phappy1 = svmPredict(modelhappy1,happy_features);

 endif
%sad
if length(sad_indices)>0
ysad5=zeros(500,1);
ysad5(1:250)=1;

ysad3=zeros(500,1);
ysad3(1:250)=1;

ysad1=zeros(500,1);
ysad1(1:250)=1;

Xsad5 = TestData5(4781);
Xsad5=Xsad5';

Xsad3 = TestData3(4781);
Xsad3=Xsad3';

Xsad1 = TestData1(4781);
Xsad1=Xsad1';



%sad

fprintf('\nTraining Linear SVM (Emotion Classifier #sad5)\n');
modelsad5 = svmTrain(Xsad5, ysad5, C, @linearKernel);
p = svmPredict(modelsad5, Xsad5);
fprintf('Training Accuracy(Emotion Classifier #sad5): %f\n', mean(double(p == ysad5)) * 100);

fprintf('\nTraining Linear SVM (Emotion Classifier #sad3)\n');
modelsad3 = svmTrain(Xsad3, ysad3, C, @linearKernel);
p = svmPredict(modelsad3, Xsad3);
fprintf('Training Accuracy(Emotion Classifier #sad3): %f\n', mean(double(p == ysad3)) * 100);

fprintf('\nTraining Linear SVM (Emotion Classifier #sad1)\n');
modelsad1 = svmTrain(Xsad1, ysad1, C, @linearKernel);
p = svmPredict(modelsad1, Xsad1);
fprintf('Training Accuracy(Emotion Classifier #sad1): %f\n', mean(double(p == ysad1)) * 100);

psad5 = svmPredict(modelsad5,sad_features);
psad3 = svmPredict(modelsad3,sad_features);
psad1 = svmPredict(modelsad1,sad_features);
endif