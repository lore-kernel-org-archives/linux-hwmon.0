Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from mail-pf1-f195.google.com ([209.85.210.195]:36843 "EHLO
        mail-pf1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726885AbeKJIjq (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 10 Nov 2018 03:39:46 -0500
Date: Fri, 9 Nov 2018 14:57:00 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Nicolin Chen <nicoleotsuka@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 0/4] hwmon: (ina3221) Implement PM runtime to save
 power
Message-ID: <20181109225700.GA30816@roeck-us.net>
References: <20181105204843.4081-1-nicoleotsuka@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181105204843.4081-1-nicoleotsuka@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Nov 05, 2018 at 12:48:39PM -0800, Nicolin Chen wrote:
> This series patches implement PM runtime feature in the ina3221 hwmon
> driver (PATCH-4). However, PATCH-[1:3] are required to make sure that
> the PM runtime feature would be functional and safe.
> 

Series applied to hwmon-next.

Thanks,
Guenter

> Changelog
> v4->v5:
>  * Dropped the change for hwmon core; Shifted all the patch indexes
>  * Used i2c_client dev pointer for pm runtime callbacks (PATCH-4)
> v3->v4:
>  * Added generic pm runtime functions to hwmon class (PATCH-1)
>  * Updated to pass pm pointer via _with_info API (PATCH-5)
> v2->v3:
>  * Dropped timeout dev_err messages as it's indicated in errno (PATCH-4)
>  * Improved a dev_err message and comments (PATCH-5)
> v1->v2:
>  * Added device pointer check (PATCH-1)
>  * Returned 0 for alert flags (PATCH-2)
>  * Moved CVRF polling to data read routine (PATCH-4)
>  * Bypassed i2c_client->dev in suspend/resume() (PATCH-5)
> 
> Nicolin Chen (4):
>   hwmon: (ina3221) Check channel status for alarms attribute read
>   hwmon: (ina3221) Serialize sysfs ABI accesses
>   hwmon: (ina3221) Make sure data is ready before reading
>   hwmon: (ina3221) Add PM runtime support
> 
>  drivers/hwmon/ina3221.c | 190 +++++++++++++++++++++++++++++++++++-----
>  1 file changed, 166 insertions(+), 24 deletions(-)
> 
> -- 
> 2.17.1
> 
