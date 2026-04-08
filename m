Received: from todd.t-8ch.de (todd.t-8ch.de [159.69.126.157])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C89DF1F91D6;
	Wed,  8 Apr 2026 19:30:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=159.69.126.157
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775676632; cv=none; b=DFktzVPFSo21haHPj2k2vaHGa9o4C4MSOVNND1LsXl2F4kGbEp6sbu6IZZiGRD8sHYHFX/rBeBl/1JDozfpQ6asOD393rj0Jv2lUkDUt2cAW5cOxl9wVnoY7zqIZRmONK7OaZGSWrWsqISa28GQqE8/AL3UIlw2aLIMkkQQh86c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775676632; c=relaxed/simple;
	bh=4W+dOMeUiQFp6WxvTADcTR9OKtvny08W/wJCH3BrVMU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJuGUxHJzdVH6sbVOf7E0aV8prsoQ1CMyxFAyzte7+JeNNoRhYK6xBq43iQesXBZlt0Jyk8VzZWh0ApeJhfu2W/JPBK3CQzVDdH9+nUD2SW87XeIabZepOCkqCchMB0zaQOwtxwnsmSznImf1lxJF8+ZigKO5MNuJaxvkRAaN88=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net; spf=pass smtp.mailfrom=weissschuh.net; dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b=Wf4dxqsa; arc=none smtp.client-ip=159.69.126.157
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=weissschuh.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=weissschuh.net header.i=@weissschuh.net header.b="Wf4dxqsa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=weissschuh.net;
	s=mail; t=1775676628;
	bh=4W+dOMeUiQFp6WxvTADcTR9OKtvny08W/wJCH3BrVMU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wf4dxqsabr4RaQX+zYP4lK92LWZ6NZPYiKeKkNM5cBV54uqzDY5Bnixlh3eA8C5kE
	 bI6TMkQZxxWE5plHUrSpKDVTHpAc/q4t2kec127H7hMvs2UjPt2oUH9TFbKKbHgZZr
	 j9MTVsPFnHyVf0U16D6EQZb8CTOElgLewfuEoYCY=
Date: Wed, 8 Apr 2026 21:30:28 +0200
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <linux@weissschuh.net>
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>, 
	"linux@roeck-us.net" <linux@roeck-us.net>, "cosmo.chou@quantatw.com" <cosmo.chou@quantatw.com>, 
	"mail@carsten-spiess.de" <mail@carsten-spiess.de>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, 
	"david.laight.linux@gmail.com" <david.laight.linux@gmail.com>, Sanman Pradhan <psanman@juniper.net>, 
	"stable@vger.kernel.org" <stable@vger.kernel.org>
Subject: Re: [PATCH v3 3/3] hwmon: (powerz) Fix use-after-free and signal
 handling on USB disconnect
Message-ID: <fa22e0b7-f962-409d-8738-e06df1fb4b92@t-8ch.de>
References: <20260408163029.353777-1-sanman.pradhan@hpe.com>
 <20260408163029.353777-4-sanman.pradhan@hpe.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260408163029.353777-4-sanman.pradhan@hpe.com>

Hi Sanman,

thanks for these fixes!

On 2026-04-08 16:31:29+0000, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>

> Fix several issues in the powerz driver related to USB disconnect
> races and signal handling:

Please split this into two patches.
It has no downside and makes everything else easier.

Also given that the series fixes completely different things in
different drivers, they could be submitted without a series.
This will reduce the spam to maintainers of unrelated drivers.
Multiple patches to a single driver can stay in a series.

> 1. Use-after-free: When hwmon sysfs attributes are read concurrently
>    with USB disconnect, powerz_read() obtains a pointer to the
>    private data via usb_get_intfdata(), then powerz_disconnect() runs
>    and frees the URB while powerz_read_data() may still reference it.

powerz_read_data() is executed with the mutex held. powerz_disconnect()
will also take that mutex, so I don't see that race.

I do see the value of the urb = NULL assignment and the associated
check.

