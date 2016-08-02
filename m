Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:59785 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S934336AbcHBOVR (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 Aug 2016 10:21:17 -0400
Subject: Re: [PATCH 0234/1285] Replace numeric parameter like 0444 with macro
To: Baole Ni <baolex.ni@intel.com>, jdelvare@suse.com
References: <20160802105158.29348-1-baolex.ni@intel.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <57A09E20.5080103@roeck-us.net>
Date: Tue, 2 Aug 2016 06:20:32 -0700
MIME-Version: 1.0
In-Reply-To: <20160802105158.29348-1-baolex.ni@intel.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 08/02/2016 03:51 AM, Baole Ni wrote:
> I find that the developers often just specified the numeric value
> when calling a macro which is defined with a parameter for access permission.
> As we know, these numeric value for access permission have had the corresponding macro,
> and that using macro can improve the robustness and readability of the code,
> thus, I suggest replacing the numeric parameter with the macro.
>
> Signed-off-by: Chuansheng Liu <chuansheng.liu@intel.com>
> Signed-off-by: Baole Ni <baolex.ni@intel.com>
> ---
>   drivers/hwmon/abituguru.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/abituguru.c b/drivers/hwmon/abituguru.c
> index 7a09c16..84d7070 100644
> --- a/drivers/hwmon/abituguru.c
> +++ b/drivers/hwmon/abituguru.c
> @@ -194,7 +194,7 @@ MODULE_PARM_DESC(pwms, "Number of PWMs on the uGuru "
>
>   /* Default verbose is 2, since this driver is still in the testing phase */
>   static int verbose = 2;
> -module_param(verbose, int, 0644);
> +module_param(verbose, int, S_IRUSR | S_IWUSR | S_IRGRP | S_IROTH);

S_IRUGO is quite useful, such as in "S_IRUGO | S_IWUSR".

Note that I cut down the excessive Cc:. Please don't do that again,
and please submit a single patch for the hwmon subsystem.

Guenter

