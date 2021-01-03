# -*- coding: utf-8 -*-
"""
Created on Wed Jun  3 18:17:45 2020

@author: earahtp
"""
import numpy as np
import pandas as pd
from sklearn.linear_model import LogisticRegression
#from sklearn.preprocessing import MinMaxScaler


cell_df=pd.read_csv(r'C:\Users\earahtp\Desktop\single ue\mixed_seed_30k_ftp_textfile_single_NBs.txt', sep=' ')
#print(cell_df.head())

y=cell_df.iloc[:,0]
X=cell_df.iloc[:,1:16]

X=np.asarray(X)
y=np.asarray(y)

X=X.tolist()
y=y.tolist()

#cell_df=pd.read_csv(r'C:\Users\earahtp\Desktop\random mover, all beam logs\random_mover_all_beam_logs.csv',sep=';',encoding='utf8')
###cell_df=pd.read_csv(r'C:\Users\earahtp\Desktop\final training data.csv',sep=';',encoding='utf8')
###c=cell_df.iloc[:,:].values
#print(c[2])
#print(cell_df.head());
#values
###X=cell_df.iloc[:,:-1].values
#normalized_X = preprocessing.normalize(X);
#print(normalized_X);
#labels
###y=cell_df.iloc[:,0]
#print(X)

y1=np.asarray(y)
#print(y1)


from sklearn.model_selection import train_test_split
from sklearn.model_selection import cross_val_score
X_train,X_test, y_train,y_test = train_test_split(X,y1,test_size=0.15, random_state=4)

model = LogisticRegression(multi_class='ovr',solver='newton-cg', random_state=1,max_iter=400,class_weight='balanced')
#model = LogisticRegression(solver='lbfgs')
model.fit(X_train,y_train)
#print(model.classes_)
scores = cross_val_score(model, X_test, y_test, cv=10)
print(scores.mean()*100)

y_predict = model.predict(X_test)
print(model.predict(X_test))
print(y_test)
#print(len(y_test))

print(model.score(X_test,y_test))


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
    plt.savefig('lr-cfmatrix.pdf')
    return fig


print_confusion_matrix(cf_matrix, class_names)

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
  
print('accuracy for logistic regression is:')
print(true/(false+true))
print('deviation of 1 is:')
print(deviation/(false+true))