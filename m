Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:50965 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752921AbdENOyq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sun, 14 May 2017 10:54:46 -0400
Subject: Re: [PATCH v3 2/4] hwmon: (adt7475) fan stall prevention
To: Chris Packham <chris.packham@alliedtelesis.co.nz>,
        linux-hwmon@vger.kernel.org
References: <20170511034524.22698-1-chris.packham@alliedtelesis.co.nz>
 <20170511034524.22698-3-chris.packham@alliedtelesis.co.nz>
Cc: Tobi Wulff <tobi.wulff@alliedtelesis.co.nz>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <763e147a-5d5c-c746-ecf5-189fed25e267@roeck-us.net>
Date: Sun, 14 May 2017 07:54:41 -0700
MIME-Version: 1.0
In-Reply-To: <20170511034524.22698-3-chris.packham@alliedtelesis.co.nz>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 05/10/2017 08:45 PM, Chris Packham wrote:
> By default adt7475 will stop the fans (pwm duty cycle 0%) when the
> temperature drops past Tmin - hysteresis. Some systems want to keep the
> fans moving even when the temperature drops so add new sysfs attributes
> that configure the enhanced acoustics min 1-3 which allows the fans to
> run at the minimum configure pwm duty cycle.
>
> Signed-off-by: Chris Packham <chris.packham@alliedtelesis.co.nz>
> ---
>
> Changes in v2:
> - use pwmN_stall_dis as the attribute name. I think this describes the purpose
>   pretty well. I went with a new attribute instead of overloading

Almost agree. Can we use pwmN_stall_disable ?

Thanks,
Guenter


