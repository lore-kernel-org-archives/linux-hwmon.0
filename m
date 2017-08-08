Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:46110 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752059AbdHHNy7 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 8 Aug 2017 09:54:59 -0400
Date: Tue, 8 Aug 2017 06:54:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: ftsteutates: fix clear alarm sysfs entries
Message-ID: <20170808135457.GA15751@roeck-us.net>
References: <20170803094351.10325-1-thilo.cestonaro@ts.fujitsu.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170803094351.10325-1-thilo.cestonaro@ts.fujitsu.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Aug 03, 2017 at 11:43:51AM +0200, Thilo Cestonaro wrote:
> sysfs store functions should return the "written" bytes.
> Returning zero ends in an endless loop, so fix this by
> returning the count of bytes got.
> 
> Signed-off-by: Thilo Cestonaro <thilo.cestonaro@ts.fujitsu.com>

Applied, thanks (fixed documentation change and description).

Guenter

> ---
>  Documentation/hwmon/ftsteutates | 4 ++++
>  drivers/hwmon/ftsteutates.c     | 2 ++
>  2 files changed, 6 insertions(+)
> 
> diff --git a/Documentation/hwmon/ftsteutates b/Documentation/hwmon/ftsteutates
> index 8c10a916de20..6b5992f6072a 100644
> --- a/Documentation/hwmon/ftsteutates
> +++ b/Documentation/hwmon/ftsteutates
> @@ -21,3 +21,7 @@ implemented in this driver.
>  Specification of the chip can be found here:
>  ftp://ftp.ts.fujitsu.com/pub/Mainboard-OEM-Sales/Services/Software&Tools/Linux_SystemMonitoring&Watchdog&GPIO/BMC-Teutates_Specification_V1.21.pdf
>  ftp://ftp.ts.fujitsu.com/pub/Mainboard-OEM-Sales/Services/Software&Tools/Linux_SystemMonitoring&Watchdog&GPIO/Fujitsu_mainboards-1-Sensors_HowTo-en-US.pdf
> +
> +to clear a temprature or fan alarm execute the following command with the
> +correct path to the alarm file:
> +echo 0 >XXXX_alarm
> diff --git a/drivers/hwmon/ftsteutates.c b/drivers/hwmon/ftsteutates.c
> index 0f0277e7aae5..a0fb9e9291f0 100644
> --- a/drivers/hwmon/ftsteutates.c
> +++ b/drivers/hwmon/ftsteutates.c
> @@ -435,6 +435,7 @@ clear_temp_alarm(struct device *dev, struct device_attribute *devattr,
>  		goto error;
>  
>  	data->valid = false;
> +	ret = count;
>  error:
>  	mutex_unlock(&data->update_lock);
>  	return ret;
> @@ -508,6 +509,7 @@ clear_fan_alarm(struct device *dev, struct device_attribute *devattr,
>  		goto error;
>  
>  	data->valid = false;
> +	ret = count;
>  error:
>  	mutex_unlock(&data->update_lock);
>  	return ret;
