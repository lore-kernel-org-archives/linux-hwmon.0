Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:33643 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932863AbcH2Med (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 29 Aug 2016 08:34:33 -0400
Date: Mon, 29 Aug 2016 05:34:32 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-hwmon@vger.kernel.org,
        Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Subject: Re: [PATCH 2/2] hwmon: (it87) Drop useless comments
Message-ID: <20160829123432.GA27794@roeck-us.net>
References: <20160829131823.776dd67b@endymion>
 <20160829133329.5c66af98@endymion>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20160829133329.5c66af98@endymion>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Aug 29, 2016 at 01:33:29PM +0200, Jean Delvare wrote:
> Remove the index comments at the end of it87_attributes_in. They
> serve no purpose (as there is no reference to them in
> it87_in_is_visible) and some of them were obviously wrong.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>
> Cc: Martin Blumenstingl <martin.blumenstingl@googlemail.com>
> Cc: Guenter Roeck <linux@roeck-us.net>

Applied to -next.

Thanks,
Guenter

> ---
>  drivers/hwmon/it87.c |    8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> --- linux-4.7.orig/drivers/hwmon/it87.c	2016-08-29 12:04:52.926911625 +0200
> +++ linux-4.7/drivers/hwmon/it87.c	2016-08-29 13:11:57.311949805 +0200
> @@ -2011,10 +2011,10 @@ static struct attribute *it87_attributes
>  	&sensor_dev_attr_in7_beep.dev_attr.attr,	/* 39 */
>  
>  	&sensor_dev_attr_in8_input.dev_attr.attr,	/* 40 */
> -	&sensor_dev_attr_in9_input.dev_attr.attr,	/* 41 */
> -	&sensor_dev_attr_in10_input.dev_attr.attr,	/* 41 */
> -	&sensor_dev_attr_in11_input.dev_attr.attr,	/* 41 */
> -	&sensor_dev_attr_in12_input.dev_attr.attr,	/* 41 */
> +	&sensor_dev_attr_in9_input.dev_attr.attr,
> +	&sensor_dev_attr_in10_input.dev_attr.attr,
> +	&sensor_dev_attr_in11_input.dev_attr.attr,
> +	&sensor_dev_attr_in12_input.dev_attr.attr,
>  	NULL
>  };
>  
> 
> -- 
> Jean Delvare
> SUSE L3 Support
