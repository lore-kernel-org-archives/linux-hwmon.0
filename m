Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from out4-smtp.messagingengine.com ([66.111.4.28]:45459 "EHLO
        out4-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751193AbdBMB3k (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 12 Feb 2017 20:29:40 -0500
Message-ID: <1486949370.3661.5.camel@aj.id.au>
Subject: Re: [PATCH linux v7 6/6] hwmon: occ: Add callbacks for parsing P9
 OCC datastructures
From: Andrew Jeffery <andrew@aj.id.au>
To: Joel Stanley <joel@jms.id.au>, eajames <eajames@linux.vnet.ibm.com>
Cc: Guenter Roeck <linux@roeck-us.net>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-doc@vger.kernel.org, jdelvare@suse.com, corbet@lwn.net,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        "Edward A. James" <eajames@us.ibm.com>
Date: Mon, 13 Feb 2017 11:59:30 +1030
In-Reply-To: <CACPK8XeX12cQgJ2HqHFqvZmFh7TNWMJq3ysaOOmnh-kp02D+YA@mail.gmail.com>
References: <1486509056-25838-1-git-send-email-eajames@linux.vnet.ibm.com>
         <1486509056-25838-7-git-send-email-eajames@linux.vnet.ibm.com>
         <CACPK8XeX12cQgJ2HqHFqvZmFh7TNWMJq3ysaOOmnh-kp02D+YA@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-IHV915ZTm41NOKvdHaxf"
Mime-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org


--=-IHV915ZTm41NOKvdHaxf
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2017-02-10 at 16:01 +1030, Joel Stanley wrote:
> > +
> > +#ifndef __OCC_P9_H__
> > +#define __OCC_P9_H__
> > +
> > +#include "scom.h"
> > +
> > +struct device;
>=20
> Include the header for struct device instead.
>=20
> Did you consider the one header file for all of your shared functions?
> I don't think there's much value in having a whole heap of small ones.

My bias is against monolithic headers. While it would be no
linux/sched.h[1] so the impact won't be great, I prefer keeping headers
to only describing the abstract data type at hand. A collection of
small, relevant headers makes it easier for me to understand the
abstraction boundaries.

Andrew

[1] https://lwn.net/Articles/713712/
--=-IHV915ZTm41NOKvdHaxf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJYoQv6AAoJEJ0dnzgO5LT5l4MP/RMFcsg2r/dBcRl7sT2uKdyS
uJ+wHBSnQaS72BVdIWmmiALTObJ3leUiWHe5S+9ZQ/AfmKOJXgTQTbwxNoUPFncJ
3h5/TJJjHZJV3hPlQJga50MOis40QfhOoxUbGOBfh1qVhhTkn4a+D0qF6cJqxdK3
NfF4HELEgSoNYAY1Kam3MbZTMHgoXcKEChlRhNhFZsjvtzmCMqv4de9sXOxXiKmV
sCujqSBHEkB7jc/wEgAbf1/0CgEdmq3ifRzPHhs0w3cUnz+QFNNtS89zLP2rCJp3
tuKLCdQ0eLGyunUZ597xhPn6dQJ0fM9NSUhMqKSA+927Y2aeuPunnyYBUX+BHPjx
/0atdL9MxBLoRn+dPcD4BIAYEJ8aNMTLApsZsaaFpkjYvl1h1/h8rzQ+0Mi/hhpQ
2JUdMvS4tiwBW3WomXn0Dk3OGIzxuKaaFXbtqrR/3RKKW25U3El+/L8IqwUp6x8F
fP1gL8LW1N9Bvy+SaQ2EmXSFoN5w4BJhw1X2xUEZILtMpdWbrE8Y+3pnR+lXSjvD
3cPxtpJwQJBER7Anhb9RTDUJFZVIYv/USfn+WQh4mNNPwSrliHQ9QVJi9S0RRuN0
76JN5uVpOzGlCk1MIloP7QxFfAlnFQpCKOPIEKxesDI6GBqWnQts2RIJYNawAcn+
Wr9p63TXB2w3eTVgF9WO
=F21f
-----END PGP SIGNATURE-----

--=-IHV915ZTm41NOKvdHaxf--

