Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:46309 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751747AbdG0Iti (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 27 Jul 2017 04:49:38 -0400
Message-ID: <1501145366.5179.20.camel@aj.id.au>
Subject: Re: [patch v3] hwmon: (aspeed-pwm-tacho) cooling device support.
From: Andrew Jeffery <andrew@aj.id.au>
To: Mykola Kostenok <c_mykolak@mellanox.com>,
        Joel Stanley <joel@jms.id.au>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        Jean Delvare <jdelvare@suse.com>, Ohad Oz <ohado@mellanox.com>,
        Vadim Pasternak <vadimp@mellanox.com>,
        Patrick Venture <venture@google.com>,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>,
        Rob Herring <robh+dt@kernel.org>,
        Guenter Roeck <linux@roeck-us.net>
Date: Thu, 27 Jul 2017 18:19:26 +0930
In-Reply-To: <DB5PR05MB1224E9363B110E787E3C16C3EFBE0@DB5PR05MB1224.eurprd05.prod.outlook.com>
References: <20170725141727.13105-1-c_mykolak@mellanox.com>
         <CACPK8XeidChD_LT6o8MQBmyJ4r3mPCPfwEX_1REmQJkMNGELeQ@mail.gmail.com>
         <DB5PR05MB1224F329AA1C5BA4B37B4B86EFB90@DB5PR05MB1224.eurprd05.prod.outlook.com>
         <1501135285.5179.16.camel@aj.id.au>
         <DB5PR05MB1224E9363B110E787E3C16C3EFBE0@DB5PR05MB1224.eurprd05.prod.outlook.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-BHQe427awUl6Z8UYIvjx"
Mime-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org


--=-BHQe427awUl6Z8UYIvjx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 2017-07-27 at 08:36 +0000, Mykola Kostenok wrote:
> > -----Original Message-----
> > > > From: Andrew Jeffery [mailto:andrew@aj.id.au]
> > Sent: Thursday, July 27, 2017 9:01 AM
> > > > To: Mykola Kostenok <c_mykolak@mellanox.com>; Joel Stanley
> > > > <joel@jms.id.au>
> > > > Cc: linux-hwmon@vger.kernel.org; Jaghathiswari Rankappagounder
> > > > > > Natarajan <jaghu@google.com>; Jean Delvare <jdelvare@suse.com>;=
 Ohad
> > > > > > Oz <ohado@mellanox.com>; Vadim Pasternak <vadimp@mellanox.com>;
> > > > Patrick Venture <venture@google.com>; OpenBMC Maillist
> > > > > > <openbmc@lists.ozlabs.org>; Rob Herring <robh+dt@kernel.org>; G=
uenter
> > > > Roeck <linux@roeck-us.net>
> > Subject: Re: [patch v3] hwmon: (aspeed-pwm-tacho) cooling device suppor=
t.
> >=20
> > Hi Mykola,
> >=20
> > I know you've sent out subsequent versions, but I wanted to address one=
 of
> > your arguments here:
> >=20
> > On Wed, 2017-07-26 at 11:08 +0000, Mykola Kostenok wrote:
> > > > > @@ -834,10 +946,12 @@ static int aspeed_pwm_tacho_probe(struct
> > > > > platform_device *pdev)
> > > > >=20
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 for_each_child_o=
f_node(np, child) {
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 ret =3D aspeed_create_fan(dev, child, pri=
v);
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 of_node_put(child);
> > > > > -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (ret)
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 if (ret) {
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of_no=
de_put(child);
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 return ret;
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 }
> > > > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 }
> > > > > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 of_node_put(child);
> > > >=20
> > > > I'm not sure about these.
> > > >=20
> > > > Cheers,
> > > >=20
> > > > Joel
> > >=20
> > > If CONFIG_OF_UNITTEST is set, system initialization=C2=A0 fails on th=
is
> >=20
> > of_node_put.
> > > I checked and found that for_each_child_of_node is macro witch use
> > > __of_get_next_child
> > > =C2=A0in cycle. __of_get_next_child do of_node_put previous child but=
 not last.
> > >=20
> > > static struct device_node *__of_get_next_child(const struct
> > > device_node *node,
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct=
 device_node
> > > *prev) {
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0struct device_node *n=
ext;
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0if (!node)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0return NULL;
> > >=20
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0next =3D prev ? prev-=
>sibling : node->child;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (; next; next =3D=
 next->sibling)
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (of_node_get(next))
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
break;
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0of_node_put(prev);
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0return next;
> > > }
> > > #define __for_each_child_of_node(parent, child) \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for (child =3D __of_g=
et_next_child(parent, NULL); child !=3D NULL;
> > > \
> > > =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0 child =3D __of_get_next_child(parent, child))
> > >=20
> > > So inside cycle we should not use of_node_put on each child. We must =
use
> >=20
> > it only on last child in cycle.
> >=20
> > I was just looking at this myself for a different driver, and I don't t=
hink this
> > argument is right. The natural terminating condition of the loop is chi=
ld =3D=3D
> > NULL. child =3D=3D NULL occurs if we have zero-or-more- children; the c=
hild is
> > always initialised as part of the loop header and would be NULL if ther=
e are
> > no children. If we have more than one child, the reference to the last =
valid
> > child is passed to of_node_put() in __of_get_next_child() in order to r=
eturn
> > the terminating NULL. Given
> > __of_get_next_child() is passed the last node and the result is NULL, t=
he call
> > to of_node_put() after the loop is always invoked on NULL, which perfor=
ms
> > an early return.
> >=20
> > As such I think it is unnecessary.
> >=20
> > Cheers,
> >=20
> > Andrew
>=20
> Ok, I agree that we don=E2=80=99t need of_node_put after loop.=C2=A0
> We must do of_node_put only in case of error.

