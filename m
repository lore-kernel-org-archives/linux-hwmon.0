Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:43387 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752926AbdGHP4k (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>); Sat, 8 Jul 2017 11:56:40 -0400
Date: Sat, 8 Jul 2017 08:56:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: hwmon: adc128d818: constify attribute_group structures.
Message-ID: <20170708155637.GA2316@roeck-us.net>
References: <ea988b4603caf53fa8a1174edf55fcebf604d598.1499232082.git.arvind.yadav.cs@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea988b4603caf53fa8a1174edf55fcebf604d598.1499232082.git.arvind.yadav.cs@gmail.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jul 05, 2017 at 10:52:13AM +0530, Arvind Yadav wrote:
> attribute_groups are not supposed to change at runtime. All functions
> working with attribute_groups provided by <linux/sysfs.h> work with const
> attribute_group. So mark the non-const structs as const.
> 
> File size before:
>    text	   data	    bss	    dec	    hex	filename
>    2304	   2936	      0	   5240	   1478	drivers/hwmon/adc128d818.o
> 
> File size After adding 'const':
>    text	   data	    bss	    dec	    hex	filename
>    2344	   2872	      0	   5216	   1460	drivers/hwmon/adc128d818.o
> 
> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>

Applied to hwmon-next.

Thanks,
Guenter

> ---
>  drivers/hwmon/adc128d818.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/adc128d818.c b/drivers/hwmon/adc128d818.c
> index a557b46..bd2ca31 100644
> --- a/drivers/hwmon/adc128d818.c
> +++ b/drivers/hwmon/adc128d818.c
> @@ -384,7 +384,7 @@ static SENSOR_DEVICE_ATTR(temp1_max_hyst, S_IWUSR | S_IRUGO,
>  	NULL
>  };
>  
> -static struct attribute_group adc128_group = {
> +static const struct attribute_group adc128_group = {
>  	.attrs = adc128_attrs,
>  	.is_visible = adc128_is_visible,
>  };
