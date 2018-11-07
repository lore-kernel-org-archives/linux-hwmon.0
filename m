Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:38667 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727006AbeKHELh (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Wed, 7 Nov 2018 23:11:37 -0500
Date: Wed, 7 Nov 2018 10:39:58 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Heiko Stuebner <heiko@sntech.de>
Cc: jdelvare@suse.com, robh+dt@kernel.org, mark.rutland@arm.com,
        linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Heiko Stuebner <heiko.stuebner@bq.com>
Subject: Re: [PATCH] dt-bindings: hwmon: tmp108: add optional interrupts and
 #thermal-sensor-cells
Message-ID: <20181107183958.GB5468@roeck-us.net>
References: <20181107154708.422-1-heiko@sntech.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181107154708.422-1-heiko@sntech.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi,

On Wed, Nov 07, 2018 at 04:47:08PM +0100, Heiko Stuebner wrote:
> From: Heiko Stuebner <heiko.stuebner@bq.com>
> 
> The tmp108 does have an alert output that can be used as interrupt source
> and can of course also be used as part of a thermal sensor setup for things
> like thermal-based cpu frequencies, so document the necessary properties.
> 
> Signed-off-by: Heiko Stuebner <heiko.stuebner@bq.com>

Do you also plan to actually implement interrupt support in the driver ?

Guenter

> ---
>  Documentation/devicetree/bindings/hwmon/tmp108.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/tmp108.txt b/Documentation/devicetree/bindings/hwmon/tmp108.txt
> index 8c4b10df86d9..54d4beed4ee5 100644
> --- a/Documentation/devicetree/bindings/hwmon/tmp108.txt
> +++ b/Documentation/devicetree/bindings/hwmon/tmp108.txt
> @@ -7,6 +7,10 @@ Requires node properties:
>  - compatible : "ti,tmp108"
>  - reg : the I2C address of the device. This is 0x48, 0x49, 0x4a, or 0x4b.
>  
> +Optional properties:
> +- interrupts: Reference to the TMP108 alert interrupt.
> +- #thermal-sensor-cells: should be set to 0.
> +
>  Example:
>  	tmp108@48 {
>  		compatible = "ti,tmp108";
> -- 
> 2.18.0
> 