>   pwmN_auto_point1_pwm so this doesn't affect existing users.
> Changes in v3:
> - Fix grammar.
> - change enh_acou to enh_acoustics
>
>  Documentation/hwmon/adt7475 |  5 +++++
>  drivers/hwmon/adt7475.c     | 50 +++++++++++++++++++++++++++++++++++++++++++++
>  2 files changed, 55 insertions(+)
>
> diff --git a/Documentation/hwmon/adt7475 b/Documentation/hwmon/adt7475
> index 0502f2b464e1..3990bae60e78 100644
> --- a/Documentation/hwmon/adt7475
> +++ b/Documentation/hwmon/adt7475
> @@ -109,6 +109,11 @@ fan speed) is applied. PWM values range from 0 (off) to 255 (full speed).
>  Fan speed may be set to maximum when the temperature sensor associated with
>  the PWM control exceeds temp#_max.
>
> +At Tmin - hysteresis the PWM output can either be off (0% duty cycle) or at the
> +minimum (i.e. auto_point1_pwm). This behaviour can be configured using the
> +pwm[1-*]_stall_dis sysfs attribute. A value of 0 means the fans will shut off.
> +A value of 1 means the fans will run at auto_point1_pwm.
> +
>  Notes
>  -----
>
> diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
> index ec0c43fbcdce..4d6c625fec70 100644
> --- a/drivers/hwmon/adt7475.c
> +++ b/drivers/hwmon/adt7475.c
> @@ -79,6 +79,9 @@
>
>  #define REG_TEMP_TRANGE_BASE	0x5F
>
> +#define REG_ENHANCE_ACOUSTICS1	0x62
> +#define REG_ENHANCE_ACOUSTICS2	0x63
> +
>  #define REG_PWM_MIN_BASE	0x64
>
>  #define REG_TEMP_TMIN_BASE	0x67
> @@ -209,6 +212,7 @@ struct adt7475_data {
>  	u8 range[3];
>  	u8 pwmctl[3];
>  	u8 pwmchan[3];
> +	u8 enh_acoustics[2];
>
>  	u8 vid;
>  	u8 vrm;
> @@ -700,6 +704,43 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *attr,
>  	data->pwm[sattr->nr][sattr->index] = clamp_val(val, 0, 0xFF);
>  	i2c_smbus_write_byte_data(client, reg,
>  				  data->pwm[sattr->nr][sattr->index]);
> +	mutex_unlock(&data->lock);
> +
> +	return count;
> +}
> +
> +
> +static ssize_t show_stall_dis(struct device *dev, struct device_attribute *attr,
> +			      char *buf)
> +{
> +	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct adt7475_data *data = i2c_get_clientdata(client);
> +	u8 mask = BIT(5 + sattr->index);
> +
> +	return sprintf(buf, "%d\n", !!(data->enh_acoustics[0] & mask));
> +}
> +
> +static ssize_t set_stall_dis(struct device *dev, struct device_attribute *attr,
> +			     const char *buf, size_t count)
> +{
> +	struct sensor_device_attribute_2 *sattr = to_sensor_dev_attr_2(attr);
> +	struct i2c_client *client = to_i2c_client(dev);
> +	struct adt7475_data *data = i2c_get_clientdata(client);
> +	long val;
> +	u8 mask = BIT(5 + sattr->index);
> +
> +	if (kstrtol(buf, 10, &val))
> +		return -EINVAL;
> +
> +	mutex_lock(&data->lock);
> +
> +	data->enh_acoustics[0] &= ~mask;
> +	if (val)
> +		data->enh_acoustics[0] |= mask;
> +
> +	i2c_smbus_write_byte_data(client, REG_ENHANCE_ACOUSTICS1,
> +				  data->enh_acoustics[0]);
>
>  	mutex_unlock(&data->lock);
>
> @@ -1028,6 +1069,8 @@ static SENSOR_DEVICE_ATTR_2(pwm1_auto_point1_pwm, S_IRUGO | S_IWUSR, show_pwm,
>  			    set_pwm, MIN, 0);
>  static SENSOR_DEVICE_ATTR_2(pwm1_auto_point2_pwm, S_IRUGO | S_IWUSR, show_pwm,
>  			    set_pwm, MAX, 0);
> +static SENSOR_DEVICE_ATTR_2(pwm1_stall_dis, S_IRUGO | S_IWUSR, show_stall_dis,
> +			    set_stall_dis, 0, 0);
>  static SENSOR_DEVICE_ATTR_2(pwm2, S_IRUGO | S_IWUSR, show_pwm, set_pwm, INPUT,
>  			    1);
>  static SENSOR_DEVICE_ATTR_2(pwm2_freq, S_IRUGO | S_IWUSR, show_pwmfreq,
> @@ -1040,6 +1083,8 @@ static SENSOR_DEVICE_ATTR_2(pwm2_auto_point1_pwm, S_IRUGO | S_IWUSR, show_pwm,
>  			    set_pwm, MIN, 1);
>  static SENSOR_DEVICE_ATTR_2(pwm2_auto_point2_pwm, S_IRUGO | S_IWUSR, show_pwm,
>  			    set_pwm, MAX, 1);
> +static SENSOR_DEVICE_ATTR_2(pwm2_stall_dis, S_IRUGO | S_IWUSR, show_stall_dis,
> +			    set_stall_dis, 0, 1);
>  static SENSOR_DEVICE_ATTR_2(pwm3, S_IRUGO | S_IWUSR, show_pwm, set_pwm, INPUT,
>  			    2);
>  static SENSOR_DEVICE_ATTR_2(pwm3_freq, S_IRUGO | S_IWUSR, show_pwmfreq,
> @@ -1052,6 +1097,8 @@ static SENSOR_DEVICE_ATTR_2(pwm3_auto_point1_pwm, S_IRUGO | S_IWUSR, show_pwm,
>  			    set_pwm, MIN, 2);
>  static SENSOR_DEVICE_ATTR_2(pwm3_auto_point2_pwm, S_IRUGO | S_IWUSR, show_pwm,
>  			    set_pwm, MAX, 2);
> +static SENSOR_DEVICE_ATTR_2(pwm3_stall_dis, S_IRUGO | S_IWUSR, show_stall_dis,
> +			    set_stall_dis, 0, 2);
>
>  /* Non-standard name, might need revisiting */
>  static DEVICE_ATTR_RW(pwm_use_point2_pwm_at_crit);
> @@ -1112,12 +1159,14 @@ static struct attribute *adt7475_attrs[] = {
>  	&sensor_dev_attr_pwm1_auto_channels_temp.dev_attr.attr,
>  	&sensor_dev_attr_pwm1_auto_point1_pwm.dev_attr.attr,
>  	&sensor_dev_attr_pwm1_auto_point2_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm1_stall_dis.dev_attr.attr,
>  	&sensor_dev_attr_pwm3.dev_attr.attr,
>  	&sensor_dev_attr_pwm3_freq.dev_attr.attr,
>  	&sensor_dev_attr_pwm3_enable.dev_attr.attr,
>  	&sensor_dev_attr_pwm3_auto_channels_temp.dev_attr.attr,
>  	&sensor_dev_attr_pwm3_auto_point1_pwm.dev_attr.attr,
>  	&sensor_dev_attr_pwm3_auto_point2_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm3_stall_dis.dev_attr.attr,
>  	&dev_attr_pwm_use_point2_pwm_at_crit.attr,
>  	NULL,
>  };
> @@ -1136,6 +1185,7 @@ static struct attribute *pwm2_attrs[] = {
>  	&sensor_dev_attr_pwm2_auto_channels_temp.dev_attr.attr,
>  	&sensor_dev_attr_pwm2_auto_point1_pwm.dev_attr.attr,
>  	&sensor_dev_attr_pwm2_auto_point2_pwm.dev_attr.attr,
> +	&sensor_dev_attr_pwm2_stall_dis.dev_attr.attr,
>  	NULL
>  };
>
>

