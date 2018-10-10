Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:39569 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725766AbeJJH4q (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Oct 2018 03:56:46 -0400
Date: Tue, 9 Oct 2018 17:37:15 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, afd@ti.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (ina3221) Validate shunt resistor value from DT
Message-ID: <20181010003715.GA21748@roeck-us.net>
References: <20181008212451.18637-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181008212451.18637-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Oct 08, 2018 at 02:24:51PM -0700, Nicolin Chen wrote:
> The input->shunt_resistor is int type while the value from DT is
> unsigned int. Meanwhile, a divide-by-zero error would happen if
> the value is 0. So this patch just simply validates the value.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>

Applied.

Thanks,
Guenter

> ---
> Changelog
> v1->v2:
>  * Validate the value and error out
> 
>  drivers/hwmon/ina3221.c | 8 +++++++-
>  1 file changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> index c3a497aed345..4f3ed24efe8e 100644
> --- a/drivers/hwmon/ina3221.c
> +++ b/drivers/hwmon/ina3221.c
> @@ -536,8 +536,14 @@ static int ina3221_probe_child_from_dt(struct device *dev,
>  	of_property_read_string(child, "label", &input->label);
>  
>  	/* Overwrite default shunt resistor value optionally */
> -	if (!of_property_read_u32(child, "shunt-resistor-micro-ohms", &val))
> +	if (!of_property_read_u32(child, "shunt-resistor-micro-ohms", &val)) {
> +		if (val < 1 || val > INT_MAX) {
> +			dev_err(dev, "invalid shunt resistor value %u of %s\n",
> +				val, child->name);
> +			return -EINVAL;
> +		}
>  		input->shunt_resistor = val;
> +	}
>  
>  	return 0;
>  }
