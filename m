Return-Path: <jdelvare@suse.de>
Return-path: <jdelvare@suse.de>
Date: Thu, 22 Mar 2018 10:17:02 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (lm92) Do not try to detect MAX6635
Message-ID: <20180322101702.247542e2@endymion>
In-Reply-To: <20180321150452.9257-1-alvaro.gamez@hazent.com>
References: <20180321150452.9257-1-alvaro.gamez@hazent.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, 21 Mar 2018 16:04:52 +0100, Alvaro Gamez Machado wrote:
> Maxim MAX663x family are mostly compatible with LM92, but they lack any
> identification register. Weakening the detect function would make it prone
> to false positives, and current one doesn't detect all chips.  Therefore,
> the detect function for max6635 devices is removed in favor of explicit
> device instatiation.
> 
> Signed-off-by: Alvaro Gamez Machado <alvaro.gamez@hazent.com>
> ---
>  Documentation/hwmon/lm92 |  4 +---
>  drivers/hwmon/lm92.c     | 58 ------------------------------------------------
>  2 files changed, 1 insertion(+), 61 deletions(-)
> 
> diff --git a/Documentation/hwmon/lm92 b/Documentation/hwmon/lm92
> index 22f68ad032cf..f2a5adcf4ead 100644
> --- a/Documentation/hwmon/lm92
> +++ b/Documentation/hwmon/lm92
> @@ -12,9 +12,7 @@ Supported chips:
>      Datasheet: http://www.national.com/pf/LM/LM76.html
>    * Maxim MAX6633/MAX6634/MAX6635
>      Prefix: 'lm92'
> -    Addresses scanned: I2C 0x48 - 0x4b
> -    MAX6633 with address in 0x40 - 0x47, 0x4c - 0x4f needs force parameter
> -    and MAX6634 with address in 0x4c - 0x4f needs force parameter
> +    Addresses scanned: none, force parameter needed
>      Datasheet: http://www.maxim-ic.com/quick_view2.cfm/qv_pk/3074
>  
>  Authors:
> diff --git a/drivers/hwmon/lm92.c b/drivers/hwmon/lm92.c
> index 2a91974a10bb..18509b5af11e 100644
> --- a/drivers/hwmon/lm92.c
> +++ b/drivers/hwmon/lm92.c
> @@ -259,62 +259,6 @@ static void lm92_init_client(struct i2c_client *client)
>  					  config & 0xFE);
>  }
>  
> -/*
> - * The MAX6635 has no identification register, so we have to use tricks
> - * to identify it reliably. This is somewhat slow.
> - * Note that we do NOT rely on the 2 MSB of the configuration register
> - * always reading 0, as suggested by the datasheet, because it was once
> - * reported not to be true.
> - */
> -static int max6635_check(struct i2c_client *client)
> -{
> -	u16 temp_low, temp_high, temp_hyst, temp_crit;
> -	u8 conf;
> -	int i;
> -
> -	/*
> -	 * No manufacturer ID register, so a read from this address will
> -	 * always return the last read value.
> -	 */
> -	temp_low = i2c_smbus_read_word_data(client, LM92_REG_TEMP_LOW);
> -	if (i2c_smbus_read_word_data(client, LM92_REG_MAN_ID) != temp_low)
> -		return 0;
> -	temp_high = i2c_smbus_read_word_data(client, LM92_REG_TEMP_HIGH);
> -	if (i2c_smbus_read_word_data(client, LM92_REG_MAN_ID) != temp_high)
> -		return 0;
> -
> -	/* Limits are stored as integer values (signed, 9-bit). */
> -	if ((temp_low & 0x7f00) || (temp_high & 0x7f00))
> -		return 0;
> -	temp_hyst = i2c_smbus_read_word_data(client, LM92_REG_TEMP_HYST);
> -	temp_crit = i2c_smbus_read_word_data(client, LM92_REG_TEMP_CRIT);
> -	if ((temp_hyst & 0x7f00) || (temp_crit & 0x7f00))
> -		return 0;
> -
> -	/*
> -	 * Registers addresses were found to cycle over 16-byte boundaries.
> -	 * We don't test all registers with all offsets so as to save some
> -	 * reads and time, but this should still be sufficient to dismiss
> -	 * non-MAX6635 chips.
> -	 */
> -	conf = i2c_smbus_read_byte_data(client, LM92_REG_CONFIG);
> -	for (i = 16; i < 96; i *= 2) {
> -		if (temp_hyst != i2c_smbus_read_word_data(client,
> -				 LM92_REG_TEMP_HYST + i - 16)
> -		 || temp_crit != i2c_smbus_read_word_data(client,
> -				 LM92_REG_TEMP_CRIT + i)
> -		 || temp_low != i2c_smbus_read_word_data(client,
> -				LM92_REG_TEMP_LOW + i + 16)
> -		 || temp_high != i2c_smbus_read_word_data(client,
> -				 LM92_REG_TEMP_HIGH + i + 32)
> -		 || conf != i2c_smbus_read_byte_data(client,
> -			    LM92_REG_CONFIG + i))
> -			return 0;
> -	}
> -
> -	return 1;
> -}
> -
>  static struct attribute *lm92_attrs[] = {
>  	&sensor_dev_attr_temp1_input.dev_attr.attr,
>  	&sensor_dev_attr_temp1_crit.dev_attr.attr,
> @@ -348,8 +292,6 @@ static int lm92_detect(struct i2c_client *new_client,
>  
>  	if ((config & 0xe0) == 0x00 && man_id == 0x0180)
>  		pr_info("lm92: Found National Semiconductor LM92 chip\n");
> -	else if (max6635_check(new_client))
> -		pr_info("lm92: Found Maxim MAX6635 chip\n");
>  	else
>  		return -ENODEV;
>  

Reviewed-by: Jean Delvare <jdelvare@suse.de>

It would probably make sense to add prefix "max6635" to lm92_id[] so
that the device can be instantiated by its actual name.

-- 
Jean Delvare
SUSE L3 Support
