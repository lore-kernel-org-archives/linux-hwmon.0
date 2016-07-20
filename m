Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:55436 "EHLO
	bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753968AbcGTONs (ORCPT
	<rfc822;linux-hwmon@vger.kernel.org>);
	Wed, 20 Jul 2016 10:13:48 -0400
Subject: Re: [PATCH -next] hwmon: Remove unused including <linux/version.h>
To: Wei Yongjun <weiyj_lk@163.com>, Jean Delvare <jdelvare@suse.com>
References: <1469016376-20327-1-git-send-email-weiyj_lk@163.com>
Cc: Wei Yongjun <weiyj.lk@gmail.com>, linux-hwmon@vger.kernel.org
From: Guenter Roeck <linux@roeck-us.net>
Message-ID: <578F870B.3030405@roeck-us.net>
Date: Wed, 20 Jul 2016 07:13:31 -0700
MIME-Version: 1.0
In-Reply-To: <1469016376-20327-1-git-send-email-weiyj_lk@163.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On 07/20/2016 05:06 AM, Wei Yongjun wrote:
> From: Wei Yongjun <weiyj.lk@gmail.com>
>
> Remove including <linux/version.h> that don't need it.
>
> Signed-off-by: Wei Yongjun <weiyj.lk@gmail.com>

Applied. Going forward, please remember to put the affected driver
into the subject line.

Thanks,
Guenter

> ---
>   drivers/hwmon/ftsteutates.c | 1 -
>   1 file changed, 1 deletion(-)
>
> diff --git a/drivers/hwmon/ftsteutates.c b/drivers/hwmon/ftsteutates.c
> index aaef5b5..2b2ff67 100644
> --- a/drivers/hwmon/ftsteutates.c
> +++ b/drivers/hwmon/ftsteutates.c
> @@ -27,7 +27,6 @@
>   #include <linux/slab.h>
>   #include <linux/sysfs.h>
>   #include <linux/uaccess.h>
> -#include <linux/version.h>
>   #include <linux/watchdog.h>
>
>   #define FTS_DEVICE_ID_REG		0x0000
>
>
>
>
>

