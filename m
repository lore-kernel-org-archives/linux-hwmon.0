Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:39264 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752855AbdGHPxY (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 8 Jul 2017 11:53:24 -0400
Date: Sat, 8 Jul 2017 08:53:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: hwmon: constify attribute_group structures.
Message-ID: <20170708155321.GA12187@roeck-us.net>
References: <916222c47f3f47d11b6fca5b0ad2e8a7384ddcc2.1499230740.git.arvind.yadav.cs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <916222c47f3f47d11b6fca5b0ad2e8a7384ddcc2.1499230740.git.arvind.yadav.cs@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jul 05, 2017 at 10:31:05AM +0530, Arvind Yadav wrote:
> attribute_groups are not supposed to change at runtime. All functions
> working with attribute_groups provided by <linux/sysfs.h> work with const
> attribute_group. So mark the non-const structs as const.
> 
> File size before:
>    text	   data	    bss	    dec	    hex	filename
>    6655	    304	      0	   6959	   1b2f	drivers/hwmon/hwmon.o
> 
> File size After adding 'const':
>    text	   data	    bss	    dec	    hex	filename
>    6703	    240	      0	   6943	   1b1f	drivers/hwmon/hwmon.o
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/hwmon.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/hwmon.c b/drivers/hwmon/hwmon.c
> index dd6e17c..2ac578a 100644
> --- a/drivers/hwmon/hwmon.c
> +++ b/drivers/hwmon/hwmon.c
> @@ -85,7 +85,7 @@ static umode_t hwmon_dev_name_is_visible(struct kobject *kobj,
>  	return attr->mode;
>  }
>  
> -static struct attribute_group hwmon_dev_attr_group = {
> +static const struct attribute_group hwmon_dev_attr_group = {
>  	.attrs		= hwmon_dev_attrs,
>  	.is_visible	= hwmon_dev_name_is_visible,
>  };
