# Sheet

Easily create and access snippets of text from your terminal. `sheet` is
your own personal wiki.

```bash

gem install sheet
```

Examples:

```bash

sheet           # with no arguments it will just list all your sheets.
sheet list      # lists all your sheets. Equivalent to running sheet with no arguments. Aliased to sheet ls.
sheet git       # opens git sheet
sheet new git   # creates git sheet
sheet edit git  # edit git sheet
sheet copy git  # Copies content of the sheet to the clipboard. Aliased to sheet cp
```

Use `sheet new <term>` to create your first sheet. Useful for jotting
down commands that you use often but somehow never remember.

### Opening urls

Found a great cheat sheet *online* about jquery or your favorite
language? I've got you covered.

When writing your snippet, you can use this special format to
automatically open a url when opening your sheet:

```yaml

url: http://example/com
```

Make sure that's you don't have trailing lines and sheet will
automatically open that url for you

Please note that to open urls, sheet will use the `open` command on mac
os x and `xdg-open` in linux. Patches welcome for other systems.

### Copying sheets

sheet will use either `pbcopy` or `xclip` to copy the content of a sheet
to the clipboard, make sure you have one of those installed (or open an
issue indicating another copy program).

### Behind the scenes

`sheet` stores your sheets in text files in the
`~/.sheets` directory. You can go there and modify the files manually if you desire,
or you can source them into version control and share them across
multiple systems.

For writing files, `sheet` looks for the `$EDITOR` global variable, and
will raise an error if no editor was found.

### Help your stuff is broken

I tested this software in mac os x with Ruby 1.9. If you find any bug
with other platforms/interpreters please let me know and I'll push a
fix.

### Contributing to sheet

* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

### Copyright

Copyright (c) 2012 Oscar Del Ben. See LICENSE.txt for
further details.

