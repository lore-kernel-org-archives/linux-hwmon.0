Return-path: <robherring2@gmail.com>
Date: Wed, 26 Oct 2016 16:12:57 -0500
From: Rob Herring <robh@kernel.org>
To: Clemens Gruber <clemens.gruber@pqgruber.com>
Cc: linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon: (mcp3021) add devicetree bindings
 documentation
Message-ID: <20161026211257.eu3lspzhkeaf56ms@rob-hp-laptop>
References: <20161019094056.24508-1-clemens.gruber@pqgruber.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161019094056.24508-1-clemens.gruber@pqgruber.com>
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, Oct 19, 2016 at 11:40:56AM +0200, Clemens Gruber wrote:
> Documents the devicetree bindings for the Microchip MCP3021/3221.
> 
> Signed-off-by: Clemens Gruber <clemens.gruber@pqgruber.com>
> ---
>  Documentation/devicetree/bindings/hwmon/mcp3021.txt | 21 +++++++++++++++++++++
>  1 file changed, 21 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/mcp3021.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/mcp3021.txt b/Documentation/devicetree/bindings/hwmon/mcp3021.txt
> new file mode 100644
> index 0000000..e1d1e62
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/mcp3021.txt
> @@ -0,0 +1,21 @@
> +mcp3021 properties
> +
> +Required properties:
> +- compatible: Must be one of the following:
> +	- "microchip,mcp3021" for mcp3021
> +	- "microchip,mcp3221" for mcp3221
> +- reg: I2C address
> +
> +Optional properties:
> +
> +- reference-voltage
> +	Reference voltage in millivolt (mV)

What I said on the first version.

> +
> +Example:
> +
> +mcp3021@4d {
> +	compatible = "microchip,mcp3021";
> +	reg = <0x4d>;
> +
> +	reference-voltage = <4500>; /* 4.5 V */
> +};
> -- 
> 2.10.0
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
