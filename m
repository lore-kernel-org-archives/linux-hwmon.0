Return-Path: <wsa@the-dreams.de>
Return-path: <wsa@the-dreams.de>
Date: Thu, 18 Oct 2018 20:07:21 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Rob Herring <robh@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Wojciech Slenska <wojciech.slenska@gmail.com>,
	Jean Delvare <jdelvare@suse.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Linux HWMON List <linux-hwmon@vger.kernel.org>,
	devicetree@vger.kernel.org, Linux I2C <linux-i2c@vger.kernel.org>
Subject: Re: [PATCH v2] hwmon: (sht3x) add devicetree support
Message-ID: <20181018180721.GA941@kunai>
References: <1538717915-22294-1-git-send-email-wojciech.slenska@gmail.com>
 <20181012202829.GA24897@bogus>
 <CAMYPSMqVHYYLpTmk5ACktKCms3yGFXXs9_m4xOGyVpq3VVSigg@mail.gmail.com>
 <20181015195440.GA21968@roeck-us.net>
 <CAL_JsqKzwhnQUbF3vOTU3pDCLPQQL33TbgWqrFf1bzRt8VmMgw@mail.gmail.com>
 <20181016233821.GA1662@roeck-us.net>
 <CAL_JsqK42DkjRjG81Yi=qmhPZx=RUT0oe-z4zJOxB__MqGgihw@mail.gmail.com>
 <20181018144141.GA3963@roeck-us.net>
 <CAL_JsqK62Yi9+w=06LrsiDCgLp9W0WmfYTL9QCv98Qfij7Zbbw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
In-Reply-To: <CAL_JsqK62Yi9+w=06LrsiDCgLp9W0WmfYTL9QCv98Qfij7Zbbw@mail.gmail.com>
List-ID: <linux-hwmon@vger.kernel.org>


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi,

> And here's another device with programmable clock stretching[1]. Lots
> of discussions in searching about masters not supporting clock
> stretching more than I found of slaves which are configurable. At
> least in that case, we should be able to derive it from master
> compatible strings. But for the cases where both ends can support
> stretching or not, seems like we need an i2c property.

I haven't read all this, but regarding clock stretching, this is the
current state:

* clock streching is defined in the I2C specs and thus masters are
  assumed to handle it properly
* if they can't, this is a quirk and we have a flag for it:
  I2C_AQ_NO_CLK_STRETCH
* client drivers can check for quirks and act accordingly:
  i2c_check_quirks(struct i2c_adapter *adap, u64 quirks)

Note: there is currently no user of this feature because mainlining the
client got stuck for some reason. So, I'd be happy if all this is useful
to you.

Regards,

   Wolfram


--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEOZGx6rniZ1Gk92RdFA3kzBSgKbYFAlvIy9UACgkQFA3kzBSg
KbaaHRAAhwDHds2Kdekb2TMRBArWzrdhaYsMHD1aMGGx1PfGfQq3QuLTm0ipdax3
YqLZ8FXXDiWMgRgVO9dzZOloGhnCZOhP6w7oX7fYwyA9sqiz6A1pQBZqMAlTRDrA
zyJk8fqd9368GarqbapulalX6CXK5+D4aMNT3uT0MsGPNmDZYG1RA+rjh3k9ksRc
Fw+u9fcD+tqkBT035aKch+//VAW8Vv8sdw4lCJHmAxaaHRVMZIR6pwg6lwZr72Ay
0euOKPSS1G/c9qF7i4tRCneWbI8M0QOlFKLeNzjlGJbkhYGM4ywrW7oTX0/1oTaS
s+mYIrNWspRqsDpSgHprNddI7p1jvK6+DZcgcYoJhtLp94IMez/X6ZyfDrQxLPhj
Qnt477YlVg1x3GeaNWEE7XEDbuyTi2zjDfBf78CLaYR4qC8i5feq5w/lfZGsMX34
12098Kv3+7fNnZkj120hw08yUIH4r/iPpTpDB5Jmk3YhZQaldzOTB5l8sMGHwsrZ
QWEXmn6K42rZcgatoAUfqo/c1hHNStWBqlAgPOdEu+Y5XLSNT4vrLJwLTsLFAjWg
JmIw0vq0HOUiDS6gH4qfZRgvIbfrmniJbAoHUKptwdfF0IV4otHipk79gAFguFvb
TBCh/lcJgq1ZhA5apDPxRp3SLEIfhVGAJBmjIR4NxTATUFdKfEw=
=qUEj
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
