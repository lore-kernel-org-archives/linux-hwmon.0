Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:35853 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751571AbdGZCRu (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 25 Jul 2017 22:17:50 -0400
Subject: Re: [PATCH v2] hwmon: (it87) Reapply probe path chip registers
 settings after resume
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>,
        Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <ff384622-ed3d-836f-c18e-5b962103634f@maciej.szmigiero.name>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <e359e68b-213a-dc55-192c-0f7daae60462@roeck-us.net>
Date: Tue, 25 Jul 2017 19:17:47 -0700
MIME-Version: 1.0
In-Reply-To: <ff384622-ed3d-836f-c18e-5b962103634f@maciej.szmigiero.name>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/24/2017 12:37 PM, Maciej S. Szmigiero wrote:
> After a suspend / resume cycle we possibly need to reapply chip registers
> settings that we had set or fixed in a probe path, since they might have
> been reset to default values or set incorrectly by a BIOS again.
> 
> Tested on a Gigabyte M720-US3 board, which requires routing internal VCCH5V
> to in7 (and had it wrong again on resume from S3).
> 
> Signed-off-by: Maciej S. Szmigiero <mail@maciej.szmigiero.name>
> ---
> Changes from v1: Move code of common probe / resume steps to new functions
> so we don't need to make large parts of probe function conditional on a
> newly added 'resume' parameter.
> 

Much better. Please split cleanup and pm functionality addition into two patches
to simplify review. More comments inline.

>   drivers/hwmon/it87.c | 214 +++++++++++++++++++++++++++++++++++++++------------
>   1 file changed, 163 insertions(+), 51 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 4dfc7238313e..b565e29c405c 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -497,6 +497,7 @@ static const struct it87_devices it87_devices[] = {
>   #define has_vin3_5v(data)	((data)->features & FEAT_VIN3_5V)
>   
>   struct it87_sio_data {
> +	int sioaddr;
>   	enum chips type;
>   	/* Values read from Super-I/O config space */
>   	u8 revision;
> @@ -517,6 +518,7 @@ struct it87_sio_data {
>    */
>   struct it87_data {
>   	const struct attribute_group *groups[7];
> +	int sioaddr;
>   	enum chips type;
>   	u32 features;
>   	u8 peci_mask;
> @@ -2389,10 +2391,11 @@ static const struct attribute_group it87_group_auto_pwm = {
>   };
>   
>   /* SuperIO detection - will change isa_address if a chip is found */
> -static int __init it87_find(int sioaddr, unsigned short *address,
> +static int __init it87_find(unsigned short *address,
>   			    struct it87_sio_data *sio_data)
>   {
>   	int err;
> +	int sioaddr = sio_data->sioaddr;
>   	u16 chip_type;
>   	const char *board_vendor, *board_name;
>   	const struct it87_devices *config;
> @@ -2828,13 +2831,89 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>   	return err;
>   }
>   
> +/*
> + * Some chips seem to have default value 0xff for all limit
> + * registers. For low voltage limits it makes no sense and triggers
> + * alarms, so change to 0 instead. For high temperature limits, it
> + * means -1 degree C, which surprisingly doesn't trigger an alarm,
> + * but is still confusing, so change to 127 degrees C.
> + */
> +static void it87_check_limit_regs(struct it87_data *data)
> +{
> +	int i, reg;
> +
> +	for (i = 0; i < NUM_VIN_LIMIT; i++) {
> +		reg = it87_read_value(data, IT87_REG_VIN_MIN(i));
> +		if (reg == 0xff)
> +			it87_write_value(data, IT87_REG_VIN_MIN(i), 0);
> +	}
> +	for (i = 0; i < NUM_TEMP_LIMIT; i++) {
> +		reg = it87_read_value(data, IT87_REG_TEMP_HIGH(i));
> +		if (reg == 0xff)
> +			it87_write_value(data, IT87_REG_TEMP_HIGH(i), 127);
> +	}
> +}
> +
> +/* Check if voltage monitors are reset manually or by some reason */
> +static void it87_check_voltage_monitors_reset(struct it87_data *data)
> +{
> +	int reg;
> +
> +	reg = it87_read_value(data, IT87_REG_VIN_ENABLE);
> +	if ((reg & 0xff) == 0) {
> +		/* Enable all voltage monitors */
> +		it87_write_value(data, IT87_REG_VIN_ENABLE, 0xff);
> +	}
> +}
> +
> +/* Check if tachometers are reset manually or by some reason */
> +static void it87_check_tachometers_reset(struct platform_device *pdev)
> +{
> +	struct it87_sio_data *sio_data = dev_get_platdata(&pdev->dev);
> +	struct it87_data *data = platform_get_drvdata(pdev);
> +	u8 mask, fan_main_ctrl;
> +
> +	mask = 0x70 & ~(sio_data->skip_fan << 4);
> +	fan_main_ctrl = it87_read_value(data, IT87_REG_FAN_MAIN_CTRL);
> +	if ((fan_main_ctrl & mask) == 0) {
> +		/* Enable all fan tachometers */
> +		fan_main_ctrl |= mask;
> +		it87_write_value(data, IT87_REG_FAN_MAIN_CTRL,
> +				 fan_main_ctrl);
> +	}
> +}
> +
> +/* Set tachometers to 16-bit mode if needed */
> +static void it87_check_tachometers_16bit_mode(struct platform_device *pdev)
> +{
> +	struct it87_data *data = platform_get_drvdata(pdev);
> +	int reg;
> +
> +	if (!has_fan16_config(data))
> +		return;
> +
> +	reg = it87_read_value(data, IT87_REG_FAN_16BIT);
> +	if (~reg & 0x07 & data->has_fan) {
> +		dev_dbg(&pdev->dev,
> +			"Setting fan1-3 to 16-bit mode\n");
> +		it87_write_value(data, IT87_REG_FAN_16BIT,
> +				 reg | 0x07);
> +	}
> +}
> +
> +static void it87_start_monitoring(struct it87_data *data)
> +{
> +	it87_write_value(data, IT87_REG_CONFIG,
> +			 (it87_read_value(data, IT87_REG_CONFIG) & 0x3e)
> +			 | (update_vbat ? 0x41 : 0x01));
> +}
> +
>   /* Called when we have found a new IT87. */
>   static void it87_init_device(struct platform_device *pdev)
>   {
>   	struct it87_sio_data *sio_data = dev_get_platdata(&pdev->dev);
>   	struct it87_data *data = platform_get_drvdata(pdev);
>   	int tmp, i;
> -	u8 mask;
>   
>   	/*
>   	 * For each PWM channel:
> @@ -2855,23 +2934,7 @@ static void it87_init_device(struct platform_device *pdev)
>   		data->auto_pwm[i][3] = 0x7f;	/* Full speed, hard-coded */
>   	}
>   
> -	/*
> -	 * Some chips seem to have default value 0xff for all limit
> -	 * registers. For low voltage limits it makes no sense and triggers
> -	 * alarms, so change to 0 instead. For high temperature limits, it
> -	 * means -1 degree C, which surprisingly doesn't trigger an alarm,
> -	 * but is still confusing, so change to 127 degrees C.
> -	 */
> -	for (i = 0; i < NUM_VIN_LIMIT; i++) {
> -		tmp = it87_read_value(data, IT87_REG_VIN_MIN(i));
> -		if (tmp == 0xff)
> -			it87_write_value(data, IT87_REG_VIN_MIN(i), 0);
> -	}
> -	for (i = 0; i < NUM_TEMP_LIMIT; i++) {
> -		tmp = it87_read_value(data, IT87_REG_TEMP_HIGH(i));
> -		if (tmp == 0xff)
> -			it87_write_value(data, IT87_REG_TEMP_HIGH(i), 127);
> -	}
> +	it87_check_limit_regs(data);
>   
>   	/*
>   	 * Temperature channels are not forcibly enabled, as they can be
> @@ -2880,38 +2943,19 @@ static void it87_init_device(struct platform_device *pdev)
>   	 * run-time through the temp{1-3}_type sysfs accessors if needed.
>   	 */
>   
> -	/* Check if voltage monitors are reset manually or by some reason */
> -	tmp = it87_read_value(data, IT87_REG_VIN_ENABLE);
> -	if ((tmp & 0xff) == 0) {
> -		/* Enable all voltage monitors */
> -		it87_write_value(data, IT87_REG_VIN_ENABLE, 0xff);
> -	}
> +	it87_check_voltage_monitors_reset(data);
> +
> +	it87_check_tachometers_reset(pdev);
>   
> -	/* Check if tachometers are reset manually or by some reason */
> -	mask = 0x70 & ~(sio_data->skip_fan << 4);
>   	data->fan_main_ctrl = it87_read_value(data, IT87_REG_FAN_MAIN_CTRL);
> -	if ((data->fan_main_ctrl & mask) == 0) {
> -		/* Enable all fan tachometers */
> -		data->fan_main_ctrl |= mask;
> -		it87_write_value(data, IT87_REG_FAN_MAIN_CTRL,
> -				 data->fan_main_ctrl);
> -	}
>   	data->has_fan = (data->fan_main_ctrl >> 4) & 0x07;
>   
> -	tmp = it87_read_value(data, IT87_REG_FAN_16BIT);
> -
> -	/* Set tachometers to 16-bit mode if needed */
> -	if (has_fan16_config(data)) {
> -		if (~tmp & 0x07 & data->has_fan) {
> -			dev_dbg(&pdev->dev,
> -				"Setting fan1-3 to 16-bit mode\n");
> -			it87_write_value(data, IT87_REG_FAN_16BIT,
> -					 tmp | 0x07);
> -		}
> -	}
> +	it87_check_tachometers_16bit_mode(pdev);
>   
>   	/* Check for additional fans */
>   	if (has_five_fans(data)) {
> +		tmp = it87_read_value(data, IT87_REG_FAN_16BIT);
> +
>   		if (tmp & BIT(4))
>   			data->has_fan |= BIT(3); /* fan4 enabled */
>   		if (tmp & BIT(5))
> @@ -2933,10 +2977,7 @@ static void it87_init_device(struct platform_device *pdev)
>   			sio_data->skip_pwm |= BIT(5);
>   	}
>   
> -	/* Start monitoring */
> -	it87_write_value(data, IT87_REG_CONFIG,
> -			 (it87_read_value(data, IT87_REG_CONFIG) & 0x3e)
> -			 | (update_vbat ? 0x41 : 0x01));
> +	it87_start_monitoring(data);
>   }
>   
>   /* Return 1 if and only if the PWM interface is safe to use */
> @@ -2986,8 +3027,6 @@ static int it87_check_pwm(struct device *dev)
>   				 "PWM configuration is too broken to be fixed\n");
>   		}
>   
> -		dev_info(dev,
> -			 "Detected broken BIOS defaults, disabling PWM interface\n");

I don't think this is a good idea. Besides, it only removes one message.

I would suggest to check for enable_pwm_interface in the resume function.
If it is not set, don't bother calling it87_check_pwm() again.

>   		return 0;
>   	} else if (fix_pwm_polarity) {
>   		dev_info(dev,
> @@ -3020,6 +3059,7 @@ static int it87_probe(struct platform_device *pdev)
>   		return -ENOMEM;
>   
>   	data->addr = res->start;
> +	data->sioaddr = sio_data->sioaddr;
>   	data->type = sio_data->type;
>   	data->features = it87_devices[sio_data->type].features;
>   	data->peci_mask = it87_devices[sio_data->type].peci_mask;
> @@ -3058,6 +3098,9 @@ static int it87_probe(struct platform_device *pdev)
>   
>   	/* Check PWM configuration */
>   	enable_pwm_interface = it87_check_pwm(dev);
> +	if (!enable_pwm_interface)
> +		dev_info(dev,
> +			 "Detected broken BIOS defaults, disabling PWM interface\n");
>   
>   	/* Starting with IT8721F, we handle scaling of internal voltages */
>   	if (has_12mv_adc(data)) {
> @@ -3140,9 +3183,77 @@ static int it87_probe(struct platform_device *pdev)
>   	return PTR_ERR_OR_ZERO(hwmon_dev);
>   }
>   
> +static int it87_resume_sio(struct platform_device *pdev)
> +{
> +	struct it87_data *data = dev_get_drvdata(&pdev->dev);
> +	int err;
> +	int reg2c;
> +
> +	if (!(data->in_internal & BIT(1)))
> +		return 0;
> +
> +	if (has_in7_internal(data))
> +		return 0;
> +
> +	err = superio_enter(data->sioaddr);
> +	if (err)
> +		return err;
> +
> +	superio_select(data->sioaddr, GPIO);
> +
> +	reg2c = superio_inb(data->sioaddr, IT87_SIO_PINX2_REG);
> +	if (!(reg2c & BIT(1))) {
> +		dev_notice(&pdev->dev,
> +			   "Routing internal VCCH5V to in7 again");
> +
I don't think this message provides any real value. Besides, it isn't
always VCCH5V.

> +		reg2c |= BIT(1);
> +		superio_outb(data->sioaddr, IT87_SIO_PINX2_REG,
> +			     reg2c);
> +	}
> +

Problem with this code is that it applies to _all_ chips.
The original code only applied to it8783 (this message), and
only if bit 2 of register 0x27 was set, or to it8720 and it8782
under certain conditions (though there the message is about VCCH).

I understand you try to cover that condition with the checks above,
but there is no guarantee that this works for all chips (and that
it will continue to work going forward as new chips are added).

Please consider adding a flag such as "need_in7_reroute" instead.
That would simplify the checks here and make it more explicit.

> +	superio_exit(data->sioaddr);
> +
> +	return 0;
> +}
> +
> +static int __maybe_unused it87_resume(struct device *dev)
> +{
> +	struct platform_device *pdev = to_platform_device(dev);
> +	struct it87_data *data = dev_get_drvdata(dev);
> +	int err;
> +
> +	err = it87_resume_sio(pdev);
> +	if (err)
> +		dev_err(dev,
> +			"Unable to resume Super I/O (%d)",
> +			err);
> +
> +	mutex_lock(&data->update_lock);
> +
> +	it87_check_pwm(dev);
> +	it87_check_limit_regs(data);
> +	it87_check_voltage_monitors_reset(data);
> +	it87_check_tachometers_reset(pdev);
> +	it87_check_tachometers_16bit_mode(pdev);
> +
> +	it87_start_monitoring(data);
> +
> +	/* force update */
> +	data->valid = 0;
> +
> +	mutex_unlock(&data->update_lock);
> +
> +	it87_update_device(dev);
> +
> +	return 0;
> +}
> +
> +static SIMPLE_DEV_PM_OPS(it87_dev_pm_ops, NULL, it87_resume);
> +
>   static struct platform_driver it87_driver = {
>   	.driver = {
>   		.name	= DRVNAME,
> +		.pm     = &it87_dev_pm_ops,
>   	},
>   	.probe	= it87_probe,
>   };
> @@ -3208,8 +3319,9 @@ static int __init sm_it87_init(void)
>   
>   	for (i = 0; i < ARRAY_SIZE(sioaddr); i++) {
>   		memset(&sio_data, 0, sizeof(struct it87_sio_data));
> +		sio_data.sioaddr = sioaddr[i];
>   		isa_address[i] = 0;
> -		err = it87_find(sioaddr[i], &isa_address[i], &sio_data);
> +		err = it87_find(&isa_address[i], &sio_data);
>   		if (err || isa_address[i] == 0)
>   			continue;
>   		/*
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 

