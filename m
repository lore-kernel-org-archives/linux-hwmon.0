Return-Path: <andrew@aj.id.au>
Return-path: <andrew@aj.id.au>
Message-ID: <1504847328.6124.15.camel@aj.id.au>
Subject: Re: [PATCH] hwmon: pmbus: Make reg check and clear faults functions
 return errors
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
 linux-doc@vger.kernel.org,  openbmc@lists.ozlabs.org, corbet@lwn.net,
 linux-kernel@vger.kernel.org
Date: Fri, 08 Sep 2017 15:08:48 +1000
In-Reply-To: <020c1373-6c3e-15e0-340a-e617c3147610@roeck-us.net>
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
	 <1504839076.6124.8.camel@aj.id.au> <1504842058.6124.10.camel@aj.id.au>
	 <020c1373-6c3e-15e0-340a-e617c3147610@roeck-us.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-cGhw3ZRf7+/GlwEqq5iR"
Mime-Version: 1.0
List-ID: <linux-hwmon@vger.kernel.org>


--=-cGhw3ZRf7+/GlwEqq5iR
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-07 at 21:43 -0700, Guenter Roeck wrote:
> On 09/07/2017 08:40 PM, Andrew Jeffery wrote:
> > On Fri, 2017-09-08 at 12:51 +1000, Andrew Jeffery wrote:
> > > > I can't test with devicetree. x86 system.
> > > > =C2=A0=C2=A0
> > > > 2,100+ iterations with your driver, no failures.
> > >=20
> > > Great. I really appreciate your testing here, so thanks for your
> > > efforts. I owe you a few drinks if we ever happen to meet.
> >=20
> > Actually, on that, how did you chop out the devicetree parts? Did you
> > keep the configuration writes at the end of max31785_of_fan_config()
> > and max31785_of_tmp_config()? Or did you just not call them? These two
> > functions cause the bulk of the bus traffic with on probe.
> >=20
>=20
> I didn't change to code, just compiled and run it. Guess that means
> this part was skipped.

Right, yeah looking at it a bit more, dev->of_node will be NULL for
for_each_child_of_node(dev->of_node, child), therefore the loop body
won't execute.

>=20
> I'll replaced the fan configuration with some hard-coded values.
> We'll see if it makes a difference.

Sounds good.

Andrew
--=-cGhw3ZRf7+/GlwEqq5iR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZsiXgAAoJEJ0dnzgO5LT5kQwQAKXMHuCkX6/AL/BgS3lVzjHh
77/sMEQTeNfRiJq+xLKosZugtvmsfddQna07cWYIi3mfp4sYzsSlE1oSI41TL6kl
96QkMdDfVDDEYf9/DvvAn1uBd8bMoZlVaZ1l4ci1zR0xjoIp3OKLod/TnvLtI9SU
B7SaGBMSCUS81Yn7b/lc9b6WHSE0iclhBalifXCVPVqQ2NNn6N1trvjTOFpxkAB0
HbZ6vqayENoRlJG8G04dl1laDa6rYTM//uh8sR9da935JDMAuyffxsPIEa+IwCXu
n8gP3QEE/9+QrdVhX5MaE52zmnw6wUF4oz5C1+y4BEfd+QqdNIcCI7g3HBNMbxoy
pyEKx+Gd5zfMhXjoCIIStYNQF1vyJ9FkygsTy1+i7+Hyo7MiV3MGN61zbite2oou
vpyoyhFLEi0B02fv6NsrVIOsJ7eGLoBq3OQabUOlFzky63L5wIM+RsC1qCpkc8xv
ZD+SL++yVnZSCFGA9o3qxfMtaiQwdmkGMXsp4/w7MfwFEtYVH5sTkEiVyHv7zqze
ydDI1B1JYAglvyrSVy+w3kFN3iD4Rc+8ZR2l2GGamIjdu/3SgPPkYVVQ6RJaB19X
YQQcdg9KYg8Xyf0DiZQ186LGQ7ao0OwnCVzcNACgXvtQ50HxCMR8VYjPw9gzXjXw
S/95rKqN8dLUQfKu7DJY
=e2m9
-----END PGP SIGNATURE-----

--=-cGhw3ZRf7+/GlwEqq5iR--
