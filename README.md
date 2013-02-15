# CallerId

A ruby wrapper around OpenCNAM api. Lookup cell phone caller ID in supported countries. See http://docs.opencnam.com/#what-s-our-coverage

## Installation

Add this line to your application's Gemfile:

    gem 'caller_id'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install caller_id

## Usage

    c = CallerId::ReversePhoneLookup.new "+1 (202) 456-1414", open_cnam_username, open_cnam_api_key
    # Username and key are optional. Sign up at http://opencnam.com to get them.
    c.lookup
    # {:cnam => "WHITE HOUSE SWI", :number => "2024561414"}

Note: if a number has not yet been mapped by OpenCNAM, you'll get a response containing :retry => true (see the spec).

In that case you should wait a few seconds and then try the call again. You may want to do this in a background queue.

Also note, the "cnam" value returned by a successful lookup is just a caller id string, all caps, with varying semantics.

I've seen:
* [first last]
* [last first]
* [last, first middle]

If you do need to parse it into first and last name, be aware that the string format varies wildly. One possible
approach would be to do this:

    first_and_maybe_middle_initial, last = result[:cname].split(",",2).reverse.join(" ").split(" ",2)

But be warned that this will not always parse them correctly, and that in some cases the string returned might not even be a name
(see the White House example). You might want to treat it as a "best guess" that should then be confirmed via other sources.

If you do not sign up for a username and API key with OpenCNAM, be aware that they currently throttle free requests to 60 per hour.
Also note the username and API keys will soon be associated with a price plan.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
