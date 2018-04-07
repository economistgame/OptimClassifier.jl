### No funciona
t=(1,2,3,3,2,1)
t2=(3,2,1,3,2,1)
function MC(y,yhat)
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
    cm
end
