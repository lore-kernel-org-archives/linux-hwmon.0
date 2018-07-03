Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-eopbgr00083.outbound.protection.outlook.com ([40.107.0.83]:31738
        "EHLO EUR02-AM5-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S932825AbeGCTDu (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 3 Jul 2018 15:03:50 -0400
From: Vadim Pasternak <vadimp@mellanox.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "jiri@resnulli.us" <jiri@resnulli.us>,
        Michael Shych <michaelsh@mellanox.com>
Subject: RE: [v5,1/1] hwmon: (mlxreg-fan) Add support for Mellanox FAN driver
Date: Tue, 3 Jul 2018 19:03:46 +0000
Message-ID: <HE1PR0502MB37533071FD7D09FF13ABDBB0A2420@HE1PR0502MB3753.eurprd05.prod.outlook.com>
References: <1530601209-23686-1-git-send-email-vadimp@mellanox.com>
 <20180703161620.GA17299@roeck-us.net>
In-Reply-To: <20180703161620.GA17299@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org



> -----Original Message-----
> From: Guenter Roeck [mailto:linux@roeck-us.net]
> Sent: Tuesday, July 03, 2018 7:16 PM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: linux-hwmon@vger.kernel.org; jiri@resnulli.us; Michael Shych
> <michaelsh@mellanox.com>
> Subject: Re: [v5,1/1] hwmon: (mlxreg-fan) Add support for Mellanox FAN dr=
iver
>=20
> On Tue, Jul 03, 2018 at 07:00:09AM +0000, Vadim Pasternak wrote:
> > Driver obtains PWM and tachometers registers location according to the
> > system configuration and creates FAN/PWM hwmon objects and a cooling
> > device. PWM and tachometers are controlled through the on-board
> > programmable device, which exports its register map. This device could
> > be attached to any bus type, for which register mapping is supported.
> > Single instance is created with one PWM control, up to 12 tachometers
> > and one cooling device. It could be as many instances as programmable
> > device supports.
> >
> > Currently driver will be activated from the Mellanox platform driver:
> > drivers/platform/x86/mlx-platform.c.
> > For the future ARM based systems it could be activated from the ARM
> > platform module.
> >
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
>=20
> Applied to hwmon-next.

Thank you very much,
Vadim.

>=20
> Thanks,
> Guenter
