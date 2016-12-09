Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:52847 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933406AbcLIQHg (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 9 Dec 2016 11:07:36 -0500
Date: Fri, 9 Dec 2016 17:07:32 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 11/17] hwmon: (lm85) Fix overflows seen when writing
 voltage limit attributes
Message-ID: <20161209170732.2b6dc1f9@endymion>
In-Reply-To: <1480913740-5678-11-git-send-email-linux@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
        <1480913740-5678-11-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sun,  4 Dec 2016 20:55:34 -0800, Guenter Roeck wrote:
> Writes into voltage limit attributes can overflow due to an unbound
> multiplication.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/lm85.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/lm85.c b/drivers/hwmon/lm85.c
> index 6ff773fcaefb..29c8136ce9c5 100644
> --- a/drivers/hwmon/lm85.c
> +++ b/drivers/hwmon/lm85.c
> @@ -136,7 +136,8 @@ static const int lm85_scaling[] = {  /* .001 Volts */
>  #define SCALE(val, from, to)	(((val) * (to) + ((from) / 2)) / (from))
>  
>  #define INS_TO_REG(n, val)	\
> -		clamp_val(SCALE(val, lm85_scaling[n], 192), 0, 255)
> +		SCALE(clamp_val(val, 0, 255 * lm85_scaling[n] / 192), \
> +		      lm85_scaling[n], 192)
>  
>  #define INSEXT_FROM_REG(n, val, ext)	\
>  		SCALE(((val) << 4) + (ext), 192 << 4, lm85_scaling[n])

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
