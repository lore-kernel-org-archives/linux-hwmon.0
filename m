Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:48358 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759380AbcLPDfy (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 15 Dec 2016 22:35:54 -0500
Subject: Re: [PATCH] hwmon: sch56xx: Remove unneeded linux/miscdevice.h
 include
To: Corentin Labbe <clabbe.montjoie@gmail.com>, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org
References: <20161215180814.24060-1-clabbe.montjoie@gmail.com>
Cc: linux-kernel@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <fe75bd4e-9c8e-d22b-07d8-4c73b0efea3d@roeck-us.net>
Date: Thu, 15 Dec 2016 19:35:52 -0800
MIME-Version: 1.0
In-Reply-To: <20161215180814.24060-1-clabbe.montjoie@gmail.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 12/15/2016 10:08 AM, Corentin Labbe wrote:
> drivers/hwmon/sch56xx-common.c does not contain any miscdevice so the
> inclusion of linux/miscdevice.h is uncessary.
>
> Signed-off-by: Corentin Labbe <clabbe.montjoie@gmail.com>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/hwmon/sch56xx-common.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/drivers/hwmon/sch56xx-common.c b/drivers/hwmon/sch56xx-common.c
> index 68c350c..bda3d52 100644
> --- a/drivers/hwmon/sch56xx-common.c
> +++ b/drivers/hwmon/sch56xx-common.c
> @@ -28,7 +28,6 @@
>  #include <linux/delay.h>
>  #include <linux/fs.h>
>  #include <linux/watchdog.h>
> -#include <linux/miscdevice.h>
>  #include <linux/uaccess.h>
>  #include <linux/slab.h>
>  #include "sch56xx-common.h"
>

