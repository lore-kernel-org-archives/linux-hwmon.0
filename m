Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:43470 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725728AbeLBFxB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 2 Dec 2018 00:53:01 -0500
Date: Sat, 1 Dec 2018 10:39:51 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Rosin <peda@axentia.se>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 1/2] hwmon: (ntc_thermistor) sort thermistor id lists
 alphabetically
Message-ID: <20181201183951.GA11613@roeck-us.net>
References: <b732b7e0-0076-9cb3-a146-4d0cd80d2658@roeck-us.net>
 <20181121160327.16772-1-peda@axentia.se>
 <20181121160327.16772-2-peda@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181121160327.16772-2-peda@axentia.se>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Nov 21, 2018 at 04:03:39PM +0000, Peter Rosin wrote:
> Use an enum to index the array, so that it is possible to add sorted
> entries without causing churn.
> 
> Signed-off-by: Peter Rosin <peda@axentia.se>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/ntc_thermistor.c | 82 +++++++++++++++++++++++++-----------------
>  1 file changed, 49 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
> index e0c6b2f244a6..7747c1ed1f02 100644
> --- a/drivers/hwmon/ntc_thermistor.c
> +++ b/drivers/hwmon/ntc_thermistor.c
> @@ -45,18 +45,34 @@ struct ntc_compensation {
>  	unsigned int	ohm;
>  };
>  
> -/* Order matters, ntc_match references the entries by index */
> +/*
> + * Used as index in a zero-terminated array, holes not allowed so
> + * that NTC_LAST is the first empty array entry.
> + */
> +enum {
> +	NTC_B57330V2103,
> +	NTC_B57891S0103,
> +	NTC_NCP03WB473,
> +	NTC_NCP03WF104,
> +	NTC_NCP15WB473,
> +	NTC_NCP15WL333,
> +	NTC_NCP15XH103,
> +	NTC_NCP18WB473,
> +	NTC_NCP21WB473,
> +	NTC_LAST,
> +};
> +
>  static const struct platform_device_id ntc_thermistor_id[] = {
> -	{ "ncp15wb473", TYPE_NCPXXWB473 },
> -	{ "ncp18wb473", TYPE_NCPXXWB473 },
> -	{ "ncp21wb473", TYPE_NCPXXWB473 },
> -	{ "ncp03wb473", TYPE_NCPXXWB473 },
> -	{ "ncp15wl333", TYPE_NCPXXWL333 },
> -	{ "b57330v2103", TYPE_B57330V2103},
> -	{ "ncp03wf104", TYPE_NCPXXWF104 },
> -	{ "ncp15xh103", TYPE_NCPXXXH103 },
> -	{ "b57891s0103", TYPE_B57891S0103 },
> -	{ },
> +	[NTC_B57330V2103]     = { "b57330v2103",     TYPE_B57330V2103 },
> +	[NTC_B57891S0103]     = { "b57891s0103",     TYPE_B57891S0103 },
> +	[NTC_NCP03WB473]      = { "ncp03wb473",      TYPE_NCPXXWB473 },
> +	[NTC_NCP03WF104]      = { "ncp03wf104",      TYPE_NCPXXWF104 },
> +	[NTC_NCP15WB473]      = { "ncp15wb473",      TYPE_NCPXXWB473 },
> +	[NTC_NCP15WL333]      = { "ncp15wl333",      TYPE_NCPXXWL333 },
> +	[NTC_NCP15XH103]      = { "ncp15xh103",      TYPE_NCPXXXH103 },
> +	[NTC_NCP18WB473]      = { "ncp18wb473",      TYPE_NCPXXWB473 },
> +	[NTC_NCP21WB473]      = { "ncp21wb473",      TYPE_NCPXXWB473 },
> +	[NTC_LAST]            = { },
>  };
>  
>  /*
> @@ -327,36 +343,36 @@ static int ntc_adc_iio_read(struct ntc_thermistor_platform_data *pdata)
>  }
>  
>  static const struct of_device_id ntc_match[] = {
> -	{ .compatible = "murata,ncp15wb473",
> -		.data = &ntc_thermistor_id[0] },
> -	{ .compatible = "murata,ncp18wb473",
> -		.data = &ntc_thermistor_id[1] },
> -	{ .compatible = "murata,ncp21wb473",
> -		.data = &ntc_thermistor_id[2] },
> -	{ .compatible = "murata,ncp03wb473",
> -		.data = &ntc_thermistor_id[3] },
> -	{ .compatible = "murata,ncp15wl333",
> -		.data = &ntc_thermistor_id[4] },
>  	{ .compatible = "epcos,b57330v2103",
> -		.data = &ntc_thermistor_id[5]},
> +		.data = &ntc_thermistor_id[NTC_B57330V2103]},
> +	{ .compatible = "epcos,b57891s0103",
> +		.data = &ntc_thermistor_id[NTC_B57891S0103] },
> +	{ .compatible = "murata,ncp03wb473",
> +		.data = &ntc_thermistor_id[NTC_NCP03WB473] },
>  	{ .compatible = "murata,ncp03wf104",
> -		.data = &ntc_thermistor_id[6] },
> +		.data = &ntc_thermistor_id[NTC_NCP03WF104] },
> +	{ .compatible = "murata,ncp15wb473",
> +		.data = &ntc_thermistor_id[NTC_NCP15WB473] },
> +	{ .compatible = "murata,ncp15wl333",
> +		.data = &ntc_thermistor_id[NTC_NCP15WL333] },
>  	{ .compatible = "murata,ncp15xh103",
> -		.data = &ntc_thermistor_id[7] },
> -	{ .compatible = "epcos,b57891s0103",
> -		.data = &ntc_thermistor_id[8] },
> +		.data = &ntc_thermistor_id[NTC_NCP15XH103] },
> +	{ .compatible = "murata,ncp18wb473",
> +		.data = &ntc_thermistor_id[NTC_NCP18WB473] },
> +	{ .compatible = "murata,ncp21wb473",
> +		.data = &ntc_thermistor_id[NTC_NCP21WB473] },
>  
>  	/* Usage of vendor name "ntc" is deprecated */
> +	{ .compatible = "ntc,ncp03wb473",
> +		.data = &ntc_thermistor_id[NTC_NCP03WB473] },
>  	{ .compatible = "ntc,ncp15wb473",
> -		.data = &ntc_thermistor_id[0] },
> +		.data = &ntc_thermistor_id[NTC_NCP15WB473] },
> +	{ .compatible = "ntc,ncp15wl333",
> +		.data = &ntc_thermistor_id[NTC_NCP15WL333] },
>  	{ .compatible = "ntc,ncp18wb473",
> -		.data = &ntc_thermistor_id[1] },
> +		.data = &ntc_thermistor_id[NTC_NCP18WB473] },
>  	{ .compatible = "ntc,ncp21wb473",
> -		.data = &ntc_thermistor_id[2] },
> -	{ .compatible = "ntc,ncp03wb473",
> -		.data = &ntc_thermistor_id[3] },
> -	{ .compatible = "ntc,ncp15wl333",
> -		.data = &ntc_thermistor_id[4] },
> +		.data = &ntc_thermistor_id[NTC_NCP21WB473] },
>  	{ },
>  };
>  MODULE_DEVICE_TABLE(of, ntc_match);
