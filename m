Return-Path: <SRS0=ckkT=P2=vger.kernel.org=linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.5 required=3.0
	tests=HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 46CB4C07EBF
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 18:22:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2633820823
	for <linux-hwmon@archiver.kernel.org>; Fri, 18 Jan 2019 18:22:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728900AbfARSWP (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Fri, 18 Jan 2019 13:22:15 -0500
Received: from foss.arm.com ([217.140.101.70]:36220 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728792AbfARSWO (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Fri, 18 Jan 2019 13:22:14 -0500
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.72.51.249])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2C3951596;
        Fri, 18 Jan 2019 10:22:14 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.72.51.249])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE1F73F6A8;
        Fri, 18 Jan 2019 10:22:13 -0800 (PST)
Received: by e110455-lin.cambridge.arm.com (Postfix, from userid 1000)
        id 320E06800DF; Fri, 18 Jan 2019 18:22:12 +0000 (GMT)
Date:   Fri, 18 Jan 2019 18:22:12 +0000
From:   Liviu Dudau <liviu.dudau@arm.com>
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Hardware Monitoring <linux-hwmon@vger.kernel.org>,
        Jean Delvare <jdelvare@suse.com>,
        Sudeep Holla <sudeep.holla@arm.com>,
        Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
Subject: Re: [PATCH 29/30] hwmon: (vexpress-hwmon) Use permission specific
 SENSOR[_DEVICE]_ATTR variants
Message-ID: <20190118182212.GJ20661@e110455-lin.cambridge.arm.com>
References: <1547831700-15865-1-git-send-email-linux@roeck-us.net>
 <1547831700-15865-30-git-send-email-linux@roeck-us.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1547831700-15865-30-git-send-email-linux@roeck-us.net>
User-Agent: Mutt/1.11.2 (2019-01-07)
Sender: linux-hwmon-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Fri, Jan 18, 2019 at 09:14:59AM -0800, Guenter Roeck wrote:
> Use SENSOR[_DEVICE]_ATTR[_2]_{RO,RW,WO} to simplify the source code,
> to improve readbility, and to reduce the chance of inconsistencies.
> 
> Also replace any remaining S_<PERMS> in the driver with octal values.
> 
> The conversion was done automatically with coccinelle. The semantic patches
> and the scripts used to generate this commit log are available at
> https://github.com/groeck/coccinelle-patches/hwmon/.
> 
> This patch does not introduce functional changes. It was verified by
> compiling the old and new files and comparing text and data sizes.
> 
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Lorenzo Pieralisi <lorenzo.pieralisi@arm.com>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>

Acked-by: Liviu Dudau <liviu.dudau@arm.com>

Are you going to take the patch via your tree?

Best regards,
Liviu

> ---
>  drivers/hwmon/vexpress-hwmon.c | 25 ++++++++++---------------
>  1 file changed, 10 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/hwmon/vexpress-hwmon.c b/drivers/hwmon/vexpress-hwmon.c
> index 8ba419d343f8..0b84adb5e88e 100644
> --- a/drivers/hwmon/vexpress-hwmon.c
> +++ b/drivers/hwmon/vexpress-hwmon.c
> @@ -92,9 +92,8 @@ struct vexpress_hwmon_type {
>  };
>  
>  #if !defined(CONFIG_REGULATOR_VEXPRESS)
> -static DEVICE_ATTR(in1_label, S_IRUGO, vexpress_hwmon_label_show, NULL);
> -static SENSOR_DEVICE_ATTR(in1_input, S_IRUGO, vexpress_hwmon_u32_show,
> -		NULL, 1000);
> +static DEVICE_ATTR(in1_label, 0444, vexpress_hwmon_label_show, NULL);
> +static SENSOR_DEVICE_ATTR_RO(in1_input, vexpress_hwmon_u32, 1000);
>  static struct attribute *vexpress_hwmon_attrs_volt[] = {
>  	&dev_attr_in1_label.attr,
>  	&sensor_dev_attr_in1_input.dev_attr.attr,
> @@ -113,9 +112,8 @@ static struct vexpress_hwmon_type vexpress_hwmon_volt = {
>  };
>  #endif
>  
> -static DEVICE_ATTR(curr1_label, S_IRUGO, vexpress_hwmon_label_show, NULL);
> -static SENSOR_DEVICE_ATTR(curr1_input, S_IRUGO, vexpress_hwmon_u32_show,
> -		NULL, 1000);
> +static DEVICE_ATTR(curr1_label, 0444, vexpress_hwmon_label_show, NULL);
> +static SENSOR_DEVICE_ATTR_RO(curr1_input, vexpress_hwmon_u32, 1000);
>  static struct attribute *vexpress_hwmon_attrs_amp[] = {
>  	&dev_attr_curr1_label.attr,
>  	&sensor_dev_attr_curr1_input.dev_attr.attr,
> @@ -133,9 +131,8 @@ static struct vexpress_hwmon_type vexpress_hwmon_amp = {
>  	},
>  };
>  
> -static DEVICE_ATTR(temp1_label, S_IRUGO, vexpress_hwmon_label_show, NULL);
> -static SENSOR_DEVICE_ATTR(temp1_input, S_IRUGO, vexpress_hwmon_u32_show,
> -		NULL, 1000);
> +static DEVICE_ATTR(temp1_label, 0444, vexpress_hwmon_label_show, NULL);
> +static SENSOR_DEVICE_ATTR_RO(temp1_input, vexpress_hwmon_u32, 1000);
>  static struct attribute *vexpress_hwmon_attrs_temp[] = {
>  	&dev_attr_temp1_label.attr,
>  	&sensor_dev_attr_temp1_input.dev_attr.attr,
> @@ -153,9 +150,8 @@ static struct vexpress_hwmon_type vexpress_hwmon_temp = {
>  	},
>  };
>  
> -static DEVICE_ATTR(power1_label, S_IRUGO, vexpress_hwmon_label_show, NULL);
> -static SENSOR_DEVICE_ATTR(power1_input, S_IRUGO, vexpress_hwmon_u32_show,
> -		NULL, 1);
> +static DEVICE_ATTR(power1_label, 0444, vexpress_hwmon_label_show, NULL);
> +static SENSOR_DEVICE_ATTR_RO(power1_input, vexpress_hwmon_u32, 1);
>  static struct attribute *vexpress_hwmon_attrs_power[] = {
>  	&dev_attr_power1_label.attr,
>  	&sensor_dev_attr_power1_input.dev_attr.attr,
> @@ -173,9 +169,8 @@ static struct vexpress_hwmon_type vexpress_hwmon_power = {
>  	},
>  };
>  
> -static DEVICE_ATTR(energy1_label, S_IRUGO, vexpress_hwmon_label_show, NULL);
> -static SENSOR_DEVICE_ATTR(energy1_input, S_IRUGO, vexpress_hwmon_u64_show,
> -		NULL, 1);
> +static DEVICE_ATTR(energy1_label, 0444, vexpress_hwmon_label_show, NULL);
> +static SENSOR_DEVICE_ATTR_RO(energy1_input, vexpress_hwmon_u64, 1);
>  static struct attribute *vexpress_hwmon_attrs_energy[] = {
>  	&dev_attr_energy1_label.attr,
>  	&sensor_dev_attr_energy1_input.dev_attr.attr,
> -- 
> 2.7.4
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯
