static VALUE

// When Hash#key is called in Ruby, returns key of value that is passed in as argument
// If the value doesn't exist, nil is returned

// 'VALUE value' is assigned the value passed in as an argument from ruby code and in
//    turn passed in as argument to 'rb_hash_key'
// 'VALUE hash' is assigned the hash object, e.g. h = Hash.new and passed
//    in as argument to 'rb_hash_key'
rb_hash_key(VALUE hash, VALUE value)
{
    VALUE args[2]; // Declares 2 arguments for 'VALUE' as passed in. I believe this
                    // creates a 2 element array.

    args[0] = value; // Assigns 1st element in array to the value passed in
    args[1] = Qnil;  // Assigns 2nd element in array to nil

    rb_hash_foreach(hash, key_i, (VALUE)args); // This iterates through each hash that
        // was passed in to map each value to there respective keys and then returns the keys

    return args[1]; // Returns 'nil'. I don't understand how this does not return if the
                    // value to the key is located. It looks as though it always returns.
}
