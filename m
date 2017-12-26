Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:39095 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751107AbdLZRYp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 26 Dec 2017 12:24:45 -0500
Date: Tue, 26 Dec 2017 09:24:44 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Joel <joel@jms.id.au>
Cc: Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <philipp.zabel@gmail.com>,
        Mykola Kostenok <c_mykolak@mellanox.com>,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        Patrick Venture <venture@google.com>,
        Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v3,2/2] hwmon: (aspeed-pwm-tacho) Deassert reset in probe
Message-ID: <20171226172444.GA22827@roeck-us.net>
References: <20171223130528.5346-3-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171223130528.5346-3-joel@jms.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sat, Dec 23, 2017 at 11:35:28PM +1030, Joel wrote:
> The ASPEED SoC must deassert a reset in order to use the PWM/tach
> peripheral.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/aspeed-pwm-tacho.c | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
> 
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index 63a95e23ca81..693a3d53cab5 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -19,6 +19,7 @@
>  #include <linux/of_platform.h>
>  #include <linux/platform_device.h>
>  #include <linux/regmap.h>
> +#include <linux/reset.h>
>  #include <linux/sysfs.h>
>  #include <linux/thermal.h>
>  
> @@ -181,6 +182,7 @@ struct aspeed_cooling_device {
>  
>  struct aspeed_pwm_tacho_data {
>  	struct regmap *regmap;
> +	struct reset_control *rst;
>  	unsigned long clk_freq;
>  	bool pwm_present[8];
>  	bool fan_tach_present[16];
> @@ -905,6 +907,13 @@ static int aspeed_create_fan(struct device *dev,
>  	return 0;
>  }
>  
> +static void aspeed_pwm_tacho_remove(void *data)
> +{
> +	struct aspeed_pwm_tacho_data *priv = data;
> +
> +	reset_control_assert(priv->rst);
> +}
> +
>  static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
>  {
>  	struct device *dev = &pdev->dev;
> @@ -931,6 +940,19 @@ static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
>  			&aspeed_pwm_tacho_regmap_config);
>  	if (IS_ERR(priv->regmap))
>  		return PTR_ERR(priv->regmap);
> +
> +	priv->rst = devm_reset_control_get_exclusive(dev, NULL);
> +	if (IS_ERR(priv->rst)) {
> +		dev_err(dev,
> +			"missing or invalid reset controller device tree entry");
> +		return PTR_ERR(priv->rst);
> +	}
> +	reset_control_deassert(priv->rst);
> +
> +	ret = devm_add_action_or_reset(dev, aspeed_pwm_tacho_remove, priv);
> +	if (ret)
> +		return ret;
> +
>  	regmap_write(priv->regmap, ASPEED_PTCR_TACH_SOURCE, 0);
>  	regmap_write(priv->regmap, ASPEED_PTCR_TACH_SOURCE_EXT, 0);
>  
