Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:58724 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751037AbdCQNoD (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 17 Mar 2017 09:44:03 -0400
Date: Fri, 17 Mar 2017 06:43:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Peter Huewe <peterhuewe@gmx.de>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: Add missing HWMON_T_ALARM
Message-ID: <20170317134354.GA16340@roeck-us.net>
References: <1489706936-26535-1-git-send-email-peterhuewe@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1489706936-26535-1-git-send-email-peterhuewe@gmx.de>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Mar 17, 2017 at 12:28:56AM +0100, Peter Huewe wrote:
> Unfortunately the HWMON_T_ALARM define was missing,
> although the associated entry was present in hwmon_temp_attributes.
> This is needed to convert drivers to the new interface which use channel
> based alarms.
> 
Good catch. Applied.

Thanks,
Guenter

> Signed-off-by: Peter Huewe <peterhuewe@gmx.de>
> ---
>  include/linux/hwmon.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
> index 78d59dba563e..88b673749121 100644
> --- a/include/linux/hwmon.h
> +++ b/include/linux/hwmon.h
> @@ -88,6 +88,7 @@ enum hwmon_temp_attributes {
>  #define HWMON_T_CRIT_HYST	BIT(hwmon_temp_crit_hyst)
>  #define HWMON_T_EMERGENCY	BIT(hwmon_temp_emergency)
>  #define HWMON_T_EMERGENCY_HYST	BIT(hwmon_temp_emergency_hyst)
> +#define HWMON_T_ALARM		BIT(hwmon_temp_alarm)
>  #define HWMON_T_MIN_ALARM	BIT(hwmon_temp_min_alarm)
>  #define HWMON_T_MAX_ALARM	BIT(hwmon_temp_max_alarm)
>  #define HWMON_T_CRIT_ALARM	BIT(hwmon_temp_crit_alarm)
> -- 
> 2.7.3
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
