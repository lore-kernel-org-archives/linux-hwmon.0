Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:43232 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750748AbdKEPEn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 5 Nov 2017 10:04:43 -0500
Date: Sun, 5 Nov 2017 07:04:41 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, jdelvare@suse.com, corbet@lwn.net,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [v4,4/6] pmbus: max31785: Add fan control
Message-ID: <20171105150441.GA26191@roeck-us.net>
References: <20171103045306.26448-5-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171103045306.26448-5-andrew@aj.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Nov 03, 2017 at 03:53:04PM +1100, Andrew Jeffery wrote:
> The implementation makes use of the new fan control virtual registers
> exposed by the pmbus core. It mixes use of the default implementations
> with some overrides via the read/write handlers to handle FAN_COMMAND_1
> on the MAX31785, whose definition breaks the value range into various
> control bands dependent on RPM or PWM mode.
> 
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> ---
>  Documentation/hwmon/max31785   |   4 ++
>  drivers/hwmon/pmbus/max31785.c | 104 ++++++++++++++++++++++++++++++++++++++++-
>  2 files changed, 107 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/max31785 b/Documentation/hwmon/max31785
> index 45fb6093dec2..e9edbf11948f 100644
> --- a/Documentation/hwmon/max31785
> +++ b/Documentation/hwmon/max31785
> @@ -32,6 +32,7 @@ Sysfs attributes
>  fan[1-4]_alarm		Fan alarm.
>  fan[1-4]_fault		Fan fault.
>  fan[1-4]_input		Fan RPM.
> +fan[1-4]_target		Fan input target
>  
>  in[1-6]_crit		Critical maximum output voltage
>  in[1-6]_crit_alarm	Output voltage critical high alarm
> @@ -44,6 +45,9 @@ in[1-6]_max_alarm	Output voltage high alarm
>  in[1-6]_min		Minimum output voltage
>  in[1-6]_min_alarm	Output voltage low alarm
>  
> +pwm[1-4]		Fan target duty cycle (0..255)
> +pwm[1-4]_enable		0: full-speed, 1: manual control, 2: automatic
> +
>  temp[1-11]_crit		Critical high temperature
>  temp[1-11]_crit_alarm	Chip temperature critical high alarm
>  temp[1-11]_input	Measured temperature
> diff --git a/drivers/hwmon/pmbus/max31785.c b/drivers/hwmon/pmbus/max31785.c
> index 9313849d5160..0d97ddf67079 100644
> --- a/drivers/hwmon/pmbus/max31785.c
> +++ b/drivers/hwmon/pmbus/max31785.c
> @@ -20,8 +20,102 @@ enum max31785_regs {
>  
>  #define MAX31785_NR_PAGES		23
>  
> +static int max31785_get_pwm(struct i2c_client *client, int page)
> +{
> +	int config;
> +	int command;
> +
> +	config = pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);
> +	if (config < 0)
> +		return config;
> +
> +	command = pmbus_read_word_data(client, page, PMBUS_FAN_COMMAND_1);
> +	if (command < 0)
> +		return command;
> +
> +	if (!(config & PB_FAN_1_RPM)) {
> +		if (command >= 0x8000)
> +			return 0;
> +		else if (command >= 0x2711)
> +			return 0x2710;
> +
> +		return command;
> +	}
> +
> +	return 0;
> +}
> +
> +static int max31785_get_pwm_mode(struct i2c_client *client, int page)
> +{
> +	int config;
> +	int command;
> +
> +	config = pmbus_read_byte_data(client, page, PMBUS_FAN_CONFIG_12);
> +	if (config < 0)
> +		return config;
> +
> +	command = pmbus_read_word_data(client, page, PMBUS_FAN_COMMAND_1);
> +	if (command < 0)
> +		return command;
> +
> +	if (!(config & PB_FAN_1_RPM)) {
> +		if (command >= 0x8000)
> +			return 2;
> +		else if (command >= 0x2711)
> +			return 0;
> +
> +		return 1;
> +	}
> +
> +	return (command >= 0x8000) ? 2 : 1;
> +}
> +
> +static int max31785_read_word_data(struct i2c_client *client, int page,
> +				   int reg)
> +{
> +	int rv;
> +
> +	switch (reg) {
> +	case PMBUS_VIRT_PWM_1:
> +		rv = max31785_get_pwm(client, page);
> +		if (rv < 0)
> +			return rv;
> +
> +		rv *= 255;
> +		rv /= 100;
> +		break;
> +	case PMBUS_VIRT_PWM_ENABLE_1:
> +		rv = max31785_get_pwm_mode(client, page);
> +		break;

I do wonder ... does it even make sense to specify generic code
for the new virtual attributes in the pmbus core code, or would
it be better to have it all in this driver, at least for now ?

> +	default:
> +		rv = -ENODATA;
> +		break;
> +	}
> +
> +	return rv;
> +}
> +
> +static const int max31785_pwm_modes[] = { 0x7fff, 0x2710, 0xffff };
> +
> +static int max31785_write_word_data(struct i2c_client *client, int page,
> +				    int reg, u16 word)
> +{
> +	switch (reg) {
> +	case PMBUS_VIRT_PWM_ENABLE_1:
> +		if (word >= ARRAY_SIZE(max31785_pwm_modes))
> +			return -EINVAL;
> +
> +		return pmbus_update_fan(client, page, 0, 0, PB_FAN_1_RPM,
> +					max31785_pwm_modes[word]);
> +	default:
> +		break;
> +	}
> +
> +	return -ENODATA;
> +}
> +
>  #define MAX31785_FAN_FUNCS \
> -	(PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12)
> +	(PMBUS_HAVE_FAN12 | PMBUS_HAVE_STATUS_FAN12 | PMBUS_HAVE_PWM12)
>  
>  #define MAX31785_TEMP_FUNCS \
>  	(PMBUS_HAVE_TEMP | PMBUS_HAVE_STATUS_TEMP)
> @@ -32,11 +126,19 @@ enum max31785_regs {
>  static const struct pmbus_driver_info max31785_info = {
>  	.pages = MAX31785_NR_PAGES,
>  
> +	.write_word_data = max31785_write_word_data,
> +	.read_word_data = max31785_read_word_data,
> +
>  	/* RPM */
>  	.format[PSC_FAN] = direct,
>  	.m[PSC_FAN] = 1,
>  	.b[PSC_FAN] = 0,
>  	.R[PSC_FAN] = 0,
> +	/* PWM */
> +	.format[PSC_PWM] = direct,
> +	.m[PSC_PWM] = 1,
> +	.b[PSC_PWM] = 0,
> +	.R[PSC_PWM] = 2,
>  	.func[0] = MAX31785_FAN_FUNCS,
>  	.func[1] = MAX31785_FAN_FUNCS,
>  	.func[2] = MAX31785_FAN_FUNCS,
