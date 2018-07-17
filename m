Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:37070 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730003AbeGQUqW (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 17 Jul 2018 16:46:22 -0400
Date: Tue, 17 Jul 2018 13:12:04 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andrew Lunn <andrew@lunn.ch>
Cc: David Miller <davem@davemloft.net>,
        netdev <netdev@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <rmk+kernel@arm.linux.org.uk>,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH net-next 1/4] hwmon: Add missing HWMON_T_LCRIT_ALARM
 define
Message-ID: <20180717201204.GA15476@roeck-us.net>
References: <1531856893-27884-1-git-send-email-andrew@lunn.ch>
 <1531856893-27884-2-git-send-email-andrew@lunn.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1531856893-27884-2-git-send-email-andrew@lunn.ch>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Jul 17, 2018 at 09:48:10PM +0200, Andrew Lunn wrote:
> The enum hwmon_temp_lcrit_alarm exists, but the BIT definition is
> missing.
> 
> Signed-off-by: Andrew Lunn <andrew@lunn.ch>

Acked-by: Guenter Roeck <linux@roeck-us.net>

... and, yes, I assume the series will be picked up by David.

> ---
>  include/linux/hwmon.h | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
> index e5fd2707b6df..1b74ad11a5a4 100644
> --- a/include/linux/hwmon.h
> +++ b/include/linux/hwmon.h
> @@ -93,6 +93,7 @@ enum hwmon_temp_attributes {
>  #define HWMON_T_MIN_ALARM	BIT(hwmon_temp_min_alarm)
>  #define HWMON_T_MAX_ALARM	BIT(hwmon_temp_max_alarm)
>  #define HWMON_T_CRIT_ALARM	BIT(hwmon_temp_crit_alarm)
> +#define HWMON_T_LCRIT_ALARM	BIT(hwmon_temp_lcrit_alarm)
>  #define HWMON_T_EMERGENCY_ALARM	BIT(hwmon_temp_emergency_alarm)
>  #define HWMON_T_FAULT		BIT(hwmon_temp_fault)
>  #define HWMON_T_OFFSET		BIT(hwmon_temp_offset)
> -- 
> 2.18.0
> 
