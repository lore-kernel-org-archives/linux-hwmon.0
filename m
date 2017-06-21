Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:55500 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751835AbdFUV4n (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 21 Jun 2017 17:56:43 -0400
Date: Wed, 21 Jun 2017 14:56:41 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Chris Sorenson <csoren@isd.net>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] w83627hf.c removed deprecated
Message-ID: <20170621215641.GA22878@roeck-us.net>
References: <f7bf84dc-5645-17f2-a3f0-7283373229ff@isd.net>
 <fd80e0df-cf35-fcfc-4d9d-fd6351f79b69@isd.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <fd80e0df-cf35-fcfc-4d9d-fd6351f79b69@isd.net>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jun 21, 2017 at 04:08:03PM -0500, Chris Sorenson wrote:
> Replaces a call to deprecated function hwmon_device_register() -----
> 
> Signed-off-by: Chris Sorenson <csoren@isd.net>
> 
> Changed to call hwmon_device_register_with_info() instead of
> hwmon_device_register(), which is deprecated.
> 
> modified:   drivers/hwmon/w83627hf.c
> 
> diff --git a/drivers/hwmon/w83627hf.c b/drivers/hwmon/w83627hf.c
> index 8ac89d0..fbc5d18 100644
> --- a/drivers/hwmon/w83627hf.c
> +++ b/drivers/hwmon/w83627hf.c
> @@ -1569,7 +1569,8 @@ static int w83627hf_probe(struct platform_device
> *pdev)
>                         goto error;
>         }
> 
> -       data->hwmon_dev = hwmon_device_register(dev);
> +       data->hwmon_dev =
> +               hwmon_device_register_with_info(dev, NULL, NULL, NULL,
> NULL);
>         if (IS_ERR(data->hwmon_dev)) {
>                 err = PTR_ERR(data->hwmon_dev);
>                 goto error;
> 

I'd rather have the deprecated message instead of a hack bypassing it.
Also, a real conversion to the new API is in the works for this driver.

So, thanks but no thanks. Let's wait for the real conversion.

Guenter
