Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:42112 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729965AbeKTCjO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 19 Nov 2018 21:39:14 -0500
Received: by mail-pl1-f196.google.com with SMTP id x21-v6so12085141pln.9
        for <linux-hwmon@vger.kernel.org>; Mon, 19 Nov 2018 08:15:12 -0800 (PST)
Date: Mon, 19 Nov 2018 08:15:07 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        Michael Shych <michaelsh@mellanox.com>
Subject: Re: [PATCH hwmon-next v1 1/1] hwmon: (mlxreg-fan) Fix macros for
 tacho fault reading
Message-ID: <20181119161507.GA12726@roeck-us.net>
References: <1542376031-179816-1-git-send-email-vadimp@mellanox.com>
 <20181116161515.GA30440@roeck-us.net>
 <AM6PR05MB5224D3D72EF7970AB2A18E06A2D80@AM6PR05MB5224.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <AM6PR05MB5224D3D72EF7970AB2A18E06A2D80@AM6PR05MB5224.eurprd05.prod.outlook.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 19, 2018 at 06:07:40AM +0000, Vadim Pasternak wrote:
> 
> 
> > -----Original Message-----
> > From: Guenter Roeck <groeck7@gmail.com> On Behalf Of Guenter Roeck
> > Sent: Friday, November 16, 2018 6:15 PM
> > To: Vadim Pasternak <vadimp@mellanox.com>
> > Cc: linux-hwmon@vger.kernel.org; Michael Shych <michaelsh@mellanox.com>
> > Subject: Re: [PATCH hwmon-next v1 1/1] hwmon: (mlxreg-fan) Fix macros for
> > tacho fault reading
> > 
> > On Fri, Nov 16, 2018 at 01:47:11PM +0000, Vadim Pasternak wrote:
> > > Fix macros for tacometer fault reading.
> > > This fix is relevant for three Mellanox systems MQMB7, MSN37, MSN34,
> > > which are about to be released to the customers.
> > > At the moment, none of them is at customers sites.
> > >
> > > Fixes: 65afb4c8e7e4 ("hwmon: (mlxreg-fan) Add support for Mellanox FAN
> > > driver")
> > > Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>
> > > ---
> > >  drivers/hwmon/mlxreg-fan.c | 2 +-
> > >  1 file changed, 1 insertion(+), 1 deletion(-)
> > >
> > > diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> > > index de46577..d8fa4be 100644
> > > --- a/drivers/hwmon/mlxreg-fan.c
> > > +++ b/drivers/hwmon/mlxreg-fan.c
> > > @@ -51,7 +51,7 @@
> > >   */
> > >  #define MLXREG_FAN_GET_RPM(rval, d, s)
> > 	(DIV_ROUND_CLOSEST(15000000 * 100, \
> > >  					 ((rval) + (s)) * (d)))
> > > -#define MLXREG_FAN_GET_FAULT(val, mask) (!!((val) ^ (mask)))
> > > +#define MLXREG_FAN_GET_FAULT(val, mask) (!((val) ^ (mask)))
> > 
> > You might want to check if the "^" is correct here. It looks fishy, since the
> > expression only evaluates to true if a no bit of val outside mask is set. I would
> > have expected "&".
> > 
> > Guenter
> 
> Hi Guenter,
> 
> Thanks for you your comment.
> 
> I'll follow your suggestion and change a macros to" 
> #define MLXREG_FAN_GET_FAULT(val, mask) (!((val & mask) ^ (mask)))
> 
That seems excessively complicated. Why the xor after the & ?

Guenter

> > 
> > >  #define MLXREG_FAN_PWM_DUTY2STATE(duty)
> > 	(DIV_ROUND_CLOSEST((duty) *	\
> > >  					 MLXREG_FAN_MAX_STATE,
> > 	\
> > >  					 MLXREG_FAN_MAX_DUTY))
