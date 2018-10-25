Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from linux-outbound-1.webhostbox.net ([207.174.213.190]:41789 "EHLO
        linux-outbound-1.webhostbox.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1725829AbeJYInP (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 25 Oct 2018 04:43:15 -0400
Date: Thu, 25 Oct 2018 00:13:01 +0000
Message-ID: <20181025001301.Horde.VCevVrrSs6rOyXT41xiPOzW@cp2.active-venture.com>
From: linux@roeck-us.net
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/5] hwmon: (core) Inherit power properties to hdev
References: <20181024193402.16698-1-nicoleotsuka@gmail.com>
 <20181024193402.16698-2-nicoleotsuka@gmail.com>
In-Reply-To: <20181024193402.16698-2-nicoleotsuka@gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed; DelSp=Yes
MIME-Version: 1.0
Content-Disposition: inline
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org


Quoting Nicolin Chen <nicoleotsuka@gmail.com>:

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
> Changelog
> v2->v3:
>  * N/A
> v1->v2:
>  * Added device pointers
>
>  drivers/hwmon/hwmon.c | 7 ++++++-
>  1 file changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index 975c95169884..14cfab64649f 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -625,7 +625,12 @@ __hwmon_device_register(struct device *dev,  
> const char *name, void *drvdata,
>  	hwdev->name = name;
>  	hdev->class = &hwmon_class;
>  	hdev->parent = dev;
> -	hdev->of_node = dev ? dev->of_node : NULL;
> +	if (dev) {
> +		hdev->driver = dev->driver;
> +		hdev->power = dev->power;
> +		hdev->pm_domain = dev->pm_domain;
> +		hdev->of_node = dev->of_node;
> +	}

We'l need to dig into this more; I suspect it may be inappropriate to do this.
With this change, every hwmon driver supporting (runtime ?) suspend/resume
will have the problem worked around in #5, and that just seems wrong.

Guenter

>  	hwdev->chip = chip;
>  	dev_set_drvdata(hdev, drvdata);
>  	dev_set_name(hdev, HWMON_ID_FORMAT, id);
> --
> 2.17.1
