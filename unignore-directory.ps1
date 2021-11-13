write-host "There are a total of $($args.count) paths to unignore"
for ( $i = 0; $i -lt $args.count; $i++ ) {
    write-host "Ignoring $($args[$i])"
    Clear-Content -Path $args[$i] -Stream com.dropbox.ignored
}