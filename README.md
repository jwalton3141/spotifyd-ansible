# About

The code in this repository uses [Ansible](https://ansible.com) to configure
[spotifyd](https://github.com/Spotifyd/spotifyd), an open-source Spotify client
which runs as a UNIX daemon.

I run this setup on a headless Raspberry Pi, so that I can control Spotify
from my phone, and have it play through my (somewhat outdated) [Marantz M-CR603
amplifier](https://www.marantz.com/en-us/product/hi-fi-components/m-cr603).

Although many, if not most modern amplifiers, have built-in streaming
functionality these days, my Marantz doesn't. Despite this, the M-CR603 is
still a very capable and performant amplifier. So, rather than throwing the
baby out with the bathwater, and buying a new amplifier just to unlock spotify
streaming, I use spotifyd and a Raspberry Pi to bring streaming to my existing
setup.

## Audio output

Although it is _possible_ to use the Pi's in-built 3.5mm headphone jack to
output audio, the jack's quality is known to be somewhat lacking.  Instead, I
bought a [HiFiBerry Digi+ Pro](https://www.hifiberry.com/blog/hifiberry-digi-pro-our-most-advanced-digital-audio-interface/),
and output audio that way.
