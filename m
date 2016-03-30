From: Lee Jones <lee.jones@linaro.org>
To: linux-hwmon@vger.kernel.org
Date: Wed, 30 Mar 2016 04:36:13 -0700
Subject: Re: [RFC 1/8] dt-bindings: mfd: Add Altera Arria10 System Resource Chip bindings
In-Reply-To: <1459278791-3646-1-git-send-email-tthayer@opensource.altera.com>
Message-ID: <20160330113532.GI3323@x1>
MIME-Version: 1.0
Content-Type: text/plain
List-ID: <linux-hwmon@vger.kernel.org>

On Tue, 29 Mar 2016, ttha...@opensource.altera.com wrote:

> From: Thor Thayer <ttha...@opensource.altera.com>
> 
> The Altera Arria10 Devkit System Resource chip is a Multi-Function
> Device, it has two subdevices:
>      - GPIO
>      - HWMON
> 
> This patch adds documentation for the Altera A10-SR DT bindings.
> 
> Signed-off-by: Thor Thayer <ttha...@opensource.altera.com>
> ---
>  .../devicetree/bindings/mfd/altera-a10sr.txt       |   35 
> ++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/mfd/altera-a10sr.txt
> 
> diff --git a/Documentation/devicetree/bindings/mfd/altera-a10sr.txt 
> b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
> new file mode 100644
> index 0000000..564c761
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/altera-a10sr.txt
> @@ -0,0 +1,35 @@
> +* Altera Arria10 Development Kit System Resource Chip
> +
> +Required parent device properties:
> +- compatible : "altr,altr_a10sr"
> +- spi-max-frequency : Maximum SPI frequency.
> +- reg : the SPI Chip Select address for the Arria10 System Resource chip

DT bindings are much easier to read in the following format:

- compatible            : "altr,altr_a10sr"
- spi-max-frequency     : Maximum SPI frequency.
- reg                   : the SPI Chip Select address for the Arria10 System 
Resource chip

... also, sentences start with an uppercase char.

> +The A10SR consists of this varied group of sub-devices:
> +
> +Device                   Description
> +------                   ----------
> +altr_a10sr_gpio          GPIO Controller
> +altr_a10sr_hwmon         Hardware Monitor
> +
> +The LEDs are implemented entirely in the device tree using
> +the gpio-led framework.

This is a Linuxisum and should not live in DT bindings.

> +Example:
> +
> +        a10-sr: a10-sr@0 {

Nodes should be named after their device 'type'.

Does this device really start a address 0?

> +             compatible = "altr,altr-a10sr";
> +             reg = <0>;
> +             spi-max-frequency = <100000>;
> +
> +             a10sr_gpio: a10sr_gpio {

Device type only please.

> +                     compatible = "altr,a10sr-gpio";
> +                     gpio-controller;
> +                     #gpio-cells = <2>;
> +                     ngpios = <16>;
> +             };
> +
> +             a10sr_hwmon: a10sr_hwmon {

Device type only please.

> +                     compatible = "altr,a10sr-hwmon";
> +             };
> +     };

-- 
Lee Jones
Linaro STMicroelectronics Landing Team Lead
Linaro.org │ Open source software for ARM SoCs
Follow Linaro: Facebook | Twitter | Blog
--
To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
the body of a message to majord...@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
