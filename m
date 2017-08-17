Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:46545 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753391AbdHQRKk (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 17 Aug 2017 13:10:40 -0400
Date: Thu, 17 Aug 2017 10:10:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Florian Eckert <fe@dev.tdt.de>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (adcxx) add devictree bindings documentation
Message-ID: <20170817171037.GA20072@roeck-us.net>
References: <20170817111705.24419-1-fe@dev.tdt.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170817111705.24419-1-fe@dev.tdt.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Aug 17, 2017 at 01:17:04PM +0200, Florian Eckert wrote:
> Document the devicetree bindings for the adcxx.
> 
> Signed-off-by: Florian Eckert <fe@dev.tdt.de>
> ---
>  Documentation/devicetree/bindings/hwmon/adcxx.txt | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adcxx.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adcxx.txt b/Documentation/devicetree/bindings/hwmon/adcxx.txt
> new file mode 100644
> index 000000000000..7b2a31b95723
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adcxx.txt
> @@ -0,0 +1,23 @@
> +adcxx properties
> +
> +Required properties:
> +- compatible: Must be one of the following:
> +	- "national,adcxx1s" for adcxx1s
> +	- "national,adcxx2s" for adcxx2s
> +	- "national,adcxx4s" for adcxx4s
> +	- "national,adcxx8s" for adcxx8s
> +- reg: SPI address for chip
> +
> +Optional properties:
> +
> +- reference-voltage-millivolt
> +	Reference voltage in millivolt (mV)
> +

This should use a regulator binding instead. See ads7828.txt for an example.

> +Example:
> +
> +adc@6 {
> +	compatible = "national,adcxx2s";
> +	reg = <6 0>;
> +	spi-max-frequency = <1000000>;
> +	reference-voltage-millivolt = <3247>; /* 3.247 V */
> +};
> -- 
> 2.11.0
> 