>    Fix by:
>    - Moving usb_set_intfdata() before hwmon registration so the
>      disconnect handler can always find the priv pointer.
>    - Clearing intfdata before taking the mutex and NULLing the
>      URB pointer in disconnect.
>    - Guarding powerz_read_data() with a !priv->urb check.

This also looks like it could be split into more patches.

> 2. Signal handling: wait_for_completion_interruptible_timeout()
>    returns -ERESTARTSYS on signal, 0 on timeout, or positive on
>    completion. The original code tests !ret, which only catches
>    timeout. On signal delivery (-ERESTARTSYS), !ret is false so the
>    function skips usb_kill_urb() and falls through, accessing
>    potentially stale URB data. Capture the return value and handle
>    both the signal (negative) and timeout (zero) cases explicitly.

What impact does the signal delivery have on URB validity?

> Fixes: 4381a36abdf1c ("hwmon: add POWER-Z driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> ---
> v3:
>  - No changes
> v2:
>  - Also fix signal handling in
>    wait_for_completion_interruptible_timeout()
>  - Return -ENODEV instead of -EIO on disconnected device
> 
>  drivers/hwmon/powerz.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/powerz.c b/drivers/hwmon/powerz.c
> index 4e663d5b4e33..0b38fdf42ddb 100644
> --- a/drivers/hwmon/powerz.c
> +++ b/drivers/hwmon/powerz.c
> @@ -108,6 +108,9 @@ static int powerz_read_data(struct usb_device *udev, struct powerz_priv *priv)
>  {
>  	int ret;
>  
> +	if (!priv->urb)
> +		return -ENODEV;

Ack.

> +
>  	priv->status = -ETIMEDOUT;
>  	reinit_completion(&priv->completion);
>  
> @@ -124,10 +127,11 @@ static int powerz_read_data(struct usb_device *udev, struct powerz_priv *priv)
>  	if (ret)
>  		return ret;
>  
> -	if (!wait_for_completion_interruptible_timeout
> -	    (&priv->completion, msecs_to_jiffies(5))) {
> +	ret = wait_for_completion_interruptible_timeout(&priv->completion,
> +							msecs_to_jiffies(5));

Should use a long type.

> +	if (ret <= 0) {
>  		usb_kill_urb(priv->urb);
> -		return -EIO;
> +		return ret ? ret : -EIO;
>  	}

If these cases are to be handled differently I  would just split this
check into two parts.

if (ret < 0) {
	usb_kill_urb(priv->urb);
	return ret;
}

if (ret == 0) {
	usb_kill_urb(priv->urb);
	return -EIO;
}

>  
>  	if (priv->urb->actual_length < sizeof(struct powerz_sensor_data))
> @@ -224,16 +228,17 @@ static int powerz_probe(struct usb_interface *intf,
>  	mutex_init(&priv->mutex);
>  	init_completion(&priv->completion);
>  
> +	usb_set_intfdata(intf, priv);

Ack.

> +
>  	hwmon_dev =
>  	    devm_hwmon_device_register_with_info(parent, DRIVER_NAME, priv,
>  						 &powerz_chip_info, NULL);
>  	if (IS_ERR(hwmon_dev)) {
> +		usb_set_intfdata(intf, NULL);

Is this really necessary? If the probing fails I would expect the
underlying subsystem to clean this up anyways.

>  		usb_free_urb(priv->urb);
>  		return PTR_ERR(hwmon_dev);
>  	}
>  
> -	usb_set_intfdata(intf, priv);
> -
>  	return 0;
>  }
>  
> @@ -241,9 +246,12 @@ static void powerz_disconnect(struct usb_interface *intf)
>  {
>  	struct powerz_priv *priv = usb_get_intfdata(intf);
>  
> +	usb_set_intfdata(intf, NULL);

Why is this necessary? The intfdata is allocated to the parent device,
so it should not become unavailable.

> +
>  	mutex_lock(&priv->mutex);
>  	usb_kill_urb(priv->urb);
>  	usb_free_urb(priv->urb);
> +	priv->urb = NULL;

Ack.

>  	mutex_unlock(&priv->mutex);
>  }
