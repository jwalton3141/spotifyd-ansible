# About

The code in this repository uses [Ansible](https://docs.ansible.com) to
configure [spotifyd](https://spotifyd.rs/), a lightweight, open-source Spotify
client which runs as a UNIX daemon, and supports [the Spotify Connect
protocol](https://developer.spotify.com/documentation/commercial-hardware/implementation/guides/connect-basics).

I run this setup on a headless Raspberry Pi, so that I can control Spotify from
my phone (and other devices on my home network), and have it play through my
(somewhat outdated) [Marantz M-CR603
amplifier](https://www.marantz.com/en-us/product/hi-fi-components/m-cr603).

Although many, if not most modern amplifiers, have built-in streaming
functionality, the M-CR603 doesn't! Despite this, the M-CR603 is
still a very capable and performant amplifier. Fortunately, the combination of
Spotifyd and a Raspberry Pi means I can bring streaming to my existing setup.

## Audio output

Although it is _possible_ to use the Pi's in-built 3.5mm headphone jack to
output audio, the jack's quality is known to be somewhat lacking. Instead, I
bought a [HiFiBerry Digi+ Pro](https://www.hifiberry.com/blog/hifiberry-digi-pro-our-most-advanced-digital-audio-interface/),
and carry audio from that board to my amplifier via optical output (TOSLINK).

## How to use this code

If you'd like to use this code to configure and install Spotifyd on your own
Raspberry Pi device, you can do so by first cloning this repo (forking it
first, if you'd like to keep any changes you make to the config).

_Note that to use Spotifyd, you'll need a premium Spotify account!_

### Usernames and passwords

Spotifyd will need to authenticate against your Spotify account to work. As
such, you'll need to provide Spotifyd your username and password. In this
project, I've used [Ansible
vault](https://docs.ansible.com/ansible/latest/vault_guide/vault.html) to
encrypt and store these credentials, and inject them in plaintext into the
Spotifyd config file at runtime.

Of course, storing credentials in plaintext is only advisable if you're running
Spotifyd on your own Raspberry Pi, with restricted access.

My Raspberry Pi is _not_ accessible via the public internet, and is only
accessible over SSH in my home network. Under these circumstances, I'm happy
storing these credentials in plaintext.

Spotifyd _does_ support storing your Spotify credentials in your OS's keyring
(see the `use-keyring` config option), but the Ansible solution in this project
doesn't support it.

To create an Ansible vault to encrypt and store your Spotify username and
password, begin by creating a password for your Ansible vault, and storing it
in the `.vault_pass` file. You could create a random password for your vault
with:

```sh
tr -dc A-Za-z0-9 </dev/urandom | head -c 24 > .vault_pass
```

`.vault_pass` has been added to this project's [`.gitignore`](./.gitignore) to
prevent it from accidentally ending up in git.

Now you have a vault password, you can create a new vault with

```sh
# Ensure there is no existing Ansible vault
rm group_vars/local

# Create a new Ansible vault
ansible-vault create group_vars/local
```

In the editor which appears, add your username and password as the following variables:

```yml
ansible_vault_spotify_user: <your-username-here>
ansible_vault_spotify_password: <your-password-here>
```

### Installing and configuring

By default, this project is configured to install the latest available version
of Spotifyd. However, it is also possible to configure Ansible to install any
other valid release by editing the variable `spotifyd_version` in the `hosts`
file.

You can then install and configure Spotifyd by running `setup.sh` (you may need
to run `chmod +x setup.sh` first).
