Return-Path: <linux-hwmon-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 60EDFC433EF
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 18:05:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4322861A8E
	for <linux-hwmon@archiver.kernel.org>; Thu, 21 Oct 2021 18:05:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231433AbhJUSHk (ORCPT <rfc822;linux-hwmon@archiver.kernel.org>);
        Thu, 21 Oct 2021 14:07:40 -0400
Received: from mail.kernel.org ([198.145.29.99]:50976 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229968AbhJUSHk (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 21 Oct 2021 14:07:40 -0400
Received: by mail.kernel.org (Postfix) with ESMTPSA id 0363661ABF;
        Thu, 21 Oct 2021 18:05:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1634839524;
        bh=dBPaU8pVYbeCTfg3x2bzjS5qt2qxpAG/D69T3tkDTWk=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=XHObuXjDMI3Jo2vT1LKd1ER90x4PhWn2JHILwztLctr7quendkGx11BkUIWd+yY7G
         +X6/XQXUvW4TuJz+zLKWA1HIPyO4HDn8G7ufmITACa9iOvEBefFw6LCV6mJCpDbZZ/
         xbUp3zFW28DBp6TKPGpUHSN+5uMURz3FRmupW+LKY8bpgt4YLRrce7zHLwVHoKaVay
         16nNMwm5YVZMWvh3/c96N+M0rVxLhXkkHOqizzXtN/OJcMhEsK10Ma5yAKTCXeSHaf
         mKBLdnpjtUQieUfl5I3SQTUfnsoJyxDK2rzqrFaNz8ysIXDV7+UlvEk8w4Zr28JbZV
         fJfNXBi++B6TA==
Received: by pali.im (Postfix)
        id 84D2F85E; Thu, 21 Oct 2021 20:05:21 +0200 (CEST)
Date:   Thu, 21 Oct 2021 20:05:21 +0200
From:   Pali =?utf-8?B?Um9ow6Fy?= <pali@kernel.org>
To:     W_Armin@gmx.de
Cc:     linux@roeck-us.net, jdelvare@suse.com, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 4/5] hwmon: (dell-smm) Add Dell Inspiron 3505 config data
Message-ID: <20211021180521.a5l2shvor4qwesfe@pali>
References: <20211021175447.5380-1-W_Armin@gmx.de>
 <20211021175447.5380-5-W_Armin@gmx.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211021175447.5380-5-W_Armin@gmx.de>
User-Agent: NeoMutt/20180716
Precedence: bulk
List-ID: <linux-hwmon.vger.kernel.org>
X-Mailing-List: linux-hwmon@vger.kernel.org

On Thursday 21 October 2021 19:54:46 W_Armin@gmx.de wrote:
> From: Armin Wolf <W_Armin@gmx.de>
> 
> After checking the fan speeds reported with the
> Dell Diag UEFI ROM, its safe to permanently
> set fan_max to I8K_FAN_HIGH and fan_mult
> to 1 for the Dell Inspiron 3505.
> 
> Tested on a Dell Inspiron 3505.

Hello! Are there any issues without this change on Dell Inspiron 3505?
Because i8k_config_data[] array is there for machines which need some
hooks and do not work correctly (e.g. allowing to use I8K_FAN_TURBO).

> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
>  drivers/hwmon/dell-smm-hwmon.c | 13 +++++++++++++
>  1 file changed, 13 insertions(+)
> 
> diff --git a/drivers/hwmon/dell-smm-hwmon.c b/drivers/hwmon/dell-smm-hwmon.c
> index 5f0338b4a717..2579dd646b20 100644
> --- a/drivers/hwmon/dell-smm-hwmon.c
> +++ b/drivers/hwmon/dell-smm-hwmon.c
> @@ -990,6 +990,7 @@ struct i8k_config_data {
>  };
> 
>  enum i8k_configs {
> +	DELL_INSPIRON_3505,
>  	DELL_LATITUDE_D520,
>  	DELL_PRECISION_490,
>  	DELL_STUDIO,
> @@ -997,6 +998,10 @@ enum i8k_configs {
>  };
> 
>  static const struct i8k_config_data i8k_config_data[] __initconst = {
> +	[DELL_INSPIRON_3505] = {
> +		.fan_mult = 1,
> +		.fan_max = I8K_FAN_HIGH,
> +	},
>  	[DELL_LATITUDE_D520] = {
>  		.fan_mult = 1,
>  		.fan_max = I8K_FAN_TURBO,
> @@ -1030,6 +1035,14 @@ static const struct dmi_system_id i8k_dmi_table[] __initconst = {
>  			DMI_MATCH(DMI_PRODUCT_NAME, "Latitude"),
>  		},
>  	},
> +	{
> +		.ident = "Dell Inspiron 3505",
> +		.matches = {
> +			DMI_MATCH(DMI_SYS_VENDOR, "Dell Inc."),
> +			DMI_MATCH(DMI_PRODUCT_NAME, "Inspiron 3505"),
> +		},
> +		.driver_data = (void *)&i8k_config_data[DELL_INSPIRON_3505],
> +	},
>  	{
>  		.ident = "Dell Inspiron 2",
>  		.matches = {
> --
> 2.20.1
> 
