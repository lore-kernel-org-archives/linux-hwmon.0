Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:54531 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934997AbcJXNJf (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 24 Oct 2016 09:09:35 -0400
Subject: Re: [PATCH] hwmon: (core) fix resource leak on devm_kcalloc failure
To: Colin King <colin.king@canonical.com>,
        Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
References: <20161023205608.11867-1-colin.king@canonical.com>
Cc: linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <5e1b6e81-c9a9-66dc-94c1-31c39def5129@roeck-us.net>
Date: Mon, 24 Oct 2016 06:09:27 -0700
MIME-Version: 1.0
In-Reply-To: <20161023205608.11867-1-colin.king@canonical.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 10/23/2016 01:56 PM, Colin King wrote:
> From: Colin Ian King <colin.king@canonical.com>
>
> If dev_kcalloc fails to allocate hw_dev->groups then the current
> exit path is a direct return, causing a leak of resources such
> as hwdev and ida is not removed.  Fix this by exiting via the
> free_hwmon exit path that performs the necessary resource cleanup.
>
> Signed-off-by: Colin Ian King <colin.king@canonical.com>

Good catch! Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/hwmon.c | 6 ++++--
>  1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index adae684..a74c075 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -536,8 +536,10 @@ __hwmon_device_register(struct device *dev, const char *name, void *drvdata,
>
>  		hwdev->groups = devm_kcalloc(dev, ngroups, sizeof(*groups),
>  					     GFP_KERNEL);
> -		if (!hwdev->groups)
> -			return ERR_PTR(-ENOMEM);
> +		if (!hwdev->groups) {
> +			err = -ENOMEM;
> +			goto free_hwmon;
> +		}
>
>  		attrs = __hwmon_create_attrs(dev, drvdata, chip);
>  		if (IS_ERR(attrs)) {
>

