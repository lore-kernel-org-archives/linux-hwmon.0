Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:48955 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751125AbdFBNKc (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 2 Jun 2017 09:10:32 -0400
Date: Fri, 2 Jun 2017 06:10:29 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Patrick Venture <venture@google.com>
Cc: joel@jms.id.au, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [v2] hwmon: (aspeed-pwm-tacho) Enable both edge measurement.
Message-ID: <20170602131029.GA12130@roeck-us.net>
References: <20170601142533.164496-1-venture@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170601142533.164496-1-venture@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Jun 01, 2017 at 07:25:33AM -0700, Patrick Venture wrote:
> The aspeed-pwm-tacho controller supports measuring the fan tach by using
> leading, falling, or both edges.  This change allows the driver to
> support either of the three configurations and will appropriately modify
> the returned tach data.
> 
> If the controller is measuring with both edges it can return a value more
> quickly to the requestor.  This version of the driver should still take ~1s
> to return with an RPM value per fan, however, it can be tuned faster with
> double edge counting enabled than without.
> 
> I tested this and found the number returned matched what I expected.
> 
> Signed-off-by: Patrick Venture <venture@google.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/aspeed-pwm-tacho.c | 24 +++++++++++++++++++++---
>  1 file changed, 21 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index 48403a2115be..f288928b5e8a 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -145,11 +145,20 @@
>  
>  #define PWM_MAX 255
>  
> +#define BOTH_EDGES 0x02 /* 10b */
> +
>  #define M_PWM_DIV_H 0x00
>  #define M_PWM_DIV_L 0x05
>  #define M_PWM_PERIOD 0x5F
>  #define M_TACH_CLK_DIV 0x00
> -#define M_TACH_MODE 0x00
> +/*
> + * 5:4 Type N fan tach mode selection bit:
> + * 00: falling
> + * 01: rising
> + * 10: both
> + * 11: reserved.
> + */
> +#define M_TACH_MODE 0x02 /* 10b */
>  #define M_TACH_UNIT 0x1000
>  #define INIT_FAN_CTRL 0xFF
>  
> @@ -162,6 +171,7 @@ struct aspeed_pwm_tacho_data {
>  	u8 type_pwm_clock_division_h[3];
>  	u8 type_pwm_clock_division_l[3];
>  	u8 type_fan_tach_clock_division[3];
> +	u8 type_fan_tach_mode[3];
>  	u16 type_fan_tach_unit[3];
>  	u8 pwm_port_type[8];
>  	u8 pwm_port_fan_ctrl[8];
> @@ -498,7 +508,7 @@ static u32 aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
>  				      u8 fan_tach_ch)
>  {
>  	u32 raw_data, tach_div, clk_source, sec, val;
> -	u8 fan_tach_ch_source, type;
> +	u8 fan_tach_ch_source, type, mode, both;
>  
>  	regmap_write(priv->regmap, ASPEED_PTCR_TRIGGER, 0);
>  	regmap_write(priv->regmap, ASPEED_PTCR_TRIGGER, 0x1 << fan_tach_ch);
> @@ -512,7 +522,14 @@ static u32 aspeed_get_fan_tach_ch_rpm(struct aspeed_pwm_tacho_data *priv,
>  	regmap_read(priv->regmap, ASPEED_PTCR_RESULT, &val);
>  	raw_data = val & RESULT_VALUE_MASK;
>  	tach_div = priv->type_fan_tach_clock_division[type];
> -	tach_div = 0x4 << (tach_div * 2);
> +	/*
> +	 * We need the mode to determine if the raw_data is double (from
> +	 * counting both edges).
> +	 */
> +	mode = priv->type_fan_tach_mode[type];
> +	both = (mode & BOTH_EDGES) ? 1 : 0;
> +
> +	tach_div = (0x4 << both) << (tach_div * 2);
>  	clk_source = priv->clk_freq;
>  
>  	if (raw_data == 0)
> @@ -696,6 +713,7 @@ static void aspeed_create_type(struct aspeed_pwm_tacho_data *priv)
>  	aspeed_set_tacho_type_enable(priv->regmap, TYPEM, true);
>  	priv->type_fan_tach_clock_division[TYPEM] = M_TACH_CLK_DIV;
>  	priv->type_fan_tach_unit[TYPEM] = M_TACH_UNIT;
> +	priv->type_fan_tach_mode[TYPEM] = M_TACH_MODE;
>  	aspeed_set_tacho_type_values(priv->regmap, TYPEM, M_TACH_MODE,
>  				     M_TACH_UNIT, M_TACH_CLK_DIV);
>  }
