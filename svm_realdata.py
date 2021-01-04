# -*- coding: utf-8 -*-
"""
Created on Mon Jun  1 13:15:04 2020

@author: earahtp
"""

import numpy as np
import pandas as pd

cell_df=pd.read_csv(r'C:\Users\earahtp\Desktop\single ue\mixed_seed_30k_ftp_textfile_single_NBs.txt', sep=' ')
#print(cell_df.head())

y=cell_df.iloc[:,0]
X=cell_df.iloc[:,1:16]

X=np.asarray(X)
y=np.asarray(y)

X=X.tolist()
y=y.tolist()

#from sklearn import preprocessing 
#from sklearn.preprocessing import MinMaxScaler

###cell_df=pd.read_csv(r'C:\Users\earahtp\Desktop\only random mover in WB8.csv',sep=';',encoding='utf8')
###c=cell_df.iloc[:,:].values
#print(c[2])
#print(cell_df.head());
#values
###X=cell_df.iloc[:,:-1].values
#normalized_X = preprocessing.normalize(X);
#print(normalized_X);
#labels
###y=cell_df.iloc[:,0]
oned_y=np.asarray(y);
#reshaped_y=np.reshape(oned_y,(-1,1))
#print(reshaped_y);
normal_y=oned_y;

#scaler = MinMaxScaler()
#normalize_y = scaler.fit_transform(reshaped_y)
#normalized_y=normalize_y.flatten();
#print(normal_y);
    

from sklearn.model_selection import train_test_split
X_train,X_test, y_train,y_test = train_test_split(X,normal_y,test_size=0.15, random_state=4)


from sklearn import svm
from sklearn.model_selection import cross_val_score
classifier = svm.SVC(kernel = 'linear', gamma='auto',C=2)  #linear,polynomial,radial basis function(rbf) and sigmoid
classifier.fit(X_train,y_train)
scores = cross_val_score(classifier, X_test, y_test, cv=10)
print(scores.mean()*100)
y_predict = classifier.predict(X_test)


print(classifier)
print(y_predict) #predicted by model
print(y_test)  # actual output
#print(classifier.support_vectors_)

##confusion matrix


#matrix_data=pd.DataFrame(cell_df, y_test,y_predict)
#confusion_matrix = pd.crosstab(y_test,y_predict,rownames=['Actual'], colnames=['Predicted'], margins = True)
#sns.heatmap(confusion_matrix, annot = True)
#plt.show()


##confusion matrix
from sklearn.metrics import confusion_matrix
import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
cf_matrix=confusion_matrix(y_test,y_predict)
#class_names=['1','2','3','4','5','6','7','8','9','10','11','12']
class_names=['12','11','10','9','8','7','6','5','4','3','2','1']

def print_confusion_matrix(confusion_matrix, class_names, figsize = (12,9), fontsize=14):

    df_cm = pd.DataFrame(
        confusion_matrix, index=class_names, columns=class_names, 
    )
    fig = plt.figure(figsize=figsize)
    try:
        heatmap = sns.heatmap(df_cm, annot=True, fmt="d",cmap='Blues') #,linewidths=1 for gaps b/w blocks
        bottom, top = heatmap.get_ylim()
        heatmap.set_ylim(bottom + 0.5, top - 0.5)
    except ValueError:
        raise ValueError("Confusion matrix values must be integers.")
    heatmap.yaxis.set_ticklabels(heatmap.yaxis.get_ticklabels(), rotation=0, ha='right', fontsize=fontsize)
    heatmap.xaxis.set_ticklabels(heatmap.xaxis.get_ticklabels(), rotation=0, ha='right', fontsize=fontsize)
    plt.ylabel('True label')
    plt.xlabel('Predicted label')
    plt.tight_layout()
    plt.savefig('svm-cfmatrix.pdf')
    return fig


print_confusion_matrix(cf_matrix, class_names)


true=0
false=0
for i in range(len(y_predict)):
    
    if(y_predict[i]==y_test[i]):
        true=true+1
    else:
        false=false+1

print('accuracy for svm is')
print(true/(false+true))
dev=0
for i in range(len(y_predict)-1):
    if(y_predict[i]==y_test[i]+1 or y_predict[i]==y_test[i]-1):
        dev=dev+1
print('deviation of 1 is ',(dev/len(y_test))*100)

dev2=0
for i in range(len(y_predict)-1):
    if(y_predict[i]==y_test[i]+2 or y_predict[i]==y_test[i]-2):
        dev2=dev2+1
print('deviation of 2 is ',(dev2/len(X))*100)
