static VALUE // This is a static variable and can correspond to any value part of a hash

// This is the c function that is called when Hash#new is called to create a hash
// 'int argc' contains the count of arguments passed to the function
// 'VALUE *argv' allows any number of arguments as strings to be passed in as an array
// 'VALUE hash' is a single argument
// These arguments are assigned to 'VALUE' if passed on initialization

rb_hash_initialize(int argc, VALUE *argv, VALUE hash)
{
    VALUE ifnone;
    rb_hash_modify(hash); // This function adds hash to a 'hash table'
    if (rb_block_given_p()) {  // Checks to see if a block has been passed?
        rb_check_arity(argc, 0, 0);  // Can't find this function but I think this checks for
                                    //  the number of arguments passed to the Hash#new method
        ifnone = rb_block_proc();
        default_proc_arity_check(ifnone);
        RHASH_SET_IFNONE(hash, ifnone);
        FL_SET(hash, HASH_PROC_DEFAULT);
    }
    else {
        rb_check_arity(argc, 0, 1);
        ifnone = argc == 0 ? Qnil : argv[0];
        RHASH_SET_IFNONE(hash, ifnone);
    }

    // If I understand this initialize function correctly, the conditional statement on lines 12
    //  through 24 handles no arguments, default values passed as arguments, or blocks that are
    //  passed as arguments when Hash#new is called.
    return hash; // => {}
}

static void
rb_hash_modify_check(VALUE hash) // This function performs a validation check on the hash
{
    rb_check_frozen(hash);  // This checks to see if hash object is mutable or not
    if (!OBJ_UNTRUSTED(hash) && rb_safe_level() >= 4)
    rb_raise(rb_eSecurityError, "Insecure: can't modify hash"); // Raises error if mutable
}

// Lines 36 through 43 creates a hash lookup table for mapping. This table stores the hashes created.
struct st_table *
rb_hash_tbl(VALUE hash)
{
    if (!RHASH(hash)->ntbl) {
        RHASH(hash)->ntbl = st_init_table(&objhash);
    }
    return RHASH(hash)->ntbl;
}

static void
rb_hash_modify(VALUE hash) // Modifies the hash stored in the hash table
{
    rb_hash_modify_check(hash);
    rb_hash_tbl(hash);
}

// Here is a summary of what's going on in the above code. This is how hashes are initialized
//  when Hash#new is called or a variable is set to the hash literal '{}'. If no arguments are passed,
//  then accessing the hash will return nil, example:
//      h = Hash.new
//      h["a"] => nil
// Only one argument may be passed which will be set as the default value:
//      h = Hash.new("foo")
//      h["a"] => "foo"
//  or multiple key, value pairs may be passed in:
//      h = Hash.new("a" => 2, "b" => 5)
//      h["a"] => {"a" => 2, "b" => 5}
// A block may also be passed in.
