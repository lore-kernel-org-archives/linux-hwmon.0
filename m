Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:34178 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753188AbeAOMYi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 15 Jan 2018 07:24:38 -0500
Date: Mon, 15 Jan 2018 04:24:35 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Samuel Mendoza-Jonas <sam@mendozajonas.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-kernel@vger.kernel.org,
        OpenBMC Maillist <openbmc@lists.ozlabs.org>
Subject: Re: hwmon: (pmbus/ir35221) Remove unnecessary scaling
Message-ID: <20180115122435.GA24640@roeck-us.net>
References: <20180115055858.1188-1-sam@mendozajonas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180115055858.1188-1-sam@mendozajonas.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Jan 15, 2018 at 04:58:58PM +1100, Samuel Mendoza-Jonas wrote:
> The ir35221 datasheet describes specific scaling factors for a number of
> commands which the current driver applies when reading.
> However now that the ir35221 has been tested on machines with more
> easily verifiable readings these descriptions have turned out to be
> superfluous and reading each command according to the linear format is
> sufficient.
> 
> Signed-off-by: Samuel Mendoza-Jonas <sam@mendozajonas.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/pmbus/ir35221.c | 189 ------------------------------------------
>  1 file changed, 189 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/ir35221.c b/drivers/hwmon/pmbus/ir35221.c
> index 8b906b44484b..977315b0fd90 100644
> --- a/drivers/hwmon/pmbus/ir35221.c
> +++ b/drivers/hwmon/pmbus/ir35221.c
> @@ -25,168 +25,19 @@
>  #define IR35221_MFR_IOUT_VALLEY		0xcb
>  #define IR35221_MFR_TEMP_VALLEY		0xcc
>  
> -static long ir35221_reg2data(int data, enum pmbus_sensor_classes class)
> -{
> -	s16 exponent;
> -	s32 mantissa;
> -	long val;
> -
> -	/* We only modify LINEAR11 formats */
> -	exponent = ((s16)data) >> 11;
> -	mantissa = ((s16)((data & 0x7ff) << 5)) >> 5;
> -
> -	val = mantissa * 1000L;
> -
> -	/* scale result to micro-units for power sensors */
> -	if (class == PSC_POWER)
> -		val = val * 1000L;
> -
> -	if (exponent >= 0)
> -		val <<= exponent;
> -	else
> -		val >>= -exponent;
> -
> -	return val;
> -}
> -
> -#define MAX_MANTISSA	(1023 * 1000)
> -#define MIN_MANTISSA	(511 * 1000)
> -
> -static u16 ir35221_data2reg(long val, enum pmbus_sensor_classes class)
> -{
> -	s16 exponent = 0, mantissa;
> -	bool negative = false;
> -
> -	if (val == 0)
> -		return 0;
> -
> -	if (val < 0) {
> -		negative = true;
> -		val = -val;
> -	}
> -
> -	/* Power is in uW. Convert to mW before converting. */
> -	if (class == PSC_POWER)
> -		val = DIV_ROUND_CLOSEST(val, 1000L);
> -
> -	/* Reduce large mantissa until it fits into 10 bit */
> -	while (val >= MAX_MANTISSA && exponent < 15) {
> -		exponent++;
> -		val >>= 1;
> -	}
> -	/* Increase small mantissa to improve precision */
> -	while (val < MIN_MANTISSA && exponent > -15) {
> -		exponent--;
> -		val <<= 1;
> -	}
> -
> -	/* Convert mantissa from milli-units to units */
> -	mantissa = DIV_ROUND_CLOSEST(val, 1000);
> -
> -	/* Ensure that resulting number is within range */
> -	if (mantissa > 0x3ff)
> -		mantissa = 0x3ff;
> -
> -	/* restore sign */
> -	if (negative)
> -		mantissa = -mantissa;
> -
> -	/* Convert to 5 bit exponent, 11 bit mantissa */
> -	return (mantissa & 0x7ff) | ((exponent << 11) & 0xf800);
> -}
> -
> -static u16 ir35221_scale_result(s16 data, int shift,
> -				enum pmbus_sensor_classes class)
> -{
> -	long val;
> -
> -	val = ir35221_reg2data(data, class);
> -
> -	if (shift < 0)
> -		val >>= -shift;
> -	else
> -		val <<= shift;
> -
> -	return ir35221_data2reg(val, class);
> -}
> -
>  static int ir35221_read_word_data(struct i2c_client *client, int page, int reg)
>  {
>  	int ret;
>  
>  	switch (reg) {
> -	case PMBUS_IOUT_OC_FAULT_LIMIT:
> -	case PMBUS_IOUT_OC_WARN_LIMIT:
> -		ret = pmbus_read_word_data(client, page, reg);
> -		if (ret < 0)
> -			break;
> -		ret = ir35221_scale_result(ret, 1, PSC_CURRENT_OUT);
> -		break;
> -	case PMBUS_VIN_OV_FAULT_LIMIT:
> -	case PMBUS_VIN_OV_WARN_LIMIT:
> -	case PMBUS_VIN_UV_WARN_LIMIT:
> -		ret = pmbus_read_word_data(client, page, reg);
> -		ret = ir35221_scale_result(ret, -4, PSC_VOLTAGE_IN);
> -		break;
> -	case PMBUS_IIN_OC_WARN_LIMIT:
> -		ret = pmbus_read_word_data(client, page, reg);
> -		if (ret < 0)
> -			break;
> -		ret = ir35221_scale_result(ret, -1, PSC_CURRENT_IN);
> -		break;
> -	case PMBUS_READ_VIN:
> -		ret = pmbus_read_word_data(client, page, PMBUS_READ_VIN);
> -		if (ret < 0)
> -			break;
> -		ret = ir35221_scale_result(ret, -5, PSC_VOLTAGE_IN);
> -		break;
> -	case PMBUS_READ_IIN:
> -		ret = pmbus_read_word_data(client, page, PMBUS_READ_IIN);
> -		if (ret < 0)
> -			break;
> -		if (page == 0)
> -			ret = ir35221_scale_result(ret, -4, PSC_CURRENT_IN);
> -		else
> -			ret = ir35221_scale_result(ret, -5, PSC_CURRENT_IN);
> -		break;
> -	case PMBUS_READ_POUT:
> -		ret = pmbus_read_word_data(client, page, PMBUS_READ_POUT);
> -		if (ret < 0)
> -			break;
> -		ret = ir35221_scale_result(ret, -1, PSC_POWER);
> -		break;
> -	case PMBUS_READ_PIN:
> -		ret = pmbus_read_word_data(client, page, PMBUS_READ_PIN);
> -		if (ret < 0)
> -			break;
> -		ret = ir35221_scale_result(ret, -1, PSC_POWER);
> -		break;
> -	case PMBUS_READ_IOUT:
> -		ret = pmbus_read_word_data(client, page, PMBUS_READ_IOUT);
> -		if (ret < 0)
> -			break;
> -		if (page == 0)
> -			ret = ir35221_scale_result(ret, -1, PSC_CURRENT_OUT);
> -		else
> -			ret = ir35221_scale_result(ret, -2, PSC_CURRENT_OUT);
> -		break;
>  	case PMBUS_VIRT_READ_VIN_MAX:
>  		ret = pmbus_read_word_data(client, page, IR35221_MFR_VIN_PEAK);
> -		if (ret < 0)
> -			break;
> -		ret = ir35221_scale_result(ret, -5, PSC_VOLTAGE_IN);
>  		break;
>  	case PMBUS_VIRT_READ_VOUT_MAX:
>  		ret = pmbus_read_word_data(client, page, IR35221_MFR_VOUT_PEAK);
>  		break;
>  	case PMBUS_VIRT_READ_IOUT_MAX:
>  		ret = pmbus_read_word_data(client, page, IR35221_MFR_IOUT_PEAK);
> -		if (ret < 0)
> -			break;
> -		if (page == 0)
> -			ret = ir35221_scale_result(ret, -1, PSC_CURRENT_IN);
> -		else
> -			ret = ir35221_scale_result(ret, -2, PSC_CURRENT_IN);
>  		break;
>  	case PMBUS_VIRT_READ_TEMP_MAX:
>  		ret = pmbus_read_word_data(client, page, IR35221_MFR_TEMP_PEAK);
> @@ -194,9 +45,6 @@ static int ir35221_read_word_data(struct i2c_client *client, int page, int reg)
>  	case PMBUS_VIRT_READ_VIN_MIN:
>  		ret = pmbus_read_word_data(client, page,
>  					   IR35221_MFR_VIN_VALLEY);
> -		if (ret < 0)
> -			break;
> -		ret = ir35221_scale_result(ret, -5, PSC_VOLTAGE_IN);
>  		break;
>  	case PMBUS_VIRT_READ_VOUT_MIN:
>  		ret = pmbus_read_word_data(client, page,
> @@ -205,12 +53,6 @@ static int ir35221_read_word_data(struct i2c_client *client, int page, int reg)
>  	case PMBUS_VIRT_READ_IOUT_MIN:
>  		ret = pmbus_read_word_data(client, page,
>  					   IR35221_MFR_IOUT_VALLEY);
> -		if (ret < 0)
> -			break;
> -		if (page == 0)
> -			ret = ir35221_scale_result(ret, -1, PSC_CURRENT_IN);
> -		else
> -			ret = ir35221_scale_result(ret, -2, PSC_CURRENT_IN);
>  		break;
>  	case PMBUS_VIRT_READ_TEMP_MIN:
>  		ret = pmbus_read_word_data(client, page,
> @@ -224,36 +66,6 @@ static int ir35221_read_word_data(struct i2c_client *client, int page, int reg)
>  	return ret;
>  }
>  
> -static int ir35221_write_word_data(struct i2c_client *client, int page, int reg,
> -				   u16 word)
> -{
> -	int ret;
> -	u16 val;
> -
> -	switch (reg) {
> -	case PMBUS_IOUT_OC_FAULT_LIMIT:
> -	case PMBUS_IOUT_OC_WARN_LIMIT:
> -		val = ir35221_scale_result(word, -1, PSC_CURRENT_OUT);
> -		ret = pmbus_write_word_data(client, page, reg, val);
> -		break;
> -	case PMBUS_VIN_OV_FAULT_LIMIT:
> -	case PMBUS_VIN_OV_WARN_LIMIT:
> -	case PMBUS_VIN_UV_WARN_LIMIT:
> -		val = ir35221_scale_result(word, 4, PSC_VOLTAGE_IN);
> -		ret = pmbus_write_word_data(client, page, reg, val);
> -		break;
> -	case PMBUS_IIN_OC_WARN_LIMIT:
> -		val = ir35221_scale_result(word, 1, PSC_CURRENT_IN);
> -		ret = pmbus_write_word_data(client, page, reg, val);
> -		break;
> -	default:
> -		ret = -ENODATA;
> -		break;
> -	}
> -
> -	return ret;
> -}
> -
>  static int ir35221_probe(struct i2c_client *client,
>  			 const struct i2c_device_id *id)
>  {
> @@ -292,7 +104,6 @@ static int ir35221_probe(struct i2c_client *client,
>  	if (!info)
>  		return -ENOMEM;
>  
> -	info->write_word_data = ir35221_write_word_data;
>  	info->read_word_data = ir35221_read_word_data;
>  
>  	info->pages = 2;
