#t = [1,2,3,3,2,1,4,4,5,6]
#t2= [3,2,1,3,2,1,5,6,7,4]
#R = MC(t,t2)

function MC(y,yhat, metrics = false)
    # Generate confusion matrix
    classes = unique(append!(unique(y), unique(yhat)))
    cm = zeros(Int64,length(classes),length(classes))

    for i in 1:length(t)
        # translate label to index
        true_class = findfirst(classes,y[i])
        pred_class = findfirst(classes,yhat[i])
        # pred class is the row, true class is the column
        cm[pred_class,true_class] += 1
    end
    if(metrics=true)
       Success_rate = sum(Diagonal(cm))/sum(cm)
       tI_error = (sum(UpperTriangular(cm))-sum(Diagonal(cm)))/sum(cm)
       tII_error = (sum(LowerTriangular(cm))-sum(Diagonal(cm)))/sum(cm)
       Prevalence = colSums(cm)/sum(cm)

       ## Sensitivity Function
       function Sensitivity_F(N,Matrix)
           Diagonal(Matrix)[N]/colSums(Matrix)[N]
       end
       ## Specificity Function
       function Specificity_F(N,Matrix)
           (sum(Diagonal(Matrix))-Diagonal(Matrix)[N])/(sum(colSums(Matrix))-sum(colSums(Matrix)[N]))
       end
       ## Precision Function
       function Precision_F(N,Matrix)
           Diagonal(Matrix)[N]/ sum(Diagonal(Matrix))
       end
       Sensitivity = map(x -> Sensitivity_F(x,cm), 1:length(Prevalence))
       #Try new values
       Specificity = map(x -> Specificity_F(x,cm), 1:length(Prevalence))
       Precision = map(x -> Precision_F(x,cm), 1:length(Prevalence))
    end
    
    return cm
end
