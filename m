Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:39064 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752435AbcLHOE0 (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 8 Dec 2016 09:04:26 -0500
Date: Thu, 8 Dec 2016 15:04:01 +0100
From: Jean Delvare <jdelvare@suse.de>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 05/17] hwmon: (adm1025) Fix overflows seen when writing
 voltage limits
Message-ID: <20161208150401.2b55a79f@endymion>
In-Reply-To: <1480913740-5678-5-git-send-email-linux@roeck-us.net>
References: <1480913740-5678-1-git-send-email-linux@roeck-us.net>
        <1480913740-5678-5-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Sun,  4 Dec 2016 20:55:28 -0800, Guenter Roeck wrote:
> Writes into voltage limit attributes can overflow due to an unbound
> multiplication.
> 
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/adm1025.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/adm1025.c b/drivers/hwmon/adm1025.c
> index d6c767ace916..1abb4609b412 100644
> --- a/drivers/hwmon/adm1025.c
> +++ b/drivers/hwmon/adm1025.c
> @@ -93,7 +93,7 @@ static const int in_scale[6] = { 2500, 2250, 3300, 5000, 12000, 3300 };
>  
>  #define IN_FROM_REG(reg, scale)	(((reg) * (scale) + 96) / 192)
>  #define IN_TO_REG(val, scale)	((val) <= 0 ? 0 : \
> -				 (val) * 192 >= (scale) * 255 ? 255 : \
> +				 (val) >= (scale) * 255 / 192 ? 255 : \
>  				 ((val) * 192 + (scale) / 2) / (scale))
>  
>  #define TEMP_FROM_REG(reg)	((reg) * 1000)

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
