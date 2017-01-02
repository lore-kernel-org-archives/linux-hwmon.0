Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49236 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933548AbdABSPr (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 2 Jan 2017 13:15:47 -0500
Subject: Re: [PATCH] hwmon: (lm90) fix temp1_max_alarm attribute
To: Michael Walle <michael@walle.cc>, linux-hwmon@vger.kernel.org
References: <1483376019-11788-1-git-send-email-michael@walle.cc>
Cc: linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <a894a5a1-f24f-6d32-327e-d124c485f446@roeck-us.net>
Date: Mon, 2 Jan 2017 10:15:44 -0800
MIME-Version: 1.0
In-Reply-To: <1483376019-11788-1-git-send-email-michael@walle.cc>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 01/02/2017 08:53 AM, Michael Walle wrote:
> Since commit commit eb1c8f4325d5 ("hwmon: (lm90) Convert to use new hwmon
> registration API") the temp1_max_alarm and temp1_crit_alarm attributes are
> mapped to the same alarm bit. Fix the typo.
>
> Fixes: eb1c8f4325d5 ("hwmon: (lm90) Convert to use new hwmon registration API")
> Signed-off-by: Micehael Walle <michael@walle.cc>

Good catch. Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/lm90.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/lm90.c b/drivers/hwmon/lm90.c
> index 322ed92..841f242 100644
> --- a/drivers/hwmon/lm90.c
> +++ b/drivers/hwmon/lm90.c
> @@ -1036,7 +1036,7 @@ static const u8 lm90_temp_emerg_index[3] = {
>  };
>
>  static const u8 lm90_min_alarm_bits[3] = { 5, 3, 11 };
> -static const u8 lm90_max_alarm_bits[3] = { 0, 4, 12 };
> +static const u8 lm90_max_alarm_bits[3] = { 6, 4, 12 };
>  static const u8 lm90_crit_alarm_bits[3] = { 0, 1, 9 };
>  static const u8 lm90_emergency_alarm_bits[3] = { 15, 13, 14 };
>  static const u8 lm90_fault_bits[3] = { 0, 2, 10 };
>

