Return-Path: <andrew@aj.id.au>
Return-path: <andrew@aj.id.au>
Message-ID: <1504836369.6124.2.camel@aj.id.au>
Subject: Re: [PATCH] hwmon: pmbus: Make reg check and clear faults functions
 return errors
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	openbmc@lists.ozlabs.org, joel@jms.id.au
Date: Fri, 08 Sep 2017 12:06:09 +1000
In-Reply-To: <f5752c40-4f1a-c6d6-ee4f-8099e802815e@roeck-us.net>
References: <20170905070132.17682-1-andrew@aj.id.au>
	 <20170905170002.GG11478@roeck-us.net> <1504657417.28363.8.camel@aj.id.au>
	 <20170906225102.GA32210@roeck-us.net> <1504740749.5042.2.camel@aj.id.au>
	 <b9209305-6273-6147-a6de-033a1b3d190b@roeck-us.net>
	 <1504797770.5105.7.camel@aj.id.au>
	 <cbbca5f6-4c40-d20e-b27d-2e965822ccb4@roeck-us.net>
	 <1504832527.6124.1.camel@aj.id.au>
	 <f5752c40-4f1a-c6d6-ee4f-8099e802815e@roeck-us.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-uysjrYDqCPcEeFgRvZbA"
Mime-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>


--=-uysjrYDqCPcEeFgRvZbA
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-07 at 18:26 -0700, Guenter Roeck wrote:
> On 09/07/2017 06:02 PM, Andrew Jeffery wrote:
> > On Thu, 2017-09-07 at 17:27 -0700, Guenter Roeck wrote:
> > > On 09/07/2017 08:22 AM, Andrew Jeffery wrote:
> > > > On Thu, 2017-09-07 at 06:40 -0700, Guenter Roeck wrote:
> > > > > On 09/06/2017 04:32 PM, Andrew Jeffery wrote:
> > > > >=20
> > > > > > > =C2=A0=C2=A0=C2=A0=C2=A0
> > > > > > > Guess I need to dig up my eval board and see if I can reprodu=
ce the problem.
> > > > > > > Seems you are saying that the problem is always seen when iss=
uing a sequence
> > > > > > > of "clear faults" commands on multiple pages ?
> > > > > >=20
> > > > > > Yeah. We're also seeing bad behaviour under other command seque=
nces as well,
> > > > > > which lead to this hack of a work-around patch[1].
> > > > > >=20
> > > > > > I'd be very interested in the results of testing against the ev=
al board. I
> > > > > > don't have access to one and it seems Maxim have discontinued t=
hem.
> > > > > >=20
> > > > >=20
> > > > > Do you have a somewhat reliable means to reproduce the problem ?
> > > >=20
> > > > It seems we hit a bunch of problems by just continually
> > > > binding/unbinding the driver, if you don't apply that hacky oneshot
> > > > retry patch. We can hit problems (in our design?) with something li=
ke:
> > > >=20
> > > > # cd /sys/bus/i2c/drivers/max31785; \
> > > > 	echo $addr > unbind; \
> > > > 	while echo $addr > bind; \
> > > > 	do echo $addr > unbind; echo -n .; done;
> > > >=20
> > > > It should hit issues covered by this patch, as the register checks =
are
> > > > used in the operations used by probe.
> > > >=20
> > >=20
> > > Hmm ... I didn't use your driver but my prototype driver which also s=
upports
> > > temperature and voltage attributes, so if anything it should create m=
ore
> > > stress on the chip.
> >=20
> > I did add the temp and voltage attributes...
> >=20
> > Any chance you can give mine a try? I don't know what I would have done
> > to invoke this kind of behaviour, so it would be useful to know whether
> > or not it happens with one driver but not the other.
> >=20
>=20
> Will do.

Thanks. For reference, here's a devicetree description:

https://github.com/openbmc/linux/blob/dev-4.10/arch/arm/boot/dts/aspeed-bmc=
-opp-witherspoon.dts#L283


>=20
> > > =C2=A0 No error so far, after running the script for a couple
> > > of minutes. How long does it take for errors to appear, and how do I =
see
> > > that there is an error ?
> >=20
> > I'm seeing failures after anything from a handful of bind/unbinds, to
> > hundreds of bind/unbinds. It seems to vary.
> >=20
> > > Does the driver fail to instantiate ?
> >=20
> > Typically probe fails so the loop exits. It usually gets -EIO and the
> > shell spits out "No such device".
> >=20
> > Thanks for testing, it's a useful data point for us hunting down the
> > source of our problems.
> >=20
>=20
> I aborted the test after ~2,500 loops without error.

Yeah, I'd consider that fairly stable.

Cheers,

Andrew
--=-uysjrYDqCPcEeFgRvZbA
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZsfsRAAoJEJ0dnzgO5LT5WoAQAJ2A8k0ItMqxdp1MmQLc0s7u
CXsjY58TW1t/i/WQSEaKTw+3aTNZRciXkpkyO0KkstApJVW3IlByhZ71e2jn7/59
cZlY9GjQhqS6CNl0P0i2bOB5+WEL+tma4/44IBJO3G8/wrMWDATVXIKiZjaGINdn
LdomDKMBvd/aQSkSpciJs0HfRiBBQo5oaxAnP9l6XYLRbBV/g0sYJyUMcpG4AZTh
sVzDjxGtQ5+ZbxX2SsWqIA5bOkV9bgo19ZM06KxvNUhh8TUzNx2tN3NYxWIUaf54
fBiPDdbH7BGWxwDHQUTanPLR32b9UiIgFnXGSMiPQiLmljX41O9Nf3r74JolOJSh
YyGULVGBl1s29+qd6KSpLVEv/90HTKhM//wrt0PmUSa2ACpydK8ItRGFuLS415Yp
BQeKdnRVRQbjsfW3tSJhsM/uIWo4xEJuvrEXjpQSmpmxaEoXv0Y2TKe3imUipDEg
5NElO76Y3q4ShDAs9O6OF4Oa60QZIO9cEaXycn2t3jxYwxfmTUubVncPshBKe0lV
61wr28ckEkE1q6DvLl8VOibywVSiJ//b7jcDSL0AxgraRnj0jP2y7EJjGozhMhqf
M9KIsnRqs+b/9Dhm/aIXkQFd9d1crAwSMPHuTaOsi8xLe8ffllb25kWoe2aohfgX
HiebK2YNSrEnE2iVbFjQ
=SYGU
-----END PGP SIGNATURE-----

--=-uysjrYDqCPcEeFgRvZbA--
