Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f194.google.com ([209.85.210.194]:45012 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728175AbeKQCX5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 16 Nov 2018 21:23:57 -0500
Received: by mail-pf1-f194.google.com with SMTP id b81-v6so11121182pfe.11
        for <linux-hwmon@vger.kernel.org>; Fri, 16 Nov 2018 08:10:59 -0800 (PST)
Date: Fri, 16 Nov 2018 08:10:56 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: linux-hwmon@vger.kernel.org, michaelsh@mellanox.com
Subject: Re: [PATCH hwmon-next v1 1/1] hwmon: (mlxreg-fan) Fix macros for
 tacho fault reading
Message-ID: <20181116161056.GA30354@roeck-us.net>
References: <1542376031-179816-1-git-send-email-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1542376031-179816-1-git-send-email-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Nov 16, 2018 at 01:47:11PM +0000, Vadim Pasternak wrote:
> Fix macros for tacometer fault reading.
> This fix is relevant for three Mellanox systems MQMB7, MSN37, MSN34,
> which are about to be released to the customers.
> At the moment, none of them is at customers sites.
> 
> Fixes: 65afb4c8e7e4 ("hwmon: (mlxreg-fan) Add support for Mellanox FAN driver")
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/mlxreg-fan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> index de46577..d8fa4be 100644
> --- a/drivers/hwmon/mlxreg-fan.c
> +++ b/drivers/hwmon/mlxreg-fan.c
> @@ -51,7 +51,7 @@
>   */
>  #define MLXREG_FAN_GET_RPM(rval, d, s)	(DIV_ROUND_CLOSEST(15000000 * 100, \
>  					 ((rval) + (s)) * (d)))
> -#define MLXREG_FAN_GET_FAULT(val, mask) (!!((val) ^ (mask)))
> +#define MLXREG_FAN_GET_FAULT(val, mask) (!((val) ^ (mask)))
>  #define MLXREG_FAN_PWM_DUTY2STATE(duty)	(DIV_ROUND_CLOSEST((duty) *	\
>  					 MLXREG_FAN_MAX_STATE,		\
>  					 MLXREG_FAN_MAX_DUTY))
