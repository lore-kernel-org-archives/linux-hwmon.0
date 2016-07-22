Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:33657 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751288AbcGVWco (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 22 Jul 2016 18:32:44 -0400
Date: Fri, 22 Jul 2016 15:32:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Michael Walle <michael@walle.cc>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: adt7411: set sane values for CFG1 and CFG3
Message-ID: <20160722223236.GA1116@roeck-us.net>
References: <1469203855-18094-1-git-send-email-michael@walle.cc>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1469203855-18094-1-git-send-email-michael@walle.cc>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Jul 22, 2016 at 06:10:54PM +0200, Michael Walle wrote:
> According to the datasheet we have to set some bits as 0 and others as 1.
> Make sure we do this for CFG1 and CFG3.
> 
> Signed-off-by: Michael Walle <michael@walle.cc>
> ---
>  drivers/hwmon/adt7411.c | 53 +++++++++++++++++++++++++++++++++++++++++++++----
>  1 file changed, 49 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/adt7411.c b/drivers/hwmon/adt7411.c
> index a7f8869..410405b 100644
> --- a/drivers/hwmon/adt7411.c
> +++ b/drivers/hwmon/adt7411.c
> @@ -30,6 +30,7 @@
>  
>  #define ADT7411_REG_CFG1			0x18
>  #define ADT7411_CFG1_START_MONITOR		(1 << 0)
> +#define ADT7411_CFG1_RESERVED_BIT1		(1 << 1)
>  #define ADT7411_CFG1_RESERVED_BIT3		(1 << 3)
>  
>  #define ADT7411_REG_CFG2			0x19
> @@ -37,6 +38,9 @@
>  
>  #define ADT7411_REG_CFG3			0x1a
>  #define ADT7411_CFG3_ADC_CLK_225		(1 << 0)
> +#define ADT7411_CFG3_RESERVED_BIT1		(1 << 1)
> +#define ADT7411_CFG3_RESERVED_BIT2		(1 << 2)
> +#define ADT7411_CFG3_RESERVED_BIT3		(1 << 3)
>  #define ADT7411_CFG3_REF_VDD			(1 << 4)
>  
>  #define ADT7411_REG_DEVICE_ID			0x4d
> @@ -280,6 +284,50 @@ static int adt7411_detect(struct i2c_client *client,
>  	return 0;
>  }
>  
> +static int adt7411_init_device(struct adt7411_data *data)
> +{
> +	int ret;
> +	u8 val;
> +
> +	mutex_lock(&data->device_lock);
> +
This is only called from the probe function. Locking is therefore not
necessary.

Thanks,
Guenter

> +	ret = i2c_smbus_read_byte_data(data->client, ADT7411_REG_CFG3);
> +	if (ret < 0)
> +		goto exit_unlock;
> +
> +	/*
> +	 * We must only write zero to bit 1 and bit 2 and only one to bit 3
> +	 * according to the datasheet.
> +	 */
> +	val = ret;
> +	val &= ~(ADT7411_CFG3_RESERVED_BIT1 | ADT7411_CFG3_RESERVED_BIT2);
> +	val |= ADT7411_CFG3_RESERVED_BIT3;
> +
> +	ret = i2c_smbus_write_byte_data(data->client, ADT7411_REG_CFG3, val);
> +	if (ret < 0)
> +		goto exit_unlock;
> +
> +	ret = i2c_smbus_read_byte_data(data->client, ADT7411_REG_CFG1);
> +	if (ret < 0)
> +		goto exit_unlock;
> +
> +	/*
> +	 * We must only write zero to bit 1 and only one to bit 3 according to
> +	 * the datasheet.
> +	 */
> +	val = ret;
> +	val &= ~ADT7411_CFG1_RESERVED_BIT1;
> +	val |= ADT7411_CFG1_RESERVED_BIT3;
> +
> +	/* enable monitoring */
> +	val |= ADT7411_CFG1_START_MONITOR;
> +
> +	ret = i2c_smbus_write_byte_data(data->client, ADT7411_REG_CFG1, val);
> + exit_unlock:
> +	mutex_unlock(&data->device_lock);
> +	return ret;
> +}
> +
>  static int adt7411_probe(struct i2c_client *client,
>  				   const struct i2c_device_id *id)
>  {
> @@ -297,10 +345,7 @@ static int adt7411_probe(struct i2c_client *client,
>  	mutex_init(&data->device_lock);
>  	mutex_init(&data->update_lock);
>  
> -	/* According to the datasheet, we must only write 1 to bit 3 */
> -	ret = adt7411_modify_bit(client, ADT7411_REG_CFG1,
> -				 ADT7411_CFG1_RESERVED_BIT3
> -				 | ADT7411_CFG1_START_MONITOR, 1);
> +	ret = adt7411_init_device(data);
>  	if (ret < 0)
>  		return ret;
>  
> -- 
> 2.1.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
