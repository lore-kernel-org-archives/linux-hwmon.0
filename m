Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:39857 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751627AbcG0IsJ (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
	Wed, 27 Jul 2016 04:48:09 -0400
Date: Wed, 27 Jul 2016 10:48:05 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] hwmon: (lm90) Improve error handling
Message-ID: <20160727104805.3ed87ae5@endymion>
In-Reply-To: <1469546388-29907-3-git-send-email-linux@roeck-us.net>
References: <1469546388-29907-1-git-send-email-linux@roeck-us.net>
	<1469546388-29907-3-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Guenter,

On Tue, 26 Jul 2016 08:19:47 -0700, Guenter Roeck wrote:
> Replace devm_add_action() with devm_add_action_or_reset(),
> and check its return value.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/lm90.c | 12 +++++++-----
>  1 file changed, 7 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 7b3eedf76c62..fa15f7238a28 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -1551,9 +1551,7 @@ static int lm90_init_client(struct i2c_client *client, struct lm90_data *data)
>  	if (config != data->config_orig) /* Only write if changed */
>  		i2c_smbus_write_byte_data(client, LM90_REG_W_CONFIG1, config);
>  
> -	devm_add_action(&client->dev, lm90_restore_conf, data);
> -
> -	return 0;
> +	return devm_add_action_or_reset(&client->dev, lm90_restore_conf, data);
>  }
>  
>  static bool lm90_is_tripped(struct i2c_client *client, u16 *status)
> @@ -1640,7 +1638,9 @@ static int lm90_probe(struct i2c_client *client,
>  		return err;
>  	}
>  
> -	devm_add_action(dev, lm90_regulator_disable, regulator);
> +	err = devm_add_action_or_reset(dev, lm90_regulator_disable, regulator);
> +	if (err)
> +		return err;
>  
>  	data = devm_kzalloc(dev, sizeof(struct lm90_data), GFP_KERNEL);
>  	if (!data)
> @@ -1696,7 +1696,9 @@ static int lm90_probe(struct i2c_client *client,
>  		err = device_create_file(dev, &dev_attr_pec);
>  		if (err)
>  			return err;
> -		devm_add_action(dev, lm90_remove_pec, dev);
> +		err = devm_add_action_or_reset(dev, lm90_remove_pec, dev);
> +		if (err)
> +			return err;
>  	}
>  
>  	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,

I'm not yet familiar with that API but it looks like the right thing to
do.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
