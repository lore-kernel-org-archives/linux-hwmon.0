Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:36516 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751527AbcJEAZa (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 4 Oct 2016 20:25:30 -0400
Date: Tue, 4 Oct 2016 17:25:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andrea Merello <andrea.merello@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [PATCH v2 1/2] DT: add binding documentation for STTS751
Message-ID: <20161005002527.GA7857@roeck-us.net>
References: <1474978047-28290-1-git-send-email-andrea.merello@gmail.com>
 <1474978047-28290-2-git-send-email-andrea.merello@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1474978047-28290-2-git-send-email-andrea.merello@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Sep 27, 2016 at 02:07:26PM +0200, Andrea Merello wrote:
> Signed-off-by: Andrea Merello <andrea.merello@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> ---
>  Documentation/devicetree/bindings/hwmon/stts751.txt | 19 +++++++++++++++++++
>  1 file changed, 19 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/stts751.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/stts751.txt b/Documentation/devicetree/bindings/hwmon/stts751.txt
> new file mode 100644
> index 0000000..277ad46
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/stts751.txt
> @@ -0,0 +1,19 @@
> +* STTS751 thermometer.
> +
> +Required node properties:
> +- compatible: "stts751"
> +- reg: I2C bus address of the device
> +
> +Optional properties:
> +- has-therm: specifies that the "therm" pin is wired
> +- has-event: specifies that the "event" pin is wired

As mentioned in the code patch, I don't think those properties are actually
needed.

Guenter

> +- smbus-timeout-disable: when set, the smbus timeout function will be disabled
> +
> +Example stts751 node:
> +
> +temp-sensor {
> +	compatible = "stts751";
> +	reg = <0x48>;
> +	has-therm;
> +	has-event;
> +}
> -- 
> 2.7.4
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
