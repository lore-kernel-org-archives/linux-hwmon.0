Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:44739 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726468AbeJJH6D (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 10 Oct 2018 03:58:03 -0400
Received: by mail-pg1-f196.google.com with SMTP id g2-v6so1624891pgu.11
        for <linux-hwmon@vger.kernel.org>; Tue, 09 Oct 2018 17:38:34 -0700 (PDT)
Date: Tue, 9 Oct 2018 17:38:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kun Yi <kunyi@google.com>
Cc: avifishman70@gmail.com, tmaimon77@gmail.com, jdelvare@suse.com,
        openbmc@lists.ozlabs.org, linux-hwmon@vger.kernel.org,
        rlippert@google.com, benjaminfair@google.com
Subject: Re: [PATCH] hwmon: (npcm-750-pwm-fan): Change initial pwm target to
 255
Message-ID: <20181010003832.GA21971@roeck-us.net>
References: <20181008214925.86281-1-kunyi@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181008214925.86281-1-kunyi@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Oct 08, 2018 at 02:49:25PM -0700, Kun Yi wrote:
> Change initial PWM target to 255 to prevent overheating, for example
> when BMC hangs in userspace or when userspace fan control application is
> not implemented yet.
> 
> Signed-off-by: Kun Yi <kunyi@google.com>

Makes sense to me, and in line with other drivers. Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/npcm750-pwm-fan.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/npcm750-pwm-fan.c b/drivers/hwmon/npcm750-pwm-fan.c
> index 96634fd54e0b..c0fab54c0094 100644
> --- a/drivers/hwmon/npcm750-pwm-fan.c
> +++ b/drivers/hwmon/npcm750-pwm-fan.c
> @@ -52,7 +52,7 @@
>  
>  /* Define the Counter Register, value = 100 for match 100% */
>  #define NPCM7XX_PWM_COUNTER_DEFAULT_NUM		255
> -#define NPCM7XX_PWM_CMR_DEFAULT_NUM		127
> +#define NPCM7XX_PWM_CMR_DEFAULT_NUM		255
>  #define NPCM7XX_PWM_CMR_MAX			255
>  
>  /* default all PWM channels PRESCALE2 = 1 */
