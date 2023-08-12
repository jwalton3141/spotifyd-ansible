# About

The code in this repository uses Ansible to configure spotifyd, an open-source
Spotify client which runs as a UNIX daemon.

I run this setup on a headless Raspberry Pi, so that I can control Spotify
from my phone, and have it play through my Marantz M-CR603 amplifier.

Although many, if not most modern amplifiers, have built-in streaming
functionality these days, my somewhat outdated Marantz doesn't. Despite this,
the M-CR603 is still a capable and performant amplifier. So, rather than
throwing the baby out with the bathwater, and buying a new amplifier just to
unlock spotify streaming, I use spotifyd and a Raspberry Pi to bring streaming
to my existing setup.

## Audio output

Although it is _possible_ to use the Pi's in-built 3.5mm headphone jack to
output audio, the jack's quality is known to be somewhat lacking.  Instead, I
bought a HiFiBerry Digi+ Pro, and output audio that way.
