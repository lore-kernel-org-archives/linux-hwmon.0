Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:53655 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750786AbdKEO6f (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Nov 2017 09:58:35 -0500
Date: Sun, 5 Nov 2017 06:58:33 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, jdelvare@suse.com, corbet@lwn.net,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [v4,6/6] pmbus: max31785: Add dual tachometer support
Message-ID: <20171105145833.GA25880@roeck-us.net>
References: <20171103045306.26448-7-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171103045306.26448-7-andrew@aj.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Nov 03, 2017 at 03:53:06PM +1100, Andrew Jeffery wrote:
> The dual tachometer feature is implemented in hardware with a TACHSEL
> input to indicate the rotor under measurement, and exposed on the device
> by extending the READ_FAN_SPEED_1 word with two extra bytes*. The need
> to read the non-standard four-byte response leads to a cut-down
> implementation of i2c_smbus_xfer_emulated() included in the driver.
> Further, to expose the second rotor tachometer value to userspace the
> values are exposed through virtual pages. We re-route accesses to
> FAN_CONFIG_1_2 and READ_FAN_SPEED_1 on undefined (in hardware) pages
> 23-28 to the same registers on pages 0-5, and with the latter command we
> extract the value from the second word of the four-byte response.
> 
> * The documentation recommends the slower rotor be associated with
> TACHSEL=0, which provides the first word of the response. The TACHSEL=0
> measurement is used by the controller's closed-loop fan management.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/hwmon/max31785   |   8 ++-
>  drivers/hwmon/pmbus/max31785.c | 159 ++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 163 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/hwmon/max31785 b/Documentation/hwmon/max31785
> index e9edbf11948f..8e75efc5e4b9 100644
> --- a/Documentation/hwmon/max31785
> +++ b/Documentation/hwmon/max31785
> @@ -17,8 +17,9 @@ management with temperature and remote voltage sensing. Various fan control
>  features are provided, including PWM frequency control, temperature hysteresis,
>  dual tachometer measurements, and fan health monitoring.
>  
> -For dual rotor fan configuration, the MAX31785 exposes the slowest rotor of the
> -two in the fan[1-4]_input attributes.
> +For dual-rotor configurations the MAX31785A exposes the second rotor tachometer
> +readings in attributes fan[5-8]_input. By contrast the MAX31785 only exposes
> +the slowest rotor measurement, and does so in the fan[1-4]_input attributes.
>  
>  Usage Notes
>  -----------
> @@ -31,7 +32,8 @@ Sysfs attributes
>  
>  fan[1-4]_alarm		Fan alarm.
>  fan[1-4]_fault		Fan fault.
> -fan[1-4]_input		Fan RPM.
> +fan[1-8]_input		Fan RPM. On the MAX31785A, inputs 5-8 correspond to the
> +			second rotor of fans 1-4
>  fan[1-4]_target		Fan input target
>  
>  in[1-6]_crit		Critical maximum output voltage
> diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
> index 0d97ddf67079..2ca7febb2843 100644
> --- a/drivers/hwmon/pmbus/max31785.c
> +++ b/drivers/hwmon/pmbus/max31785.c
> @@ -16,10 +16,82 @@
>  
>  enum max31785_regs {
>  	MFR_REVISION		= 0x9b,
> +	MFR_FAN_CONFIG		= 0xf1,
>  };
>  
> +#define MAX31785			0x3030
> +#define MAX31785A			0x3040
> +
> +#define MFR_FAN_CONFIG_DUAL_TACH	BIT(12)
> +
>  #define MAX31785_NR_PAGES		23
>  
> +static int max31785_read_byte_data(struct i2c_client *client, int page,
> +				   int reg)
> +{
> +	switch (reg) {
> +	case PMBUS_VOUT_MODE:
> +		if (page < MAX31785_NR_PAGES)
> +			return -ENODATA;
> +
> +		return -ENOTSUPP;
> +	case PMBUS_FAN_CONFIG_12:
> +		if (page < MAX31785_NR_PAGES)
> +			return -ENODATA;
> +
> +		return pmbus_read_byte_data(client, page - MAX31785_NR_PAGES,
> +					    reg);
> +	}
> +
> +	return -ENODATA;
> +}
> +
> +static int max31785_write_byte(struct i2c_client *client, int page, u8 value)
> +{
> +	if (page < MAX31785_NR_PAGES)
> +		return -ENODATA;
> +
> +	return -ENOTSUPP;
> +}
> +
> +static int max31785_read_long_data(struct i2c_client *client, int page,
> +				   int reg, u32 *data)
> +{
> +	unsigned char cmdbuf[1];
> +	unsigned char rspbuf[4];
> +	int rc;
> +
> +	struct i2c_msg msg[2] = {
> +		{
> +			.addr = client->addr,
> +			.flags = 0,
> +			.len = sizeof(cmdbuf),
> +			.buf = cmdbuf,
> +		},
> +		{
> +			.addr = client->addr,
> +			.flags = I2C_M_RD,
> +			.len = sizeof(rspbuf),
> +			.buf = rspbuf,
> +		},
> +	};
> +
> +	cmdbuf[0] = reg;
> +
> +	rc = pmbus_set_page(client, page);
> +	if (rc < 0)
> +		return rc;
> +
> +	rc = i2c_transfer(client->adapter, msg, ARRAY_SIZE(msg));
> +	if (rc < 0)
> +		return rc;
> +
> +	*data = (rspbuf[0] << (0 * 8)) | (rspbuf[1] << (1 * 8)) |
> +		(rspbuf[2] << (2 * 8)) | (rspbuf[3] << (3 * 8));
> +
> +	return rc;
> +}
> +
>  static int max31785_get_pwm(struct i2c_client *client, int page)
>  {
>  	int config;
> @@ -76,7 +148,25 @@ static int max31785_read_word_data(struct i2c_client *client, int page,
>  	int rv;
>  
>  	switch (reg) {
> +	case PMBUS_READ_FAN_SPEED_1:
> +	{
> +		u32 val;
> +
> +		if (page < MAX31785_NR_PAGES)
> +			return -ENODATA;
> +
> +		rv = max31785_read_long_data(client, page - MAX31785_NR_PAGES,
> +					     reg, &val);
> +		if (rv < 0)
> +			return rv;
> +
> +		rv = (val >> 16) & 0xffff;
> +		break;
> +	}
>  	case PMBUS_VIRT_PWM_1:
> +		if (page >= MAX31785_NR_PAGES)
> +			return -ENOTSUPP;
> +
>  		rv = max31785_get_pwm(client, page);
>  		if (rv < 0)
>  			return rv;
> @@ -85,10 +175,13 @@ static int max31785_read_word_data(struct i2c_client *client, int page,
>  		rv /= 100;
>  		break;
>  	case PMBUS_VIRT_PWM_ENABLE_1:
> +		if (page >= MAX31785_NR_PAGES)
> +			return -ENOTSUPP;
> +
>  		rv = max31785_get_pwm_mode(client, page);
>  		break;
>  	default:
> -		rv = -ENODATA;
> +		rv = (page >= MAX31785_NR_PAGES) ? -ENXIO : -ENODATA;
>  		break;
>  	}
>  
> @@ -100,6 +193,9 @@ static const int max31785_pwm_modes[] = { 0x7fff, 0x2710, 0xffff };
>  static int max31785_write_word_data(struct i2c_client *client, int page,
>  				    int reg, u16 word)
>  {
> +	if (page >= MAX31785_NR_PAGES)
> +		return -ENXIO;
> +
>  	switch (reg) {
>  	case PMBUS_VIRT_PWM_ENABLE_1:
>  		if (word >= ARRAY_SIZE(max31785_pwm_modes))
> @@ -127,7 +223,9 @@ static const struct pmbus_driver_info max31785_info = {
>  	.pages = MAX31785_NR_PAGES,
>  
>  	.write_word_data = max31785_write_word_data,
> +	.read_byte_data = max31785_read_byte_data,
>  	.read_word_data = max31785_read_word_data,
> +	.write_byte = max31785_write_byte,
>  
>  	/* RPM */
>  	.format[PSC_FAN] = direct,
> @@ -174,6 +272,55 @@ static const struct pmbus_driver_info max31785_info = {
>  	.func[22] = MAX31785_VOUT_FUNCS,
>  };
>  
> +static int max31785_configure(struct i2c_client *client,
> +			      const struct i2c_device_id *id,
> +			      struct pmbus_driver_info *info)
> +{
> +	struct device *dev = &client->dev;
> +	bool dual_tach = false;
> +	int ret;
> +	int i;
> +
> +	ret = i2c_smbus_read_word_data(client, MFR_REVISION);
> +	if (ret < 0)
> +		return ret;
> +
> +	if (!strcmp("max31785a", id->name)) {
> +		if (ret == MAX31785A)
> +			dual_tach = true;
> +		else
> +			dev_warn(dev, "Expected max3175a, found max31785: cannot provide secondary tachometer readings\n");
> +	} else if (!strcmp("max31785", id->name)) {
> +		if (ret == MAX31785A)
> +			dev_info(dev, "Expected max31785, found max3175a: suppressing secondary tachometer attributes\n");
> +	} else {
> +		return -EINVAL;
> +	}

This is too restrictive. I would suggest to move the chip detection part
to the probe function. Also, since you have it, you should weed out any other
types (ret could be anything) and not just assume it is MAX31785 if it isn't
MAX31785A.

The "excpected" messages are ok, but don't unnecessaily suppress attributes.
If there is a need to do this for some reason, there should be a configuration
parameter: forcing the user to specify the wrong type on purpose to suppress
information is just wrong.

dual_tach should not depend on the type in id but on the detected type.

> +
> +	if (!dual_tach)
> +		return 0;
> +
> +	for (i = 0; i <= 5; i++) {
> +		ret = i2c_smbus_write_byte_data(client, PMBUS_PAGE, i);
> +		if (ret < 0)
> +			return ret;
> +
> +		ret = i2c_smbus_read_word_data(client, MFR_FAN_CONFIG);
> +		if (ret < 0)
> +			return ret;
> +
> +		if (ret & MFR_FAN_CONFIG_DUAL_TACH) {
> +			int virtual = MAX31785_NR_PAGES + i;
> +
> +			info->pages = max(info->pages, virtual + 1);
> +			info->func[virtual] |= PMBUS_HAVE_FAN12;
> +			info->func[virtual] |= PMBUS_PAGE_VIRTUAL;
> +		}
> +	}
> +
> +	return 0;
> +}
> +
>  static int max31785_probe(struct i2c_client *client,
>  			  const struct i2c_device_id *id)
>  {
> @@ -181,6 +328,12 @@ static int max31785_probe(struct i2c_client *client,
>  	struct pmbus_driver_info *info;
>  	s64 ret;
>  
> +	if (!i2c_check_functionality(client->adapter,
> +				     I2C_FUNC_SMBUS_BYTE_DATA |
> +				     I2C_FUNC_SMBUS_WORD_DATA |
> +				     I2C_FUNC_SMBUS_BLOCK_DATA))
> +		return -ENODEV;
> +
>  	info = devm_kzalloc(dev, sizeof(struct pmbus_driver_info), GFP_KERNEL);
>  	if (!info)
>  		return -ENOMEM;
> @@ -191,6 +344,10 @@ static int max31785_probe(struct i2c_client *client,
>  	if (ret < 0)
>  		return ret;
>  
> +	ret = max31785_configure(client, id, info);
> +	if (ret < 0)
> +		return ret;
> +
>  	return pmbus_do_probe(client, id, info);
>  }
>  
