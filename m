Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:46625 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751198AbdGMVsM (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Thu, 13 Jul 2017 17:48:12 -0400
Date: Thu, 13 Jul 2017 14:48:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
Cc: zbr@ioremap.net, linux-kernel@vger.kernel.org, jdelvare@suse.com,
        linux-hwmon@vger.kernel.org
Subject: Re: [PATCH linux v3 2/3] drivers: w1: refactor w1_slave_show to make
 the temp reading functionality separate
Message-ID: <20170713214810.GC32381@roeck-us.net>
References: <20170713210649.16188-1-jaghu@google.com>
 <20170713210649.16188-3-jaghu@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170713210649.16188-3-jaghu@google.com>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Thu, Jul 13, 2017 at 02:06:48PM -0700, Jaghathiswari Rankappagounder Natarajan wrote:
> Inside the w1_slave_show function refactor the code to read the temp
> into a separate function.
> 
> Signed-off-by: Jaghathiswari Rankappagounder Natarajan <jaghu@google.com>
> Acked-by: Evgeniy Polyakov <zbr@ioremap.net>

Acked-by: Guenter Roeck <linux@roeck-us.net>

> ---
> v2
> - no changes
> 
> v3
> - changed code so that the refcount is incremented with the bus mutex locked.
> 
>  drivers/w1/slaves/w1_therm.c | 82 +++++++++++++++++++++++++++-----------------
>  1 file changed, 51 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/w1/slaves/w1_therm.c b/drivers/w1/slaves/w1_therm.c
> index 82611f197b0a..64e6a8f38410 100644
> --- a/drivers/w1/slaves/w1_therm.c
> +++ b/drivers/w1/slaves/w1_therm.c
> @@ -64,6 +64,12 @@ struct w1_therm_family_data {
>  	atomic_t refcnt;
>  };
> 
> +struct therm_info {
> +	u8 rom[9];
> +	u8 crc;
> +	u8 verdict;
> +};
> +
>  /* return the address of the refcnt in the family data */
>  #define THERM_REFCNT(family_data) \
>  	(&((struct w1_therm_family_data *)family_data)->refcnt)
> @@ -427,33 +433,31 @@ static ssize_t w1_slave_store(struct device *device,
>  	return ret ? : size;
>  }
> 
> -static ssize_t w1_slave_show(struct device *device,
> -	struct device_attribute *attr, char *buf)
> +static ssize_t read_therm(struct device *device,
> +			  struct w1_slave *sl, struct therm_info *info)
>  {
> -	struct w1_slave *sl = dev_to_w1_slave(device);
>  	struct w1_master *dev = sl->master;
> -	u8 rom[9], crc, verdict, external_power;
> -	int i, ret, max_trying = 10;
> -	ssize_t c = PAGE_SIZE;
> +	u8 external_power;
> +	int ret, max_trying = 10;
>  	u8 *family_data = sl->family_data;
> 
>  	ret = mutex_lock_interruptible(&dev->bus_mutex);
>  	if (ret != 0)
> -		goto post_unlock;
> +		goto error;
> 
> -	if (!sl->family_data) {
> +	if (!family_data) {
>  		ret = -ENODEV;
> -		goto pre_unlock;
> +		goto mt_unlock;
>  	}
> 
>  	/* prevent the slave from going away in sleep */
>  	atomic_inc(THERM_REFCNT(family_data));
> -	memset(rom, 0, sizeof(rom));
> +	memset(info->rom, 0, sizeof(info->rom));
> 
>  	while (max_trying--) {
> 
> -		verdict = 0;
> -		crc = 0;
> +		info->verdict = 0;
> +		info->crc = 0;
> 
>  		if (!w1_reset_select_slave(sl)) {
>  			int count = 0;
> @@ -479,47 +483,69 @@ static ssize_t w1_slave_show(struct device *device,
>  				sleep_rem = msleep_interruptible(tm);
>  				if (sleep_rem != 0) {
>  					ret = -EINTR;
> -					goto post_unlock;
> +					goto dec_refcnt;
>  				}
> 
>  				ret = mutex_lock_interruptible(&dev->bus_mutex);
>  				if (ret != 0)
> -					goto post_unlock;
> +					goto dec_refcnt;
>  			} else if (!w1_strong_pullup) {
>  				sleep_rem = msleep_interruptible(tm);
>  				if (sleep_rem != 0) {
>  					ret = -EINTR;
> -					goto pre_unlock;
> +					goto dec_refcnt;
>  				}
>  			}
> 
>  			if (!w1_reset_select_slave(sl)) {
> 
>  				w1_write_8(dev, W1_READ_SCRATCHPAD);
> -				count = w1_read_block(dev, rom, 9);
> +				count = w1_read_block(dev, info->rom, 9);
>  				if (count != 9) {
>  					dev_warn(device, "w1_read_block() "
>  						"returned %u instead of 9.\n",
>  						count);
>  				}
> 
> -				crc = w1_calc_crc8(rom, 8);
> +				info->crc = w1_calc_crc8(info->rom, 8);
> 
> -				if (rom[8] == crc)
> -					verdict = 1;
> +				if (info->rom[8] == info->crc)
> +					info->verdict = 1;
>  			}
>  		}
> 
> -		if (verdict)
> +		if (info->verdict)
>  			break;
>  	}
> 
> +dec_refcnt:
> +	atomic_dec(THERM_REFCNT(family_data));
> +mt_unlock:
> +	mutex_unlock(&dev->bus_mutex);
> +error:
> +	return ret;
> +}
> +
> +static ssize_t w1_slave_show(struct device *device,
> +			     struct device_attribute *attr, char *buf)
> +{
> +	struct w1_slave *sl = dev_to_w1_slave(device);
> +	struct therm_info info;
> +	u8 *family_data = sl->family_data;
> +	int ret, i;
> +	ssize_t c = PAGE_SIZE;
> +	u8 fid = sl->family->fid;
> +
> +	ret = read_therm(device, sl, &info);
> +	if (ret)
> +		return ret;
> +
>  	for (i = 0; i < 9; ++i)
> -		c -= snprintf(buf + PAGE_SIZE - c, c, "%02x ", rom[i]);
> +		c -= snprintf(buf + PAGE_SIZE - c, c, "%02x ", info.rom[i]);
>  	c -= snprintf(buf + PAGE_SIZE - c, c, ": crc=%02x %s\n",
> -		      crc, (verdict) ? "YES" : "NO");
> -	if (verdict)
> -		memcpy(family_data, rom, sizeof(rom));
> +		      info.crc, (info.verdict) ? "YES" : "NO");
> +	if (info.verdict)
> +		memcpy(family_data, info.rom, sizeof(info.rom));
>  	else
>  		dev_warn(device, "Read failed CRC check\n");
> 
> @@ -528,14 +554,8 @@ static ssize_t w1_slave_show(struct device *device,
>  			      ((u8 *)family_data)[i]);
> 
>  	c -= snprintf(buf + PAGE_SIZE - c, c, "t=%d\n",
> -		w1_convert_temp(rom, sl->family->fid));
> +			w1_convert_temp(info.rom, fid));
>  	ret = PAGE_SIZE - c;
> -
> -pre_unlock:
> -	mutex_unlock(&dev->bus_mutex);
> -
> -post_unlock:
> -	atomic_dec(THERM_REFCNT(family_data));
>  	return ret;
>  }
> 
> --
> 2.13.2.932.g7449e964c-goog
> 
