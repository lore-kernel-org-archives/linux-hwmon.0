Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:44370 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727171AbeITXPU (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 20 Sep 2018 19:15:20 -0400
Date: Thu, 20 Sep 2018 10:30:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: zhong jiang <zhongjiang@huawei.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: remove redundant continue
Message-ID: <20180920173045.GA15272@roeck-us.net>
References: <1537431070-38261-1-git-send-email-zhongjiang@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1537431070-38261-1-git-send-email-zhongjiang@huawei.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Sep 20, 2018 at 04:11:10PM +0800, zhong jiang wrote:
> The continue will not truely skip any code. hence it is safe to
> remove it.
> 
> Signed-off-by: zhong jiang <zhongjiang@huawei.com>

The proper subject line would be

hwmon: (scpi-hwmon) <summary>

Since it now happened several times that I got a patch without proper
subject (ie where the subject does not even mention the affected driver),
I am no longer going to accept patches if the affected driver is missing,
sorry.

Guenter

> ---
>  drivers/hwmon/scpi-hwmon.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/drivers/hwmon/scpi-hwmon.c b/drivers/hwmon/scpi-hwmon.c
> index 7e49da5..111d521 100644
> --- a/drivers/hwmon/scpi-hwmon.c
> +++ b/drivers/hwmon/scpi-hwmon.c
> @@ -286,10 +286,8 @@ static int scpi_hwmon_probe(struct platform_device *pdev)
>  		 * any thermal zones or if the thermal subsystem is
>  		 * not configured.
>  		 */
> -		if (IS_ERR(z)) {
> +		if (IS_ERR(z))
>  			devm_kfree(dev, zone);
> -			continue;
> -		}
>  	}
>  
>  	return 0;
> -- 
> 1.7.12.4
> 
