Return-Path: <andrew@aj.id.au>
Return-path: <andrew@aj.id.au>
Message-ID: <1504832527.6124.1.camel@aj.id.au>
Subject: Re: [PATCH] hwmon: pmbus: Make reg check and clear faults functions
 return errors
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, joel@jms.id.au
Date: Fri, 08 Sep 2017 11:02:07 +1000
In-Reply-To: <cbbca5f6-4c40-d20e-b27d-2e965822ccb4@roeck-us.net>
References: <20170905070132.17682-1-andrew@aj.id.au>
	 <20170905170002.GG11478@roeck-us.net> <1504657417.28363.8.camel@aj.id.au>
	 <20170906225102.GA32210@roeck-us.net> <1504740749.5042.2.camel@aj.id.au>
	 <b9209305-6273-6147-a6de-033a1b3d190b@roeck-us.net>
	 <1504797770.5105.7.camel@aj.id.au>
	 <cbbca5f6-4c40-d20e-b27d-2e965822ccb4@roeck-us.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-PuSp64QzTKl+lJDFLYDO"
Mime-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>


--=-PuSp64QzTKl+lJDFLYDO
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-07 at 17:27 -0700, Guenter Roeck wrote:
> On 09/07/2017 08:22 AM, Andrew Jeffery wrote:
> > On Thu, 2017-09-07 at 06:40 -0700, Guenter Roeck wrote:
> > > On 09/06/2017 04:32 PM, Andrew Jeffery wrote:
> > >=20
> > > > > =C2=A0=C2=A0=C2=A0
> > > > > Guess I need to dig up my eval board and see if I can reproduce t=
he problem.
> > > > > Seems you are saying that the problem is always seen when issuing=
 a sequence
> > > > > of "clear faults" commands on multiple pages ?
> > > >=20
> > > > Yeah. We're also seeing bad behaviour under other command sequences=
 as well,
> > > > which lead to this hack of a work-around patch[1].
> > > >=20
> > > > I'd be very interested in the results of testing against the eval b=
oard. I
> > > > don't have access to one and it seems Maxim have discontinued them.
> > > >=20
> > >=20
> > > Do you have a somewhat reliable means to reproduce the problem ?
> >=20
> > It seems we hit a bunch of problems by just continually
> > binding/unbinding the driver, if you don't apply that hacky oneshot
> > retry patch. We can hit problems (in our design?) with something like:
> >=20
> > # cd /sys/bus/i2c/drivers/max31785; \
> > 	echo $addr > unbind; \
> > 	while echo $addr > bind; \
> > 	do echo $addr > unbind; echo -n .; done;
> >=20
> > It should hit issues covered by this patch, as the register checks are
> > used in the operations used by probe.
> >=20
>=20
> Hmm ... I didn't use your driver but my prototype driver which also suppo=
rts
> temperature and voltage attributes, so if anything it should create more
> stress on the chip.

I did add the temp and voltage attributes...

Any chance you can give mine a try? I don't know what I would have done
to invoke this kind of behaviour, so it would be useful to know whether
or not it happens with one driver but not the other.

>  No error so far, after running the script for a couple
> of minutes. How long does it take for errors to appear, and how do I see
> that there is an error ?=20

I'm seeing failures after anything from a handful of bind/unbinds, to
hundreds of bind/unbinds. It seems to vary.=20

> Does the driver fail to instantiate ?

Typically probe fails so the loop exits. It usually gets -EIO and the
shell spits out "No such device".

Thanks for testing, it's a useful data point for us hunting down the
source of our problems.

Andrew
--=-PuSp64QzTKl+lJDFLYDO
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZsewPAAoJEJ0dnzgO5LT5zV8P/35uu3DIuMCpjuAYWel/zpi/
xolioIQWPejos8vDR5ZNA2IXUwoTBrDkhAKQY2Q0OKpGpj9W20wrYncwaOdGheyS
VcjXO/oReXnRT3kkRCCh/5TsQrdBGBJe+QrYQwn0pO61LrEmz4TCgXCQ3Pyu+kGb
uG673Mi7nNvWEqiQ0E7v63whkDuRIRABN2A0CIP/PyfWzZLATlqbhIsk/WgDtxnV
9CF1lOLylIliuNNdFXnR5D4YHr/++d1P5ptc3FvBESpg7rAtCLEtvW32/ZCcUqJC
NTRPbX3+1pLAVB4BpZxL9BVdWhghHiweS6Ztu0y2j+qnJBgFWqDFyJ73jFKv91Au
FKGLfGqtacymBRhEQfrbqKFvxoRrAjziTIyVbEDNlQr4jkb0H8TXS5yRL4EqFqx4
Ndy57To7iQbGSJ7KCQBGnCxXOXHj77Ul/g2ceT0/U3c+KQ96M8ukwIcN+5x0K7LK
2Qa96DOKiZ+CgO+zj9bHU8ykem2Ip0OS4cYL8AQXZiq7n7Dn8oVN6Lot8ewYE9hQ
kSuUKdHXLm9aRzhbKcU2eaidedYglFKLRlJsHQn6kMeN8Fai0kcC40pJZULvr0VG
EXS573WYCsWilEDN845WivO2Hd2ejFnyNwQ2cE/vpUCmmz5dksuASoC+k+7LTUBA
rakxPZVlEBG6OkpTbXjf
=PwPW
-----END PGP SIGNATURE-----

--=-PuSp64QzTKl+lJDFLYDO--
