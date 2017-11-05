Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:50140 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750914AbdKEOkA (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Nov 2017 09:40:00 -0500
Date: Sun, 5 Nov 2017 06:39:57 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, jdelvare@suse.com, corbet@lwn.net,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [v4,3/6] pmbus: core: Add fan control support
Message-ID: <20171105143957.GA23897@roeck-us.net>
References: <20171103045306.26448-4-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171103045306.26448-4-andrew@aj.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Nov 03, 2017 at 03:53:03PM +1100, Andrew Jeffery wrote:
> Expose fanX_target, pwmX and pwmX_enable hwmon sysfs attributes.
> 
> Fans in a PMBus device are driven by the configuration of two registers:
> FAN_CONFIG_x_y and FAN_COMMAND_x: FAN_CONFIG_x_y dictates how the fan
> and the tacho operate (if installed), while FAN_COMMAND_x sets the
> desired fan rate. The unit of FAN_COMMAND_x is dependent on the
> operational fan mode, RPM or PWM percent duty, as determined by the
> corresponding FAN_CONFIG_x_y.
> 
> The mapping of fanX_target, pwmX and pwmX_enable onto FAN_CONFIG_x_y and
> FAN_COMMAND_x is implemented with the addition of virtual registers and
> generic implementations in the core:
> 
> 1. PMBUS_VIRT_FAN_TARGET_x
> 2. PMBUS_VIRT_PWM_x
> 3. PMBUS_VIRT_PWM_ENABLE_x
> 
> The virtual registers facilitate the necessary side-effects of each
> access. Examples of the read case, assuming m = 1, b = 0, R = 0:
> 
>              Read     |              With              || Gives
>          -------------------------------------------------------
>            Attribute  | FAN_CONFIG_x_y | FAN_COMMAND_y || Value
>          ----------------------------------------------++-------
>           fanX_target | ~PB_FAN_z_RPM  | 0x0001        || 1
>           pwm1        | ~PB_FAN_z_RPM  | 0x0064        || 255
>           pwmX_enable | ~PB_FAN_z_RPM  | 0x0001        || 1
>           fanX_target |  PB_FAN_z_RPM  | 0x0001        || 1
>           pwm1        |  PB_FAN_z_RPM  | 0x0064        || 0
>           pwmX_enable |  PB_FAN_z_RPM  | 0x0001        || 1
> 
> And the write case:
> 
>              Write    | With  ||               Sets
>          -------------+-------++----------------+---------------
>            Attribute  | Value || FAN_CONFIG_x_y | FAN_COMMAND_x
>          -------------+-------++----------------+---------------
>           fanX_target | 1     ||  PB_FAN_z_RPM  | 0x0001
>           pwmX        | 255   || ~PB_FAN_z_RPM  | 0x0064
>           pwmX_enable | 1     || ~PB_FAN_z_RPM  | 0x0064
> 
> Also, the DIRECT mode scaling of some controllers is different between
> RPM and PWM percent duty control modes, so PSC_PWM is introduced to
> capture the necessary coefficients.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  drivers/hwmon/pmbus/pmbus.h      |  29 +++++
>  drivers/hwmon/pmbus/pmbus_core.c | 224 ++++++++++++++++++++++++++++++++++++---
>  2 files changed, 238 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/pmbus.h b/drivers/hwmon/pmbus/pmbus.h
> index 4efa2bd4f6d8..cdf3e288e626 100644
> --- a/drivers/hwmon/pmbus/pmbus.h
> +++ b/drivers/hwmon/pmbus/pmbus.h
> @@ -190,6 +190,28 @@ enum pmbus_regs {
>  	PMBUS_VIRT_VMON_UV_FAULT_LIMIT,
>  	PMBUS_VIRT_VMON_OV_FAULT_LIMIT,
>  	PMBUS_VIRT_STATUS_VMON,
> +
> +	/*
> +	 * RPM and PWM Fan control
> +	 *
> +	 * Drivers wanting to expose PWM control must define the behaviour of
> +	 * PMBUS_VIRT_PWM_ENABLE_[1-4] in the {read,write}_word_data callback.
> +	 *
> +	 * pmbus core provides default implementations for
> +	 * PMBUS_VIRT_FAN_TARGET_[1-4] and PMBUS_VIRT_PWM_[1-4].
> +	 */
> +	PMBUS_VIRT_FAN_TARGET_1,
> +	PMBUS_VIRT_FAN_TARGET_2,
> +	PMBUS_VIRT_FAN_TARGET_3,
> +	PMBUS_VIRT_FAN_TARGET_4,
> +	PMBUS_VIRT_PWM_1,
> +	PMBUS_VIRT_PWM_2,
> +	PMBUS_VIRT_PWM_3,
> +	PMBUS_VIRT_PWM_4,
> +	PMBUS_VIRT_PWM_ENABLE_1,
> +	PMBUS_VIRT_PWM_ENABLE_2,
> +	PMBUS_VIRT_PWM_ENABLE_3,
> +	PMBUS_VIRT_PWM_ENABLE_4,
>  };
>  
>  /*
> @@ -223,6 +245,8 @@ enum pmbus_regs {
>  #define PB_FAN_1_RPM			BIT(6)
>  #define PB_FAN_1_INSTALLED		BIT(7)
>  
> +enum pmbus_fan_mode { percent = 0, rpm };
> +
>  /*
>   * STATUS_BYTE, STATUS_WORD (lower)
>   */
> @@ -313,6 +337,7 @@ enum pmbus_sensor_classes {
>  	PSC_POWER,
>  	PSC_TEMPERATURE,
>  	PSC_FAN,
> +	PSC_PWM,
>  	PSC_NUM_CLASSES		/* Number of power sensor classes */
>  };
>  
> @@ -339,6 +364,8 @@ enum pmbus_sensor_classes {
>  #define PMBUS_HAVE_STATUS_FAN34	BIT(17)
>  #define PMBUS_HAVE_VMON		BIT(18)
>  #define PMBUS_HAVE_STATUS_VMON	BIT(19)
> +#define PMBUS_HAVE_PWM12	BIT(20)
> +#define PMBUS_HAVE_PWM34	BIT(21)
>  
>  enum pmbus_data_format { linear = 0, direct, vid };
>  enum vrm_version { vr11 = 0, vr12, vr13 };
> @@ -413,6 +440,8 @@ int pmbus_write_byte_data(struct i2c_client *client, int page, u8 reg,
>  			  u8 value);
>  int pmbus_update_byte_data(struct i2c_client *client, int page, u8 reg,
>  			   u8 mask, u8 value);
> +int pmbus_update_fan(struct i2c_client *client, int page, int id,
> +		     u8 config, u8 mask, u16 command);
>  void pmbus_clear_faults(struct i2c_client *client);
>  bool pmbus_check_byte_register(struct i2c_client *client, int page, int reg);
>  bool pmbus_check_word_register(struct i2c_client *client, int page, int reg);
> diff --git a/drivers/hwmon/pmbus/pmbus_core.c b/drivers/hwmon/pmbus/pmbus_core.c
> index 302f0aef59de..55838b69e99a 100644
> --- a/drivers/hwmon/pmbus/pmbus_core.c
> +++ b/drivers/hwmon/pmbus/pmbus_core.c
> @@ -64,6 +64,7 @@ struct pmbus_sensor {
>  	u16 reg;		/* register */
>  	enum pmbus_sensor_classes class;	/* sensor class */
>  	bool update;		/* runtime sensor update needed */
> +	bool convert;		/* Whether or not to apply linear/vid/direct */
>  	int data;		/* Sensor data.
>  				   Negative if there was a read error */
>  };
> @@ -128,6 +129,27 @@ struct pmbus_debugfs_entry {
>  	u8 reg;
>  };
>  
> +static const int pmbus_fan_rpm_mask[] = {
> +	PB_FAN_1_RPM,
> +	PB_FAN_2_RPM,
> +	PB_FAN_1_RPM,
> +	PB_FAN_2_RPM,
> +};
> +
> +static const int pmbus_fan_config_registers[] = {
> +	PMBUS_FAN_CONFIG_12,
> +	PMBUS_FAN_CONFIG_12,
> +	PMBUS_FAN_CONFIG_34,
> +	PMBUS_FAN_CONFIG_34
> +};
> +
> +static const int pmbus_fan_command_registers[] = {
> +	PMBUS_FAN_COMMAND_1,
> +	PMBUS_FAN_COMMAND_2,
> +	PMBUS_FAN_COMMAND_3,
> +	PMBUS_FAN_COMMAND_4,
> +};
> +
>  void pmbus_clear_cache(struct i2c_client *client)
>  {
>  	struct pmbus_data *data = i2c_get_clientdata(client);
> @@ -198,6 +220,31 @@ int pmbus_write_word_data(struct i2c_client *client, u8 page, u8 reg, u16 word)
>  }
>  EXPORT_SYMBOL_GPL(pmbus_write_word_data);
>  
> +int pmbus_update_fan(struct i2c_client *client, int page, int id,
> +			       u8 config, u8 mask, u16 command)

Please make sure continuation lines are aligned to '(' where possible.

> +{
> +	int from, rv;
> +	u8 to;
> +
> +	from = pmbus_read_byte_data(client, page,
> +				    pmbus_fan_config_registers[id]);
> +	if (from < 0)
> +		return from;
> +
> +	to = (from & ~mask) | (config & mask);
> +
> +	if (to != from) {
> +		rv = pmbus_write_byte_data(client, page,
> +					   pmbus_fan_config_registers[id], to);
> +		if (rv < 0)
> +			return rv;
> +	}
> +
> +	return pmbus_write_word_data(client, page,
> +				     pmbus_fan_command_registers[id], command);
> +}
> +EXPORT_SYMBOL_GPL(pmbus_update_fan);
> +
>  /*
>   * _pmbus_write_word_data() is similar to pmbus_write_word_data(), but checks if
>   * a device specific mapping function exists and calls it if necessary.
> @@ -214,8 +261,40 @@ static int _pmbus_write_word_data(struct i2c_client *client, int page, int reg,
>  		if (status != -ENODATA)
>  			return status;
>  	}
> -	if (reg >= PMBUS_VIRT_BASE)
> -		return -ENXIO;
> +	if (reg >= PMBUS_VIRT_BASE) {
> +		int id, bit;
> +
> +		switch (reg) {
> +		case PMBUS_VIRT_FAN_TARGET_1:
> +		case PMBUS_VIRT_FAN_TARGET_2:
> +		case PMBUS_VIRT_FAN_TARGET_3:
> +		case PMBUS_VIRT_FAN_TARGET_4:

Maybe
		case PMBUS_VIRT_FAN_TARGET_1 ... PMBUS_VIRT_FAN_TARGET_4:

> +			id = reg - PMBUS_VIRT_FAN_TARGET_1;
> +			bit = pmbus_fan_rpm_mask[id];
> +			status = pmbus_update_fan(client, page, id, bit, bit,
> +						  word);
> +			break;
> +		case PMBUS_VIRT_PWM_1:
> +		case PMBUS_VIRT_PWM_2:
> +		case PMBUS_VIRT_PWM_3:
> +		case PMBUS_VIRT_PWM_4:
> +		{
> +			u32 command = word;

Please move command up and drop the {.

Why u32 ? The value should be bound to 0..255 (if it isn't and a larger
value is accepted we have overflow issues).

> +
> +			id = reg - PMBUS_VIRT_PWM_1;
> +			bit = pmbus_fan_rpm_mask[id];
> +			command *= 100;
> +			command /= 255;
> +			status = pmbus_update_fan(client, page, id, 0, bit,
> +						  command);
> +			break;
> +		}
> +		default:
> +			status = -ENXIO;
> +			break;
> +		}
> +		return status;

Please move this code to a separate function.

> +	}
>  	return pmbus_write_word_data(client, page, reg, word);
>  }
>  
> @@ -231,6 +310,9 @@ int pmbus_read_word_data(struct i2c_client *client, u8 page, u8 reg)
>  }
>  EXPORT_SYMBOL_GPL(pmbus_read_word_data);
>  
> +static int pmbus_get_fan_command(struct i2c_client *client, int page, int id,
> +				 enum pmbus_fan_mode mode);
> +
>  /*
>   * _pmbus_read_word_data() is similar to pmbus_read_word_data(), but checks if
>   * a device specific mapping function exists and calls it if necessary.
> @@ -246,8 +328,42 @@ static int _pmbus_read_word_data(struct i2c_client *client, int page, int reg)
>  		if (status != -ENODATA)
>  			return status;
>  	}
> -	if (reg >= PMBUS_VIRT_BASE)
> -		return -ENXIO;
> +	if (reg >= PMBUS_VIRT_BASE) {
> +		int id;
> +
> +		switch (reg) {
> +		case PMBUS_VIRT_FAN_TARGET_1:
> +		case PMBUS_VIRT_FAN_TARGET_2:
> +		case PMBUS_VIRT_FAN_TARGET_3:
> +		case PMBUS_VIRT_FAN_TARGET_4:

Since there is an implied assumption that those are sequential,
how about the following ?

		case PMBUS_VIRT_FAN_TARGET_1 ... PMBUS_VIRT_FAN_TARGET_4:

> +			id = reg - PMBUS_VIRT_FAN_TARGET_1;

This warrants a comment in the definition of PMBUS_VIRT_FAN_TARGET_X
and PMBUS_VIRT_PWM_X stating that the definitions must be in sequence.

> +			status = pmbus_get_fan_command(client, page, id, rpm);
> +			break;
> +		case PMBUS_VIRT_PWM_1:
> +		case PMBUS_VIRT_PWM_2:
> +		case PMBUS_VIRT_PWM_3:
> +		case PMBUS_VIRT_PWM_4:

Same as above.

> +		{
> +			int rv;

Please move the declaration up and drop the {.

> +
> +			id = reg - PMBUS_VIRT_PWM_1;
> +			rv = pmbus_get_fan_command(client, page, id, percent);
> +			if (rv < 0)
> +				return rv;
> +
Is this guaranteed to be <= 100 ?

> +			rv *= 255;
> +			rv /= 100;
> +
> +			status = rv;
> +			break;
> +		}
> +		default:
> +			status = -ENXIO;
> +			break;
> +		}

Please move this code to a separate function.

> +
> +		return status;
> +	}
>  	return pmbus_read_word_data(client, page, reg);
>  }
>  
> @@ -314,6 +430,28 @@ static int _pmbus_read_byte_data(struct i2c_client *client, int page, int reg)
>  	return pmbus_read_byte_data(client, page, reg);
>  }
>  
> +static int pmbus_get_fan_command(struct i2c_client *client, int page, int id,
> +				 enum pmbus_fan_mode mode)

Maybe better pmbus_get_fan_get_speed_rpm to clarify that we are not
really interested in the command register value but but in speed or rpm ?

> +{
> +	int config;
> +
> +	config = _pmbus_read_byte_data(client, page,
> +				       pmbus_fan_config_registers[id]);
> +	if (config < 0)
> +		return config;
> +
> +	/*
> +	 * We can't meaningfully translate between PWM and RPM, so if the
> +	 * attribute mode (fan[1-*]_target is RPM, pwm[1-*] and pwm[1-*]_enable
> +	 * are PWM) doesn't match the hardware mode, then report 0 instead.
> +	 */
> +	if ((mode == rpm) != (!!(config & pmbus_fan_rpm_mask[id])))
> +		return 0;

Please drop the unnecessary ().

I am not too happy about this - the user has no means to specify pwm or
fan target speed _before_ changing the mode. It would be better to report
(and accept) cached values in that situation, and update the actual value
as the mode is changed.

> +
> +	return _pmbus_read_word_data(client, page,
> +				     pmbus_fan_command_registers[id]);
> +}
> +
>  static void pmbus_clear_fault_page(struct i2c_client *client, int page)
>  {
>  	_pmbus_write_byte(client, page, PMBUS_CLEAR_FAULTS);
> @@ -515,7 +653,7 @@ static long pmbus_reg2data_direct(struct pmbus_data *data,
>  	/* X = 1/m * (Y * 10^-R - b) */
>  	R = -R;
>  	/* scale result to milli-units for everything but fans */
> -	if (sensor->class != PSC_FAN) {
> +	if (!(sensor->class == PSC_FAN || sensor->class == PSC_PWM)) {

Please use positive logic

	if (sensor->class != PSC_FAN && sensor->class != PSC_PWM)

It is (at least for me) much easier to read.

>  		R += 3;
>  		b *= 1000;
>  	}
> @@ -569,6 +707,9 @@ static long pmbus_reg2data(struct pmbus_data *data, struct pmbus_sensor *sensor)
>  {
>  	long val;
>  
> +	if (!sensor->convert)
> +		return sensor->data;
> +
>  	switch (data->info->format[sensor->class]) {
>  	case direct:
>  		val = pmbus_reg2data_direct(data, sensor);
> @@ -672,7 +813,7 @@ static u16 pmbus_data2reg_direct(struct pmbus_data *data,
>  	}
>  
>  	/* Calculate Y = (m * X + b) * 10^R */
> -	if (sensor->class != PSC_FAN) {
> +	if (!(sensor->class == PSC_FAN || sensor->class == PSC_PWM)) {

Same as above.

>  		R -= 3;		/* Adjust R and b for data in milli-units */
>  		b *= 1000;
>  	}
> @@ -703,6 +844,9 @@ static u16 pmbus_data2reg(struct pmbus_data *data,
>  {
>  	u16 regval;
>  
> +	if (!sensor->convert)
> +		return val;
> +
>  	switch (data->info->format[sensor->class]) {
>  	case direct:
>  		regval = pmbus_data2reg_direct(data, sensor, val);
> @@ -925,12 +1069,18 @@ static struct pmbus_sensor *pmbus_add_sensor(struct pmbus_data *data,
>  		return NULL;
>  	a = &sensor->attribute;
>  
> -	snprintf(sensor->name, sizeof(sensor->name), "%s%d_%s",
> -		 name, seq, type);
> +	if (type)
> +		snprintf(sensor->name, sizeof(sensor->name), "%s%d_%s",
> +			 name, seq, type);
> +	else
> +		snprintf(sensor->name, sizeof(sensor->name), "%s%d",
> +			 name, seq);
> +
>  	sensor->page = page;
>  	sensor->reg = reg;
>  	sensor->class = class;
>  	sensor->update = update;
> +	sensor->convert = true;
>  	pmbus_dev_attr_init(a, sensor->name,
>  			    readonly ? S_IRUGO : S_IRUGO | S_IWUSR,
>  			    pmbus_show_sensor, pmbus_set_sensor);
> @@ -1592,13 +1742,6 @@ static const int pmbus_fan_registers[] = {
>  	PMBUS_READ_FAN_SPEED_4
>  };
>  
> -static const int pmbus_fan_config_registers[] = {
> -	PMBUS_FAN_CONFIG_12,
> -	PMBUS_FAN_CONFIG_12,
> -	PMBUS_FAN_CONFIG_34,
> -	PMBUS_FAN_CONFIG_34
> -};
> -
>  static const int pmbus_fan_status_registers[] = {
>  	PMBUS_STATUS_FAN_12,
>  	PMBUS_STATUS_FAN_12,
> @@ -1621,6 +1764,48 @@ static const u32 pmbus_fan_status_flags[] = {
>  };
>  
>  /* Fans */
> +static int pmbus_add_fan_ctrl(struct i2c_client *client,
> +		struct pmbus_data *data, int index, int page, int id,
> +		u8 config)
> +{
> +	struct pmbus_sensor *sensor;
> +	int rv;
> +
> +	rv = _pmbus_read_word_data(client, page,
> +				   pmbus_fan_command_registers[id]);
> +	if (rv < 0)
> +		return rv;
> +
> +	sensor = pmbus_add_sensor(data, "fan", "target", index, page,
> +				  PMBUS_VIRT_FAN_TARGET_1 + id, PSC_FAN,
> +				  true, false);
> +
> +	if (!sensor)
> +		return -ENOMEM;
> +
> +	if (!((data->info->func[page] & PMBUS_HAVE_PWM12) ||
> +			(data->info->func[page] & PMBUS_HAVE_PWM34)))

why not just the following ?

	if (!(data->info->func[page] & (PMBUS_HAVE_PWM12 | PMBUS_HAVE_PWM34)))

Also, doesn't this add attributes for 1,2 even if only 3,4 are
supported, and 3,4 even if only 1,2 are supported ?

> +		return 0;
> +
> +	sensor = pmbus_add_sensor(data, "pwm", NULL, index, page,
> +				  PMBUS_VIRT_PWM_1 + id, PSC_PWM,
> +				  true, false);
> +
> +	if (!sensor)
> +		return -ENOMEM;
> +
> +	sensor = pmbus_add_sensor(data, "pwm", "enable", index, page,
> +				  PMBUS_VIRT_PWM_ENABLE_1 + id, PSC_PWM,
> +				  true, false);
> +
> +	if (!sensor)
> +		return -ENOMEM;
> +
> +	sensor->convert = false;

convert should be a new parameter to pmbus_add_sensor().

> +
> +	return 0;
> +}
> +
>  static int pmbus_add_fan_attributes(struct i2c_client *client,
>  				    struct pmbus_data *data)
>  {
> @@ -1658,6 +1843,15 @@ static int pmbus_add_fan_attributes(struct i2c_client *client,
>  					     PSC_FAN, true, true) == NULL)
>  				return -ENOMEM;
>  
> +			/* Fan control */
> +			if (pmbus_check_word_register(client, page,
> +					pmbus_fan_command_registers[f])) {
> +				ret = pmbus_add_fan_ctrl(client, data, index,
> +							 page, f, regval);
> +				if (ret < 0)
> +					return ret;
> +			}
> +
>  			/*
>  			 * Each fan status register covers multiple fans,
>  			 * so we have to do some magic.
