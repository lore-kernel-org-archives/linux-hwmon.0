Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f68.google.com ([209.85.218.68]:34929 "EHLO
        mail-oi0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752787AbdACPbO (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 3 Jan 2017 10:31:14 -0500
Date: Tue, 3 Jan 2017 09:28:19 -0600
From: Rob Herring <robh@kernel.org>
To: Alexander Koch <mail@alexanderkoch.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>,
        Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>,
        Jiri Kosina <trivial@kernel.org>
Subject: Re: [RFC PATCH v2 1/4] devicetree: hwmon: Add bindings for ADC128D818
Message-ID: <20170103152819.r4ybaxyaqd7aotak@rob-hp-laptop>
References: <20161223221205.8825-1-mail@alexanderkoch.net>
 <20161223221205.8825-2-mail@alexanderkoch.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161223221205.8825-2-mail@alexanderkoch.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Dec 23, 2016 at 11:12:02PM +0100, Alexander Koch wrote:
> Add bindings documentation for the ADC128D818 driver, featuring default I2C
> properties along with the optional 'mode' property for chip operation mode
> selection (see datasheet, sec. 8.4.1).
> 
> Signed-off-by: Alexander Koch <mail@alexanderkoch.net>
> ---
>  .../devicetree/bindings/hwmon/adc128d818.txt       | 39 ++++++++++++++++++++++
>  1 file changed, 39 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adc128d818.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adc128d818.txt b/Documentation/devicetree/bindings/hwmon/adc128d818.txt
> new file mode 100644
> index 000000000000..5e14aa36a696
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adc128d818.txt
> @@ -0,0 +1,39 @@
> +TI ADC128D818 ADC System Monitor With Temperature Sensor
> +--------------------------------------------------------
> +
> +Operation modes:
> +
> + - Mode 0:  7 single-ended voltage readings (IN0-IN6),
> +            1 temperature reading (internal)
> + - Mode 1:  8 single-ended voltage readings (IN0-IN7),
> +            no temperature
> + - Mode 2:  4 pseudo-differential voltage readings
> +              (IN0-IN1, IN3-IN2, IN4-IN5, IN7-IN6),
> +            1 temperature reading (internal)
> + - Mode 3:  4 single-ended voltage readings (IN0-IN3),
> +            2 pseudo-differential voltage readings
> +              (IN4-IN5, IN7-IN6),
> +            1 temperature reading (internal)
> +
> +If no operation mode is configured via device tree, the driver defaults
> +to Mode 0.
> +
> +
> +Required node properties:
> +
> + - compatible:  must be set to "ti,adc128d818"
> + - reg:         I2C address of the device
> +
> +Optional node properties:
> +
> + - mode:        Operation mode (see above).

Needs a vendor prefix.

> +
> +
> +Example (operation mode 2):
> +
> +	adc128d818@1d {
> +		compatible = "ti,adc128d818";
> +		reg = <0x1d>;
> +		mode = /bits/ 8 <2>;

Need to specify above this is an 8-bit value. Or just drop the size 
here as there's little gain to use a byte here.

> +	};
> +
> -- 
> 2.11.0
> 
