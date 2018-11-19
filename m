Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-eopbgr20083.outbound.protection.outlook.com ([40.107.2.83]:45995
        "EHLO EUR02-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725908AbeKSQaT (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Nov 2018 11:30:19 -0500
From: Vadim Pasternak <vadimp@mellanox.com>
To: Guenter Roeck <linux@roeck-us.net>
CC: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Michael Shych <michaelsh@mellanox.com>
Subject: RE: [PATCH hwmon-next v1 1/1] hwmon: (mlxreg-fan) Fix macros for
 tacho fault reading
Date: Mon, 19 Nov 2018 06:07:40 +0000
Message-ID:
 <AM6PR05MB5224D3D72EF7970AB2A18E06A2D80@AM6PR05MB5224.eurprd05.prod.outlook.com>
References: <1542376031-179816-1-git-send-email-vadimp@mellanox.com>
 <20181116161515.GA30440@roeck-us.net>
In-Reply-To: <20181116161515.GA30440@roeck-us.net>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable
MIME-Version: 1.0
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org
Message-ID: <20181119060740.IQB9ruwQeIhBlRBEfuwaf1NdSH62NNj80MLMsvQUTXM@z>



> -----Original Message-----
> From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> Sent: Friday, November 16, 2018 6:15 PM
> To: Vadim Pasternak <vadimp@mellanox.com>
> Cc: linux-hwmon@vger.kernel.org; Michael Shych <michaelsh@mellanox.com>
> Subject: Re: [PATCH hwmon-next v1 1/1] hwmon: (mlxreg-fan) Fix macros for
> tacho fault reading
>=20
> On Fri, Nov 16, 2018 at 01:47:11PM +0000, Vadim Pasternak wrote:
> > Fix macros for tacometer fault reading.
> > This fix is relevant for three Mellanox systems MQMB7, MSN37, MSN34,
> > which are about to be released to the customers.
> > At the moment, none of them is at customers sites.
> >
> > Fixes: 65afb4c8e7e4 ("hwmon: (mlxreg-fan) Add support for Mellanox FAN
> > driver")
> > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > ---
> >  drivers/hwmon/mlxreg-fan.c | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> > index de46577..d8fa4be 100644
> > --- a/drivers/hwmon/mlxreg-fan.c
> > +++ b/drivers/hwmon/mlxreg-fan.c
> > @@ -51,7 +51,7 @@
> >   */
> >  #define MLXREG_FAN_GET_RPM(rval, d, s)
> 	(DIV_ROUND_CLOSEST(15000000 * 100, \
> >  					 ((rval) + (s)) * (d)))
> > -#define MLXREG_FAN_GET_FAULT(val, mask) (!!((val) ^ (mask)))
> > +#define MLXREG_FAN_GET_FAULT(val, mask) (!((val) ^ (mask)))
>=20
> You might want to check if the "^" is correct here. It looks fishy, since=
 the
> expression only evaluates to true if a no bit of val outside mask is set.=
 I would
> have expected "&".
>=20
> Guenter

Hi Guenter,

Thanks for you your comment.

I'll follow your suggestion and change a macros to"=20
#define MLXREG_FAN_GET_FAULT(val, mask) (!((val & mask) ^ (mask)))

>=20
> >  #define MLXREG_FAN_PWM_DUTY2STATE(duty)
> 	(DIV_ROUND_CLOSEST((duty) *	\
> >  					 MLXREG_FAN_MAX_STATE,
> 	\
> >  					 MLXREG_FAN_MAX_DUTY))
