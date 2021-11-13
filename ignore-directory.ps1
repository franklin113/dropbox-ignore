write-host "There are a total of $($args.count) paths to ignore"
for ( $i = 0; $i -lt $args.count; $i++ ) {
    write-host "Ignoring $($args[$i])"
    Set-Content -Path $args[$i] -Stream com.dropbox.ignored -Value 1
}