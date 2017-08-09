Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:39441 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752341AbdHINmB (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 9 Aug 2017 09:42:01 -0400
Date: Wed, 9 Aug 2017 06:41:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Maciej S. Szmigiero" <mail@maciej.szmigiero.name>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel <linux-kernel@vger.kernel.org>
Subject: Re: [v5, 2/2] hwmon: (it87) Reapply probe path chip registers
 settings after resume
Message-ID: <20170809134159.GA18609@roeck-us.net>
References: <6f12e42a-c147-45cb-dea6-cf071773a1c8@maciej.szmigiero.name>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <6f12e42a-c147-45cb-dea6-cf071773a1c8@maciej.szmigiero.name>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Aug 09, 2017 at 12:08:23PM +0200, Maciej S. Szmigiero wrote:
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
> Changes from v2: Code move of common probe / resume steps to new functions
> and actual resume functionality split into two, separate patches.
> 
> Changed message level about VCCH5V being routed to in7 again on resume to
> debug.
> 
> Added a "need_in7_reroute" flag and made VCCH5V to in7 rerouting on resume
> explicitly conditional on it.
> 
> Didn't finally add check for enable_pwm_interface being set before calling
> it87_check_pwm() in the resume function since this variable is it87_probe()
> function local and so adding this check would require adding it to device
> instance structure.
> 
> Changes from v3, v4: Fix patch formatting.
> 
>  drivers/hwmon/it87.c | 84 +++++++++++++++++++++++++++++++++++++++++++++++++---
>  1 file changed, 80 insertions(+), 4 deletions(-)
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 818f123ac475..88f8ad9e2070 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -497,12 +497,14 @@ static const struct it87_devices it87_devices[] = {
>  #define has_vin3_5v(data)	((data)->features & FEAT_VIN3_5V)
>  
>  struct it87_sio_data {
> +	int sioaddr;
>  	enum chips type;
>  	/* Values read from Super-I/O config space */
>  	u8 revision;
>  	u8 vid_value;
>  	u8 beep_pin;
>  	u8 internal;	/* Internal sensors can be labeled */
> +	u8 need_in7_reroute;

Please use bool.

>  	/* Features skipped based on config or DMI */
>  	u16 skip_in;
>  	u8 skip_vid;
> @@ -517,6 +519,7 @@ struct it87_sio_data {
>   */
>  struct it87_data {
>  	const struct attribute_group *groups[7];
> +	int sioaddr;
>  	enum chips type;
>  	u32 features;
>  	u8 peci_mask;
> @@ -532,6 +535,7 @@ struct it87_data {
>  	u16 in_internal;	/* Bitfield, internal sensors (for labels) */
>  	u16 has_in;		/* Bitfield, voltage sensors enabled */
>  	u8 in[NUM_VIN][3];		/* [nr][0]=in, [1]=min, [2]=max */
> +	u8 need_in7_reroute;

Please use bool, and "=true;" in the assignment.

>  	u8 has_fan;		/* Bitfield, fans enabled */
>  	u16 fan[NUM_FAN][2];	/* Register values, [nr][0]=fan, [1]=min */
>  	u8 has_temp;		/* Bitfield, temp sensors enabled */
> @@ -2389,10 +2393,11 @@ static const struct attribute_group it87_group_auto_pwm = {
>  };
>  
>  /* SuperIO detection - will change isa_address if a chip is found */
> -static int __init it87_find(int sioaddr, unsigned short *address,
> +static int __init it87_find(unsigned short *address,
>  			    struct it87_sio_data *sio_data)
>  {
>  	int err;
> +	int sioaddr = sio_data->sioaddr;

Please drop this change, and assign 
	sio_data->sioaddr = address;
in this function after a chip was detected. This minimizes the changes.

>  	u16 chip_type;
>  	const char *board_vendor, *board_name;
>  	const struct it87_devices *config;
> @@ -2575,6 +2580,7 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>  				reg2c |= BIT(1);
>  				superio_outb(sioaddr, IT87_SIO_PINX2_REG,
>  					     reg2c);
> +				sio_data->need_in7_reroute = 1;
>  				pr_notice("Routing internal VCCH5V to in7.\n");
>  			}
>  			pr_notice("in7 routed to internal voltage divider, with external pin disabled.\n");
> @@ -2777,6 +2783,7 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>  		if ((sio_data->type == it8720 || uart6) && !(reg & BIT(1))) {
>  			reg |= BIT(1);
>  			superio_outb(sioaddr, IT87_SIO_PINX2_REG, reg);
> +			sio_data->need_in7_reroute = 1;
>  			pr_notice("Routing internal VCCH5V to in7\n");
>  		}
>  		if (reg & BIT(0))
> @@ -3024,8 +3031,6 @@ static int it87_check_pwm(struct device *dev)
>  				 "PWM configuration is too broken to be fixed\n");
>  		}
>  
> -		dev_info(dev,
> -			 "Detected broken BIOS defaults, disabling PWM interface\n");
>  		return 0;
>  	} else if (fix_pwm_polarity) {
>  		dev_info(dev,
> @@ -3058,6 +3063,7 @@ static int it87_probe(struct platform_device *pdev)
>  		return -ENOMEM;
>  
>  	data->addr = res->start;
> +	data->sioaddr = sio_data->sioaddr;
>  	data->type = sio_data->type;
>  	data->features = it87_devices[sio_data->type].features;
>  	data->peci_mask = it87_devices[sio_data->type].peci_mask;
> @@ -3096,6 +3102,9 @@ static int it87_probe(struct platform_device *pdev)
>  
>  	/* Check PWM configuration */
>  	enable_pwm_interface = it87_check_pwm(dev);
> +	if (!enable_pwm_interface)
> +		dev_info(dev,
> +			 "Detected broken BIOS defaults, disabling PWM interface\n");
>  
>  	/* Starting with IT8721F, we handle scaling of internal voltages */
>  	if (has_12mv_adc(data)) {
> @@ -3123,6 +3132,7 @@ static int it87_probe(struct platform_device *pdev)
>  	}
>  
>  	data->in_internal = sio_data->internal;
> +	data->need_in7_reroute = sio_data->need_in7_reroute;
>  	data->has_in = 0x3ff & ~sio_data->skip_in;
>  
>  	if (has_six_temp(data)) {
> @@ -3178,9 +3188,74 @@ static int it87_probe(struct platform_device *pdev)
>  	return PTR_ERR_OR_ZERO(hwmon_dev);
>  }
>  
> +static int it87_resume_sio(struct platform_device *pdev)
> +{
> +	struct it87_data *data = dev_get_drvdata(&pdev->dev);
> +	int err;
> +	int reg2c;
> +
> +	if (!data->need_in7_reroute)
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
> +		dev_dbg(&pdev->dev,
> +			"Routing internal VCCH5V to in7 again");
> +
> +		reg2c |= BIT(1);
> +		superio_outb(data->sioaddr, IT87_SIO_PINX2_REG,
> +			     reg2c);
> +	}
> +
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
>  static struct platform_driver it87_driver = {
>  	.driver = {
>  		.name	= DRVNAME,
> +		.pm     = &it87_dev_pm_ops,
>  	},
>  	.probe	= it87_probe,
>  };
> @@ -3246,8 +3321,9 @@ static int __init sm_it87_init(void)
>  
>  	for (i = 0; i < ARRAY_SIZE(sioaddr); i++) {
>  		memset(&sio_data, 0, sizeof(struct it87_sio_data));
> +		sio_data.sioaddr = sioaddr[i];
>  		isa_address[i] = 0;
> -		err = it87_find(sioaddr[i], &isa_address[i], &sio_data);
> +		err = it87_find(&isa_address[i], &sio_data);
>  		if (err || isa_address[i] == 0)
>  			continue;
>  		/*
