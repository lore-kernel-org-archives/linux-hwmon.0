Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:34420 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751626AbeA0Q0P (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 27 Jan 2018 11:26:15 -0500
Received: by mail-pg0-f65.google.com with SMTP id r19so1820570pgn.1
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Jan 2018 08:26:15 -0800 (PST)
Subject: Re: [PATCH] hwmon: (sht21) Don't use clock stretching
To: Danilo Bargen <mail@dbrgn.ch>, linux-hwmon@vger.kernel.org
Cc: jdelvare@suse.com, andreas.brauchli@sensirion.com
References: <20180126233731.19127-1-mail@dbrgn.ch>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <54a9981f-71fe-d332-8364-7bfb88eed2b3@roeck-us.net>
Date: Sat, 27 Jan 2018 08:26:13 -0800
MIME-Version: 1.0
In-Reply-To: <20180126233731.19127-1-mail@dbrgn.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 01/26/2018 03:37 PM, Danilo Bargen wrote:
> The current driver uses clock stretching (hold master) mode to retrieve
> the measurements. This blocks the bus and may cause problems on some
> systems like the BCM2835 (Raspberry Pi) that have buggy I2C hardware¹.
> 
> ¹ http://www.advamation.com/knowhow/raspberrypi/rpi-i2c-bug.html
> 
> Signed-off-by: Danilo Bargen <mail@dbrgn.ch>
> Reviewed-by: Andreas Brauchli <andreas.brauchli@sensirion.com>
> ---
>   drivers/hwmon/sht21.c | 79 ++++++++++++++++++++++++++++++++++++++-------------
>   1 file changed, 60 insertions(+), 19 deletions(-)
> 
> diff --git a/drivers/hwmon/sht21.c b/drivers/hwmon/sht21.c
> index 984f14b3e89a..56aa13b15682 100644
> --- a/drivers/hwmon/sht21.c
> +++ b/drivers/hwmon/sht21.c
> @@ -25,15 +25,24 @@
>   #include <linux/mutex.h>
>   #include <linux/device.h>
>   #include <linux/jiffies.h>
> +#include <linux/delay.h>
>   
> -/* I2C command bytes */
> -#define SHT21_TRIG_T_MEASUREMENT_HM  0xe3
> -#define SHT21_TRIG_RH_MEASUREMENT_HM 0xe5
> +/* I2C commands */
> +static const char sht21_trig_t_measurement_nh[] = { 0xf3 };
> +static const char sht21_trig_rh_measurement_nh[] = { 0xf5 };
>   #define SHT21_READ_SNB_CMD1 0xFA
>   #define SHT21_READ_SNB_CMD2 0x0F
>   #define SHT21_READ_SNAC_CMD1 0xFC
>   #define SHT21_READ_SNAC_CMD2 0xC9
>   
> +/* I2C lengths */
> +#define SHT21_CMD_LENGTH 1
> +#define SHT21_RESPONSE_LENGTH 3
> +
> +/* Max waiting times in ms at max resolution, datasheet table 7 */
> +#define SHT21_WAIT_T 85
> +#define SHT21_WAIT_RH 29
> +
>   /**
>    * struct sht21 - SHT21 device specific data
>    * @hwmon_dev: device registered with hwmon
> @@ -93,6 +102,7 @@ static inline int sht21_rh_ticks_to_per_cent_mille(int ticks)
>   static int sht21_update_measurements(struct device *dev)
>   {
>   	int ret = 0;
> +	unsigned char buf[SHT21_RESPONSE_LENGTH];
>   	struct sht21 *sht21 = dev_get_drvdata(dev);
>   	struct i2c_client *client = sht21->client;
>   
> @@ -103,22 +113,60 @@ static int sht21_update_measurements(struct device *dev)
>   	 * maximum two measurements per second at 12bit accuracy shall be made.
>   	 */
>   	if (time_after(jiffies, sht21->last_update + HZ / 2) || !sht21->valid) {
> -		ret = i2c_smbus_read_word_swapped(client,
> -						  SHT21_TRIG_T_MEASUREMENT_HM);
> -		if (ret < 0)
> +		/*
> +		 * Read from the SHT21 in non blocking mode
> +		 * (no clock stretching).
> +		 */
> +
> +		/* Trigger temperature measurement */
> +		ret = i2c_master_send(client,
> +				      sht21_trig_t_measurement_nh,
> +				      SHT21_CMD_LENGTH);
> +		if (ret != SHT21_CMD_LENGTH) {
> +			dev_err(dev, "failed to send command: %d\n", ret);
> +			ret = -EIO;

Both i2c_master_send() and i2c_master_recv() return either the expected length
or an error. Overriding the error is neither necessary nor desirable.

> +			goto out;
> +		}
> +		msleep(SHT21_WAIT_T);
> +
> +		/* Read temperature data */
> +		ret = i2c_master_recv(client, buf, sizeof(buf));
> +		if (ret != SHT21_RESPONSE_LENGTH) {
> +			dev_err(dev, "failed to read values: %d\n", ret);
> +			ret = -EIO;
> +			goto out;
> +		}
> +		sht21->temperature = sht21_temp_ticks_to_millicelsius(
> +			(buf[0] << 8) | buf[1]
> +		);

Please find a better alignment than that.

> +
> +		/* Trigger humidity measurement */
> +		ret = i2c_master_send(client,
> +				      sht21_trig_rh_measurement_nh,
> +				      SHT21_CMD_LENGTH);
> +		if (ret != SHT21_CMD_LENGTH) {
> +			dev_err(dev, "failed to send command: %d\n", ret);
> +			ret = -EIO;
>   			goto out;
> -		sht21->temperature = sht21_temp_ticks_to_millicelsius(ret);
> -		ret = i2c_smbus_read_word_swapped(client,
> -						  SHT21_TRIG_RH_MEASUREMENT_HM);
> -		if (ret < 0)
> +		}
> +		msleep(SHT21_WAIT_RH);
> +
> +		/* Read humidity data */
> +		ret = i2c_master_recv(client, buf, sizeof(buf));
> +		if (ret != SHT21_RESPONSE_LENGTH) {
> +			dev_err(dev, "failed to read values: %d\n", ret);
> +			ret = -EIO;
>   			goto out;
> -		sht21->humidity = sht21_rh_ticks_to_per_cent_mille(ret);
> +		}
> +		sht21->humidity = sht21_rh_ticks_to_per_cent_mille(
> +			(buf[0] << 8) | buf[1]
> +		);
> +
>   		sht21->last_update = jiffies;
>   		sht21->valid = 1;
>   	}
>   out:
>   	mutex_unlock(&sht21->lock);
> -
>   	return ret >= 0 ? 0 : ret;
>   }
>   
> @@ -269,13 +317,6 @@ static int sht21_probe(struct i2c_client *client,
>   	struct device *hwmon_dev;
>   	struct sht21 *sht21;
>   
> -	if (!i2c_check_functionality(client->adapter,
> -				     I2C_FUNC_SMBUS_WORD_DATA)) {
> -		dev_err(&client->dev,
> -			"adapter does not support SMBus word transactions\n");
> -		return -ENODEV;
> -	}
> -

The driver must now support I2C_FUNC_I2C which is a significant change in functionality
since it will no longer work on SMBus-only adapters. On top of that, it severely affects
access speed (or at least that is most likely the case). You'll have to find a better
solution, one that retains the old functionality but also works on the Raspberry Pi.

FWIW, this should really be solved in the infrastructure. Many devices support and
depend on clock stretching, and we can not mess up the drivers for all those devices
to deal with a broken adapter. Has this been discussed on the i2c mailing list ?

Guenter

>   	sht21 = devm_kzalloc(dev, sizeof(*sht21), GFP_KERNEL);
>   	if (!sht21)
>   		return -ENOMEM;
> 

