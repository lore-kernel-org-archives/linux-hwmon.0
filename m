Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f196.google.com ([209.85.210.196]:44878 "EHLO
        mail-pf1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725728AbeLBFxo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 2 Dec 2018 00:53:44 -0500
Date: Sat, 1 Dec 2018 10:40:34 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Rosin <peda@axentia.se>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 2/2] hwmon: (ntc_thermistor) use a table to lookup the
 thermistor type
Message-ID: <20181201184034.GA25714@roeck-us.net>
References: <b732b7e0-0076-9cb3-a146-4d0cd80d2658@roeck-us.net>
 <20181121160327.16772-1-peda@axentia.se>
 <20181121160327.16772-3-peda@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181121160327.16772-3-peda@axentia.se>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Nov 21, 2018 at 04:03:46PM +0000, Peter Rosin wrote:
> Sort the entries while at it.
> 
> Signed-off-by: Peter Rosin <peda@axentia.se>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/ntc_thermistor.c               | 47 +++++++++++++---------------
>  include/linux/platform_data/ntc_thermistor.h |  6 ++--
>  2 files changed, 24 insertions(+), 29 deletions(-)
> 
> diff --git a/drivers/hwmon/ntc_thermistor.c b/drivers/hwmon/ntc_thermistor.c
> index 7747c1ed1f02..56d83b2472c8 100644
> --- a/drivers/hwmon/ntc_thermistor.c
> +++ b/drivers/hwmon/ntc_thermistor.c
> @@ -315,6 +315,23 @@ static const struct ntc_compensation b57891s0103[] = {
>  	{ .temp_c	= 155.0, .ohm	= 168 },
>  };
>  
> +struct ntc_type {
> +	const struct ntc_compensation *comp;
> +	int n_comp;
> +};
> +
> +#define NTC_TYPE(ntc, compensation) \
> +[(ntc)] = { .comp = (compensation), .n_comp = ARRAY_SIZE(compensation) }
> +
> +static const struct ntc_type ntc_type[] = {
> +	NTC_TYPE(TYPE_B57330V2103, b57330v2103),
> +	NTC_TYPE(TYPE_B57891S0103, b57891s0103),
> +	NTC_TYPE(TYPE_NCPXXWB473,  ncpXXwb473),
> +	NTC_TYPE(TYPE_NCPXXWF104,  ncpXXwf104),
> +	NTC_TYPE(TYPE_NCPXXWL333,  ncpXXwl333),
> +	NTC_TYPE(TYPE_NCPXXXH103,  ncpXXxh103),
> +};
> +
>  struct ntc_data {
>  	struct ntc_thermistor_platform_data *pdata;
>  	const struct ntc_compensation *comp;
> @@ -671,37 +688,15 @@ static int ntc_thermistor_probe(struct platform_device *pdev)
>  
>  	data->pdata = pdata;
>  
> -	switch (pdev_id->driver_data) {
> -	case TYPE_NCPXXWB473:
> -		data->comp = ncpXXwb473;
> -		data->n_comp = ARRAY_SIZE(ncpXXwb473);
> -		break;
> -	case TYPE_NCPXXWL333:
> -		data->comp = ncpXXwl333;
> -		data->n_comp = ARRAY_SIZE(ncpXXwl333);
> -		break;
> -	case TYPE_B57330V2103:
> -		data->comp = b57330v2103;
> -		data->n_comp = ARRAY_SIZE(b57330v2103);
> -		break;
> -	case TYPE_NCPXXWF104:
> -		data->comp = ncpXXwf104;
> -		data->n_comp = ARRAY_SIZE(ncpXXwf104);
> -		break;
> -	case TYPE_NCPXXXH103:
> -		data->comp = ncpXXxh103;
> -		data->n_comp = ARRAY_SIZE(ncpXXxh103);
> -		break;
> -	case TYPE_B57891S0103:
> -		data->comp = b57891s0103;
> -		data->n_comp = ARRAY_SIZE(b57891s0103);
> -		break;
> -	default:
> +	if (pdev_id->driver_data >= ARRAY_SIZE(ntc_type)) {
>  		dev_err(dev, "Unknown device type: %lu(%s)\n",
>  				pdev_id->driver_data, pdev_id->name);
>  		return -EINVAL;
>  	}
>  
> +	data->comp   = ntc_type[pdev_id->driver_data].comp;
> +	data->n_comp = ntc_type[pdev_id->driver_data].n_comp;
> +
>  	hwmon_dev = devm_hwmon_device_register_with_groups(dev, pdev_id->name,
>  							   data, ntc_groups);
>  	if (IS_ERR(hwmon_dev)) {
> diff --git a/include/linux/platform_data/ntc_thermistor.h b/include/linux/platform_data/ntc_thermistor.h
> index 231a27c302ec..ee03d429742b 100644
> --- a/include/linux/platform_data/ntc_thermistor.h
> +++ b/include/linux/platform_data/ntc_thermistor.h
> @@ -24,12 +24,12 @@
>  struct iio_channel;
>  
>  enum ntc_thermistor_type {
> -	TYPE_NCPXXWB473,
> -	TYPE_NCPXXWL333,
>  	TYPE_B57330V2103,
> +	TYPE_B57891S0103,
> +	TYPE_NCPXXWB473,
>  	TYPE_NCPXXWF104,
> +	TYPE_NCPXXWL333,
>  	TYPE_NCPXXXH103,
> -	TYPE_B57891S0103,
>  };
>  
>  struct ntc_thermistor_platform_data {
