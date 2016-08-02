Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:40834 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754135AbcHBWps (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 Aug 2016 18:45:48 -0400
Date: Tue, 2 Aug 2016 15:44:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	Chris Packham <chris.packham@alliedtelesis.co.nz>
Subject: Re: [PATCH] hwmon: adt7470: Expose PWM frequency to sysfs
Message-ID: <20160802224429.GA9350@roeck-us.net>
References: <20160801054151.27639-1-joshua.scott@alliedtelesis.co.nz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160801054151.27639-1-joshua.scott@alliedtelesis.co.nz>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Aug 01, 2016 at 05:41:51PM +1200, Joshua Scott wrote:
> The ADT7470 supports a variety of PWM frequencies. This patch allows the
> frequency to be configured and viewed through the sysfs entry pwm1_freq.
> 
> Signed-off-by: Joshua Scott <joshua.scott@alliedtelesis.co.nz>
> ---
>  Documentation/hwmon/adt7470 |  17 +++++
>  drivers/hwmon/adt7470.c     | 149 ++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 166 insertions(+)
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
> index f5da39a..f57026f 100644
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
> @@ -142,6 +144,22 @@ static const unsigned short normal_i2c[] = { 0x2C, 0x2E, 0x2F, I2C_CLIENT_END };
>  #define FAN_PERIOD_INVALID	65535
>  #define FAN_DATA_VALID(x)	((x) && (x) != FAN_PERIOD_INVALID)
>  
> +/* The datasheet includes a table of available pwm frequencies
> + * controlled by values in config registers 1 and 2.
> + */
> +#define ADT7470_CFG_LF		0x40
> +#define ADT7470_FREQ_BITS	0x70
> +#define ADT7470_CFG_LF_11_0_HZ	0x00
> +#define ADT7470_CFG_LF_14_7_HZ	0x10
> +#define ADT7470_CFG_LF_22_1_HZ	0x20
> +#define ADT7470_CFG_LF_29_4_HZ	0x30
> +#define ADT7470_CFG_LF_35_3_HZ	0x40
> +#define ADT7470_CFG_LF_44_1_HZ	0x50
> +#define ADT7470_CFG_LF_58_8_HZ	0x60
> +#define ADT7470_CFG_LF_88_2_HZ	0x70
> +#define ADT7470_CFG_HF_1_4_KHZ	0x00
> +#define ADT7470_CFG_HF_22_5_KHZ	0x10
> +
>  struct adt7470_data {
>  	struct i2c_client	*client;
>  	struct mutex		lock;
> @@ -688,6 +706,134 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *devattr,
>  	return count;
>  }
>  
> +static ssize_t show_pwm_freq(struct device *dev,
> +			     struct device_attribute *devattr, char *buf)
> +{
> +	struct adt7470_data *data = adt7470_update_device(dev);
> +	unsigned char cfg_reg_1;
> +	unsigned char cfg_reg_2;
> +	int freq = -EINVAL;
> +
> +	mutex_lock(&data->lock);
> +	cfg_reg_1 = i2c_smbus_read_byte_data(data->client, ADT7470_REG_CFG);
> +	cfg_reg_2 = i2c_smbus_read_byte_data(data->client, ADT7470_REG_CFG_2);

[ Note: Lack of error checking accepted because the rest of the driver
  doesn't check for errors either ]

> +	mutex_unlock(&data->lock);
> +
> +	if (cfg_reg_1 & ADT7470_CFG_LF)
> +		switch (cfg_reg_2 & ADT7470_FREQ_BITS) {
> +		case ADT7470_CFG_LF_11_0_HZ:
> +			freq = 11;
> +			break;
> +		case ADT7470_CFG_LF_14_7_HZ:
> +			freq = 15;
> +			break;
> +		case ADT7470_CFG_LF_22_1_HZ:
> +			freq = 22;
> +			break;
> +		case ADT7470_CFG_LF_29_4_HZ:
> +			freq = 29;
> +			break;
> +		case ADT7470_CFG_LF_35_3_HZ:
> +			freq = 35;
> +			break;
> +		case ADT7470_CFG_LF_44_1_HZ:
> +			freq = 44;
> +			break;
> +		case ADT7470_CFG_LF_58_8_HZ:
> +			freq = 59;
> +			break;
> +		case ADT7470_CFG_LF_88_2_HZ:
> +			freq = 88;
> +			break;
> +		}
> +	else
> +		switch (cfg_reg_2 & ADT7470_FREQ_BITS) {
> +		case ADT7470_CFG_HF_1_4_KHZ:
> +			freq = 1400;
> +			break;
> +		default:
> +			freq = 22500;
> +			break;
> +		}
> +	return scnprintf(buf, PAGE_SIZE, "%d\n", freq);
> +}

This can be implemented more easily by using adt7470_freq_map[].

Something like
	index = (cfg_reg_2 & ADT7470_FREQ_MASK) >> ADT7470_FREQ_SHIFT;
	if (!(cfg_reg_1 & ADT7470_CFG_LF))
		index += 8;
	if (index >= ARRAY_SIZE(adt7470_freq_map))
		index = ARRAY_SIZE(adt7470_freq_map) - 1;

	return scnprintf(buf, PAGE_SIZE, "%d\n", adt7470_freq_map[index]);

with

#define ADT7470_FREQ_MASK       0x70
#define ADT7470_FREQ_SHIFT      4

> +
> +/* These are the valid PWM frequencies to the nearest Hz */
> +static const int adt7470_freq_map[] = {
> +	11, 15, 22, 29, 35, 44, 59, 88, 1400, 22500
> +};
> +
> +static ssize_t set_pwm_freq(struct device *dev,
> +			    struct device_attribute *devattr,
> +			    const char *buf, size_t count)
> +{
> +	struct adt7470_data *data = dev_get_drvdata(dev);
> +	struct i2c_client *client = data->client;
> +	long freq;
> +	int freq_index;
> +	int low_freq = ADT7470_CFG_LF;
> +	int freq_bits;
> +	unsigned char val;
> +
> +	if (kstrtol(buf, 10, &freq))
> +		return -EINVAL;
> +
> +	/* Round the user value given to the closest available frequency */
> +	freq_index = find_closest(freq, adt7470_freq_map,
> +				  ARRAY_SIZE(adt7470_freq_map));
> +	freq = adt7470_freq_map[freq_index];
> +
> +	switch (freq) {
> +	case 11:
> +		freq_bits = ADT7470_CFG_LF_11_0_HZ;
> +		break;
> +	case 15:
> +		freq_bits = ADT7470_CFG_LF_14_7_HZ;
> +		break;
> +	case 22:
> +		freq_bits = ADT7470_CFG_LF_22_1_HZ;
> +		break;
> +	case 29:
> +		freq_bits = ADT7470_CFG_LF_29_4_HZ;
> +		break;
> +	case 35:
> +		freq_bits = ADT7470_CFG_LF_35_3_HZ;
> +		break;
> +	case 44:
> +		freq_bits = ADT7470_CFG_LF_44_1_HZ;
> +		break;
> +	case 59:
> +		freq_bits = ADT7470_CFG_LF_58_8_HZ;
> +		break;
> +	case 88:
> +		freq_bits = ADT7470_CFG_LF_88_2_HZ;
> +		break;
> +	case 1400:
> +		freq_bits = ADT7470_CFG_HF_1_4_KHZ;
> +		low_freq = 0;
> +		break;
> +	case 22500:
> +		freq_bits = ADT7470_CFG_HF_22_5_KHZ;
> +		low_freq = 0;
> +		break;

freq_index can be used directly to calculate the register values
without going through the switch statement.

	if (freq_index >= 8) {
		freq_index -= 8;
		low_freq = 0;
	}
	...
	/* Configuration Register 2 */
	val = i2c_smbus_read_byte_data(client, ADT7470_REG_CFG_2);
	i2c_smbus_write_byte_data(client, ADT7470_REG_CFG_2,
		(val & ~ADT7470_FREQ_MASK) | (freq_index << ADT7470_FREQ_SHIFT);

> +	default:
> +		return -EINVAL;
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
> +				  (val & ~ADT7470_FREQ_BITS) | freq_bits);
> +	mutex_unlock(&data->lock);
> +
> +	return count;
> +}
> +
>  static ssize_t show_pwm_max(struct device *dev,
>  			    struct device_attribute *devattr,
>  			    char *buf)
> @@ -1038,6 +1184,8 @@ static SENSOR_DEVICE_ATTR(pwm2, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 1);
>  static SENSOR_DEVICE_ATTR(pwm3, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 2);
>  static SENSOR_DEVICE_ATTR(pwm4, S_IWUSR | S_IRUGO, show_pwm, set_pwm, 3);
>  
> +static DEVICE_ATTR(pwm1_freq, S_IWUSR | S_IRUGO, show_pwm_freq, set_pwm_freq);
> +
>  static SENSOR_DEVICE_ATTR(pwm1_auto_point1_pwm, S_IWUSR | S_IRUGO,
>  		    show_pwm_min, set_pwm_min, 0);
>  static SENSOR_DEVICE_ATTR(pwm2_auto_point1_pwm, S_IWUSR | S_IRUGO,
> @@ -1096,6 +1244,7 @@ static struct attribute *adt7470_attrs[] = {
>  	&dev_attr_alarm_mask.attr,
>  	&dev_attr_num_temp_sensors.attr,
>  	&dev_attr_auto_update_interval.attr,
> +	&dev_attr_pwm1_freq.attr,

Should be right after &sensor_dev_attr_pwm1.dev_attr.attr.

>  	&sensor_dev_attr_temp1_max.dev_attr.attr,
>  	&sensor_dev_attr_temp2_max.dev_attr.attr,
>  	&sensor_dev_attr_temp3_max.dev_attr.attr,
> -- 
> 2.9.0
> 
