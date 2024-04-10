Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F91716DECA
	for <linux-hwmon@vger.kernel.org>; Wed, 10 Apr 2024 15:10:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1712761841; cv=none; b=DiVT3Ne6uDL4VYa7HJKF99nvSApOPzfic8LI1u/3fzpoJBAI0or2bfG1R6ghHaua/Wmmr+iy4PSq7CBdTnqooqsanKXhAgKWRPuCoGYfcsurGu+84KqSzdmUBQzR9HGOiMIjncX9Tvg/cIvoDcNUZjVDQYN2PbxJyHg6EdmBBS0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1712761841; c=relaxed/simple;
	bh=1XHioqwg2cT344PTuDWA3C9kX7OdVQUWCeBvd94jxTo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=TbSnPkfpujWW8QGicP/DjXV+ZObpwhkxZnrKWQcG2MiFPKC6Pp4JHZC1mkjlUcMATnWf42a5z6qEbFPcn5XC82fr5OOER9rFhLh0t37ZsoSek7NdIeo9XnJc/xlI3vJeynvP3ooth79IyqkCtCCeqmh5GaN5CvIDsMZRAKqiyNs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M9wSp7+n; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M9wSp7+n"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e0b889901bso55377145ad.1
        for <linux-hwmon@vger.kernel.org>; Wed, 10 Apr 2024 08:10:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1712761839; x=1713366639; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/aJ9hy9ASbXfA9YCXsbhdbuTG7AehKecq+zYNjVdD94=;
        b=M9wSp7+nkepZtXG8ZiYXd8ZQAnpJzfMj7bsYQlS6sMPUP9//LCZaf+ffak4nwJjYwF
         sheRAzjgiPfw8Y5efQTo6Jb5VFo90Axk4wL/6UtvuNMGb/8dGPsPa9tKjSFQtPIaM8Oe
         /qRi6acXIY0VXKGuXxTwVry4t8B+ZIR8WCu4fu4XALo0sDmz9x3SMBFR0PhOzVjWD1d3
         7Tzhts/wg1iWS0IbaYfFIDwFPe4rXT6iOuQMFmASTDeTjlLiB23G8y/L7+C8G9Ec2TWQ
         p9r8fIbARaqBcNQEevsfJjUARSUEz+C+qJ0pfMzdyFaNaZPtsyCdqgjWavYBcb9WCLLa
         HFmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1712761839; x=1713366639;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/aJ9hy9ASbXfA9YCXsbhdbuTG7AehKecq+zYNjVdD94=;
        b=C26Ex0iqBsw+aQimdUcNOvkNE4OBL9cPh3YJRO6il/2GweFnwwpWvWXczSHxI28mye
         Kg77a1S1taCbQBs/xgYXPCCr+AZK4u0Bea7eGTngCpdkz6EYRiWk5fteuk7PxrZVL4sJ
         EKpiF+WBST+q9am7U9KiXz7MFsdF24V++XdAGRKMqViBioU3Pml5xPjM1X/frUcz8+p0
         LVN4bHmrO6hm0DcbAtDu9aP2+YvHaqrCJOUH7nJ9Hxq7x103BmNSwfQLQ+hbS2xsAT+Y
         VvPR+dvYEHqw7yt1z4Ng6KNDj97KuRPqdOlKJ932z9GXru7Xi0RM6ij1In4uq5Mrzruq
         4s+g==
X-Forwarded-Encrypted: i=1; AJvYcCUtdq2GBcJXOwmY6a86wfvgepaLJlpjBXv6Whi5cT9f6fXF5NkERNoEsMhfMKTfbGmIYqqlkqmoI19nP6+F39myKZjqNNwVqAUvYlM=
X-Gm-Message-State: AOJu0Yx9Hupa1Qwoz7ijZ2eWPlxaD05pVMXB/eVPct71/NNs/2OynTlk
	xnEp/0LcWls47N+T1waaMPSlK42JwR+zZ2bta7gkya8pc4S9RKmhHTmhLOWy
X-Google-Smtp-Source: AGHT+IHw7M3cqi5hTKt6fPVsJ3Qe8s2/Ff8wUuc32nXUJWxFaagPNqYgNPAQ+E6oT5huLoEDF4cXpA==
X-Received: by 2002:a17:903:41ce:b0:1e3:e081:d29b with SMTP id u14-20020a17090341ce00b001e3e081d29bmr3274121ple.45.1712761839236;
        Wed, 10 Apr 2024 08:10:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id e10-20020a170902f1ca00b001e2a7ed52d0sm10922002plc.239.2024.04.10.08.10.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 10 Apr 2024 08:10:38 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 10 Apr 2024 08:10:37 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Frank Crawford <frank@crawford.emu.id.au>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v1 1/4] hwmon (it87): Rename NOEXIT to BIOSOPEN as more
 descriptive of requirement
Message-ID: <f4efa185-7312-4116-a843-a6d7e0c22c79@roeck-us.net>
References: <20240401025620.205068-1-frank@crawford.emu.id.au>
 <20240401025620.205068-2-frank@crawford.emu.id.au>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240401025620.205068-2-frank@crawford.emu.id.au>

On Mon, Apr 01, 2024 at 01:56:03PM +1100, Frank Crawford wrote:
> Rename previous definitions to match the new information that they are
> preinitialised by the BIOS and should not receive codes to enter or exit
> configuration mode.
> 

