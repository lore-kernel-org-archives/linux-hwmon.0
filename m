Return-path: <robherring2@gmail.com>
Date: Mon, 27 Feb 2017 09:57:52 -0600
From: Rob Herring <robh@kernel.org>
To: Marco Franchi <marco.franchi@nxp.com>
Cc: linux@roeck-us.net, devicetree@vger.kernel.org,
	linux-hwmon@vger.kernel.org, marcofrk@gmail.com,
	FoxPeter@kabelbw.de
Subject: Re: [PATCH v4 2/2] hwmon: (sht15) Add device tree support
Message-ID: <20170227155752.b6yshpowa4ioty6a@rob-hp-laptop>
References: <1487247824-10005-1-git-send-email-marco.franchi@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1487247824-10005-1-git-send-email-marco.franchi@nxp.com>
List-ID: <linux-hwmon@vger.kernel.org>

On Thu, Feb 16, 2017 at 10:23:43AM -0200, Marco Franchi wrote:
> Allow the driver to work with device tree support.
> 
> Based on initial patch submission from Peter Fox.
> 
> Tested on a imx7d-sdb board connected to a SHT15 board via Mikro Bus.
> 
> Signed-off-by: Marco Franchi <marco.franchi@nxp.com>
> ---
> Changes since v3:
> -Remove the optional properties because they are not hardware description
> -Change the sensor node name
> 
>  Documentation/devicetree/bindings/hwmon/sht15.txt | 19 +++++++
>  drivers/hwmon/sht15.c                             | 64 +++++++++++++++++++++--
>  2 files changed, 79 insertions(+), 4 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/sht15.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/sht15.txt b/Documentation/devicetree/bindings/hwmon/sht15.txt
> new file mode 100644
> index 0000000..6a80277
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/sht15.txt
> @@ -0,0 +1,19 @@
> +Sensirion SHT15 Humidity and Temperature Sensor
> +
> +Required properties:
> +
> + - "compatible": must be "sensirion,sht15".
> + - "data-gpios": GPIO connected to the data line.
> + - "clk-gpios": GPIO connected to the clock line.

Looks like this device is I2C perhaps? Though I'm not sure the waveforms 
before and after transactions are compliant.

> + - "vcc-supply": regulator that drives the VCC pin.
> +
> +Example:
> +
> +	sensor {
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_sensor>;
> +		compatible = "sensirion,sht15";
> +		clk-gpios = <&gpio4 12 0>;
> +		data-gpios = <&gpio4 13 0>;
> +		vcc-supply = <&reg_sht15>;
> +	};
