Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-wm1-f67.google.com ([209.85.128.67]:54882 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727486AbeK1TPJ (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 28 Nov 2018 14:15:09 -0500
Received: by mail-wm1-f67.google.com with SMTP id z18so1564307wmc.4
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Nov 2018 00:14:22 -0800 (PST)
Date: Wed, 28 Nov 2018 09:14:18 +0100
From: Pali =?utf-8?B?Um9ow6Fy?= <pali.rohar@gmail.com>
To: Michele Sorcinelli <michelesr@autistici.org>
Cc: Jean Delvare <jdelvare@suse.com>,
        Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] dell-smm-hwmon.c: Add XPS 9570 to supported devices list
Message-ID: <20181128081418.v22p5oclddim5v2u@pali>
References: <20181127230637.8673-1-michelesr@autistici.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181127230637.8673-1-michelesr@autistici.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tuesday 27 November 2018 23:06:37 Michele Sorcinelli wrote:
> Allow the module to be loaded on Dell XPS 9570, without having to use
> the "force=1" option. The module loads without problems, and reports
> correct fan values:
> 
>     $ time cat /proc/i8k
>     1.0 1.5 -1 35 0 0 0 0 -1 -22
>     cat /proc/i8k  0.00s user 0.00s system 7% cpu 0.033 total

Hi! This interface is deprecated and should not be used in new project
or software...

> However, the call may freeze the kernel for a very small time due to
> code running in the SSM layer. This is a known issue with the driver, and
> can be reproduced with other supported models. Average execution
> time is 33 ms.
> 
> The command line tools from i8kutils can properly set the fan speed,
> although the firmware will override it, unless automatic fan
> control is disabled with the proper SSM call.

i8kutils uses /proc/i8k too.

Can you check standard hwmon interface via lm-sensors / sensors command
is also working correctly? If you do not have sensors command you can
also look into /sys/class/hwmon/

> Average fans speed (when firwmare automatic control is off):
> 
> STATE -> RPM
> 0 0 -> 0 0
> 1 1 -> 2500 2500
> 2 2 -> 5100 5100
> 3 3 -> same as 2 2
> ---
>  drivers/hwmon/dell-smm-hwmon.c | 7 +++++++
>  1 file changed, 7 insertions(+)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 9d3ef879d..367a8a617 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -1017,6 +1017,13 @@ static const struct dmi_system_id i8k_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 9560"),
>  		},
>  	},
> +	{
> +		.ident = "Dell XPS 15 9570",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "XPS 15 9570"),
> +		},
> +	},
>  	{ }
>  };
>  

-- 
Pali Rohár
pali.rohar@gmail.com