That is wrong. NOEXIT is needed for broken chips where two chips are on the
sio bus, and disabling sio access on the broken chip results in sio access
errors. The description is also wrong, because SIO mode still needs to be
_entered_.

Also, a BIOS open mode, if it indeed exists, would have to be be board
specific, not chip specific.

Guenter

> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> ---
>  drivers/hwmon/it87.c | 18 +++++++++---------
>  1 file changed, 9 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index fbe86cec6055..6eeba3a01e3c 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -320,7 +320,7 @@ struct it87_devices {
>   * second SIO address. Never exit configuration mode on these
>   * chips to avoid the problem.
>   */
> -#define FEAT_CONF_NOEXIT	BIT(19)	/* Chip should not exit conf mode */
> +#define FEAT_CONF_BIOSOPEN	BIT(19)	/* Chip conf mode enabled by BIOS */
>  #define FEAT_FOUR_FANS		BIT(20)	/* Supports four fans */
>  #define FEAT_FOUR_PWM		BIT(21)	/* Supports four fan controls */
>  #define FEAT_FOUR_TEMP		BIT(22)
> @@ -452,7 +452,7 @@ static const struct it87_devices it87_devices[] = {
>  		.model = "IT8790E",
>  		.features = FEAT_NEWER_AUTOPWM | FEAT_12MV_ADC | FEAT_16BIT_FANS
>  		  | FEAT_TEMP_OFFSET | FEAT_TEMP_PECI | FEAT_IN7_INTERNAL
> -		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF | FEAT_CONF_NOEXIT,
> +		  | FEAT_PWM_FREQ2 | FEAT_FANCTL_ONOFF | FEAT_CONF_BIOSOPEN,
>  		.peci_mask = 0x07,
>  	},
>  	[it8792] = {
> @@ -461,7 +461,7 @@ static const struct it87_devices it87_devices[] = {
>  		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
>  		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
>  		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FANCTL_ONOFF
> -		  | FEAT_CONF_NOEXIT,
> +		  | FEAT_CONF_BIOSOPEN,
>  		.peci_mask = 0x07,
>  		.old_peci_mask = 0x02,	/* Actually reports PCH */
>  	},
> @@ -507,7 +507,7 @@ static const struct it87_devices it87_devices[] = {
>  		.features = FEAT_NEWER_AUTOPWM | FEAT_16BIT_FANS
>  		  | FEAT_TEMP_OFFSET | FEAT_TEMP_OLD_PECI | FEAT_TEMP_PECI
>  		  | FEAT_10_9MV_ADC | FEAT_IN7_INTERNAL | FEAT_FANCTL_ONOFF
> -		  | FEAT_CONF_NOEXIT,
> +		  | FEAT_CONF_BIOSOPEN,
>  		.peci_mask = 0x07,
>  		.old_peci_mask = 0x02,	/* Actually reports PCH */
>  	},
> @@ -544,7 +544,7 @@ static const struct it87_devices it87_devices[] = {
>  #define has_four_temp(data)	((data)->features & FEAT_FOUR_TEMP)
>  #define has_six_temp(data)	((data)->features & FEAT_SIX_TEMP)
>  #define has_vin3_5v(data)	((data)->features & FEAT_VIN3_5V)
> -#define has_conf_noexit(data)	((data)->features & FEAT_CONF_NOEXIT)
> +#define has_conf_biosopen(data)	((data)->features & FEAT_CONF_BIOSOPEN)
>  #define has_scaling(data)	((data)->features & (FEAT_12MV_ADC | \
>  						     FEAT_10_9MV_ADC))
>  #define has_fanctl_onoff(data)	((data)->features & FEAT_FANCTL_ONOFF)
> @@ -748,7 +748,7 @@ static int smbus_disable(struct it87_data *data)
>  		superio_select(data->sioaddr, PME);
>  		superio_outb(data->sioaddr, IT87_SPECIAL_CFG_REG,
>  			     data->ec_special_config & ~data->smbus_bitmap);
> -		superio_exit(data->sioaddr, has_conf_noexit(data));
> +		superio_exit(data->sioaddr, has_conf_biosopen(data));
>  	}
>  	return 0;
>  }
> @@ -765,7 +765,7 @@ static int smbus_enable(struct it87_data *data)
>  		superio_select(data->sioaddr, PME);
>  		superio_outb(data->sioaddr, IT87_SPECIAL_CFG_REG,
>  			     data->ec_special_config);
> -		superio_exit(data->sioaddr, has_conf_noexit(data));
> +		superio_exit(data->sioaddr, has_conf_biosopen(data));
>  	}
>  	return 0;
>  }
> @@ -3143,7 +3143,7 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>  	}
>  
>  exit:
> -	superio_exit(sioaddr, config ? has_conf_noexit(config) : false);
> +	superio_exit(sioaddr, config ? has_conf_biosopen(config) : false);
>  	return err;
>  }
>  
> @@ -3540,7 +3540,7 @@ static void it87_resume_sio(struct platform_device *pdev)
>  			     reg2c);
>  	}
>  
> -	superio_exit(data->sioaddr, has_conf_noexit(data));
> +	superio_exit(data->sioaddr, has_conf_biosopen(data));
>  }
>  
>  static int it87_resume(struct device *dev)
