Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:43853 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751390AbdLCS6h (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 3 Dec 2017 13:58:37 -0500
Date: Sun, 3 Dec 2017 10:58:34 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Joel <joel@jms.id.au>
Cc: Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <philipp.zabel@gmail.com>,
        Mykola Kostenok <c_mykolak@mellanox.com>,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        Patrick Venture <venture@google.com>,
        Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v2,2/3] hwmon: (aspeed-pwm-tacho) Deassert reset in probe
Message-ID: <20171203185834.GA6772@roeck-us.net>
References: <20171102035349.1902-3-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171102035349.1902-3-joel@jms.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Nov 02, 2017 at 02:53:48PM +1100, Joel wrote:
> The ASPEED SoC must deassert a reset in order to use the PWM/tach
> peripheral.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

I have not heard from anyone objecting to this change, so I am going to
accept it. See below for a list of changes required to get there.

> ---
> v2:
>  - Correct horrible mistakes
>  - Boot tested and hwmon sysfs files checked
> ---
>  drivers/hwmon/aspeed-pwm-tacho.c | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
> 
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index 63a95e23ca81..77bb7a4bbed4 100644
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
> @@ -931,6 +933,15 @@ static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
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
>  	regmap_write(priv->regmap, ASPEED_PTCR_TACH_SOURCE, 0);
>  	regmap_write(priv->regmap, ASPEED_PTCR_TACH_SOURCE_EXT, 0);
>  
> @@ -960,6 +971,15 @@ static int aspeed_pwm_tacho_probe(struct platform_device *pdev)
>  	return PTR_ERR_OR_ZERO(hwmon);
>  }
>  
> +static int aspeed_pwm_tacho_remove(struct platform_device *pdev)
> +{
> +	struct aspeed_pwm_tacho_data *priv = platform_get_drvdata(pdev);
> +
> +	reset_control_assert(priv->rst);

This asserts reset before the hwmon device is removed. Please use
devm_add_action_or_reset() after reset_control_deassert() to avoid
this problem.

> +
> +	return 0;
> +}
> +
>  static const struct of_device_id of_pwm_tacho_match_table[] = {
>  	{ .compatible = "aspeed,ast2400-pwm-tacho", },
>  	{ .compatible = "aspeed,ast2500-pwm-tacho", },
> @@ -969,6 +989,7 @@ MODULE_DEVICE_TABLE(of, of_pwm_tacho_match_table);
>  
>  static struct platform_driver aspeed_pwm_tacho_driver = {
>  	.probe		= aspeed_pwm_tacho_probe,
> +	.remove 	= aspeed_pwm_tacho_remove,

... and by doing that you won't need the remove function, and you don't
have to fix the checkpatch error here.

>  	.driver		= {
>  		.name	= "aspeed_pwm_tacho",
>  		.of_match_table = of_pwm_tacho_match_table,
