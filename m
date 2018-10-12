Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi1-f195.google.com ([209.85.167.195]:36465 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725765AbeJMECo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 13 Oct 2018 00:02:44 -0400
Date: Fri, 12 Oct 2018 15:28:29 -0500
From: Rob Herring <robh@kernel.org>
To: Wojciech Slenska <wojciech.slenska@gmail.com>
Cc: linux@roeck-us.net, jdelvare@suse.com, mark.rutland@arm.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (sht3x) add devicetree support
Message-ID: <20181012202829.GA24897@bogus>
References: <1538717915-22294-1-git-send-email-wojciech.slenska@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1538717915-22294-1-git-send-email-wojciech.slenska@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Oct 05, 2018 at 07:38:35AM +0200, Wojciech Slenska wrote:

Commit msg?

> Signed-off-by: Wojciech Slenska <wojciech.slenska@gmail.com>
> ---
>  Documentation/devicetree/bindings/hwmon/sht3x.txt | 16 +++++++++++++

Please split bindings to separate patch.

>  drivers/hwmon/sht3x.c                             | 28 ++++++++++++++++++++---
>  2 files changed, 41 insertions(+), 3 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/sht3x.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/sht3x.txt b/Documentation/devicetree/bindings/hwmon/sht3x.txt
> new file mode 100644
> index 0000000..80b117e
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/sht3x.txt
> @@ -0,0 +1,16 @@
> +Sensirion SHT3x Humidity and Temperature Sensor
> +
> +Required node properties:
> +- compatible: "sensirion,sht3x" or "sensirion,sts3x"
> +- reg: I2C bus address of the device
> +
> +Optional properties:
> +- sensirion,blocking-io: enable blocking mode on i2c

This is not a h/w parameter and shouldn't be in DT.

> +- sensirion,no-high-precision: disable high accuracy

Maybe this one is okay, but couldn't the user want to set this? If so, 
then it should be a sysfs attr.

> +
> +Example sht3x node:
> +
> +sensor {

sensor@4a

> +	compatible = "sensirion,sht3x";
> +	reg = <0x4a>;
> +}
