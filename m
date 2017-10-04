Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-he1eur01on0065.outbound.protection.outlook.com ([104.47.0.65]:51253
        "EHLO EUR01-HE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751049AbdJDFe7 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 4 Oct 2017 01:34:59 -0400
From: Vadim Pasternak <vadimp@mellanox.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: "robh+dt@kernel.org" <robh+dt@kernel.org>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "jiri@resnulli.us" <jiri@resnulli.us>
Subject: RE: [v4, 1/2] hwmon: (max6621) Add support for Maxim MAX6621
 temperature sensor
Date: Wed, 4 Oct 2017 05:34:56 +0000
Message-ID: <AM4PR05MB3330E559C29CB6B8AA79C156A2730@AM4PR05MB3330.eurprd05.prod.outlook.com>
References: <1507054108-195806-2-git-send-email-vadimp@mellanox.com>
 <20171004022128.GA1248@roeck-us.net>
In-Reply-To: <20171004022128.GA1248@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

=20
> >  drivers/hwmon/Kconfig   |  14 ++
> >  drivers/hwmon/Makefile  |   1 +
> >  drivers/hwmon/max6621.c | 593
> > ++++++++++++++++++++++++++++++++++++++++++++++++
>=20
> I just realized that Documentation/hwmon/max6621 is missing, but since
> this is really my fault I won't you hostage on that.
>=20
> Applied to hwmon-next.
>=20
> Guenter

Thank you very much,
Vadim.

>=20
> >  3 files changed, 608 insertions(+)
> >  create mode 100644 drivers/hwmon/max6621.c
=20
