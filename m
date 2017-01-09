Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49282 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935186AbdAIRMC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Mon, 9 Jan 2017 12:12:02 -0500
Date: Mon, 9 Jan 2017 09:11:59 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: jeroen.de_wachter.ext@nokia.com
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] hwmon/tmp401: Fix some checkstyle warnings
Message-ID: <20170109171159.GC16253@roeck-us.net>
References: <1483980458-28202-1-git-send-email-jeroen.de_wachter.ext@nokia.com>
 <1483980458-28202-2-git-send-email-jeroen.de_wachter.ext@nokia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1483980458-28202-2-git-send-email-jeroen.de_wachter.ext@nokia.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Jan 09, 2017 at 05:47:38PM +0100, jeroen.de_wachter.ext@nokia.com wrote:
> From: Jeroen De Wachter <jeroen.de_wachter.ext@nokia.com>
> 
> Signed-off-by: Jeroen De Wachter <jeroen.de_wachter.ext@nokia.com>
> ---
>  drivers/hwmon/tmp401.c | 66 +++++++++++++++++++++++++-------------------------
>  1 file changed, 33 insertions(+), 33 deletions(-)
> 
> diff --git a/drivers/hwmon/tmp401.c b/drivers/hwmon/tmp401.c
> index 88b17e4..853056d 100644
> --- a/drivers/hwmon/tmp401.c
> +++ b/drivers/hwmon/tmp401.c
> @@ -498,40 +498,40 @@ static ssize_t set_update_interval(struct device *dev,
>  	return count;
>  }
>  
> -static SENSOR_DEVICE_ATTR_2(temp1_input, S_IRUGO, show_temp, NULL, 0, 0);
> -static SENSOR_DEVICE_ATTR_2(temp1_min, S_IWUSR | S_IRUGO, show_temp,
> +static SENSOR_DEVICE_ATTR_2(temp1_input, 0444, show_temp, NULL, 0, 0);
> +static SENSOR_DEVICE_ATTR_2(temp1_min, 0644, show_temp,

I hate this change :-(.

Please don't bother. I have a coccinelle driven series in the works which makes 
those changes automatically for all drivers (and, along the line, simplifies
the SENSOR_DEVICE_ATTR[_2] macros).

Thanks,
Guenter
