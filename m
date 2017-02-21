Return-Path: <linux-hwmon-owner@vger.kernel.org>
Received: from bh-25.webhostbox.net ([208.91.199.152]:51797 "EHLO
        bh-25.webhostbox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751023AbdBUPnC (ORCPT
        <rfc822;linux-hwmon@vger.kernel.org>);
        Tue, 21 Feb 2017 10:43:02 -0500
Date: Tue, 21 Feb 2017 07:42:58 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Atsushi Nemoto <nemoto@toshiba-tops.co.jp>
Cc: linux-hwmon@vger.kernel.org, Jean Delvare <jdelvare@suse.com>,
        sato@toshiba-tops.co.jp
Subject: Re: [PATCH] hwmon: (w83627ehf) Use request_muxed_region
Message-ID: <20170221154258.GA14606@roeck-us.net>
References: <20170220.135014.415950098927632727.nemoto@toshiba-tops.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170220.135014.415950098927632727.nemoto@toshiba-tops.co.jp>
Sender: linux-hwmon-owner@vger.kernel.org
List-Id: linux-hwmon@vger.kernel.org

On Mon, Feb 20, 2017 at 01:50:14PM +0900, Atsushi Nemoto wrote:
> From: Katsumi Sato <sato@toshiba-tops.co.jp>
> 
> Serialize access to the hardware by using "request_muxed_region".
> Call to this macro will hold off the requestor if the resource is
> currently busy. "superio_enter" will return an error if call to
> "request_muxed_region" fails.
> 
> Signed-off-by: Katsumi Sato <sato@toshiba-tops.co.jp>
> Signed-off-by: Atsushi Nemoto <nemoto@toshiba-tops.co.jp>
> ---
>  drivers/hwmon/w83627ehf.c |   32 ++++++++++++++++++++++++++------
>  1 files changed, 26 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/w83627ehf.c b/drivers/hwmon/w83627ehf.c
> index 697007a..40cb8fa 100644
> --- a/drivers/hwmon/w83627ehf.c
> +++ b/drivers/hwmon/w83627ehf.c
> @@ -135,11 +135,16 @@ enum kinds {
>  	outb(ld, ioreg + 1);
>  }
>  
> -static inline void
> +static inline int
>  superio_enter(int ioreg)
>  {
> +	if (!request_muxed_region(ioreg, 2, DRVNAME))
> +		return -EBUSY;
> +
>  	outb(0x87, ioreg);
>  	outb(0x87, ioreg);
> +
> +	return 0;
>  }
>  
>  static inline void
> @@ -148,6 +153,7 @@ enum kinds {
>  	outb(0xaa, ioreg);
>  	outb(0x02, ioreg);
>  	outb(0x02, ioreg + 1);
> +	release_region(ioreg, 2);
>  }
>  
>  /*
> @@ -1970,7 +1976,10 @@ static void w82627ehf_swap_tempreg(struct w83627ehf_data *data,
>  		return;
>  	}
>  
> -	superio_enter(sio_data->sioreg);
> +	if (superio_enter(sio_data->sioreg)) {
> +		pr_err("%s: superio is busy!!\n", __func__);
> +		return;
> +	}

This is not good. It effectively ignores the error and does not
initialize the chip's fan configuration. Displaying a log message
doesn't improve the situation.

The best solution here would probably be to remove superio_enter/exit
from this function and move the superio_exit() call in the calling code
after the call to w83627ehf_check_fan_inputs().

>  
>  	/* fan4 and fan5 share some pins with the GPIO and serial flash */
>  	if (sio_data->kind == nct6775) {
> @@ -2352,7 +2361,11 @@ static int w83627ehf_probe(struct platform_device *pdev)
>  	w83627ehf_init_device(data, sio_data->kind);
>  
>  	data->vrm = vid_which_vrm();
> -	superio_enter(sio_data->sioreg);
> +
> +	err = superio_enter(sio_data->sioreg);
> +	if (err)
> +		goto exit_release;
> +
>  	/* Read VID value */
>  	if (sio_data->kind == w83667hg || sio_data->kind == w83667hg_b ||
>  	    sio_data->kind == nct6775 || sio_data->kind == nct6776) {
> @@ -2364,8 +2377,10 @@ static int w83627ehf_probe(struct platform_device *pdev)
>  		superio_select(sio_data->sioreg, W83667HG_LD_VID);
>  		data->vid = superio_inb(sio_data->sioreg, 0xe3);
>  		err = device_create_file(dev, &dev_attr_cpu0_vid);
> -		if (err)
> +		if (err) {
> +			superio_exit(sio_data->sioreg);
>  			goto exit_release;
> +		}
>  	} else if (sio_data->kind != w83627uhg) {
>  		superio_select(sio_data->sioreg, W83627EHF_LD_HWM);
>  		if (superio_inb(sio_data->sioreg, SIO_REG_VID_CTRL) & 0x80) {
> @@ -2401,8 +2416,10 @@ static int w83627ehf_probe(struct platform_device *pdev)
>  				data->vid &= 0x3f;
>  
>  			err = device_create_file(dev, &dev_attr_cpu0_vid);
> -			if (err)
> +			if (err) {
> +				superio_exit(sio_data->sioreg);
>  				goto exit_release;
> +			}
>  		} else {
>  			dev_info(dev,
>  				 "VID pins in output mode, CPU VID not available\n");
> @@ -2712,8 +2729,11 @@ static int __init w83627ehf_find(int sioaddr, unsigned short *addr,
>  
>  	u16 val;
>  	const char *sio_name;
> +	int err;
>  
> -	superio_enter(sioaddr);
> +	err = superio_enter(sioaddr);
> +	if (err)
> +		return err;
>  
>  	if (force_id)
>  		val = force_id;
> -- 
> 
> 
> --
> To unsubscribe from this list: send the line "unsubscribe linux-hwmon" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
