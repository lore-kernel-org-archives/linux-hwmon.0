Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:40296 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726393AbeJIDhf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 8 Oct 2018 23:37:35 -0400
Date: Mon, 8 Oct 2018 13:24:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, afd@ti.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (ina3221) Clamp shunt resistor value from DT
Message-ID: <20181008202402.GA27003@roeck-us.net>
References: <20181008200537.22062-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181008200537.22062-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Oct 08, 2018 at 01:05:37PM -0700, Nicolin Chen wrote:
> The input->shunt_resistor is int type while the value from DT is
> unsigned int. Meanwhile, a divide-by-zero error would happen if
> the value is 0. So this patch just simply clamps the value.
> 

I think it would be better to validate the numbers here instead of 
silently accepting bad values, and return -EINVAL if the property value
is bad.

Thanks,
Guenter

> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/hwmon/ina3221.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/ina3221.c b/drivers/hwmon/ina3221.c
> index c3a497aed345..ce8f0a8c4982 100644
> --- a/drivers/hwmon/ina3221.c
> +++ b/drivers/hwmon/ina3221.c
> @@ -536,8 +536,10 @@ static int ina3221_probe_child_from_dt(struct device *dev,
>  	of_property_read_string(child, "label", &input->label);
>  
>  	/* Overwrite default shunt resistor value optionally */
> -	if (!of_property_read_u32(child, "shunt-resistor-micro-ohms", &val))
> +	if (!of_property_read_u32(child, "shunt-resistor-micro-ohms", &val)) {
> +		val = clamp_val(val, 1, INT_MAX);
>  		input->shunt_resistor = val;
> +	}
>  
>  	return 0;
>  }
> -- 
> 2.17.1
> 
