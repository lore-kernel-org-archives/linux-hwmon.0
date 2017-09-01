Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:34846 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751994AbdIAOc6 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 1 Sep 2017 10:32:58 -0400
Date: Fri, 1 Sep 2017 07:32:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Florian Eckert <fe@dev.tdt.de>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [v2,1/2] hwmon: (adcxx) add devictree bindings documentation
Message-ID: <20170901143257.GA1167@roeck-us.net>
References: <20170821081952.18508-1-fe@dev.tdt.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170821081952.18508-1-fe@dev.tdt.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Aug 21, 2017 at 10:19:51AM +0200, Florian Eckert wrote:
> Document the devicetree bindings for the adcxx.
> 
> Signed-off-by: Florian Eckert <fe@dev.tdt.de>
> ---
> v2:
> - use regulator voltage binding
> 
>  Documentation/devicetree/bindings/hwmon/adcxx.txt | 24 +++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/adcxx.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/adcxx.txt b/Documentation/devicetree/bindings/hwmon/adcxx.txt
> new file mode 100644
> index 000000000000..a94a5fe21b6d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/adcxx.txt
> @@ -0,0 +1,24 @@
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
> +- vref-supply
> +  The external reference in microvolt for this device is set to this value.
> +  If it does not exists the reference will be set to 3300000uV (3.3V).

s/exists/exist/

> +
> +Example:
> +
> +adc@6 {
> +	compatible = "national,adcxx2s";
> +	reg = <6 0>;
> +	spi-max-frequency = <1000000>;

I asssume that means that standard spi properties are accepted / required,
which I think should be documented. We'll need input from Rob for that.

Thanks,
Guenter

> +	vref-supply = <&vref>;
> +};
