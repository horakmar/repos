# Returns last part of pathname (usually filename)
sub BaseName {
    return substr($path, rindex($path, '/')+1);
}
