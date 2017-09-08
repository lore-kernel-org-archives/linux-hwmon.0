Return-Path: <andrew@aj.id.au>
Return-path: <andrew@aj.id.au>
Message-ID: <1504842058.6124.10.camel@aj.id.au>
Subject: Re: [PATCH] hwmon: pmbus: Make reg check and clear faults functions
 return errors
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
 linux-doc@vger.kernel.org,  openbmc@lists.ozlabs.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org
Date: Fri, 08 Sep 2017 13:40:58 +1000
In-Reply-To: <1504839076.6124.8.camel@aj.id.au>
References: <20170905070132.17682-1-andrew@aj.id.au>
	 <20170905170002.GG11478@roeck-us.net> <1504657417.28363.8.camel@aj.id.au>
	 <20170906225102.GA32210@roeck-us.net> <1504740749.5042.2.camel@aj.id.au>
	 <b9209305-6273-6147-a6de-033a1b3d190b@roeck-us.net>
	 <1504797770.5105.7.camel@aj.id.au>
	 <cbbca5f6-4c40-d20e-b27d-2e965822ccb4@roeck-us.net>
	 <1504832527.6124.1.camel@aj.id.au>
	 <f5752c40-4f1a-c6d6-ee4f-8099e802815e@roeck-us.net>
	 <1504836369.6124.2.camel@aj.id.au>
	 <75d9f838-aa4a-5cbd-744a-4d8e8bf1a370@roeck-us.net>
	 <1504839076.6124.8.camel@aj.id.au>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-QG6e8yWIzdDght3qgphi"
Mime-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>


--=-QG6e8yWIzdDght3qgphi
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-09-08 at 12:51 +1000, Andrew Jeffery wrote:
> > I can't test with devicetree. x86 system.
> >=C2=A0
> > 2,100+ iterations with your driver, no failures.
>=20
> Great. I really appreciate your testing here, so thanks for your
> efforts. I owe you a few drinks if we ever happen to meet.

Actually, on that, how did you chop out the devicetree parts? Did you
keep the configuration writes at the end of max31785_of_fan_config()
and max31785_of_tmp_config()? Or did you just not call them? These two
functions cause the bulk of the bus traffic with on probe.

Andrew
--=-QG6e8yWIzdDght3qgphi
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZshFKAAoJEJ0dnzgO5LT5CAsP/3Cuy/Tsrw2Ls6G3X2okSEep
OM+JHgeXk0Y5iSUk+rzS1IeNhN12b1v5K/+Vc9VolBkaDBYulaDPoTHsNcqRsbqm
ug+tDnvYoNtaXzeTBCtryHU1y520EI4c70re4akP8bk9qXO0E23ezdUmun3sL9kL
KU8hPpDfo8AXVs+MXWue+pnFHey8HoXoQeE0fn6eko6/7aHIkhtEWrRt6B8++8Yo
mV6rjEk2lT4c2rLThwhC/0kCZnhNZmJ52PexmeW+gNezrWOqYDjrWCQFXcpD0Ag0
JZwOSJKGY5v8epbjzyJNsv9rbOMRt23wVKLcCQ9IYWffU2zmEPMQTlpyuvFzbbLc
Y+gLFqSxTz0CMfELpxmF5y3iF72uZfhyEOytJSXp2XDTsamiYpdeiLV1G9mb8pl4
FjS2PX9l9dCVXSGTzq1gUDxS0WEDsdpo6/Q7mBeWK8p/+LrSrZtXryDm5cMYRvvI
AGZC60tm5c4NfXEvYObrH2Y0yYQC/DYoKx22SON+rbzc3HMN40eGJbGej6LYIHgi
YruHCgHrg/yofBYFpUHk2IL/L6UR1c7duqMa8RJXx5IKVg/8Jz4P9YdQozFPh8EK
bkxGrwPjUZhaumw2bACzInoXRlkR5O0PUUsvAYz8JVwikbXMa9FLzJWG0N6yCG4N
h5MamSNB0N3Ck/TxI9x1
=snjJ
-----END PGP SIGNATURE-----

--=-QG6e8yWIzdDght3qgphi--
