Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:45128 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1758338AbdJMMva (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 13 Oct 2017 08:51:30 -0400
Subject: Re: [PATCH 1/2] hwmon: (jc42) optionally try to disable the SMBUS
 timeout
To: Peter Rosin <peda@axentia.se>, linux-kernel@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Russell King <linux@armlinux.org.uk>,
        Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-hwmon@vger.kernel.org
References: <20171013092705.7038-1-peda@axentia.se>
 <20171013092705.7038-2-peda@axentia.se>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <3aae0c68-f001-50fa-8db7-3090978cf16d@roeck-us.net>
Date: Fri, 13 Oct 2017 05:51:27 -0700
MIME-Version: 1.0
In-Reply-To: <20171013092705.7038-2-peda@axentia.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 10/13/2017 02:27 AM, Peter Rosin wrote:
> With a nxp,se97 chip on an atmel sama5d31 board, the I2C adapter driver
> is not always capable of avoiding the 25-35 ms timeout as specified by
> the SMBUS protocol. This may cause silent corruption of the last bit of
> any transfer, e.g. a one is read instead of a zero if the sensor chip
> times out. This also affects the eeprom half of the nxp-se97 chip, where
> this silent corruption was originally noticed. Other I2C adapters probably
> suffer similar issues, e.g. bit-banging comes to mind as risky...
> 
> The SMBUS register in the nxp chip is not a standard Jedec register, but
> it is not special to the nxp chips either, at least the atmel chips
> have the same mechanism. Therefore, do not special case this on the
> manufacturer, it is opt-in via the device property anyway.
> 
> Signed-off-by: Peter Rosin <peda@axentia.se>
> ---
>   Documentation/devicetree/bindings/hwmon/jc42.txt |  4 ++++
>   drivers/hwmon/jc42.c                             | 20 ++++++++++++++++++++
>   2 files changed, 24 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/jc42.txt b/Documentation/devicetree/bindings/hwmon/jc42.txt
> index 07a250498fbb..f569db58f64a 100644
> --- a/Documentation/devicetree/bindings/hwmon/jc42.txt
> +++ b/Documentation/devicetree/bindings/hwmon/jc42.txt
> @@ -34,6 +34,10 @@ Required properties:
>   
>   - reg: I2C address
>   
> +Optional properties:
> +- smbus-timeout-disable: When set, the smbus timeout function will be disabled.
> +			 This is not supported on all chips.
> +
>   Example:
>   
>   temp-sensor@1a {
> diff --git a/drivers/hwmon/jc42.c b/drivers/hwmon/jc42.c
> index 1bf22eff0b08..fd816902fa30 100644
> --- a/drivers/hwmon/jc42.c
> +++ b/drivers/hwmon/jc42.c
> @@ -45,6 +45,7 @@ static const unsigned short normal_i2c[] = {
>   #define JC42_REG_TEMP		0x05
>   #define JC42_REG_MANID		0x06
>   #define JC42_REG_DEVICEID	0x07
> +#define JC42_REG_SMBUS		0x22 /* NXP and Atmel, possibly others? */
>   
>   /* Status bits in temperature register */
>   #define JC42_ALARM_CRIT_BIT	15
> @@ -73,6 +74,9 @@ static const unsigned short normal_i2c[] = {
>   #define ONS_MANID		0x1b09  /* ON Semiconductor */
>   #define STM_MANID		0x104a  /* ST Microelectronics */
>   
> +/* SMBUS register */
> +#define SMBUS_STMOUT		BIT(7)  /* SMBus time-out, active low */

Requires bitops.h.

Otherwise looks good, though we'll have to wait for Rob's ack.

Thanks,
Guenter
