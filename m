Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:44421 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727528AbeJBTde (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Tue, 2 Oct 2018 15:33:34 -0400
Subject: Re: [PATCH] hwmon: Fix the 'No sensors found' error after replacing
 the parameter NULL by the actual device
To: Cao Van Dong <cv-dong@jinso.co.jp>, broonie@kernel.org,
        geert+renesas@glider.be, linux-hwmon@vger.kernel.org
Cc: kuninori.morimoto.gx@renesas.com, yoshihiro.shimoda.uh@renesas.com,
        linux-renesas-soc@vger.kernel.org, h-inayoshi@jinso.co.jp,
        nv-dung@jinso.co.jp, na-hoan@jinso.co.jp
References: <1538469324-8028-1-git-send-email-cv-dong@jinso.co.jp>
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <031294c5-2fd5-f6cc-6762-30e987c5029c@roeck-us.net>
Date: Tue, 2 Oct 2018 05:50:20 -0700
MIME-Version: 1.0
In-Reply-To: <1538469324-8028-1-git-send-email-cv-dong@jinso.co.jp>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 10/02/2018 01:35 AM, Cao Van Dong wrote:
> In __hwmon_device_register() function of hwmon.c, we have assigned 'dev' directly to 'hdev->parent'.
> Formerly, when registering the hwmon device, we pass NULL as the device. This is not affected.
> Recently, the developer has replaced the parameter NULL as the device by the actual device.
> This causes the "No sensors found" error. This patch is to fix this error.
> 
> This patch is based on the v4.19-rc3 tag.
> 

NACK.

This is wrong. The passed device is the hwmon driver's parent device. Using that device's
parent would be wrong. Indeed, that device could be a platform device with no parent.
The problem must be fixed in the calling code.

Guenter

> ---
>   drivers/hwmon/hwmon.c | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 33d5128..7c8d3cb 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -610,7 +610,7 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
>   
>   	hwdev->name = name;
>   	hdev->class = &hwmon_class;
> -	hdev->parent = dev;
> +	hdev->parent = dev->parent;
>   	hdev->of_node = dev ? dev->of_node : NULL;
>   	hwdev->chip = chip;
>   	dev_set_drvdata(hdev, drvdata);
> 
