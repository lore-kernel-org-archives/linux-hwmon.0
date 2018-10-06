Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43857 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726217AbeJGC3W (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 6 Oct 2018 22:29:22 -0400
Date: Sat, 6 Oct 2018 12:24:49 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, afd@ti.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (core) Add hwmon_in_enable attribute
Message-ID: <20181006192449.GA30010@roeck-us.net>
References: <20181005235905.29403-1-nicoleotsuka@gmail.com>
 <20181005235905.29403-2-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181005235905.29403-2-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Oct 05, 2018 at 04:59:04PM -0700, Nicolin Chen wrote:
> According to hwmon ABI, in%d_enable is a sysfs interface that
> allows user space to enable and disable the input sensor. So
> this patch just simply adds the attribute to the list.
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/hwmon.c | 1 +
>  include/linux/hwmon.h | 2 ++
>  2 files changed, 3 insertions(+)
> 
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 33d51281272b..ac1cdf88840f 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -356,6 +356,7 @@ static const char * const hwmon_in_attr_templates[] = {
>  	[hwmon_in_max_alarm] = "in%d_max_alarm",
>  	[hwmon_in_lcrit_alarm] = "in%d_lcrit_alarm",
>  	[hwmon_in_crit_alarm] = "in%d_crit_alarm",
> +	[hwmon_in_enable] = "in%d_enable",
>  };
>  
>  static const char * const hwmon_curr_attr_templates[] = {
> diff --git a/include/linux/hwmon.h b/include/linux/hwmon.h
> index 9493d4a388db..99e0c1b0b5fb 100644
> --- a/include/linux/hwmon.h
> +++ b/include/linux/hwmon.h
> @@ -118,6 +118,7 @@ enum hwmon_in_attributes {
>  	hwmon_in_max_alarm,
>  	hwmon_in_lcrit_alarm,
>  	hwmon_in_crit_alarm,
> +	hwmon_in_enable,
>  };
>  
>  #define HWMON_I_INPUT		BIT(hwmon_in_input)
> @@ -135,6 +136,7 @@ enum hwmon_in_attributes {
>  #define HWMON_I_MAX_ALARM	BIT(hwmon_in_max_alarm)
>  #define HWMON_I_LCRIT_ALARM	BIT(hwmon_in_lcrit_alarm)
>  #define HWMON_I_CRIT_ALARM	BIT(hwmon_in_crit_alarm)
> +#define HWMON_I_ENABLE		BIT(hwmon_in_enable)
>  
>  enum hwmon_curr_attributes {
>  	hwmon_curr_input,
