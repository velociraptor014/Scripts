arg1=$1
result=$arg1

for i in 0 2 4 6 8 10
do
    result=`expr $result + $i`
    echo "$i and $result"
    sleep 0.20
done

echo "result 1->10 : $result"

for i in 0 2 4 6 8 10
do
    result=`expr $result - $i`
    echo "$i and $result"
    sleep 0.20
done

echo "result 1->10 : $result"

for i in 0 2 4 6 8 10
do
    result=`expr $result + $i`
    echo "$i and $result"
    sleep 0.20
done

echo "result 1->10 : $result"

for i in 0 2 4 6 8 10
do
    result=`expr $result - $i`
    echo "$i and $result"
    sleep 0.20
done

echo "result 1->10 : $result"