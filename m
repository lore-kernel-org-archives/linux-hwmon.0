Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f193.google.com ([209.85.210.193]:32856 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726191AbeI2Azg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 28 Sep 2018 20:55:36 -0400
Received: by mail-pf1-f193.google.com with SMTP id d4-v6so4895093pfn.0
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Sep 2018 11:30:34 -0700 (PDT)
Date: Fri, 28 Sep 2018 11:30:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kun Yi <kunyi@google.com>
Cc: linux-hwmon@vger.kernel.org, rlippert@google.com,
        benjaminfair@google.com, openbmc@lists.ozlabs.org
Subject: Re: [PATCH] hwmon: (adm1275): Add device tree param for shunt
 resistor
Message-ID: <20180928183031.GA24293@roeck-us.net>
References: <20180928174500.18538-1-kunyi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180928174500.18538-1-kunyi@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Sep 28, 2018 at 10:45:00AM -0700, Kun Yi wrote:
> The ADM series of hotswap controllers support extending
> the current measurement range by using a sensing resistor
> value other than the typical 1 mOhm. For example, using a 0.5 mOhm
> sensing resistor doubles the maximal current can be measured.
> 
> Current driver assumes a shunt resistor value of 1 mOhm in calculation,
> meaning for other resistor values, hwmon will report scaled
> current/power measurements. This patch adds a device tree parameter so
> that individual boards can configure its shunt resistor value.
> 
Please copy DT maintainers for all DT changes.

> Signed-off-by: Kun Yi <kunyi@google.com>
> ---
>  .../devicetree/bindings/hwmon/adm1275.txt     | 19 +++++++++++++++++++
>  Documentation/hwmon/adm1275                   |  3 +++
>  drivers/hwmon/pmbus/adm1275.c                 | 15 +++++++++++++--
>  3 files changed, 35 insertions(+), 2 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adm1275.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adm1275.txt b/Documentation/devicetree/bindings/hwmon/adm1275.txt
> new file mode 100644
> index 000000000000..a182fa195ed1
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adm1275.txt
> @@ -0,0 +1,19 @@
> +adm1275 properties
> +
> +Required properties:
> +- compatible: Must be one of the supported compatible strings in
> +  Documentation/hwmon/adm1275

It would be more appropriate to list those here as devicetree properties.
The information in Documentation/hwmon/adm1275 does not include the "adi,"
prefix.

Thanks,
Guenter

> +- reg: I2C address
> +
> +Optional properties:
> +
> +- shunt-resistor-micro-ohms
> +	Shunt resistor value in micro-Ohm
> +
> +Example:
> +
> +adm1272@10 {
> +	compatible = "adi,adm1272";
> +	reg = <0x10>;
> +	shunt-resistor-micro-ohms = <500>;
> +};
> diff --git a/Documentation/hwmon/adm1275 b/Documentation/hwmon/adm1275
> index 39033538eb03..5e277b0d91ce 100644
> --- a/Documentation/hwmon/adm1275
> +++ b/Documentation/hwmon/adm1275
> @@ -58,6 +58,9 @@ The ADM1075, unlike many other PMBus devices, does not support internal voltage
>  or current scaling. Reported voltages, currents, and power are raw measurements,
>  and will typically have to be scaled.
>  
> +The shunt value in micro-ohms can be set via device tree at compile-time. Please
> +refer to the Documentation/devicetree/bindings/hwmon/adm1275.txt for bindings
> +if the device tree is used.
>  
>  Platform data support
>  ---------------------
> diff --git a/drivers/hwmon/pmbus/adm1275.c b/drivers/hwmon/pmbus/adm1275.c
> index 13600fa79e7f..f569372c9204 100644
> --- a/drivers/hwmon/pmbus/adm1275.c
> +++ b/drivers/hwmon/pmbus/adm1275.c
> @@ -373,6 +373,7 @@ static int adm1275_probe(struct i2c_client *client,
>  	const struct coefficients *coefficients;
>  	int vindex = -1, voindex = -1, cindex = -1, pindex = -1;
>  	int tindex = -1;
> +	u32 shunt;
>  
>  	if (!i2c_check_functionality(client->adapter,
>  				     I2C_FUNC_SMBUS_READ_BYTE_DATA
> @@ -421,6 +422,13 @@ static int adm1275_probe(struct i2c_client *client,
>  	if (!data)
>  		return -ENOMEM;
>  
> +	if (of_property_read_u32(client->dev.of_node,
> +				 "shunt-resistor-micro-ohms", &shunt))
> +		shunt = 1000; /* 1 mOhm if not set via DT */
> +
> +	if (shunt == 0)
> +		return -EINVAL;
> +
>  	data->id = mid->driver_data;
>  
>  	info = &data->info;
> @@ -654,12 +662,15 @@ static int adm1275_probe(struct i2c_client *client,
>  		info->R[PSC_VOLTAGE_OUT] = coefficients[voindex].R;
>  	}
>  	if (cindex >= 0) {
> -		info->m[PSC_CURRENT_OUT] = coefficients[cindex].m;
> +		/* Scale current with sense resistor value */
> +		info->m[PSC_CURRENT_OUT] =
> +			coefficients[cindex].m * shunt / 1000;
>  		info->b[PSC_CURRENT_OUT] = coefficients[cindex].b;
>  		info->R[PSC_CURRENT_OUT] = coefficients[cindex].R;
>  	}
>  	if (pindex >= 0) {
> -		info->m[PSC_POWER] = coefficients[pindex].m;
> +		info->m[PSC_POWER] =
> +			coefficients[pindex].m * shunt / 1000;
>  		info->b[PSC_POWER] = coefficients[pindex].b;
>  		info->R[PSC_POWER] = coefficients[pindex].R;
>  	}
> -- 
> 2.19.0.605.g01d371f741-goog
> 
