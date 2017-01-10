Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:33903 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1762607AbdAJRDJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 10 Jan 2017 12:03:09 -0500
Date: Tue, 10 Jan 2017 09:03:06 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: jeroen.de_wachter.ext@nokia.com
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [v2] hwmon/tmp401: use smb word operations instead of 2 smb byte
 operations
Message-ID: <20170110170306.GA12973@roeck-us.net>
References: <1483984500-19529-1-git-send-email-jeroen.de_wachter.ext@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1483984500-19529-1-git-send-email-jeroen.de_wachter.ext@nokia.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Jan 09, 2017 at 06:55:00PM +0100, jeroen.de_wachter.ext@nokia.com wrote:
> From: Jeroen De Wachter <jeroen.de_wachter.ext@nokia.com>
> 
> tmp401 separately read/wrote high and low bytes of temperature values while
> the hardware supports reading/writing those values in one operation. Driver
> has been modified to use word operations where possible.
> 
> Tested with a tmp432 sensor on a mips64 platform.
> 
> Signed-off-by: Jeroen De Wachter <jeroen.de_wachter.ext@nokia.com>

Applied to -next.

Thanks,
Guenter

> ---
>  drivers/hwmon/tmp401.c | 49 ++++++++++++++-----------------------------------
>  1 file changed, 14 insertions(+), 35 deletions(-)
> 
> diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
> index eeeed2c..0af6b86 100644
> --- a/drivers/hwmon/tmp401.c
> +++ b/drivers/hwmon/tmp401.c
> @@ -82,16 +82,6 @@
>  	{ 0, 0x11 },	/* offset */
>  };
>  
> -static const u8 TMP401_TEMP_LSB[7][2] = {
> -	{ 0x15, 0x10 },	/* temp */
> -	{ 0x17, 0x14 },	/* low limit */
> -	{ 0x16, 0x13 },	/* high limit */
> -	{ 0, 0 },	/* therm (crit) limit (unused) */
> -	{ 0x31, 0x35 },	/* lowest */
> -	{ 0x33, 0x37 },	/* highest */
> -	{ 0, 0x12 },	/* offset */
> -};
> -
>  static const u8 TMP432_TEMP_MSB_READ[4][3] = {
>  	{ 0x00, 0x01, 0x23 },	/* temp */
>  	{ 0x06, 0x08, 0x16 },	/* low limit */
> @@ -106,12 +96,6 @@
>  	{ 0x20, 0x19, 0x1A },	/* therm (crit) limit */
>  };
>  
> -static const u8 TMP432_TEMP_LSB[3][3] = {
> -	{ 0x29, 0x10, 0x24 },	/* temp */
> -	{ 0x3E, 0x14, 0x18 },	/* low limit */
> -	{ 0x3D, 0x13, 0x17 },	/* high limit */
> -};
> -
>  /* [0] = fault, [1] = low, [2] = high, [3] = therm/crit */
>  static const u8 TMP432_STATUS_REG[] = {
>  	0x1b, 0x36, 0x35, 0x37 };
> @@ -213,25 +197,20 @@ static int tmp401_update_device_reg16(struct i2c_client *client,
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
> @@ -373,11 +352,11 @@ static ssize_t store_temp(struct device *dev, struct device_attribute *devattr,
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
> +		/* Hardware expects big endian data --> use _swapped */
> +		i2c_smbus_write_word_swapped(client, regaddr, reg);
>  	}
>  	data->temp[nr][index] = reg;
>  
