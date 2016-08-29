Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57716 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756125AbcH2Ma5 (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 29 Aug 2016 08:30:57 -0400
Date: Mon, 29 Aug 2016 05:30:46 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-hwmon@vger.kernel.org,
        Alexander Kapshuk <alexander.kapshuk@gmail.com>,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 1/2] hwmon: (it87) Add missing sysfs attribute group
 terminator
Message-ID: <20160829123046.GA26130@roeck-us.net>
References: <20160829131823.776dd67b@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160829131823.776dd67b@endymion>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Aug 29, 2016 at 01:18:23PM +0200, Jean Delvare wrote:
> Attribute array it87_attributes_in lacks its NULL terminator,
> causing random behavior when operating on the attribute group.
> 
> Fixes: 52929715634a ("hwmon: (it87) Use is_visible for voltage sensors")
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: stable@vger.kernel.org

Applied.

Thanks,
Guenter

> ---
>  drivers/hwmon/it87.c |    1 +
>  1 file changed, 1 insertion(+)
> 
> --- linux-4.7.orig/drivers/hwmon/it87.c	2016-07-04 08:01:00.000000000 +0200
> +++ linux-4.7/drivers/hwmon/it87.c	2016-08-29 12:04:52.926911625 +0200
> @@ -2015,6 +2015,7 @@ static struct attribute *it87_attributes
>  	&sensor_dev_attr_in10_input.dev_attr.attr,	/* 41 */
>  	&sensor_dev_attr_in11_input.dev_attr.attr,	/* 41 */
>  	&sensor_dev_attr_in12_input.dev_attr.attr,	/* 41 */
> +	NULL
>  };
>  
>  static const struct attribute_group it87_group_in = {
> 
> 
> -- 
> Jean Delvare
> SUSE L3 Support
