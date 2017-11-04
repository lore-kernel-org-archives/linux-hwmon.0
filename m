Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:50609 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932148AbdKDSKE (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 4 Nov 2017 14:10:04 -0400
Date: Sat, 4 Nov 2017 11:09:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Joel <joel@jms.id.au>
Cc: Rob Herring <robh+dt@kernel.org>,
        Philipp Zabel <philipp.zabel@gmail.com>,
        Mykola Kostenok <c_mykolak@mellanox.com>,
        Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>,
        Patrick Venture <venture@google.com>,
        Andrew Jeffery <andrew@aj.id.au>, devicetree@vger.kernel.org,
        linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [v2,1/3] hwmon: (aspeed-pwm-tacho) Sort headers
Message-ID: <20171104180959.GA28230@roeck-us.net>
References: <20171102035349.1902-2-joel@jms.id.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20171102035349.1902-2-joel@jms.id.au>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Nov 02, 2017 at 02:53:47PM +1100, Joel wrote:
> Sort the headers in preperation for future changes.
> 
> Signed-off-by: Joel Stanley <joel@jms.id.au>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/aspeed-pwm-tacho.c | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index f914e5f41048..63a95e23ca81 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -7,19 +7,19 @@
>   */
>  
>  #include <linux/clk.h>
> +#include <linux/delay.h>
>  #include <linux/errno.h>
>  #include <linux/gpio/consumer.h>
> -#include <linux/delay.h>
>  #include <linux/hwmon.h>
>  #include <linux/hwmon-sysfs.h>
>  #include <linux/io.h>
>  #include <linux/kernel.h>
>  #include <linux/module.h>
> -#include <linux/of_platform.h>
>  #include <linux/of_device.h>
> +#include <linux/of_platform.h>
>  #include <linux/platform_device.h>
> -#include <linux/sysfs.h>
>  #include <linux/regmap.h>
> +#include <linux/sysfs.h>
>  #include <linux/thermal.h>
>  
>  /* ASPEED PWM & FAN Tach Register Definition */
