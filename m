Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:35515 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752169AbdBCNeg (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Fri, 3 Feb 2017 08:34:36 -0500
Subject: Re: [PATCH v6 2/2] DT: add binding documentation for STTS751
To: Andrea Merello <andrea.merello@gmail.com>,
        linux-hwmon@vger.kernel.org
References: <1486021444-9429-1-git-send-email-andrea.merello@gmail.com>
 <1486021444-9429-2-git-send-email-andrea.merello@gmail.com>
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5764920c-cc23-d7cb-7cf2-60419c7f3c24@roeck-us.net>
Date: Fri, 3 Feb 2017 05:34:34 -0800
MIME-Version: 1.0
In-Reply-To: <1486021444-9429-2-git-send-email-andrea.merello@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 02/01/2017 11:44 PM, Andrea Merello wrote:
> Signed-off-by: Andrea Merello <andrea.merello@gmail.com>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> ---

Applied to hwmon-next.

Guenter

>  Documentation/devicetree/bindings/hwmon/stts751.txt | 15 +++++++++++++++
>  1 file changed, 15 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/stts751.txt
>
> diff --git a/Documentation/devicetree/bindings/hwmon/stts751.txt b/Documentation/devicetree/bindings/hwmon/stts751.txt
> new file mode 100644
> index 0000000..3ee1dc3
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/stts751.txt
> @@ -0,0 +1,15 @@
> +* STTS751 thermometer.
> +
> +Required node properties:
> +- compatible: "stts751"
> +- reg: I2C bus address of the device
> +
> +Optional properties:
> +- smbus-timeout-disable: when set, the smbus timeout function will be disabled
> +
> +Example stts751 node:
> +
> +temp-sensor {
> +	compatible = "stts751";
> +	reg = <0x48>;
> +}
>

