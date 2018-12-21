Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41356 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389090AbeLUXcR (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 21 Dec 2018 18:32:17 -0500
Date: Fri, 21 Dec 2018 15:32:14 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Kangjie Lu <kjlu@umn.edu>
Cc: pakki001@umn.edu, Jean Delvare <jdelvare@suse.com>,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (lm80) fix a missing check of the status of
 SMBus read
Message-ID: <20181221233214.GA10894@roeck-us.net>
References: <20181221190134.930-1-kjlu@umn.edu>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181221190134.930-1-kjlu@umn.edu>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Dec 21, 2018 at 01:01:33PM -0600, Kangjie Lu wrote:
> If lm80_read_value() fails, it returns a negative number instead of the
> correct read data. Therefore, we should avoid using the data if it
> fails.
> 
> The fix checks if lm80_read_value() fails, and if so, returns with the
> error number.
> 
> Signed-off-by: Kangjie Lu <kjlu@umn.edu>
> ---
[ change log goes here ]

>  drivers/hwmon/lm80.c | 8 ++++++--
>  1 file changed, 6 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/lm80.c b/drivers/hwmon/lm80.c
> index 08e3945a6fbf..d91333557f04 100644
> --- a/drivers/hwmon/lm80.c
> +++ b/drivers/hwmon/lm80.c
> @@ -360,6 +360,7 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
>  	struct i2c_client *client = data->client;
>  	unsigned long min, val;
>  	u8 reg;
> +	int rv;
>  	int err = kstrtoul(buf, 10, &val);
>  	if (err < 0)
>  		return err;

Now we have 'rv' and 'err'.

My earlier comments didn't mean to suggest that we should now have two
different variables to handle errors.

Never mind, I'll fix it all up myself. No need to resend.

Guenter

> @@ -390,8 +391,11 @@ static ssize_t set_fan_div(struct device *dev, struct device_attribute *attr,
>  		return -EINVAL;
>  	}
>  
> -	reg = (lm80_read_value(client, LM80_REG_FANDIV) &
> -	       ~(3 << (2 * (nr + 1)))) | (data->fan_div[nr] << (2 * (nr + 1)));
> +	rv = lm80_read_value(client, LM80_REG_FANDIV);
> +	if (rv < 0)
> +		return rv;
> +	reg = (rv & ~(3 << (2 * (nr + 1))))
> +	    | (data->fan_div[nr] << (2 * (nr + 1)));
>  	lm80_write_value(client, LM80_REG_FANDIV, reg);
>  
>  	/* Restore fan_min */
