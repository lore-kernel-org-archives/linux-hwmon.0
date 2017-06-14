Return-Path: <linux-hwmon-owner@vger.kernel.org>
Return-path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:57254 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751600AbdFNWip (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Wed, 14 Jun 2017 18:38:45 -0400
Date: Wed, 14 Jun 2017 15:38:43 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: zbr@ioremap.net, linux-kernel@vger.kernel.org, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH linux v1 1/3] drivers: w1: add hwmon support structures
Message-ID: <20170614223843.GB19172@roeck-us.net>
References: <20170614215944.24984-1-jaghu@google.com>
 <20170614215944.24984-2-jaghu@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170614215944.24984-2-jaghu@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Wed, Jun 14, 2017 at 02:59:42PM -0700, Jaghathiswari Rankappagounder Natarajan wrote:
> This patch has changes to w1.h/w1.c/w1_family.h generic files to
> add (optional) hwmon support structures
> 
> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
> Change-Id: I17f7c670e5cd7a3826add720ffa928c3e1aa0abc
> ---
>  drivers/w1/w1.c        | 20 +++++++++++++++++++-
>  drivers/w1/w1.h        |  2 ++
>  drivers/w1/w1_family.h |  2 ++
>  3 files changed, 23 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/w1/w1.c b/drivers/w1/w1.c
> index e213c678bbfe..e3efabccd284 100644
> --- a/drivers/w1/w1.c
> +++ b/drivers/w1/w1.c
> @@ -32,6 +32,7 @@
>  #include <linux/sched.h>
>  #include <linux/kthread.h>
>  #include <linux/freezer.h>
> +#include <linux/hwmon.h>
> 
>  #include <linux/atomic.h>
> 
> @@ -659,13 +660,30 @@ static int w1_family_notify(unsigned long action, struct w1_slave *sl)
>  				return err;
>  			}
>  		}
> -
> +#ifdef CONFIG_HWMON
> +		if (fops->hwmon_groups && sl->hwmon) {
> +			struct device *hwmon
> +				= hwmon_device_register_with_groups(&sl->dev,

You should really use hwmon_device_register_with_info().

Also, would devm_hwmon_device_register_with_info() work ?

> +						"w1_slave_temp", sl,
> +						fops->hwmon_groups);
> +			if (IS_ERR(hwmon)) {
> +				dev_warn(&sl->dev,
> +					 "could not create hwmon device\n");
> +			} else {
> +				sl->hwmon = hwmon;
> +			}
> +		}
> +#endif
>  		break;
>  	case BUS_NOTIFY_DEL_DEVICE:
>  		if (fops->remove_slave)
>  			sl->family->fops->remove_slave(sl);
>  		if (fops->groups)
>  			sysfs_remove_groups(&sl->dev.kobj, fops->groups);
> +#ifdef CONFIG_HWMON
> +		if (fops->hwmon_groups && sl->hwmon)
> +			hwmon_device_unregister(sl->hwmon);
> +#endif
>  		break;
>  	}
>  	return 0;
> diff --git a/drivers/w1/w1.h b/drivers/w1/w1.h
> index 129895f562b0..74ef1a543856 100644
> --- a/drivers/w1/w1.h
> +++ b/drivers/w1/w1.h
> @@ -83,6 +83,7 @@ struct w1_reg_num
>   * @family: module for device family type
>   * @family_data: pointer for use by the family module
>   * @dev: kernel device identifier
> + * @hwmon: pointer to hwmon device
>   *
>   */
>  struct w1_slave
> @@ -99,6 +100,7 @@ struct w1_slave
>  	struct w1_family	*family;
>  	void			*family_data;
>  	struct device		dev;
> +	struct device		*hwmon;
>  };
> 
>  typedef void (*w1_slave_found_callback)(struct w1_master *, u64);
> diff --git a/drivers/w1/w1_family.h b/drivers/w1/w1_family.h
> index 10a7a0767187..fc582df5c28e 100644
> --- a/drivers/w1/w1_family.h
> +++ b/drivers/w1/w1_family.h
> @@ -55,12 +55,14 @@ struct w1_slave;
>   * @add_slave: add_slave
>   * @remove_slave: remove_slave
>   * @groups: sysfs group
> + * @hwmon_groups: hwmon sysfs group
>   */
>  struct w1_family_ops
>  {
>  	int  (* add_slave)(struct w1_slave *);
>  	void (* remove_slave)(struct w1_slave *);
>  	const struct attribute_group **groups;
> +	const struct attribute_group **hwmon_groups;
>  };
> 
>  /**
> --
> 2.13.1.508.gb3defc5cc-goog
> 
