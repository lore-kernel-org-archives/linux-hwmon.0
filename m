Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:35821 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750981AbdJAOLn (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 1 Oct 2017 10:11:43 -0400
Date: Sun, 1 Oct 2017 07:11:40 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alan Tull <atull@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Subject: Re: [1/2] dt-bindings: hwmon: add compatible for max1619
Message-ID: <20171001141140.GA31645@roeck-us.net>
References: <20170911191649.3344-1-atull@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170911191649.3344-1-atull@kernel.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Sep 11, 2017 at 02:16:48PM -0500, Alan Tull wrote:
> Add new device tree bindings document for max1619 device
> including a new compatible string.
> 
> Signed-off-by: Alan Tull <atull@kernel.org>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Rob Herring <robh+dt@kernel.org>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Acked-by: Rob Herring <robh@kernel.org>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  Documentation/devicetree/bindings/hwmon/max1619.txt | 12 ++++++++++++
>  1 file changed, 12 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/hwmon/max1619.txt
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/max1619.txt b/Documentation/devicetree/bindings/hwmon/max1619.txt
> new file mode 100644
> index 0000000..c70dbbe
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/max1619.txt
> @@ -0,0 +1,12 @@
> +Bindings for MAX1619 Temperature Sensor
> +
> +Required properties:
> +- compatible : "maxim,max1619"
> +- reg        : I2C address, one of 0x18, 0x19, 0x1a, 0x29, 0x2a, 0x2b, 0x4c, or
> +               0x4d, 0x4e
> +
> +Example:
> +	temp@4c {
> +		compatible = "maxim,max1619";
> +		reg = <0x4c>;
> +	};
