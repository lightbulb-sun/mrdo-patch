# Mr. Do! (ColecoVision) patch

## Changes

Makes changes according to
[romhacking.net post #1](https://www.romhacking.net/forum/index.php?topic=36522.msg441531#msg441531)
and
[romhacking.net post #2](https://www.romhacking.net/forum/index.php?topic=36522.msg441803#msg441803)
by SMB2J-2Q:
* Make alphamonsters spawn every 5,000 points instead of 10,000
* Use the following guide for treats:
```
Treat #1: scenes 1, 5-6 and 13-15
Treat #2: scenes 2, 7-8 and 16-18
Treat #3: scenes 3, 9-10 and 19-21
Treat #4: scenes 4, 11-12 and 22+
```
* Use the following guide for treat scoring:
```
Treat #1: 1,000 points
Treat #2: 1,500 points
Treat #3: 2,000 points
Treat #4: 2,500 points
Treat #5: 3,000 points (scenes 5-6)
Treat #6: 3,500 points (scenes 7-8)
Treat #7: 4,000 points (scenes 9-10)
Treat #8: 4,500 points (scenes 11-12)
Treat #9: 5,000 points (scenes 13-15)
Treat #10: 6,000 points (scenes 16-18)
Treat #11: 7,000 points (scenes 19-21)
Treat #12: 8,000 points (scene 22+)
```
* Eighth cherry in a row now worth 500 points, not 500+50

## Download
The latest release can be found on the
[releases page](https://github.com/lightbulb-sun/mrdo-patch/releases).
Patch the original ROM with one of the `.bsdiff`, `.ips` or `.bps` files
to create the hack.

## License
Distributed under the MIT License. See LICENSE for more information.
