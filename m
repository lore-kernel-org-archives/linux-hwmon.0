Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:40807 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750888AbdAUUZ0 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 21 Jan 2017 15:25:26 -0500
Subject: Re: [PATCH 2/2] hwmon: (lm70) Add support for TI TMP122/124
To: Florian Fainelli <f.fainelli@gmail.com>,
        linux-kernel@vger.kernel.org
References: <20170121192010.30681-1-f.fainelli@gmail.com>
 <20170121192010.30681-3-f.fainelli@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Jonathan Corbet <corbet@lwn.net>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        "open list:HARDWARE MONITORING" <linux-hwmon@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <8ada15e2-2b99-02c3-e731-c469a3d6c3bf@roeck-us.net>
Date: Sat, 21 Jan 2017 12:25:21 -0800
MIME-Version: 1.0
In-Reply-To: <20170121192010.30681-3-f.fainelli@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 01/21/2017 11:20 AM, Florian Fainelli wrote:
> Add support for Texas Instruments TMP122/124 which are nearly identical to
> their TMP121/123 except that they also support programmable temperature
> thresholds.
>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

Applied to -next.

Any plans to add support for the thresholds ?

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/hwmon/lm70.txt | 1 +
>  Documentation/hwmon/lm70                         | 8 ++++++--
>  drivers/hwmon/lm70.c                             | 9 ++++++++-
>  3 files changed, 15 insertions(+), 3 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/hwmon/lm70.txt b/Documentation/devicetree/bindings/hwmon/lm70.txt
> index e7fd921aa4f1..ea417a0d32af 100644
> --- a/Documentation/devicetree/bindings/hwmon/lm70.txt
> +++ b/Documentation/devicetree/bindings/hwmon/lm70.txt
> @@ -4,6 +4,7 @@ Required properties:
>  - compatible: one of
>  		"ti,lm70"
>  		"ti,tmp121"
> +		"ti,tmp122"
>  		"ti,lm71"
>  		"ti,lm74"
>
> diff --git a/Documentation/hwmon/lm70 b/Documentation/hwmon/lm70
> index 1bb2db440671..c3a1f2ea017d 100644
> --- a/Documentation/hwmon/lm70
> +++ b/Documentation/hwmon/lm70
> @@ -6,6 +6,8 @@ Supported chips:
>      Datasheet: http://www.national.com/pf/LM/LM70.html
>    * Texas Instruments TMP121/TMP123
>      Information: http://focus.ti.com/docs/prod/folders/print/tmp121.html
> +  * Texas Instruments TMP122/TMP124
> +    Information: http://www.ti.com/product/tmp122
>    * National Semiconductor LM71
>      Datasheet: http://www.ti.com/product/LM71
>    * National Semiconductor LM74
> @@ -35,8 +37,10 @@ As a real (in-tree) example of this "SPI protocol driver" interfacing
>  with a "SPI master controller driver", see drivers/spi/spi_lm70llp.c
>  and its associated documentation.
>
> -The LM74 and TMP121/TMP123 are very similar; main difference is 13-bit
> -temperature data (0.0625 degrees celsius resolution).
> +The LM74 and TMP121/TMP122/TMP123/TMP124 are very similar; main difference is
> +13-bit temperature data (0.0625 degrees celsius resolution).
> +
> +The TMP122/TMP124 also feature configurable temperature thresholds.
>
>  The LM71 is also very similar; main difference is 14-bit temperature
>  data (0.03125 degrees celsius resolution).
> diff --git a/drivers/hwmon/lm70.c b/drivers/hwmon/lm70.c
> index 52c5cdd00448..543556dc563b 100644
> --- a/drivers/hwmon/lm70.c
> +++ b/drivers/hwmon/lm70.c
> @@ -46,6 +46,7 @@
>  #define LM70_CHIP_TMP121	1	/* TI TMP121/TMP123 */
>  #define LM70_CHIP_LM71		2	/* NS LM71 */
>  #define LM70_CHIP_LM74		3	/* NS LM74 */
> +#define LM70_CHIP_TMP122	4	/* TI TMP122/TMP124 */
>
>  struct lm70 {
>  	struct spi_device *spi;
> @@ -92,7 +93,7 @@ static ssize_t temp1_input_show(struct device *dev,
>  	 * Celsius.
>  	 * So it's equivalent to multiplying by 0.25 * 1000 = 250.
>  	 *
> -	 * LM74 and TMP121/TMP123:
> +	 * LM74 and TMP121/TMP122/TMP123/TMP124:
>  	 * 13 bits of 2's complement data, discard LSB 3 bits,
>  	 * resolution 0.0625 degrees celsius.
>  	 *
> @@ -106,6 +107,7 @@ static ssize_t temp1_input_show(struct device *dev,
>  		break;
>
>  	case LM70_CHIP_TMP121:
> +	case LM70_CHIP_TMP122:
>  	case LM70_CHIP_LM74:
>  		val = ((int)raw / 8) * 625 / 10;
>  		break;
> @@ -143,6 +145,10 @@ static const struct of_device_id lm70_of_ids[] = {
>  		.data = (void *) LM70_CHIP_TMP121,
>  	},
>  	{
> +		.compatible = "ti,tmp122",
> +		.data = (void *) LM70_CHIP_TMP122,
> +	},
> +	{
>  		.compatible = "ti,lm71",
>  		.data = (void *) LM70_CHIP_LM71,
>  	},
> @@ -191,6 +197,7 @@ static int lm70_probe(struct spi_device *spi)
>  static const struct spi_device_id lm70_ids[] = {
>  	{ "lm70",   LM70_CHIP_LM70 },
>  	{ "tmp121", LM70_CHIP_TMP121 },
> +	{ "tmp122", LM70_CHIP_TMP122 },
>  	{ "lm71",   LM70_CHIP_LM71 },
>  	{ "lm74",   LM70_CHIP_LM74 },
>  	{ },
>

