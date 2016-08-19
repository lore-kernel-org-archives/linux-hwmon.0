Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:44928 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753995AbcHSCyk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 18 Aug 2016 22:54:40 -0400
Subject: Re: [PATCH] hwmon: (max6650) Allow fan shutdown and a more intuitive
 mode interface
To: Mike Looijmans <mike.looijmans@topic.nl>,
        linux-hwmon@vger.kernel.org
References: <1471334034-14894-1-git-send-email-mike.looijmans@topic.nl>
Cc: linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <c47e4482-a8e0-6a38-cccb-062b667587ac@roeck-us.net>
Date: Thu, 18 Aug 2016 19:54:38 -0700
MIME-Version: 1.0
In-Reply-To: <1471334034-14894-1-git-send-email-mike.looijmans@topic.nl>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 08/16/2016 12:53 AM, Mike Looijmans wrote:
> The fan can be stopped by writing "0" to fan1_target in sysfs.
>
> Writing non-zero values to fan1_target or pwm1 in sysfs automatically
> selects the corresponding control mode (closed or open loop).
>
> This allows userspace applications to control the fan speed without
> the need to know specific details of the controller (like the fact
> that fan1_target does not take effect when pwm1_enable is set to
> anything but "2"). Early initialization of the fan controller prevents
> overheating, for example when resetting the board while the fan was
> completely turned off.
>

But this is the normal hwmon ABI. It should not be a surprise.
On the other side, changing the mode automatically as side effect
_is_ a surprise.

> Signed-off-by: Mike Looijmans <mike.looijmans@topic.nl>
> ---
> This patch requires the devicetree support patch for the max6650.
>
> Changes the functionality and interface of the driver, to be able to
> initialize the chip at boot, and allows userspace control without
> requiring hardware knowledge.
>
>  .../devicetree/bindings/hwmon/max6650.txt          |   5 +
>  Documentation/hwmon/max6650                        |   5 +-
>  drivers/hwmon/max6650.c                            | 153 +++++++++++++--------
>  3 files changed, 106 insertions(+), 57 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/hwmon/max6650.txt b/Documentation/devicetree/bindings/hwmon/max6650.txt
> index 2e46e69..724ab3a 100644
> --- a/Documentation/devicetree/bindings/hwmon/max6650.txt
> +++ b/Documentation/devicetree/bindings/hwmon/max6650.txt
> @@ -13,6 +13,10 @@ Optional properties, default is to retain the chip's current setting:
>  - maxim,fan-prescale  : Pre-scaling value, as per datasheet [1]. Lower values
>  			allow more fine-grained control of slower fans.
>  			Valid: 1, 2, 4, 8, 16.
> +- maxim,fan-target-rpm: Initial requested fan rotation speed. If specified, the
> +			driver selects closed-loop mode and the requested speed.
> +			This ensures the fan is already running before userspace
> +			takes over.
>

Needs to be separate patch and be approved by devicetree maintainers. Overall,
it would be better to make have the devicetree changces as single patch.

>  Example:
>  	fan-max6650: max6650@1b {
> @@ -20,4 +24,5 @@ Example:
>  		compatible = "maxim,max6650";
>  		maxim,fan-microvolt = <12000000>;
>  		maxim,fan-prescale = <4>;
> +		maxim,fan-target-rpm = <1200>;
>  	};
> diff --git a/Documentation/hwmon/max6650 b/Documentation/hwmon/max6650
> index 58d9644..53e308b 100644
> --- a/Documentation/hwmon/max6650
> +++ b/Documentation/hwmon/max6650
> @@ -33,9 +33,12 @@ fan2_input	ro	"
>  fan3_input	ro	"
>  fan4_input	ro	"
>  fan1_target	rw	desired fan speed in RPM (closed loop mode only)
> +			Set to 0 to stop the fan. Writing any other value sets
> +			the regulator mode to "closed loop".
>  pwm1_enable	rw	regulator mode, 0=full on, 1=open loop, 2=closed loop
>  pwm1		rw	relative speed (0-255), 255=max. speed.
> -			Used in open loop mode only.
> +			Set to 0 to stop the fan. Writing any other value sets
> +			the regulator mode to "open loop".

The mode should really be selected using pwm1_enable. I don't like the idea
of automatically changing it as side effect.

