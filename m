Return-path: <robherring2@gmail.com>
Date: Wed, 15 Feb 2017 20:32:40 -0600
From: Rob Herring <robh@kernel.org>
To: Marco Franchi <marco.franchi@nxp.com>
Cc: linux@roeck-us.net, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, marcofrk@gmail.com,
	FoxPeter@kabelbw.de
Subject: Re: [PATCH 2/2] hwmon: (sht15) Add DTS support
Message-ID: <20170216023240.okcz6auvirjfihkc@rob-hp-laptop>
References: <1486737041-32014-1-git-send-email-marco.franchi@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1486737041-32014-1-git-send-email-marco.franchi@nxp.com>
List-ID: <linux-hwmon@vger.kernel.org>

On Fri, Feb 10, 2017 at 12:30:41PM -0200, Marco Franchi wrote:
> Allow the driver to work with dts support.
> 
> Based on initial patch submission from Peter Fox.
> 
> Tested on a imx7d-sdb board connected to a SHT15 board via Mikro Bus.
> 
> Signed-off-by: Marco Franchi <marco.franchi@nxp.com>
> ---
>  Documentation/devicetree/bindings/hwmon/sht15.txt | 25 ++++++++
>  drivers/hwmon/sht15.c                             | 69 +++++++++++++++++++++--
>  2 files changed, 90 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/sht15.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/sht15.txt b/Documentation/devicetree/bindings/hwmon/sht15.txt
> new file mode 100644
> index 0000000..6415f52
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/sht15.txt
> @@ -0,0 +1,25 @@
> +Sensirion SHT15 Humidity and Temperature Sensor
> +
> +Required properties:
> +
> + - "compatible": must be "sensirion,sht15".
> + - "data-gpios": GPIO connected to the data line.
> + - "clk-gpios": GPIO connected to the clock line.
> + - "vcc-supply": regulator that drives the VCC pin.
> +
> +Optional properties:
> +
> + - "checksum": boolean property that when present enables the CRC validation of the readings.

Seems more like a user setting than h/w setting?

> + - "no-otp-reload": boolean property that when present indicates not to reload from OTP.
> + - "low-resolution": boolean property that when present indicates that the device operates in
> + 		low-resolution mode.

Same here.

If they stay, these need vendor prefixes.

> +Example:
> +
> +	temp_humid_sensor: sht15 {

sensor {

> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_sensor>;
> +		compatible = "sensirion,sht15";
> +		clk-gpios = <&gpio4 12 0>;
> +		data-gpios = <&gpio4 13 0>;
> +		vcc-supply = <&reg_sht15>;
> +	};
