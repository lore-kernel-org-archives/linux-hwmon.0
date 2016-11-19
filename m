Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:49742 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752520AbcKSQ3s (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Sat, 19 Nov 2016 11:29:48 -0500
Date: Sat, 19 Nov 2016 08:29:45 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Clemens Gruber <clemens.gruber@pqgruber.com>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        linux-kernel@vger.kernel.org
Subject: Re: [v3,3/3] hwmon: (mcp3021) replace S_IRUGO with 0444
Message-ID: <20161119162945.GA15441@roeck-us.net>
References: <20161109171614.9730-2-clemens.gruber@pqgruber.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161109171614.9730-2-clemens.gruber@pqgruber.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Nov 09, 2016 at 06:16:14PM +0100, Clemens Gruber wrote:
> Replace S_IRUGO with the better readable 0444.
> This fixes a checkpatch warning.
> 
> Signed-off-by: Clemens Gruber <clemens.gruber@pqgruber.com>

Applied to -next.

Guenter

> ---
>  drivers/hwmon/mcp3021.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/mcp3021.c b/drivers/hwmon/mcp3021.c
> index 81f4b7f..3a007ab 100644
> --- a/drivers/hwmon/mcp3021.c
> +++ b/drivers/hwmon/mcp3021.c
> @@ -102,7 +102,7 @@ static ssize_t show_in_input(struct device *dev, struct device_attribute *attr,
>  	return sprintf(buf, "%d\n", in_input);
>  }
>  
> -static DEVICE_ATTR(in0_input, S_IRUGO, show_in_input, NULL);
> +static DEVICE_ATTR(in0_input, 0444, show_in_input, NULL);
>  
>  static int mcp3021_probe(struct i2c_client *client,
>  				const struct i2c_device_id *id)
