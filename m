Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:49536 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752365AbcLIJtj (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 9 Dec 2016 04:49:39 -0500
Date: Fri, 9 Dec 2016 10:49:31 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 09/17] hwmon: (nct7802) Fix overflows seen when writing
 into limit attributes
Message-ID: <20161209104931.0f8ad01f@endymion>
In-Reply-To: <1480913740-5678-9-git-send-email-linux@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
        <1480913740-5678-9-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Guenter,

On Sun,  4 Dec 2016 20:55:32 -0800, Guenter Roeck wrote:
> Fix overflows seen when writing voltage and temperature limit attributes.
> 
> The value passed to DIV_ROUND_CLOSEST() needs to be clamped.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

I think you can also add:

Fixes: 3434f3783580 ("hwmon: Driver for Nuvoton NCT7802Y")

> ---
>  drivers/hwmon/nct7802.c | 7 ++++---
>  1 file changed, 4 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/nct7802.c b/drivers/hwmon/nct7802.c
> index 3ce33d244cc0..6fe71cfe0320 100644
> --- a/drivers/hwmon/nct7802.c
> +++ b/drivers/hwmon/nct7802.c
> @@ -326,8 +326,9 @@ static int nct7802_write_voltage(struct nct7802_data *data, int nr, int index,
>  	int shift = 8 - REG_VOLTAGE_LIMIT_MSB_SHIFT[index - 1][nr];
>  	int err;
>  
> -	voltage = DIV_ROUND_CLOSEST(voltage, nct7802_vmul[nr]);
> -	voltage = clamp_val(voltage, 0, 0x3ff);
> +	voltage = DIV_ROUND_CLOSEST(clamp_val(voltage, 0,
> +					      0x3ff * nct7802_vmul[nr]),
> +				    nct7802_vmul[nr]);

As for previous patches, I think separate lines make the code more
readable.

>  
>  	mutex_lock(&data->access_lock);
>  	err = regmap_write(data->regmap,
> @@ -402,7 +403,7 @@ static ssize_t store_temp(struct device *dev, struct device_attribute *attr,
>  	if (err < 0)
>  		return err;
>  
> -	val = clamp_val(DIV_ROUND_CLOSEST(val, 1000), -128, 127);
> +	val = DIV_ROUND_CLOSEST(clamp_val(val, -127000, 127000), 1000);

You change the low limit from -128 to -127 without justification.

>  
>  	err = regmap_write(data->regmap, nr, val & 0xff);
>  	return err ? : count;

Looking at function nct7802_write_fan_min() I think an overflow can
happen here too, as DIV_ROUND_CLOSEST() is called before clamp_val().
Any reason why you did not fix that one?

-- 
Jean Delvare
SUSE L3 Support
