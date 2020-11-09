outdir=/app/sandbox-tests/e2e-results
mkdir -p $outdir
rm -rf $outdir/*
mkdir $outdir/generated-features
mkdir $outdir/tickets
mkdir $outdir/results
while IFS= read -r ticket
do
    if [ "$ticket" != "" ] ; then
        echo "Processing with ticket: $ticket"

        e2e-fetch --ticket $ticket --output-folder $outdir/generated-features

        if [ -f $outdir/generated-features/generated-features/$ticket.feature ]; then
            # Change dynamically env to run on
            dest_env=dev_zibi
            sed "s|\(Given       environment\) \"[^\"]*\" \(from.*$\)|\1 \"$dest_env\" \2|g" \
                $outdir/generated-features/generated-features/$ticket.feature > $outdir/tickets/$ticket.feature
        else
            echo "Can't fetch feature $ticket'"
            exit 1
        fi
    fi
done < e2e-tickets.txt

# run all tests
e2e-behave $outdir/tickets \
           --summary \
           --outfile $outdir/results/test-output.txt \
           --logging-location $outdir/results

