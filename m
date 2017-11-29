Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl0-f65.google.com ([209.85.160.65]:41234 "EHLO
        mail-pl0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752449AbdK2UxN (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 29 Nov 2017 15:53:13 -0500
Date: Wed, 29 Nov 2017 12:53:11 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Rosin <peda@axentia.se>
Cc: linux-kernel@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Russell King <linux@armlinux.org.uk>,
        Jean Delvare <jdelvare@suse.com>,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 2/2] ARM: dts: at91: disable the nxp,se97b SMBUS
 timeout on the TSE-850
Message-ID: <20171129205311.GA20551@roeck-us.net>
References: <20171127163101.27859-1-peda@axentia.se>
 <20171127163101.27859-3-peda@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171127163101.27859-3-peda@axentia.se>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 27, 2017 at 05:31:01PM +0100, Peter Rosin wrote:
> The I2C adapter driver is sometimes slow, causing the SCL line to
> be stuck low for more than the stipulated SMBUS timeout of 25-35 ms.
> This causes the client device to give up which in turn causes silent
> corruption of data. So, disable the SMBUS timeout in the client device.
> 
> Signed-off-by: Peter Rosin <peda@axentia.se>

Acked-by: Guenter Roeck <linux@roeck-us.net>

I assume this will be sent upstream through an arm tree.

Thanks,
Guenter

> ---
>  arch/arm/boot/dts/at91-tse850-3.dts | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/arch/arm/boot/dts/at91-tse850-3.dts b/arch/arm/boot/dts/at91-tse850-3.dts
> index 5f29010cdbd8..9b82cc8843e1 100644
> --- a/arch/arm/boot/dts/at91-tse850-3.dts
> +++ b/arch/arm/boot/dts/at91-tse850-3.dts
> @@ -221,6 +221,7 @@
>  	jc42@18 {
>  		compatible = "nxp,se97b", "jedec,jc-42.4-temp";
>  		reg = <0x18>;
> +		smbus-timeout-disable;
>  	};
>  
>  	dpot: mcp4651-104@28 {
> -- 
> 2.11.0
> 
