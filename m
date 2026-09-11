Received: from mail-pj2-f13.google.com (mail-pj2-f13.google.com [74.125.227.141])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 322794A4EF0
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 21:46:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.141
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789163217; cv=none; b=ks/XcAXlLVzzbc6NnD3PK7mwoIZjoOopqrTeOAmUER69ryJ7hUdg6eKeXVj4wERumRJU0S214PwMNOBoZWSnYG/755F1KIcOn5sBrZxDqeRgaP/aKYCAfbCU5VV6SN9ojVvV9bhYLAoUM7eu3JCELCS8Bnm9+vEm/GQgRvIRvTA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789163217; c=relaxed/simple;
	bh=PiaKAyD7d+00pfdZ8SrbGYWHzdANSMetJuvQBoxbsXw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T6bYm7B1X6iykKQaPUA1pxV0V7DTglsGMT+aXHznIxssG0iEkKQWONBgReXfhpXeKBzSsXoD8tZID71KL4Q+RBPi5OLMchxE0ZcR3eHDLRZ6uA/9+xAEHGX2hsY2R4EgEbYUIkQQdEtlwPHZ/vEr7E/ZWd7Z5TfDG8SQh1g8yO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bkUrAZH/; arc=none smtp.client-ip=74.125.227.141
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bkUrAZH/"
Received: by mail-pj2-f13.google.com with SMTP id 98e67ed59e1d1-396ccafb74fso275507a91.3
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 14:46:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789163215; x=1789768015; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CvF6mXV4/o8ZVJXR1oq5jFHP/ZPq+7AJoMWbWxqY8mo=;
        b=bkUrAZH/qds+Ws9yZnIK6TXBuUT1YkjzdzB48Zkdd1etRDYChRU5os0IvbUI4DCgf+
         gqRK2AWnRisK69KoHRL3fPwym9YBS0tW0AZs59jV1TkbmsykIdDO19iNDhNkEsx0W3If
         EOrrDUvGJH6shlCkzqyesXpic9t9ggHTKw1pB5lBUqZ1LTbsqR9SbLMKwHq81NI5Jwiu
         ETGzLR4YYV4B8iWP7xHoToaMcla18RWHDUPO8fsgKDU0NSfMoRa7rVlmZR97TQzgjtCW
         DEUEh5SzadzYm6izRzhNZ5F2OJ9C+vezY2D4O+2Pbr8v/d+UQIU3v2HYD/gGn3qgpFad
         HgFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789163215; x=1789768015;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CvF6mXV4/o8ZVJXR1oq5jFHP/ZPq+7AJoMWbWxqY8mo=;
        b=YbdWbNdB7X8D2RFsPKfpnM3bpDS5ZIdFc54c7bSig7IZQ3OEGGZAbLHIF9itMycS8r
         t1dj9wzD03IZfhEB3E+X11ccE/I5eF+xGAO9JxmT4CxRpSFJgoVNbFU5iTvMnGkt1/X9
         MmwSNRc2//RarcN/lvo+jV30aruEvTBxYuL0QBLFfJDSUUxujRR558toQKBukUedrKr5
         XtsN6iou6Kh1XjixqbDFyTCSBl6LbN+V0Y0Dy/PGSaLV9myqr+dAzqIrr0dJVEpbJgfa
         JRGqOHE0xQ8CnZHjmROVZGhEY+0Rhw1elVkqi37QDEjzMyWDFtGqtjfy6e2xDuY8bSGa
         vFdg==
X-Gm-Message-State: AFuF++kkZuFjH9aCeFOufE1XA5BIBf2Qc1mjqeMudeLulAQhtM6GzL3y
	6zCPrw4rYH6ERW5J1KoYDZMfoF0i0t8tlmZkPWtoHbBK/CQSu/7EgAqr
X-Gm-Gg: AYBFou30qo7G470w7k7wMmJiQObh4PCO6aM/9R7IsOVFBOLiHLkgfmhWKa/vCwZ0Iqu
	LGqhulJvJ9JBnETaS7yDUJfbP3Vnz0tYLP8GZMUqWSdl06EmZXjlz/CWWsvRbsXVXDL+iNgveWO
	T9YT1vZf/4nT2AtbHkVceYjbY0o58pabSswLj7wfH0pUkBKiiXz6HZ14+1LxcF0HWYjERQ/IY3j
	yupzCV4H1+bJi2qP23RUUr17RGCpKONIZ8DzIz/urQR4lFOEIFt3Xo33ptZBauGT2n74JhOZpUC
	zV4U9wXUsOY6CVffnCfgKc13PWnSoPgLiA7T7ctU8LQH7XSCXsqx0j3AlFvRWOECpHY7Q9snVw3
	vgQU/e5ITk3s85CxJvsUvxNCKxjZnGUsODgT4ibkCvw+OJT6YzIG8yfGOFYK4VX5/SuwsQq6nX3
	2qDvhpXCF4PK8hsqo/40+yFpOUPrp3svwtMACQ73vKKZMr1HIli3gosaJpRj0hqj2q/z5E48nVo
	pIdUEuJ+T52e+rcyfAfvUI=
X-Received: by 2002:a17:90b:548f:b0:392:b509:b1a5 with SMTP id 98e67ed59e1d1-39d9c1db3d4mr10747178a91.14.1789163215212;
        Fri, 11 Sep 2026 14:46:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-14365bb6ba0sm8657061c88.15.2026.09.11.14.46.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 14:46:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 11 Sep 2026 14:46:53 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: marco.rodolfi@tuta.io
