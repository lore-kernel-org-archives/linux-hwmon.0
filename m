Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:33244 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754327AbcLAAmy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 30 Nov 2016 19:42:54 -0500
Date: Wed, 30 Nov 2016 16:42:51 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: John Muir <john@jmuir.com>
Cc: Jean Delvare <jdelvare@suse.com>, Jonathan Corbet <corbet@lwn.net>,
        linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        John Muir <muirj@google.com>,
        Anatol Pomazau <anatol@google.com>
Subject: Re: [PATCH 2/2] devicetree: hwmon: Add documentation for TMP108
 driver.
Message-ID: <20161201004251.GA18513@roeck-us.net>
References: <1480209983-65915-1-git-send-email-john@jmuir.com>
 <1480538179-75901-1-git-send-email-john@jmuir.com>
 <1480538179-75901-3-git-send-email-john@jmuir.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1480538179-75901-3-git-send-email-john@jmuir.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi John,

On Wed, Nov 30, 2016 at 12:36:19PM -0800, John Muir wrote:
> Simple hwmon binding documentation.
> 
> Signed-off-by: John Muir <john@jmuir.com>
> ---
>  Documentation/devicetree/bindings/hwmon/tmp108.txt | 24 ++++++++++++++++++++++
>  1 file changed, 24 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/tmp108.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/tmp108.txt b/Documentation/devicetree/bindings/hwmon/tmp108.txt
> new file mode 100644
> index 0000000..7ba08c4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/tmp108.txt
> @@ -0,0 +1,24 @@
> +TMP108 temperature sensor
> +-------------------------
> +
> +This device supports I2C only.
> +
> +Requires node properties:
> +- compatible : "ti,tmp108"
> +- reg : the I2C address of the device. This is 0x48, 0x49, 0x4a, or 0x4b.
> +
> +Optional node properties:
> +- ti,thermostat-mode-comparator : (boolean) select the comparator mode for the
> +      thermostat rather than the default interrupt-mode.
> +
I keep arguing with myself over this. Ultimately, I think it is not needed,
for a simple reason: As currently written, using the driver in anything but
comparator mode does not really make sense (because the alert status bits
will be reset after reading them in interrupt mode). Second, interrupt mode
can be determined automatically, based on the presence of SMBus alert support.
Given that, I wonder if it would make more sense to drop this property and
always put the chip into comparator mode for the time being. At a later time,
if and when alert support is added, we can discuss the best approach to
determine how it should be enabled (ie how do we know that the SMBus adapter
supports handling alerts, or would we assume that it always does ?).

What do you think ?

Thanks,
Guenter

> +Example:
> +	tmp108@48 {
> +		compatible = "ti,tmp108";
> +		reg = <0x48>;
> +		ti,thermostat-mode-comparator;
> +	};
> +
> +	tmp108@49 {
> +		compatible = "ti,tmp108";
> +		reg = <0x49>;
> +	};
> -- 
> 2.8.0.rc3.226.g39d4020
> 
