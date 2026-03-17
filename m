Received: from mail-dy1-f173.google.com (mail-dy1-f173.google.com [74.125.82.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B94C2DA75C
	for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 15:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773763110; cv=none; b=JUYQwCPsILq2hQ9HqBhciQWMS1CQuN8SAs1qYm9xEaOwvx6Z9aupbHydPx+tiAt4BbHcei6tE7vSyDN/uBfucx8rOvAzGrH0fLQPxSBRBNtitPz23+ckX1vBTlcRk21ZNd2YVTHuFpC1fPwGRb1/U90oitM60bmqkROXj/0XdBg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773763110; c=relaxed/simple;
	bh=vRG9qYtTGKnk4PZ/yhXY6tDMhj3du2zVk9Jue96rtag=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TBjOOmYG0dW5iAW9KKtpQls0Hyc3MuTFWMJDMSW6alSwV8xzbU3SS9BHmYSWZ0pmx8jVeNZ60TwvUjl34GNwFx9ScG1N+Z3d9ERdsBrFd0j7tfMRt1m4B4dyu51LEOl1zHg+WFTUEsQoh2/MWzNQwbwVgBXYT54IpjLykfPIvj8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mpsb1khp; arc=none smtp.client-ip=74.125.82.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mpsb1khp"
Received: by mail-dy1-f173.google.com with SMTP id 5a478bee46e88-2c0c955a481so677664eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 17 Mar 2026 08:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773763108; x=1774367908; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GQwIT8KflzB8EJJH88RamnpudhnIxY4vpJh0tAXPQbE=;
        b=Mpsb1khpkiPhpGYCnOrg4jYI6pkoTIUvr/DoQdYFApNk/Yfl2qlr5VP8j3rrdEah11
         8vuJqGHFDDhA/uIebjleawHoBrYOmpbTqODDVuhN5wP14zESBEY7zRDLULhurJskDXR1
         I2kMKzoS1sDAXk+WR+YINLHtz2r/h6A/Na/af/hBruKomy81T6ONq969yvddl3A7ydXF
         pyrMNlQ67hEEOtZdTQzOvZ4XbmMwjH94gl+eoeUMwP3WUZbrt8WzQsochuNkFvYNuI4w
         KlJVEoR7RwYNCXHh9ELGpzOhe+9OH0Lm40+0GCVdaQ8cPYzuMmwSCvDkxtr9EhZbyzQJ
         MZvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773763108; x=1774367908;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=GQwIT8KflzB8EJJH88RamnpudhnIxY4vpJh0tAXPQbE=;
        b=BkrpzoYFOwSjdolvYHNAJqizUUer3tPjUO5hYmLPAMx2DdqeTiQ8FWpfpV8QU7WBNs
         x3lZ+Af1s1J7JRRmQwtzqSMOnzX9EUde7kjQNXVnuLF3uPUVoXqK/stgWzzJ0cjIbKYB
         /YttVA7DtC78BNinbUvLp7nbAc87LpCY6kCyDkAA/sH2xVoUzEQTpHhKbXVYZiUpZEDY
         nnwxSjjG3FHYmLIcoRxc7MA7u8OrCPf2iUnqEOGUdn++Yfdko8hRHFk+zQOO+m6gJx7K
         Z+bBob5r31BCffnC9SAY4QuLYSmdfuQRSXnd4+0mlG/ntBuxLGppcr+eWwQzwHdSNMSk
         39Mw==
X-Gm-Message-State: AOJu0YyjOJgyLUY41WX4Icpww4L5LRdA1rFVRi5iCOz7uRI2xxwtByEB
	9Fpi7ZUfel3ouHOWmMRJEvDzffmu2hHweIrPEWpGhwyIiBz3kkyAte01Ni6V3w==
X-Gm-Gg: ATEYQzyWq3Z16cE+LB4auvxmqpU/8L0GZXUAgDJAqbbaJ/b4YXivqIl3vImr2cXYkfY
	W/NVdOk9rjDaYb+/8x0Axd+ms9qRA6IQIuywSL6/m0W/xH+nKwnUnIyJMW02wwlV+ngnHO97wdV
	e2IRrkTiUWKKVhQLeqg3kcbwuUScLNUrxa3dHWR9/NcvEiWq3t/nYfHQZoSFmmsd0kTbEltPYSJ
	R8CNg0P/J6SZkvUrreOGXytSoaBxibvuYqSDTHMo+R+hmnPbF3fPD3KFULnEpVL9loi2YzjABcL
	bUPks6vSxYczR4Ljfdeupp6iFkLKvEbH/b2FkXhvCQMAJAbMPSzZCIBd5dctj8SK/ZZZCNNB6jE
	lXa9x9QsbMm6sEgOiWFMgW6NcCvjGn3DyQvXd0nx0v/lo7RnzEXmO3gFNG715YI8qBBrLO6MX2l
	KQmK6uxIzjoEhVQJU/qZwCBCF/XYy+1H4DCZyV
X-Received: by 2002:a05:7301:578a:b0:2ba:6d87:cf6e with SMTP id 5a478bee46e88-2bea541a90cmr7734525eec.4.1773763108311;
        Tue, 17 Mar 2026 08:58:28 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0b3f02ee3sm13661960eec.16.2026.03.17.08.58.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 Mar 2026 08:58:27 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 17 Mar 2026 08:58:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Markus Hoffmann <markus@thehoffs.at>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: (it87) Add support for IT8689E
Message-ID: <8fdb9bd3-5ee9-4ee2-a55d-eafe5b986217@roeck-us.net>
References: <20260309223103.175443-1-markus@thehoffs.at>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260309223103.175443-1-markus@thehoffs.at>

On Mon, Mar 09, 2026 at 10:31:03PM +0000, Markus Hoffmann wrote:
> Add support for the ITE IT8689E Super I/O chip. The IT8689E supports
> newer autopwm, 12mV ADC, 16-bit fans, six fans, six PWM channels,
> PWM frequency 2, six temperature inputs, and AVCC3.
> 
> Signed-off-by: Markus Hoffmann <markus@thehoffs.at>

Feedback from AI review (https://sashiko.dev/#/patchset/20260309223103.175443-1-markus%40thehoffs.at) inline.

Please address.

Thanks,
Guenter

> ---
>  drivers/hwmon/it87.c | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index e233aafa8..dd136bd94 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -16,6 +16,7 @@
>   *            IT8622E  Super I/O chip w/LPC interface
>   *            IT8623E  Super I/O chip w/LPC interface
>   *            IT8628E  Super I/O chip w/LPC interface
> + *            IT8689E  Super I/O chip w/LPC interface
>   *            IT8705F  Super I/O chip w/LPC interface
>   *            IT8712F  Super I/O chip w/LPC interface
>   *            IT8716F  Super I/O chip w/LPC interface
> @@ -64,7 +65,7 @@
>  
>  enum chips { it87, it8712, it8716, it8718, it8720, it8721, it8728, it8732,
>  	     it8771, it8772, it8781, it8782, it8783, it8786, it8790,
> -	     it8792, it8603, it8620, it8622, it8628, it87952 };
> +	     it8792, it8603, it8620, it8622, it8628, it8689, it87952 };
>  
>  static struct platform_device *it87_pdev[2];
>  
> @@ -162,6 +163,7 @@ static inline void superio_exit(int ioreg, bool noexit)
>  #define IT8622E_DEVID 0x8622
>  #define IT8623E_DEVID 0x8623
>  #define IT8628E_DEVID 0x8628
> +#define IT8689E_DEVID 0x8689
>  #define IT87952E_DEVID 0x8695
>  
>  /* Logical device 4 (Environmental Monitor) registers */
> @@ -502,6 +504,14 @@ static const struct it87_devices it87_devices[] = {
>  		  | FEAT_SIX_TEMP | FEAT_VIN3_5V | FEAT_FANCTL_ONOFF,
>  		.peci_mask = 0x07,
>  	},
> +	[it8689] = {
> +		.name = "it8689",
> +		.model = "IT8689E",
> +		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
> +		  | FEAT_SIX_FANS | FEAT_IN7_INTERNAL | FEAT_SIX_PWM
> +		  | FEAT_PWM_FREQ2 | FEAT_SIX_TEMP | FEAT_AVCC3,
> +		.smbus_bitmap = BIT(1) | BIT(2),
> +	},
>  	[it87952] = {
>  		.name = "it87952",
>  		.model = "IT87952E",
> @@ -2785,6 +2795,9 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>  	case IT8628E_DEVID:
>  		sio_data->type = it8628;
>  		break;
> +	case IT8689E_DEVID:
> +		sio_data->type = it8689;
> +		break;
>  	case IT87952E_DEVID:
>  		sio_data->type = it87952;
>  		break;

Does this patch introduce a regression by omitting it8689 from the GPIO pin
multiplexing checks later in it87_find()?
Looking at the code, chips with 6 fans and AVCC like it8620 and it8628 have
explicit checks to disable unrouted pins:
	} else if (sio_data->type == it8620 || sio_data->type == it8628) {
		int reg;
		superio_select(sioaddr, GPIO);
		/* Check for pwm5 */
		reg = superio_inb(sioaddr, IT87_SIO_GPIO1_REG);
		if (reg & BIT(6))
			sio_data->skip_pwm |= BIT(4);
Since it8689 is declared with FEAT_SIX_FANS, FEAT_SIX_PWM, and FEAT_AVCC3,
falling into the default else block means it performs no checks for fans 4-6,
PWMs 4-6, or AVCC.
Could this cause the driver to unconditionally expose 'ghost' fans, read
garbage tachometer data, and expose non-functional PWM controls on
motherboards where these pins are multiplexed as general-purpose I/O?