>  fan1_div	rw	sets the speed range the inputs can handle. Legal
>  			values are 1, 2, 4, and 8. Use lower values for
>  			faster fans.
> diff --git a/drivers/hwmon/max6650.c b/drivers/hwmon/max6650.c
> index 6beb62c..d40756a 100644
> --- a/drivers/hwmon/max6650.c
> +++ b/drivers/hwmon/max6650.c
> @@ -185,6 +185,35 @@ static struct max6650_data *max6650_update_device(struct device *dev)
>  	return data;
>  }
>
> +static bool max6650_is_powerdown(const struct max6650_data *data)
> +{
> +	return (data->config & MAX6650_CFG_MODE_MASK) == MAX6650_CFG_MODE_OFF;
> +}
> +
> +/*
> + * Change the operating mode of the chip (if needed).
> + * mode is one of the MAX6650_CFG_MODE_* values.
> + */
> +static int max6650_set_operating_mode(struct max6650_data *data, u8 mode)
> +{
> +	int result;
> +	u8 config = data->config;
> +
> +	if (mode == (config & MAX6650_CFG_MODE_MASK))
> +		return 0;
> +
> +	config = (config & ~MAX6650_CFG_MODE_MASK) | mode;
> +
> +	result = i2c_smbus_write_byte_data(data->client, MAX6650_REG_CONFIG,
> +					   config);
> +	if (result < 0)
> +		return result;
> +
> +	data->config = config;
> +
> +	return 0;
> +}
> +
>  static ssize_t get_fan(struct device *dev, struct device_attribute *devattr,
>  		       char *buf)
>  {
> @@ -258,26 +287,26 @@ static ssize_t get_target(struct device *dev, struct device_attribute *devattr,
>  	 *    FanSpeed = KSCALE x fCLK / [256 x (KTACH + 1)]
>  	 *
>  	 * then multiply by 60 to give rpm.
> +	 *
> +	 * When not running, report target to be "0".
>  	 */
>
> -	kscale = DIV_FROM_REG(data->config);
> -	ktach = data->speed;
> -	rpm = 60 * kscale * clock / (256 * (ktach + 1));
> +	if (max6650_is_powerdown(data))
> +		rpm = 0;
> +	else {
> +		kscale = DIV_FROM_REG(data->config);
> +		ktach = data->speed;
> +		rpm = 60 * kscale * clock / (256 * (ktach + 1));
> +	}
>  	return sprintf(buf, "%d\n", rpm);
>  }
>
> -static ssize_t set_target(struct device *dev, struct device_attribute *devattr,
> -			 const char *buf, size_t count)
> +static int max6650_set_target(struct max6650_data *data, unsigned long rpm)
>  {
> -	struct max6650_data *data = dev_get_drvdata(dev);
> -	struct i2c_client *client = data->client;
>  	int kscale, ktach;
> -	unsigned long rpm;
> -	int err;
>
> -	err = kstrtoul(buf, 10, &rpm);
> -	if (err)
> -		return err;
> +	if (rpm == 0)
> +		return max6650_set_operating_mode(data, MAX6650_CFG_MODE_OFF);
>
>  	rpm = clamp_val(rpm, FAN_RPM_MIN, FAN_RPM_MAX);
>
> @@ -288,8 +317,6 @@ static ssize_t set_target(struct device *dev, struct device_attribute *devattr,
>  	 *     KTACH = [(fCLK x KSCALE) / (256 x FanSpeed)] - 1
>  	 */
>
> -	mutex_lock(&data->update_lock);
> -
>  	kscale = DIV_FROM_REG(data->config);
>  	ktach = ((clock * kscale) / (256 * rpm / 60)) - 1;
>  	if (ktach < 0)
> @@ -298,7 +325,25 @@ static ssize_t set_target(struct device *dev, struct device_attribute *devattr,
>  		ktach = 255;
>  	data->speed = ktach;
>
> -	i2c_smbus_write_byte_data(client, MAX6650_REG_SPEED, data->speed);
> +	i2c_smbus_write_byte_data(data->client, MAX6650_REG_SPEED, data->speed);
> +
> +	return max6650_set_operating_mode(data, MAX6650_CFG_MODE_CLOSED_LOOP);
> +}
> +
> +static ssize_t set_target(struct device *dev, struct device_attribute *devattr,
> +			 const char *buf, size_t count)
> +{
> +	struct max6650_data *data = dev_get_drvdata(dev);
> +	unsigned long rpm;
> +	int err;
> +
> +	err = kstrtoul(buf, 10, &rpm);
> +	if (err)
> +		return err;
> +
> +	mutex_lock(&data->update_lock);
> +
> +	err = max6650_set_target(data, rpm);
>
>  	mutex_unlock(&data->update_lock);
>
> @@ -320,17 +365,21 @@ static ssize_t get_pwm(struct device *dev, struct device_attribute *devattr,
>  	int pwm;
>  	struct max6650_data *data = max6650_update_device(dev);
>
> -	/*
> -	 * Useful range for dac is 0-180 for 12V fans and 0-76 for 5V fans.
> -	 * Lower DAC values mean higher speeds.
> -	 */
> -	if (data->config & MAX6650_CFG_V12)
> -		pwm = 255 - (255 * (int)data->dac)/180;
> -	else
> -		pwm = 255 - (255 * (int)data->dac)/76;
> -
> -	if (pwm < 0)
> +	if (max6650_is_powerdown(data))
>  		pwm = 0;
> +	else {
> +		/*
> +		 * Useful range for dac is 0-180 for 12V fans and 0-76 for 5V
> +		 * fans. Lower DAC values mean higher speeds.
> +		 */
> +		if (data->config & MAX6650_CFG_V12)
> +			pwm = 255 - (255 * (int)data->dac)/180;
> +		else
> +			pwm = 255 - (255 * (int)data->dac)/76;
> +
> +		if (pwm < 0)
> +			pwm = 0;
> +	}
>
>  	return sprintf(buf, "%d\n", pwm);
>  }
> @@ -351,16 +400,20 @@ static ssize_t set_pwm(struct device *dev, struct device_attribute *devattr,
>
>  	mutex_lock(&data->update_lock);
>
> -	if (data->config & MAX6650_CFG_V12)
> -		data->dac = 180 - (180 * pwm)/255;
> -	else
> -		data->dac = 76 - (76 * pwm)/255;
> -
> -	i2c_smbus_write_byte_data(client, MAX6650_REG_DAC, data->dac);
> +	if (pwm == 0)
> +		err = max6650_set_operating_mode(data, MAX6650_CFG_MODE_OFF);
> +	else {
> +		if (data->config & MAX6650_CFG_V12)
> +			data->dac = 180 - (180 * pwm)/255;
> +		else
> +			data->dac = 76 - (76 * pwm)/255;
> +		i2c_smbus_write_byte_data(client, MAX6650_REG_DAC, data->dac);
> +		err = max6650_set_operating_mode(data, MAX6650_CFG_MODE_OPEN_LOOP);
> +	}
>
>  	mutex_unlock(&data->update_lock);
>
> -	return count;
> +	return err < 0 ? err : count;
>  }
>
>  /*
> @@ -385,25 +438,24 @@ static ssize_t set_enable(struct device *dev, struct device_attribute *devattr,
>  			  const char *buf, size_t count)
>  {
>  	struct max6650_data *data = dev_get_drvdata(dev);
> -	struct i2c_client *client = data->client;
> -	int max6650_modes[3] = {0, 3, 2};
>  	unsigned long mode;
>  	int err;
> +	const u8 max6650_modes[3] = {
> +		MAX6650_CFG_MODE_ON,
> +		MAX6650_CFG_MODE_OPEN_LOOP,
> +		MAX6650_CFG_MODE_CLOSED_LOOP
> +		};
>
>  	err = kstrtoul(buf, 10, &mode);
>  	if (err)
>  		return err;
>
> -	if (mode > 2)
> +	if (mode >= ARRAY_SIZE(max6650_modes))
>  		return -EINVAL;
>
>  	mutex_lock(&data->update_lock);
>
> -	data->config = i2c_smbus_read_byte_data(client, MAX6650_REG_CONFIG);
> -	data->config = (data->config & ~MAX6650_CFG_MODE_MASK)
> -		       | (max6650_modes[mode] << 4);
> -
> -	i2c_smbus_write_byte_data(client, MAX6650_REG_CONFIG, data->config);
> +	max6650_set_operating_mode(data, max6650_modes[mode]);
>
>  	mutex_unlock(&data->update_lock);
>
> @@ -582,6 +634,7 @@ static int max6650_init_client(struct max6650_data *data,
>  	int err = -EIO;
>  	u32 voltage;
>  	u32 prescale;
> +	u32 target_rpm;
>
>  	if (of_property_read_u32(dev->of_node, "maxim,fan-microvolt",
>  				 &voltage))
> @@ -642,22 +695,6 @@ static int max6650_init_client(struct max6650_data *data,
>  		 (config & MAX6650_CFG_V12) ? 12 : 5,
>  		 1 << (config & MAX6650_CFG_PRESCALER_MASK));
>
> -	/*
> -	 * If mode is set to "full off", we change it to "open loop" and
> -	 * set DAC to 255, which has the same effect. We do this because
> -	 * there's no "full off" mode defined in hwmon specifications.
> -	 */
> -
> -	if ((config & MAX6650_CFG_MODE_MASK) == MAX6650_CFG_MODE_OFF) {
> -		dev_dbg(dev, "Change mode to open loop, full off.\n");
> -		config = (config & ~MAX6650_CFG_MODE_MASK)
> -			 | MAX6650_CFG_MODE_OPEN_LOOP;
> -		if (i2c_smbus_write_byte_data(client, MAX6650_REG_DAC, 255)) {
> -			dev_err(dev, "DAC write error, aborting.\n");
> -			return err;
> -		}
> -	}
> -
>  	if (i2c_smbus_write_byte_data(client, MAX6650_REG_CONFIG, config)) {
>  		dev_err(dev, "Config write error, aborting.\n");
>  		return err;
> @@ -666,6 +703,10 @@ static int max6650_init_client(struct max6650_data *data,
>  	data->config = config;
>  	data->count = i2c_smbus_read_byte_data(client, MAX6650_REG_COUNT);
>
> +	if (!of_property_read_u32(client->dev.of_node, "maxim,fan-target-rpm",
> +				 &target_rpm))
> +		max6650_set_target(data, target_rpm);
> +
>  	return 0;
>  }
>
>

