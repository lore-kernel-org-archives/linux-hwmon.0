Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:36359 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752342AbcLLLPA (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 12 Dec 2016 06:15:00 -0500
Date: Mon, 12 Dec 2016 12:14:56 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 15/17] hwmln: (g762) Fix overflows and crash seen when
 writing limit attributes
Message-ID: <20161212121456.4fef646c@endymion>
In-Reply-To: <1480913740-5678-15-git-send-email-linux@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
 <1480913740-5678-15-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Guenter,

There's a typo in the subject (hwmln -> hwmon.)

On Sun,  4 Dec 2016 20:55:38 -0800, Guenter Roeck wrote:
> Fix overflows seen when writing into fan speed limit attributes.
> Also fix crash due to division by zero, seen when certain very
> large values (such as 4611686018427387904, or 0x4000000000000000)
> are written into fan speed limit attributes.
> 
> Fixes: 594fbe713bf60 ("Add support for GMT G762/G763 PWM fan controllers")
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/g762.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/g762.c b/drivers/hwmon/g762.c
> index b96a2a9e4df7..584f9f755a92 100644
> --- a/drivers/hwmon/g762.c
> +++ b/drivers/hwmon/g762.c
> @@ -193,12 +193,13 @@ static inline unsigned int rpm_from_cnt(u8 cnt, u32 clk_freq, u16 p,
>   * Convert fan RPM value from sysfs into count value for fan controller
>   * register (FAN_SET_CNT).
>   */
> -static inline unsigned char cnt_from_rpm(u32 rpm, u32 clk_freq, u16 p,
> +static inline unsigned char cnt_from_rpm(unsigned long rpm, u32 clk_freq, u16 p,
>  					 u8 clk_div, u8 gear_mult)
>  {
> -	if (!rpm)         /* to stop the fan, set cnt to 255 */
> +	if (!rpm || !p || !clk_div)	/* to stop the fan, set cnt to 255 */
>  		return 0xff;

Looking at the definitions of G762_PULSE_FROM_REG and
G762_CLKDIV_FROM_REG, I can't see how either p or clk_div would be 0.
So this change seems unneeded to me. The division by zero you have seen
would be the consequence of an overflow (fixed below.)

>  
> +	rpm = clamp_val(rpm, 1, ULONG_MAX / (p * clk_div));
>  	return clamp_val(((clk_freq * 30 * gear_mult) / (rpm * p * clk_div)),
>  			 0, 255);
>  }

If my math is right, this can be simplified to:

	rpm = clamp_val(rpm, 1, (clk_freq * 30 * gear_mult) / (255  * p * clk_div));
	return (clk_freq * 30 * gear_mult) / (rpm * p * clk_div);

which may or may not actually be more simple ;-) as it avoids the
double clamping only at the cost of extra arithmetic. Probably only
worth it if we store the result of clk_freq * 30 * gear_mult and p *
clk_div locally so we don't have to compute them again.

Probably doesn't matter much in the end, so it's your call.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
