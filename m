Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51323 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752185AbeGBQOS (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 Jul 2018 12:14:18 -0400
Date: Mon, 2 Jul 2018 09:14:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
        "jiri@resnulli.us" <jiri@resnulli.us>,
        Michael Shych <michaelsh@mellanox.com>
Subject: Re: [PATCH v3 1/1] hwmon: (mlxreg-fan) Add support for Mellanox FAN
 driver
Message-ID: <20180702161416.GA32333@roeck-us.net>
References: <1530109582-4851-1-git-send-email-vadimp@mellanox.com>
 <20180627170328.GB6826@roeck-us.net>
 <HE1PR0502MB3753B730EFCC918D632AE490A2430@HE1PR0502MB3753.eurprd05.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <HE1PR0502MB3753B730EFCC918D632AE490A2430@HE1PR0502MB3753.eurprd05.prod.outlook.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Jul 02, 2018 at 02:33:50PM +0000, Vadim Pasternak wrote:
> > 
> > Also, the usage of "round" is "100 + (r)". A value of 0 is no problem.
> 
> Hi Guenter,
> 
> This is 15000000 / ((val) * (d) / 100 + (r))).
> Value is reading from the register ( >=0) , in default case should be:
> regval * 1132 / 100 + 500;
> 
> > A value of -100 is problematic. Which makes me wonder - what is the point of
> > the offset ? And why "round" ? This looks like a fractional divider to me, where
> > 	d(real) = d / (100 + (r))
> > It might be useful to explain that somewhere, and use a better variable name
> > than 'round' to describe the fraction.
> 
> I will change round to fraction and will add a comment before macros
> MLXREG_FAN_GET_RPM. Something like below:
> /*
>  * FAN datasheet defines the formula for RPM calculations as RPM = 15/t-high.
>  * The logic in a programmable device measures the time t-high by sampling the
>  * tachometer every t-sample (with the default value 11.32 uS) and increment
>  * a counter (N) as long as the pulse has not change:
>  * RPM = 15 / (t-sample * (K + Regval)), where:
>  * Regval: is the value read from the programmable device register;
>  *  - 0xff - represents tachometer fault;
>  *  - 0xfe - represents tachometer minimum value , which is 4444 RPM;
>  *  - 0x00 - represents tachometer maximum value , which is 300000 RPM;
>  * K: is 44 and it represents the minimum allowed samples per pulse;
>  * F: is equal K * t-sample (44 * 11.32 = ~500) and it represents a minimum
>  *    fraction in RPM calculation;
>  * N: is equal K + Regval;
>  * In order to calculate RPM from the register value the following formula is
>  * used: RPM = 15 / ((Regval * 11.32 + F) * 10^(-6)), which in  the default
>  * case is modified to:
>  * RPM = 15000000 / ((Regval * 1132) / 100 + 500);
>  * - for Regval 0x00, RPM will be 15000000 / 500 = 30000;
>  * - for Regval 0xfe, RPM will be 15000000 / ((254 * 1132) / 100 + 500) = 4444;
>  * In common case the formula is modified to:
>  * RPM = 15000000 / ((Regval * divider) / 100 + fraction).
>  */
> 
> Would it be OK?
> 
If F = K * t-sample, and K == 44, F also includes t-sample and is thus partially
redundant. If K is a constant, you could write

	rpm = 15000000 / DIV_ROUND_CLOSEST(((regval) + 44) * (d), 100);

If K is not constant, you could provide K as parameter.

	rpm = 15000000 / DIV_ROUND_CLOSEST(((regval) + (K)) * (d), 100);

Using your examples:

	15000000 / (((0 + 44) * 1132) / 100) = 30120
	15000000 / (((254 + 44) * 1132) / 100) = 4447

You could also use

	rpm = 15000000 * 100 / (((regval) + (K)) * (d)));
or
	rpm = DIV_ROUND_CLOSEST(15000000 * 100, ((regval) + (K)) * (d));

which would probably generate even more accurate results and at the same time
simplify the equation.

Again with your examples:

	rpm = 15000000 * 100 / ((0 + 44) * 1132) = 30115
	rpm = 15000000 * 100 / ((254 + 44) * 1132) = 4446

Guenter
