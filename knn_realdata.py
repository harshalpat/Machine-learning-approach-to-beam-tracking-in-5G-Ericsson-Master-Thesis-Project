# -*- coding: utf-8 -*-
"""
Created on Wed Jun  3 17:30:52 2020

@author: earahtp
"""

import numpy as np
import pandas as pd
from sklearn.neighbors import KNeighborsClassifier
#from sklearn.preprocessing import MinMaxScaler


cell_df=pd.read_csv(r'C:\Users\earahtp\Desktop\single ue\mixed_seed_30k_ftp_textfile_single_NBs.txt', sep=' ')
#print(cell_df.head())

y=cell_df.iloc[:,0]
X=cell_df.iloc[:,1:16]

X=np.asarray(X)
y=np.asarray(y)

X=X.tolist()
y=y.tolist()

###cell_df=pd.read_csv(r'C:\Users\earahtp\Desktop\final training data.csv',sep=';',encoding='utf8')
###c=cell_df.iloc[:,:].values
#print(c[2])
#print(cell_df.head());
#values
###X=cell_df.iloc[:,:-1].values


#labels
###y=cell_df.iloc[:,0];
#y=cell_df.loc[:,'BESTNB'].values
#print(y)

#values
#X=cell_df.loc[:,'WB1':'ANGZ']
#print(X)

y1=np.asarray(y)
print(y1)

from sklearn.model_selection import train_test_split
from sklearn.model_selection import cross_val_score
X_train,X_test, y_train,y_test = train_test_split(X,y1,test_size=0.15, random_state=4)


knn = KNeighborsClassifier(n_neighbors=15, metric='minkowski',p=1)# manhattan distance
knn.fit(X_train, y_train)
scores = cross_val_score(knn, X_test, y_test, cv=10)
print(scores.mean()*100)


#testing the accuracy of model
y_predict = knn.predict(X_test)

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
    plt.savefig('knn-cfmatrix.pdf')
    return fig


print_confusion_matrix(cf_matrix, class_names)


#fig=img.get_figure()
#plt.figure(figsize=(20,20))
#fig.savefig('Bigconfusion matrix', dpi=400)





print(y_predict) #predicted by model
print(y_test)  # actual output
true=0
false=0
deviation=0
for i in range(len(y_predict)):
    
    if(y_predict[i]==y_test[i]):
        true=true+1
    else:
        false=false+1
        if(y_predict[i]==y_test[i]+1 or y_predict[i]==y_test[i]-1):
            deviation=deviation+1
            

print('accuracy for knn is:')
print(true/(false+true))
print('deviation of 1 is:')
print(deviation/(false+true))



