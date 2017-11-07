Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:52173 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752721AbdKGB1N (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 6 Nov 2017 20:27:13 -0500
Date: Mon, 6 Nov 2017 17:27:11 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Jeffery <andrew@aj.id.au>
Cc: linux-hwmon@vger.kernel.org, robh+dt@kernel.org,
        mark.rutland@arm.com, jdelvare@suse.com, corbet@lwn.net,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, joel@jms.id.au, openbmc@lists.ozlabs.org
Subject: Re: [v4,1/6] dt-bindings: pmbus: Add Maxim MAX31785 documentation
Message-ID: <20171107012711.GA13616@roeck-us.net>
References: <20171103045306.26448-2-andrew@aj.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171103045306.26448-2-andrew@aj.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Nov 03, 2017 at 03:53:01PM +1100, Andrew Jeffery wrote:
> Signed-off-by: Andrew Jeffery <andrew@aj.id.au>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  .../devicetree/bindings/hwmon/max31785.txt         | 22 ++++++++++++++++++++++
>  1 file changed, 22 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/max31785.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/max31785.txt b/Documentation/devicetree/bindings/hwmon/max31785.txt
> new file mode 100644
> index 000000000000..106e08c56aaa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/max31785.txt
> @@ -0,0 +1,22 @@
> +Bindings for the Maxim MAX31785 Intelligent Fan Controller
> +==========================================================
> +
> +Reference:
> +
> +https://datasheets.maximintegrated.com/en/ds/MAX31785.pdf
> +
> +The Maxim MAX31785 is a PMBus device providing closed-loop, multi-channel fan
> +management with temperature and remote voltage sensing. Various fan control
> +features are provided, including PWM frequency control, temperature hysteresis,
> +dual tachometer measurements, and fan health monitoring.
> +
> +Required properties:
> +- compatible     : One of "maxim,max31785" or "maxim,max31785a"
> +- reg            : I2C address, one of 0x52, 0x53, 0x54, 0x55.
> +
> +Example:
> +
> +        fans@52 {
> +                compatible = "maxim,max31785";
> +                reg = <0x52>;
> +        };
