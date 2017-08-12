# aar-methods-count
Simple shell script that shows you a method count of provided AAR library file.

To use it, declare dx location with `export $DX=path_to_dx`, usually that is `$ANDROID_SDK_LOCATION/build-tools/{version}/dx`.

Now, you can call `./main.sh path/to/library.aar`.

This script uses a solution provided on the [StackOverflow](https://stackoverflow.com/a/14026180/4069913).
