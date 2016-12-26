Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:53127 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750787AbcLZKnl (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 26 Dec 2016 05:43:41 -0500
Subject: Re: [PATCH v3] hwmon: (sht21) Add Electronic Identification Code
 retrieval
To: "Peter A. Bigot" <pab@pabigot.com>, linux-hwmon@vger.kernel.org
References: <1482585764-21529-1-git-send-email-pab@pabigot.com>
Cc: urs.fleisch@sensirion.com
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <13763ce6-8e67-7296-a7fc-28e276332f9c@roeck-us.net>
Date: Mon, 26 Dec 2016 02:43:36 -0800
MIME-Version: 1.0
In-Reply-To: <1482585764-21529-1-git-send-email-pab@pabigot.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 12/24/2016 05:22 AM, Peter A. Bigot wrote:
> Expose the per-chip unique identifier so it can be used to identify the
> sensor producing the measurements.
>
> Signed-off-by: Peter A. Bigot <pab@pabigot.com>

Applied to -next.

Guenter

> ---
> v3: Use permission-specific DEVICE_ATTR for new attribute
>
> v2: Remove unnecessary copyright/authorship claims.
>     Define symbolic names for serial number read commands.
>     Provide separate function to read EIC.
>     Rearrange device data structure slightly to reduce alignment padding.
>     Store EIC in ASCII form and mark validity using non-NUL character.
>     Use hard-coded lengths and avoid redundant assignments.
>     Change attribute name.
>
>  Documentation/hwmon/sht21 |  5 +--
>  drivers/hwmon/sht21.c     | 92 +++++++++++++++++++++++++++++++++++++++++++++--
>  2 files changed, 93 insertions(+), 4 deletions(-)
>
> diff --git a/Documentation/hwmon/sht21 b/Documentation/hwmon/sht21
> index db17fda..47f4765 100644
> --- a/Documentation/hwmon/sht21
> +++ b/Documentation/hwmon/sht21
> @@ -35,6 +35,7 @@ sysfs-Interface
>
>  temp1_input - temperature input
>  humidity1_input - humidity input
> +eic - Electronic Identification Code
>
>  Notes
>  -----
> @@ -45,5 +46,5 @@ humidity and 66 ms for temperature. To keep self heating below 0.1 degree
>  Celsius, the device should not be active for more than 10% of the time,
>  e.g. maximum two measurements per second at the given resolution.
>
> -Different resolutions, the on-chip heater, using the CRC checksum and reading
> -the serial number are not supported yet.
> +Different resolutions, the on-chip heater, and using the CRC checksum
> +are not supported yet.
> diff --git a/drivers/hwmon/sht21.c b/drivers/hwmon/sht21.c
> index 84cdb1c..06706d2 100644
> --- a/drivers/hwmon/sht21.c
> +++ b/drivers/hwmon/sht21.c
> @@ -34,23 +34,29 @@
>  /* I2C command bytes */
>  #define SHT21_TRIG_T_MEASUREMENT_HM  0xe3
>  #define SHT21_TRIG_RH_MEASUREMENT_HM 0xe5
> +#define SHT21_READ_SNB_CMD1 0xFA
> +#define SHT21_READ_SNB_CMD2 0x0F
> +#define SHT21_READ_SNAC_CMD1 0xFC
> +#define SHT21_READ_SNAC_CMD2 0xC9
>
>  /**
>   * struct sht21 - SHT21 device specific data
>   * @hwmon_dev: device registered with hwmon
>   * @lock: mutex to protect measurement values
> - * @valid: only 0 before first measurement is taken
>   * @last_update: time of last update (jiffies)
>   * @temperature: cached temperature measurement value
>   * @humidity: cached humidity measurement value
> + * @valid: only 0 before first measurement is taken
> + * @eic: cached electronic identification code text
>   */
>  struct sht21 {
>  	struct i2c_client *client;
>  	struct mutex lock;
> -	char valid;
>  	unsigned long last_update;
>  	int temperature;
>  	int humidity;
> +	char valid;
> +	char eic[18];
>  };
>
>  /**
> @@ -165,15 +171,97 @@ static ssize_t sht21_show_humidity(struct device *dev,
>  	return sprintf(buf, "%d\n", sht21->humidity);
>  }
>
> +static ssize_t eic_read(struct sht21 *sht21)
> +{
> +	struct i2c_client *client = sht21->client;
> +	u8 tx[2];
> +	u8 rx[8];
> +	u8 eic[8];
> +	struct i2c_msg msgs[2] = {
> +		{
> +			.addr = client->addr,
> +			.flags = 0,
> +			.len = 2,
> +			.buf = tx,
> +		},
> +		{
> +			.addr = client->addr,
> +			.flags = I2C_M_RD,
> +			.len = 8,
> +			.buf = rx,
> +		},
> +	};
> +	int ret;
> +
> +	tx[0] = SHT21_READ_SNB_CMD1;
> +	tx[1] = SHT21_READ_SNB_CMD2;
> +	ret = i2c_transfer(client->adapter, msgs, 2);
> +	if (ret < 0)
> +		goto out;
> +	eic[2] = rx[0];
> +	eic[3] = rx[2];
> +	eic[4] = rx[4];
> +	eic[5] = rx[6];
> +
> +	tx[0] = SHT21_READ_SNAC_CMD1;
> +	tx[1] = SHT21_READ_SNAC_CMD2;
> +	msgs[1].len = 6;
> +	ret = i2c_transfer(client->adapter, msgs, 2);
> +	if (ret < 0)
> +		goto out;
> +	eic[0] = rx[3];
> +	eic[1] = rx[4];
> +	eic[6] = rx[0];
> +	eic[7] = rx[1];
> +
> +	ret = snprintf(sht21->eic, sizeof(sht21->eic),
> +		       "%02x%02x%02x%02x%02x%02x%02x%02x\n",
> +		       eic[0], eic[1], eic[2], eic[3],
> +		       eic[4], eic[5], eic[6], eic[7]);
> +out:
> +	if (ret < 0)
> +		sht21->eic[0] = 0;
> +
> +	return ret;
> +}
> +
> +/**
> + * eic_show() - show Electronic Identification Code in sysfs
> + * @dev: device
> + * @attr: device attribute
> + * @buf: sysfs buffer (PAGE_SIZE) where EIC is written
> + *
> + * Will be called on read access to eic sysfs attribute.
> + * Returns number of bytes written into buffer, negative errno on error.
> + */
> +static ssize_t eic_show(struct device *dev,
> +	struct device_attribute *attr,
> +	char *buf)
> +{
> +	struct sht21 *sht21 = dev_get_drvdata(dev);
> +	int ret;
> +
> +	ret = sizeof(sht21->eic) - 1;
> +	mutex_lock(&sht21->lock);
> +	if (!sht21->eic[0])
> +		ret = eic_read(sht21);
> +	if (ret > 0)
> +		memcpy(buf, sht21->eic, ret);
> +	mutex_unlock(&sht21->lock);
> +	return ret;
> +}
> +
>  /* sysfs attributes */
>  static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, sht21_show_temperature,
>  	NULL, 0);
>  static SENSOR_DEVICE_ATTR(humidity1_input, S_IRUGO, sht21_show_humidity,
>  	NULL, 0);
> +static DEVICE_ATTR_RO(eic);
>
>  static struct attribute *sht21_attrs[] = {
>  	&sensor_dev_attr_temp1_input.dev_attr.attr,
>  	&sensor_dev_attr_humidity1_input.dev_attr.attr,
> +	&dev_attr_eic.attr,
>  	NULL
>  };
>
>