Yep, this is the right approach as far as I can see.

Thanks,

Andrew

>=20
> So I will send next patch v6 with this:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0for_eac=
h_child_of_node(np, child) {
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ret =3D aspeed_create_fan(dev, ch=
ild, priv);
> =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0of_node_put(child);
> =C2=A0 -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0if (ret)
> =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0if (ret) {
> =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0of_=
node_put(child);
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0return ret;
> =C2=A0+=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0}
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0}
>=20
> Without it and with CONFIG_OF_UNITTEST we see this:
> [=C2=A0=C2=A0=C2=A0=C2=A03.000000] [<80010080>] (unwind_backtrace) from [=
<8000d934>] (show_stack+0x20/0x24)
> [=C2=A0=C2=A0=C2=A0=C2=A03.000000] [<8000d934>] (show_stack) from [<801db=
f8c>] (dump_stack+0x20/0x28)
> [=C2=A0=C2=A0=C2=A0=C2=A03.000000] [<801dbf8c>] (dump_stack) from [<8030a=
d14>] (of_node_release+0x98/0xa0)
> [=C2=A0=C2=A0=C2=A0=C2=A03.000000] [<8030ad14>] (of_node_release) from [<=
801de0ec>] (kobject_put+0xf8/0x1ec)
> [=C2=A0=C2=A0=C2=A0=C2=A03.000000] [<801de0ec>] (kobject_put) from [<8030=
a340>] (of_node_put+0x24/0x28)
> [=C2=A0=C2=A0=C2=A0=C2=A03.000000] [<8030a340>] (of_node_put) from [<8030=
5fe4>] (__of_get_next_child+0x58/0x70)
> [=C2=A0=C2=A0=C2=A0=C2=A03.000000] [<80305fe4>] (__of_get_next_child) fro=
m [<8030668c>] (of_get_next_child+0x20/0x28)
> [=C2=A0=C2=A0=C2=A0=C2=A03.000000] [<8030668c>] (of_get_next_child) from =
[<802e39ac>] (aspeed_pwm_tacho_probe+0x490/0x574)
> [=C2=A0=C2=A0=C2=A0=C2=A03.000000] [<802e39ac>] (aspeed_pwm_tacho_probe) =
from [<80244090>] (platform_drv_probe+0x60/0xc0)
> [=C2=A0=C2=A0=C2=A0=C2=A03.000000] [<80244090>] (platform_drv_probe) from=
 [<80242408>] (driver_probe_device+0x280/0x44c)
