Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:52497 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751982AbcHLNMx (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Fri, 12 Aug 2016 09:12:53 -0400
Subject: Re: [PATCH] hwmon: adt7470: Expose PWM frequency to sysfs
To: Joshua Scott <joshua.scott@alliedtelesis.co.nz>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20160808013545.25447-1-joshua.scott@alliedtelesis.co.nz>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <fbd9e687-7ab5-8cd5-9617-357fedef0de8@roeck-us.net>
Date: Fri, 12 Aug 2016 06:12:49 -0700
MIME-Version: 1.0
In-Reply-To: <20160808013545.25447-1-joshua.scott@alliedtelesis.co.nz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 08/07/2016 06:35 PM, Joshua Scott wrote:
> The ADT7470 supports a variety of PWM frequencies. This patch allows the
> frequency to be configured and viewed through the sysfs entry pwm1_freq.
>
> Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>

Applied to -next.

Thanks,
Guenter

> ---
>  Documentation/hwmon/adt7470 | 17 +++++++++++
>  drivers/hwmon/adt7470.c     | 74 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 91 insertions(+)
>
> diff --git a/Documentation/hwmon/adt7470 b/Documentation/hwmon/adt7470
> index 8ce4aa0..fe68e18 100644
> --- a/Documentation/hwmon/adt7470
> +++ b/Documentation/hwmon/adt7470
> @@ -65,6 +65,23 @@ from 0 (off) to 255 (full speed).  Fan speed will be set to maximum when the
>  temperature sensor associated with the PWM control exceeds
>  pwm#_auto_point2_temp.
>
> +The driver also allows control of the PWM frequency:
> +
> +* pwm1_freq
> +
> +The PWM frequency is rounded to the nearest one of:
> +
> +* 11.0 Hz
> +* 14.7 Hz
> +* 22.1 Hz
> +* 29.4 Hz
> +* 35.3 Hz
> +* 44.1 Hz
> +* 58.8 Hz
> +* 88.2 Hz
> +* 1.4 kHz
> +* 22.5 kHz
> +
>  Notes
>  -----
>
> diff --git a/drivers/hwmon/adt7470.c b/drivers/hwmon/adt7470.c
> index f5da39a..94550d7 100644
> --- a/drivers/hwmon/adt7470.c
> +++ b/drivers/hwmon/adt7470.c
> @@ -32,6 +32,7 @@
>  #include <linux/log2.h>
>  #include <linux/kthread.h>
>  #include <linux/slab.h>
> +#include <linux/util_macros.h>
>
>  /* Addresses to scan */
>  static const unsigned short normal_i2c[] = { 0x2C, 0x2E, 0x2F, I2C_CLIENT_END };
> @@ -83,6 +84,7 @@ static const unsigned short normal_i2c[] = { 0x2C, 0x2E, 0x2F, I2C_CLIENT_END };
>  #define ADT7470_REG_PWM_MIN_MAX_ADDR		0x6D
>  #define ADT7470_REG_PWM_TEMP_MIN_BASE_ADDR	0x6E
>  #define ADT7470_REG_PWM_TEMP_MIN_MAX_ADDR	0x71
> +#define ADT7470_REG_CFG_2			0x74
>  #define ADT7470_REG_ACOUSTICS12			0x75
>  #define ADT7470_REG_ACOUSTICS34			0x76
>  #define ADT7470_REG_DEVICE			0x3D
> @@ -142,6 +144,11 @@ static const unsigned short normal_i2c[] = { 0x2C, 0x2E, 0x2F, I2C_CLIENT_END };
>  #define FAN_PERIOD_INVALID	65535
>  #define FAN_DATA_VALID(x)	((x) && (x) != FAN_PERIOD_INVALID)
>
> +/* Config registers 1 and 2 include fields for selecting the PWM frequency */
> +#define ADT7470_CFG_LF		0x40
> +#define ADT7470_FREQ_MASK	0x70
> +#define ADT7470_FREQ_SHIFT	4
> +
>  struct adt7470_data {
>  	struct i2c_client	*client;
>  	struct mutex		lock;
> @@ -688,6 +695,70 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *devattr,
>  	return count;
>  }
>
> +/* These are the valid PWM frequencies to the nearest Hz */
> +static const int adt7470_freq_map[] = {
> +	11, 15, 22, 29, 35, 44, 59, 88, 1400, 22500
> +};
> +
> +static ssize_t show_pwm_freq(struct device *dev,
> +			     struct device_attribute *devattr, char *buf)
> +{
> +	struct adt7470_data *data = adt7470_update_device(dev);
> +	unsigned char cfg_reg_1;
> +	unsigned char cfg_reg_2;
> +	int index;
> +
> +	mutex_lock(&data->lock);
> +	cfg_reg_1 = i2c_smbus_read_byte_data(data->client, ADT7470_REG_CFG);
> +	cfg_reg_2 = i2c_smbus_read_byte_data(data->client, ADT7470_REG_CFG_2);
> +	mutex_unlock(&data->lock);
> +
> +	index = (cfg_reg_2 & ADT7470_FREQ_MASK) >> ADT7470_FREQ_SHIFT;
> +	if (!(cfg_reg_1 & ADT7470_CFG_LF))
> +		index += 8;
> +	if (index >= ARRAY_SIZE(adt7470_freq_map))
> +		index = ARRAY_SIZE(adt7470_freq_map) - 1;
> +
> +	return scnprintf(buf, PAGE_SIZE, "%d\n", adt7470_freq_map[index]);
> +}
> +
> +static ssize_t set_pwm_freq(struct device *dev,
> +			    struct device_attribute *devattr,
> +			    const char *buf, size_t count)
> +{
> +	struct adt7470_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	long freq;
> +	int index;
> +	int low_freq = ADT7470_CFG_LF;
> +	unsigned char val;
> +
> +	if (kstrtol(buf, 10, &freq))
> +		return -EINVAL;
> +
> +	/* Round the user value given to the closest available frequency */
> +	index = find_closest(freq, adt7470_freq_map,
> +			     ARRAY_SIZE(adt7470_freq_map));
> +
> +	if (index >= 8) {
> +		index -= 8;
> +		low_freq = 0;
> +	}
> +
> +	mutex_lock(&data->lock);
> +	/* Configuration Register 1 */
> +	val = i2c_smbus_read_byte_data(client, ADT7470_REG_CFG);
> +	i2c_smbus_write_byte_data(client, ADT7470_REG_CFG,
> +				  (val & ~ADT7470_CFG_LF) | low_freq);
> +	/* Configuration Register 2 */
> +	val = i2c_smbus_read_byte_data(client, ADT7470_REG_CFG_2);
> +	i2c_smbus_write_byte_data(client, ADT7470_REG_CFG_2,
> +		(val & ~ADT7470_FREQ_MASK) | (index << ADT7470_FREQ_SHIFT));
> +	mutex_unlock(&data->lock);
> +
> +	return count;
> +}
> +
>  static ssize_t show_pwm_max(struct device *dev,
>  			    struct device_attribute *devattr,
>  			    char *buf)
> @@ -1038,6 +1109,8 @@ static SENSOR_DEVICE_ATTR(pwm2, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 1);
>  static SENSOR_DEVICE_ATTR(pwm3, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 2);
>  static SENSOR_DEVICE_ATTR(pwm4, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 3);
>
> +static DEVICE_ATTR(pwm1_freq, S_IWUSR | S_IRUGO, show_pwm_freq, set_pwm_freq);
> +
>  static SENSOR_DEVICE_ATTR(pwm1_auto_point1_pwm, S_IWUSR | S_IRUGO,
>  		    show_pwm_min, set_pwm_min, 0);
>  static SENSOR_DEVICE_ATTR(pwm2_auto_point1_pwm, S_IWUSR | S_IRUGO,
> @@ -1154,6 +1227,7 @@ static struct attribute *adt7470_attrs[] = {
>  	&sensor_dev_attr_fan4_alarm.dev_attr.attr,
>  	&sensor_dev_attr_force_pwm_max.dev_attr.attr,
>  	&sensor_dev_attr_pwm1.dev_attr.attr,
> +	&dev_attr_pwm1_freq.attr,
>  	&sensor_dev_attr_pwm2.dev_attr.attr,
>  	&sensor_dev_attr_pwm3.dev_attr.attr,
>  	&sensor_dev_attr_pwm4.dev_attr.attr,
>

