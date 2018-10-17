Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:32946 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727014AbeJRDlp (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 17 Oct 2018 23:41:45 -0400
Date: Wed, 17 Oct 2018 12:44:30 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/5] hwmon: (core) Inherit power properties to hdev
Message-ID: <20181017194430.GA6812@roeck-us.net>
References: <20181017012426.26958-1-nicoleotsuka@gmail.com>
 <20181017012426.26958-2-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181017012426.26958-2-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Tue, Oct 16, 2018 at 06:24:22PM -0700, Nicolin Chen wrote:
> The new hdev is a child device related to the original parent
> hwmon driver and its device. However, it doesn't support the
> power features, typically being defined in the parent driver.
> 
> So this patch inherits three necessary power properties from
> the parent dev to hdev: power, pm_domain and driver pointers.
> 
> Note that the dev->driver pointer is the place that contains
> a dev_pm_ops pointer defined in the parent device driver and
> the pm runtime core also checks this pointer:
>        if (!cb && dev->driver && dev->driver->pm)
> 
> Signed-off-by: Nicolin Chen <nicoleotsuka@gmail.com>
> ---
>  drivers/hwmon/hwmon.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 975c95169884..7c064e1218ba 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -625,6 +625,9 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
>  	hwdev->name = name;
>  	hdev->class = &hwmon_class;
>  	hdev->parent = dev;
> +	hdev->driver = dev->driver;
> +	hdev->power = dev->power;
> +	hdev->pm_domain = dev->pm_domain;

dev can, unfortunately, be NULL

>  	hdev->of_node = dev ? dev->of_node : NULL;

... as you can see here.

Guenter

>  	hwdev->chip = chip;
>  	dev_set_drvdata(hdev, drvdata);
> -- 
> 2.17.1
> 
