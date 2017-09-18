Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf0-f193.google.com ([209.85.192.193]:37801 "EHLO
        mail-pf0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754332AbdIROoi (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 18 Sep 2017 10:44:38 -0400
Received: by mail-pf0-f193.google.com with SMTP id e69so269047pfg.4
        for <linux-hwmon@vger.kernel.org>; Mon, 18 Sep 2017 07:44:38 -0700 (PDT)
Date: Mon, 18 Sep 2017 07:44:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Patrick Venture <venture@google.com>
Cc: joel@jms.id.au, kunyi@google.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (aspeed-pwm-tacho) increase fan tach period
Message-ID: <20170918144435.GA11868@roeck-us.net>
References: <20170911224155.146738-1-venture@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170911224155.146738-1-venture@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Sep 11, 2017 at 03:41:55PM -0700, Patrick Venture wrote:
> The previous value reduced the time required to determine
> the fan value, however, it's also used as the final timeout
> mechanism.  The prevous value would work for any fan speed
> greater than around 3k RPM.  This increased value, lets the fan
> speeds return quickly but will wait longer to handle speeds below 3k
> RPM.
> 
> Testing: this value was determined through experimentation on the ast2400
> on the Quanta-q71l.  This configurations runs 8 fans attached to the
> controller.
> 
> Signed-off-by: Patrick Venture <venture@google.com>

With reservations:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

This is the last time for me to accept a patch changing the value of
M_TACH_UNIT in this driver. Any subsequent change will require a more
comprehensive solution.

Guenter

> ---
>  drivers/hwmon/aspeed-pwm-tacho.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/aspeed-pwm-tacho.c b/drivers/hwmon/aspeed-pwm-tacho.c
> index 69b97d45e3cb..f914e5f41048 100644
> --- a/drivers/hwmon/aspeed-pwm-tacho.c
> +++ b/drivers/hwmon/aspeed-pwm-tacho.c
> @@ -161,7 +161,7 @@
>   * 11: reserved.
>   */
>  #define M_TACH_MODE 0x02 /* 10b */
> -#define M_TACH_UNIT 0x00c0
> +#define M_TACH_UNIT 0x0210
>  #define INIT_FAN_CTRL 0xFF
>  
>  /* How long we sleep in us while waiting for an RPM result. */
> -- 
> 2.14.1.581.gf28d330327-goog
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