Cc: Linux Hwmon <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH] arctic_fan_controller: Add a way to set a default value
 state on kernel bootup
Message-ID: <5684d0e8-9ac9-48e3-9f81-3c7c9b63d65a@roeck-us.net>
References: <P1G6-or--F-9@tuta.io>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <P1G6-or--F-9@tuta.io>

On Fri, Sep 11, 2026 at 05:36:13PM +0200, marco.rodolfi@tuta.io wrote:
> This allows to quickly set the connected fan(s) speed on bootup to a 
> sensible value, rather than the randomly initialized values as the 
> default behavior was.
> 
> Signed-off-by: Marco Rodolfi <marco.rodolfi@tuta.io>

This patch is corrupted. On top of that, it has various checkpatch issues
which could easily be discovered by running checkpatch. On top of that, it
conflicts with a patch that I just accepted, which sets the default speed
to 40%. I think that is sufficient.

Anything further should explore the possibility of caching the current
values prior to suspend and restoring it on resume. I do not see the need
for module parameters.

Thanks,
Guenter


> ---
> arctic_fan_controller.c | 34 ++++++++++++++++++++++++++++------
> 1 file changed, 28 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/arctic_fan_controller.c b/drivers/hwmon/arctic_fan_controller.c
> index 75cc78d..00ca803 100644
> --- a/drivers/hwmon/arctic_fan_controller.c
> +++ b/drivers/hwmon/arctic_fan_controller.c
> @@ -17,6 +17,7 @@
> #include <linux/jiffies.h>
> #include <linux/minmax.h>
> #include <linux/module.h>
> +#include <linux/moduleparam.h>
> #include <linux/spinlock.h>
> #include <linux/string.h>
> #include <linux/unaligned.h>
> @@ -36,6 +37,14 @@
>   */
> #define ARCTIC_ACK_TIMEOUT_MS		1000
>  
> +static int all_fan_default = 100;
> +module_param(all_fan_default, int, 0);
> +MODULE_PARM_DESC(all_fan_default, "This parameter controls the default value that the fan(s) will have once the module is loaded. The default is 100/255 (which correspond to 50%).");
> +
> +static int fanx_default[ARCTIC_NUM_FANS] = {-1, -1, -1, -1, -1, -1, -1, -1, -1, -1};
> +module_param_array(fanx_default, int, NULL, 0);
> +MODULE_PARM_DESC(fanx_default, "This parameter controls the default value that each individual fan will have once the module is loaded. This parameter takes precedence over the global default. If you don't want to set a default speed for a specific fan, specify -1 in the array. The default is -1 for all fans in the array (so use the global default for all of them).");
> +
> struct arctic_fan_data {
> struct hid_device *hdev;
> struct device *hwmon_dev;	/* stored for explicit unregister in remove() */
> @@ -254,16 +263,20 @@ static int arctic_fan_reset_resume(struct hid_device *hdev)
> {
> struct arctic_fan_data *priv = hid_get_drvdata(hdev);
> unsigned long flags;
> +	int i;
>  
> /*
> * The device resets its PWM channels to hardware defaults on power
> -	 * loss during suspend. Clear the cached duty values so they reflect
> -	 * the unknown hardware state, consistent with probe-time behaviour
> -	 * (the device has no GET_REPORT support). Hold in_report_lock so
> -	 * this does not race with a concurrent pwm read or write callback.
> +	 * loss during suspend. Set the requested default state again to
> +	 * reconfigure the hardware correctly. Hold in_report_lock so this
> +	 * does not race with a concurrent pwm read or write callback.
> */
> spin_lock_irqsave(&priv->in_report_lock, flags);
> -	memset(priv->pwm_duty, 0, sizeof(priv->pwm_duty));
> +	for (i = 0; i < ARCTIC_NUM_FANS; i++) {
> +		int speed_selected = fanx_default[i] == -1 ? all_fan_default : fanx_default[i];
> +
> +		arctic_fan_write(&hdev->dev, hwmon_pwm, hwmon_pwm_input, i, speed_selected);
> +	}
> spin_unlock_irqrestore(&priv->in_report_lock, flags);
> return 0;
> }
> @@ -272,7 +285,7 @@ static int arctic_fan_probe(struct hid_device *hdev,
>     const struct hid_device_id *id)
> {
> struct arctic_fan_data *priv;
> -	int ret;
> +	int ret, i;
>  
> if (!hid_is_usb(hdev))
> return -ENODEV;
> @@ -317,6 +331,17 @@ static int arctic_fan_probe(struct hid_device *hdev,
> priv->hwmon_dev = hwmon_device_register_with_info(&hdev->dev, "arctic_fan",
>   priv, &arctic_fan_chip_info,
>   NULL);
> +	/*
> +	 * Check which fan default value to use, chosen between the array of fan(s)
> +	 * values or the default fans value (first takes precedence) and write the
> +	 * corresponding value to the hardware.
> +	 */
> +	for (i = 0; i < ARCTIC_NUM_FANS; i++) {
> +		int speed_selected = fanx_default[i] == -1 ? all_fan_default : fanx_default[i];
> +
> +		arctic_fan_write(&hdev->dev, hwmon_pwm, hwmon_pwm_input, i, speed_selected);
> +	}
> +
> if (IS_ERR(priv->hwmon_dev)) {
> ret = PTR_ERR(priv->hwmon_dev);
> goto out_close;
