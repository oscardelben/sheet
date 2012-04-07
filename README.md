= sheet

Easily create and access sheets from your terminal.

Note: sheet uses the $EDITOR variable to figure out how to open sheets
(for writing).

Examples:

    sheet git # opens git sheet
    sheet git 'undo commit' # opens git sheet, and searches for 'undo commit'
    sheet new git # creates git sheet
    sheet edit git # edit git sheet

Once you open a sheet, you can write whatever you want into it.

### Opening urls

You can use the special format to automatically open a url:

    url: http://example/com

Behind the scenes, sheet stores your sheets in txt files in the
~/.sheets directory. You can go there and modify the files if you want.


== Contributing to sheet
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.
* Please try not to mess with the Rakefile, version, or history. If you want to have your own version, or is otherwise necessary, that is fine, but please isolate to its own commit so I can cherry-pick around it.

== Copyright

Copyright (c) 2012 Oscar Del Ben. See LICENSE.txt for
further details.

