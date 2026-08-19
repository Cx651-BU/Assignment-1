binary=test-mini

make clean; make

if [[ ! -a $binary ]]; then
    echo "FAIL: $binary not made"
    echo "SCORE: 0/7"
    exit -1
fi
score=0


for (( i = 0; i < 3; i++ )); do
    echo "TEST: ./test-mini $i"
    ./test-mini $i > /dev/null
    if [ "$?" -eq 1 ]; then
    ((score+=1))
    else
    echo "  --FAIL!"
    fi
done

echo "TEST: ./test-mini2 3"
./test-mini2 3 > /dev/null
if [ "$?" -eq 1 ]; then
((score+=1))
else
    echo "  --FAIL!"
fi

echo "TEST: ./calc"
out=$(./calc)
if [ "$out" == "1517" ]; then
    ((score+=1))
else
    echo "  --FAIL!"
fi

echo "TEST: ./caller"
out=$(./caller 2>err.txt)
[[ "$out" == "hello STDOUT" && "$(cat err.txt)" == "ERROR: this is an error" ]] \
  && ((score+=1)) ||  echo "  --FAIL!"
rm -f err.txt

echo "TEST: questions.txt is non-empty and contains questions (1) through (N)"
N=2
if [ -f questions.txt ] && [ "$(wc -c < questions.txt)" -gt 200 ]; then
    passed=true
    for ((i=1; i<=N; i++)); do
        if ! grep -q "^($i)" questions.txt; then
            echo "  --FAIL: questions.txt missing ($i)"
            passed=false
        fi
    done
    if $passed; then
        ((score+=1))
    fi
else
    echo "  --FAIL!"
fi

echo "SCORE: $score/7"
