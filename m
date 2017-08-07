Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:45331 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752555AbdHGJZx (ORCPT <rfc822;linux-hwmon@vger.kernel.org>);
        Mon, 7 Aug 2017 05:25:53 -0400
Message-ID: <1502097950.4007.82.camel@suse.de>
Subject: Re: [PATCH] hwmon: adt7475: wusbhc: constify attribute_group
 structures.
From: Jean Delvare <jdelvare@suse.de>
To: Arvind Yadav <arvind.yadav.cs@gmail.com>, linux@roeck-us.net
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Date: Mon, 07 Aug 2017 11:25:50 +0200
In-Reply-To: <b4f5a71ff727f2bbd16aee1494ecf07e208830d2.1502086709.git.arvind.yadav.cs@gmail.com>
References: <b4f5a71ff727f2bbd16aee1494ecf07e208830d2.1502086709.git.arvind.yadav.cs@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

Hi Arvind,

On lun., 2017-08-07 at 11:49 +0530, Arvind Yadav wrote:
> attribute_group are not supposed to change at runtime. All functions
> working with attribute_group provided by <linux/sysfs.h> work with
> const attribute_group. So mark the non-const structs as const.

Confused by the subject. What is "wusbhc:"?

Also please avoid trailing dot in mail subjects.

> Signed-off-by: Arvind Yadav <arvind.yadav.cs@gmail.com>
> ---
>  drivers/hwmon/adt7475.c | 16 ++++++++--------
>  1 file changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/hwmon/adt7475.c b/drivers/hwmon/adt7475.c
> index 1baa213..9ef8499 100644
> --- a/drivers/hwmon/adt7475.c
> +++ b/drivers/hwmon/adt7475.c
> @@ -1319,14 +1319,14 @@ static SENSOR_DEVICE_ATTR_2(pwm3_stall_disable, S_IRUGO | S_IWUSR,
>  	NULL
>  };
>  
> -static struct attribute_group adt7475_attr_group = { .attrs = adt7475_attrs };
> -static struct attribute_group fan4_attr_group = { .attrs = fan4_attrs };
> -static struct attribute_group pwm2_attr_group = { .attrs = pwm2_attrs };
> -static struct attribute_group in0_attr_group = { .attrs = in0_attrs };
> -static struct attribute_group in3_attr_group = { .attrs = in3_attrs };
> -static struct attribute_group in4_attr_group = { .attrs = in4_attrs };
> -static struct attribute_group in5_attr_group = { .attrs = in5_attrs };
> -static struct attribute_group vid_attr_group = { .attrs = vid_attrs };
> +static const struct attribute_group adt7475_attr_group = { .attrs = adt7475_attrs };
> +static const struct attribute_group fan4_attr_group = { .attrs = fan4_attrs };
> +static const struct attribute_group pwm2_attr_group = { .attrs = pwm2_attrs };
> +static const struct attribute_group in0_attr_group = { .attrs = in0_attrs };
> +static const struct attribute_group in3_attr_group = { .attrs = in3_attrs };
> +static const struct attribute_group in4_attr_group = { .attrs = in4_attrs };
> +static const struct attribute_group in5_attr_group = { .attrs = in5_attrs };
> +static const struct attribute_group vid_attr_group = { .attrs = vid_attrs };
>  
>  static int adt7475_detect(struct i2c_client *client,
>  			  struct i2c_board_info *info)

Looks good to me.

Reviewed-by: Jean Delvare <jdelvare@suse.de>

-- 
Jean Delvare
SUSE L3 Support
