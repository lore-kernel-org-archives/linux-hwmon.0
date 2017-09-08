Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:45457 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1750967AbdIHFQ3 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 8 Sep 2017 01:16:29 -0400
Message-ID: <1504847776.6124.17.camel@aj.id.au>
Subject: Re: [PATCH] hwmon: pmbus: Make reg check and clear faults functions
 return errors
From: Andrew Jeffery <andrew@aj.id.au>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com,
        linux-doc@vger.kernel.org, openbmc@lists.ozlabs.org,
        corbet@lwn.net, linux-kernel@vger.kernel.org
Date: Fri, 08 Sep 2017 15:16:16 +1000
In-Reply-To: <a9924f0c-ee26-6c6b-262e-84dacb50b6a6@roeck-us.net>
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
         <a9924f0c-ee26-6c6b-262e-84dacb50b6a6@roeck-us.net>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-+ucxoPjWpWJMrpdaHBPh"
Mime-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org


--=-+ucxoPjWpWJMrpdaHBPh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-09-07 at 22:14 -0700, Guenter Roeck wrote:
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
> fan config hardcoded, four fans connected. Still no failure.

Great. Thanks again for your efforts here.

Andrew
--=-+ucxoPjWpWJMrpdaHBPh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZsiegAAoJEJ0dnzgO5LT5uakP/j1WyE+8UvJ5LmyUn+4J5y9k
FxBXYxRYQAj8GwQ29j+Fq6OfkVos++G2TpK+G4sNV8jaapRGXJgQLAQjcbGtSf3K
8kE4kcId2ICefwpksJ79sOvXrXHrKLraKly+RoodQtcEWMpR90enQ9+mWRnbum0J
894mfhat3ZhZTeE0AelB74Z6sY6oqg4Oan4PMkRl4ruQmxrI5URRIyqytLOI2e/e
ZHJuXeFN2XWk623f1XpWkHbu/zL0DrENqRequOvMcMO7C3bMXyP9t7gq3AcMF7Wa
cGSwvvtR2tLtpJ+Gj2oZkg6Pj7DUawaAjrN4XeL5em2XHHf9yIcO1PTSkVEZtQoc
+inEcELY+80EwST+PabyGVG0Kd+R/MvtDctqzFusBwWbLZJbzFhSQovHz69EAEwH
p43AtxWMQTgdTNA9lOkmwgYadUZzXFt/C87WcmA5I4oSe59F86e5SvmJaRHn43dG
dvUqPeFAOG75J8itlYEPj7pZcCOfEByeTg12TgVJqgBeYgiu8cgEOFSF3ua9yJte
jiu+Mk3GJTLKVaNmiXUMAqm1FjlnG9kY7X3Ngz09csx77Dt/Spx8Xz3UspZRcYVx
Z3t5Vs5oTxDzobH0hwuTvzeZGuvqApPYk5V43Ch7vZI0bR5OPnndnf1kvg0/xLpM
kRjD1I2d3RgcL4mv6RA/
=9KSx
-----END PGP SIGNATURE-----

--=-+ucxoPjWpWJMrpdaHBPh--

