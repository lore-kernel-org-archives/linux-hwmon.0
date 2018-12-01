Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43030 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725726AbeLBFoo (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sun, 2 Dec 2018 00:44:44 -0500
Received: by mail-pf1-f193.google.com with SMTP id w73so4382214pfk.10
        for <linux-hwmon@vger.kernel.org>; Sat, 01 Dec 2018 10:31:38 -0800 (PST)
Date: Sat, 1 Dec 2018 10:31:35 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Michele Sorcinelli <michelesr@autistici.org>
Cc: Pali =?iso-8859-1?Q?Roh=E1r?= <pali.rohar@gmail.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] dell-smm-hwmon.c: Add XPS 9570 to supported devices list
Message-ID: <20181201183135.GA30503@roeck-us.net>
References: <026d224f-7f8d-b50f-f269-e6b2408a8822@autistici.org>
 <20181130184256.7487-1-michelesr@autistici.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181130184256.7487-1-michelesr@autistici.org>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Fri, Nov 30, 2018 at 06:42:56PM +0000, Michele Sorcinelli wrote:
> Allow the module to be loaded on Dell XPS 9570, without having to
> provide the "force=1" option.
> 
> Signed-off-by: Michele Sorcinelli <michelesr@autistici.org>
> Reviewed-by: Pali Rohár <pali.rohar@gmail.com>

Applied to hwmon-next.

Thanks,
Guenter

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
