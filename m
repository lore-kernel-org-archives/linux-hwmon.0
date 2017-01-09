Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:45851 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1763057AbdAIRJy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 9 Jan 2017 12:09:54 -0500
Date: Mon, 9 Jan 2017 09:09:52 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: jeroen.de_wachter.ext@nokia.com
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon/tmp401: use smb word operations instead of 2
 smb byte operations
Message-ID: <20170109170952.GB16253@roeck-us.net>
References: <1483980458-28202-1-git-send-email-jeroen.de_wachter.ext@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1483980458-28202-1-git-send-email-jeroen.de_wachter.ext@nokia.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Jan 09, 2017 at 05:47:37PM +0100, jeroen.de_wachter.ext@nokia.com wrote:
> From: Jeroen De Wachter <jeroen.de_wachter.ext@nokia.com>
> 
> tmp401 separately read/wrote high and low bytes of temperature values while
> the hardware supports reading/writing those values in one operation. Driver
> has been modified to use word operations where possible.
> 
> Tested with a tmp432 sensor on a mips64 platform.
> 
> Signed-off-by: Jeroen De Wachter <jeroen.de_wachter.ext@nokia.com>
> ---
>  drivers/hwmon/tmp401.c | 48 +++++++++++++++++++++++++++++-------------------
>  1 file changed, 29 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
> index eeeed2c..88b17e4 100644
> --- a/drivers/hwmon/tmp401.c
> +++ b/drivers/hwmon/tmp401.c
> @@ -213,25 +213,29 @@ static int tmp401_update_device_reg16(struct i2c_client *client,
>  	for (i = 0; i < num_sensors; i++) {		/* local / r1 / r2 */
>  		for (j = 0; j < num_regs; j++) {	/* temp / low / ... */
>  			u8 regaddr;
> -			/*
> -			 * High byte must be read first immediately followed
> -			 * by the low byte
> -			 */
> +
>  			regaddr = data->kind == tmp432 ?
>  						TMP432_TEMP_MSB_READ[j][i] :
>  						TMP401_TEMP_MSB_READ[j][i];
> -			val = i2c_smbus_read_byte_data(client, regaddr);
> -			if (val < 0)
> -				return val;
> -			data->temp[j][i] = val << 8;
> -			if (j == 3)		/* crit is msb only */
> -				continue;
> -			regaddr = data->kind == tmp432 ? TMP432_TEMP_LSB[j][i]
> -						       : TMP401_TEMP_LSB[j][i];
> -			val = i2c_smbus_read_byte_data(client, regaddr);
> +			if (j == 3) { /* crit is msb only */
> +				val = i2c_smbus_read_byte_data(client, regaddr);
> +			} else {
> +				/*
> +				 * Hardware provides big endian data. However,
> +				 * the smbus protocol expects the LSB first in
> +				 * I2C_SMBUS_WORD_DATA operations.
> +				 * i2c_smbus_read_word_swapped swaps the bytes
> +				 * in the value it receives from
> +				 * i2c_smbus_read_word_data before returning the
> +				 * data, so we get the correct value.
> +				 */
Please drop the comment or make it shorter (such as "Hardware provides
big endian data").

> +				val = i2c_smbus_read_word_swapped(client,
> +								  regaddr);
> +			}
>  			if (val < 0)
>  				return val;
> -			data->temp[j][i] |= val;
> +
> +			data->temp[j][i] = j == 3 ? val << 8 : val;
>  		}
>  	}
>  	return 0;
> @@ -373,11 +377,17 @@ static ssize_t store_temp(struct device *dev, struct device_attribute *devattr,
>  
>  	regaddr = data->kind == tmp432 ? TMP432_TEMP_MSB_WRITE[nr][index]
>  				       : TMP401_TEMP_MSB_WRITE[nr][index];
> -	i2c_smbus_write_byte_data(client, regaddr, reg >> 8);
> -	if (nr != 3) {
> -		regaddr = data->kind == tmp432 ? TMP432_TEMP_LSB[nr][index]
> -					       : TMP401_TEMP_LSB[nr][index];
> -		i2c_smbus_write_byte_data(client, regaddr, reg & 0xFF);
> +	if (nr == 3) { /* crit is msb only */
> +		i2c_smbus_write_byte_data(client, regaddr, reg >> 8);
> +	} else {
> +		/*
> +		 * Hardware expects big endian data. However, the smbus protocol
> +		 * puts the LSB first in I2C_SMBUS_WORD_DATA operations.
> +		 * i2c_smbus_write_word_data_swapped will swap the bytes before
> +		 * passing them to i2c_smbus_write_word_data, so the hardware
> +		 * will receive the MSB first, as expected.

Comment in one place is enough.

Unless I am missing something, TMP432_TEMP_LSB and TMP401_TEMP_LSB are now
unused and can be removed.

Thanks,
Guenter

> +		 */
> +		i2c_smbus_write_word_swapped(client, regaddr, reg);
>  	}
>  	data->temp[nr][index] = reg;
>  
> -- 
> 1.8.3.1
> 
