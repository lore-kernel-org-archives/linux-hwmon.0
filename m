Return-path: <robherring2@gmail.com>
Date: Wed, 26 Oct 2016 16:06:44 -0500
From: Rob Herring <robh@kernel.org>
To: Clemens Gruber <clemens.gruber@pqgruber.com>
Cc: linux-hwmon@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>,
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] mcp3021: rework for DT support of reference-voltage
Message-ID: <20161026210644.h72oirfgjmea5wxx@rob-hp-laptop>
References: <20161018224444.11225-1-clemens.gruber@pqgruber.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161018224444.11225-1-clemens.gruber@pqgruber.com>
List-ID: <linux-hwmon@vger.kernel.org>

On Wed, Oct 19, 2016 at 12:44:44AM +0200, Clemens Gruber wrote:
> Support setting the reference voltage in the device tree.
> Rework of driver structure, put chip specific data in a separate
> structure and assign it depending on device id from platform data or
> DT match.
> Extend the device documentation and add new documentation for the
> devicetree bindings.
> Also change S_IRUGO to the better readable 0444, which fixes a
> checkpatch warning.

"Also" is a keyword for put in a separate commit.

> 
> Signed-off-by: Clemens Gruber <clemens.gruber@pqgruber.com>
> ---
>  .../devicetree/bindings/hwmon/mcp3021.txt          |  21 +++
>  Documentation/hwmon/mcp3021                        |   5 +
>  drivers/hwmon/mcp3021.c                            | 184 ++++++++++++++-------
>  3 files changed, 149 insertions(+), 61 deletions(-)
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

Unit suffix in the property name please. The defined unit for DT is 
'-microvolt'.

> +
> +Example:
> +
> +mcp3021@4d {
> +	compatible = "microchip,mcp3021";
> +	reg = <0x4d>;
> +
> +	reference-voltage = <4500>; /* 4.5 V */
> +};