> [=C2=A0=C2=A0=C2=A0=C2=A03.000000] [<80242408>] (driver_probe_device) fro=
m [<802426c4>] (__driver_attach+0xf0/0x104)
> [=C2=A0=C2=A0=C2=A0=C2=A03.000000] [<802426c4>] (__driver_attach) from [<=
802403d8>] (bus_for_each_dev+0x7c/0xb0)
> [=C2=A0=C2=A0=C2=A0=C2=A03.000000] [<802403d8>] (bus_for_each_dev) from [=
<8024286c>] (driver_attach+0x28/0x30)
> [=C2=A0=C2=A0=C2=A0=C2=A03.000000] [<8024286c>] (driver_attach) from [<80=
240e38>] (bus_add_driver+0x14c/0x268)
> [=C2=A0=C2=A0=C2=A0=C2=A03.000000] [<80240e38>] (bus_add_driver) from [<8=
02432f8>] (driver_register+0x88/0x104)
> [=C2=A0=C2=A0=C2=A0=C2=A03.000000] [<802432f8>] (driver_register) from [<=
80244cd0>] (__platform_driver_register+0x40/0x54)
> [=C2=A0=C2=A0=C2=A0=C2=A03.000000] [<80244cd0>] (__platform_driver_regist=
er) from [<805bfc64>] (aspeed_pwm_tacho_driver_init+0x18/0x20)
> [=C2=A0=C2=A0=C2=A0=C2=A03.000000] [<805bfc64>] (aspeed_pwm_tacho_driver_=
init) from [<8059de70>] (do_one_initcall+0xac/0x168)
> [=C2=A0=C2=A0=C2=A0=C2=A03.000000] [<8059de70>] (do_one_initcall) from [<=
8059e040>] (kernel_init_freeable+0x114/0x1cc)
> [=C2=A0=C2=A0=C2=A0=C2=A03.000000] [<8059e040>] (kernel_init_freeable) fr=
om [<804072a0>] (kernel_init+0x18/0x104)
> [=C2=A0=C2=A0=C2=A0=C2=A03.000000] [<804072a0>] (kernel_init) from [<8000=
a5e8>] (ret_from_fork+0x14/0x2c)
> [=C2=A0=C2=A0=C2=A0=C2=A03.200000] OF: ERROR: Bad of_node_put() on /ahb/a=
pb/pwm-tacho-controller@1e786000/fan@1
> And kernel panic at the end.
>=20
> Best regards. Mykola Kostenok.
--=-BHQe427awUl6Z8UYIvjx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iQIcBAABCgAGBQJZeakWAAoJEJ0dnzgO5LT5ofEQAK3DCqUmtAcreW3pj7ALIbh7
MP3sTzaNCB1oGvKbgOSKGwkwDm9EH5FwkABdFmhuUssLpcJFwMGQcIfXOz7FYhT5
zdLnus4pp8aWw6e39boiflo10fFVbxXqJ/wNPN0ozpx6+xqHpX4C2TT25jTZBECl
OKDZxHC7pzhuTXy/freN1lRZf97DAL36CeXfpS5DRlIzIAQ1LLubEXgsqQln6FO6
N556jfNDF6iCDh+e7Zo9GhaejUtu69SxbJFFFpls/srtRYyUoXvtIo+J/0/ecJd7
HB9f6J4YkcktOAt0IChM/0abfufPyQSOQ3mGe6QBsIZYxN6IzvbXUaKQz41ANI46
6VAcFg2k+GrbhYKkuvBs6TuwvBch50NpEfDf7h+SiGP2ps8szhUXql1W25p+AhlQ
AE6hPiiV7d1BhMPrOVVBY6BoqgKGLUvtymau6binmULJZIXHmXfZTg46hyERDcv/
2gJjXvIGfsZ3DFup/de1eGqolbAOijNCy9DOCUoeAjOUlI60r90VfJymKD/gptQO
wexikp96+XEGrlsPZmVuAquwAjM2Q0kBcw5d7cisZy4Lc6BHBxYTNC/eEJpbSMz/
lmWTMVhzu6CfC9m7GV4QdWNgSE8J5X9/B5SCT2XNZE2ju7m44dhZcSyjSPWnrX19
LvgqjHwHjE/6Ds/xi0Cd
=EIyH
-----END PGP SIGNATURE-----

--=-BHQe427awUl6Z8UYIvjx--

