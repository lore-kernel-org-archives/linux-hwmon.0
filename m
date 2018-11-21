Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:46407 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387923AbeKVKVL (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 22 Nov 2018 05:21:11 -0500
Received: by mail-pl1-f193.google.com with SMTP id t13so7628935ply.13
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Nov 2018 15:44:36 -0800 (PST)
Date: Wed, 21 Nov 2018 15:44:34 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Vadim Pasternak <vadimp@mellanox.com>
Cc: linux-hwmon@vger.kernel.org, michaelsh@mellanox.com
Subject: Re: [PATCH hwmon-next v1 1/1] hwmon: (mlxreg-fan) Modify macros for
 tachometer fault status reading
Message-ID: <20181121234434.GA5142@roeck-us.net>
References: <1542755796-70329-1-git-send-email-vadimp@mellanox.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1542755796-70329-1-git-send-email-vadimp@mellanox.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Nov 20, 2018 at 11:16:36PM +0000, Vadim Pasternak wrote:
> Modify macros for tachometer fault status reading for making it more
> simple and clear.
> 
> Signed-off-by: Vadim Pasternak <vadimp@mellanox.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/mlxreg-fan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/mlxreg-fan.c b/drivers/hwmon/mlxreg-fan.c
> index d8fa4be..db8c6de 100644
> --- a/drivers/hwmon/mlxreg-fan.c
> +++ b/drivers/hwmon/mlxreg-fan.c
> @@ -51,7 +51,7 @@
>   */
>  #define MLXREG_FAN_GET_RPM(rval, d, s)	(DIV_ROUND_CLOSEST(15000000 * 100, \
>  					 ((rval) + (s)) * (d)))
> -#define MLXREG_FAN_GET_FAULT(val, mask) (!((val) ^ (mask)))
> +#define MLXREG_FAN_GET_FAULT(val, mask) ((val) == (mask))
>  #define MLXREG_FAN_PWM_DUTY2STATE(duty)	(DIV_ROUND_CLOSEST((duty) *	\
>  					 MLXREG_FAN_MAX_STATE,		\
>  					 MLXREG_FAN_MAX_DUTY))
