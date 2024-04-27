Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2D2D022089
	for <linux-hwmon@vger.kernel.org>; Sat, 27 Apr 2024 11:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1714216265; cv=none; b=YcpqWAdl8Ec4jpj1aeCKcO+BmkI7Hs8plZNXqkkIrSvB+3LfRONevGrynJsl06ChJvWK5FO3hqw8u10ixMg40gHmNwKsyhB7U9pHC7p5BouuFcT+ohmyAHq/2iJULsKzWsBAMxvwZYhmO80qBvH1sXyyW0BhDhb0tIRuxQdqw9s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1714216265; c=relaxed/simple;
	bh=+TZKMHmEXyiawptxbZR1r5X1+DigIHXMhIJgeuNI1fo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=W+yBY6LsJSR5XM7QOo1M8Pr8X347K2mE40Xo5Va0k6kchp5lwO2LsbkzZsLudMrEyGicmWl06Rrz/H5U1dNj32jVdvuSvURhB6qrZ3zXdi463IMBhGfLRIVNK/TRj3dduEezNKAqHW2kLyae8/CWb/vnREqmF7AYmmH8ndcE3Uo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ATojk+pc; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATojk+pc"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-1e834159f40so23952985ad.2
        for <linux-hwmon@vger.kernel.org>; Sat, 27 Apr 2024 04:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1714216262; x=1714821062; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fLhsZS2EKZhtxun+xItXku9KO8y+9XNIph94kHJ98u0=;
        b=ATojk+pcHN3a6Hst8QXWtTEH2Ty9EKP/yqp+WZqfESEXctEipynVKKpfmgwWxm3j0U
         9OHIzDKiiJX/+wSKle9RkVLUMUvkgr9jwKfX4kxLvVO+Kr5E6S419oXwE18Ucprd/q8a
         geSc8lEbYizq3eNsTPoHQCxzmzdekp7Agbx3tdCVA1gU0RAlOBh6CMXGCl4MoxMiQQ52
         DPXSqiyv5curoNxY7R6sE4PdhKIwdoODoUs34TAZVHmZa5q1/IFza2IyK+DUNkzVbARg
         D2J4fLmZwdnc187LicVVaJJtso6hU9/Pg3WzHmcWXGA8vHYgQtbA+nlOfoyyQLWMAVDg
         CNCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1714216262; x=1714821062;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fLhsZS2EKZhtxun+xItXku9KO8y+9XNIph94kHJ98u0=;
        b=m6C5eMPaJ7B+wlGsF3M/vC8BQTSPvL23J+9Ewy3au2HMgwGSe6eyKOk9WYeX6Psbf+
         HGJDIxfmxQ9C2gRZW7X8uJ2Os3b29gyNX/soJnEyJ7v5LXdLS8kttRIQRaP11Mjr14VZ
         oJchCpPbbiYWdbqoo8KGpDSFflvO+ocVeBUWDBIFjuurupTnT0I8BGOWQ3WiGZILunSd
         5xU5aEUjPvcDoSMphXWioa9JER3TiZtcAKJPlDTYtMGv2MSI4K9wSw2WSrgi7eOBa+bQ
         MlSjnPvLE184oWf2NZ0bBwRaxZ8znRT6w1Fh9e3bU5LiAfyNpoyFCbm2RYYsPuNPNrOG
         VOpQ==
X-Gm-Message-State: AOJu0Yy+r9GVM9rCePCP8H8n+hkdk8zGRyIfUMdY+G+qCBbO+Edo3+yk
	UvW4yG0ikGiRco9J7yMlsdsvuxrtO8bsZh9ODmdCUhDM6v2T3ElV/6vhsQ==
X-Google-Smtp-Source: AGHT+IHBqzB8HAteyHOgzC0WbX2xHyOYN1DXi0Ktfz1NgGo2ip/vJr1Q0+fbd7XOR/g6MqnfPJ2rQg==
X-Received: by 2002:a17:902:8215:b0:1e4:d548:81a0 with SMTP id x21-20020a170902821500b001e4d54881a0mr4691620pln.67.1714216262458;
        Sat, 27 Apr 2024 04:11:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id c13-20020a170902b68d00b001e8a7ec6aabsm15792651pls.49.2024.04.27.04.11.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 27 Apr 2024 04:11:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8d9c9f7d-8a6a-488d-814b-807060aa8336@roeck-us.net>
Date: Sat, 27 Apr 2024 04:11:00 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/4] hwmon (it87): Test for chipset before entering
 configuration mode
To: Frank Crawford <frank@crawford.emu.id.au>,
 Jean Delvare <jdelvare@suse.com>
Cc: linux-hwmon@vger.kernel.org
References: <20240427083317.2077175-1-frank@crawford.emu.id.au>
 <20240427083317.2077175-4-frank@crawford.emu.id.au>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240427083317.2077175-4-frank@crawford.emu.id.au>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/27/24 01:33, Frank Crawford wrote:
> Major part of the change for the new method to avoid chipset issues.
> 
> The actual update does the following:
> 
> 1) Lock the memory, but does not perform a SIO entry (previously it
> would have performed an SIO entry).
> 
> 2) Attempt to read the chipID.  This should be safe no matter which
> chip we have.
> 
> 3) If step (2) fails, then perform SIO entry and retry chipID read.  For
> older chips and on failure it acts similarly to prior to this patch.
> 
> 4) Set the sio_data->type, similar to previously.
> 
> 5) If we have not performed an SIO entry, and this is not a chip type
> with the NOCONF feature, then it will perform an SIO entry at this
> point.
> 
> 6) Proceed with setup as prior to this patch.
> 
> 7) Any following access to the SIO registers will invoke the SIO entry
> and SIO exit steps unless it is a chip with the NOCONF feature set.
> This was set up in the previous patches in this patchset.
> 
> 8) There is also some minor update to the failure exit based on if it
> had performed a SIO entry or not, in addition to the previous tests.
> 
> Signed-off-by: Frank Crawford <frank@crawford.emu.id.au>
> ---
>   drivers/hwmon/it87.c | 52 +++++++++++++++++++++++++++++++++++++++-----
>   1 file changed, 47 insertions(+), 5 deletions(-)
> 
> diff --git a/drivers/hwmon/it87.c b/drivers/hwmon/it87.c
> index 396c2d3afbf7..6a77f2f6e1e1 100644
> --- a/drivers/hwmon/it87.c
> +++ b/drivers/hwmon/it87.c
> @@ -2667,6 +2667,27 @@ static const struct attribute_group it87_group_auto_pwm = {
>   	.is_visible = it87_auto_pwm_is_visible,
>   };
>   
> +/*
> + * Original explanation:
> + * On various Gigabyte AM4 boards (AB350, AX370), the second Super-IO chip
> + * (IT8792E) needs to be in configuration mode before accessing the first
> + * due to a bug in IT8792E which otherwise results in LPC bus access errors.
> + * This needs to be done before accessing the first Super-IO chip since
> + * the second chip may have been accessed prior to loading this driver.
> + *
> + * The problem is also reported to affect IT8795E, which is used on X299 boards
> + * and has the same chip ID as IT8792E (0x8733). It also appears to affect
> + * systems with IT8790E, which is used on some Z97X-Gaming boards as well as
> + * Z87X-OC.
> + *
> + * From other information supplied:
> + * ChipIDs 0x8733, 0x8695 (early ID for IT87952E) and 0x8790 are intialised
> + * and left in configuration mode, and entering and/or exiting configuration
> + * mode is what causes the crash.
> + *
> + * The recommendation is to look up the chipID before doing any mode swap
> + * and then act accordingly.
> + */
>   /* SuperIO detection - will change isa_address if a chip is found */
>   static int __init it87_find(int sioaddr, unsigned short *address,
>   			    struct it87_sio_data *sio_data, int chip_cnt)
> @@ -2674,16 +2695,25 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>   	int err;
>   	u16 chip_type;
>   	const struct it87_devices *config = NULL;
> +	bool opened = false;
>   
> -	err = superio_enter(sioaddr, false);
> +	/* First step, lock memory but don't enter configuration mode */
> +	err = superio_enter(sioaddr, true);
>   	if (err)
>   		return err;
>   
>   	err = -ENODEV;
>   	chip_type = superio_inw(sioaddr, DEVID);
> -	/* check first for a valid chip before forcing chip id */
> -	if (chip_type == 0xffff)
> -		goto exit;
> +	/* Check for a valid chip before forcing chip id */
> +	if (chip_type == 0xffff) {
> +		/* Enter configuration mode */
> +		__superio_enter(sioaddr);
> +		opened = true;
> +		/* and then try again */
> +		chip_type = superio_inw(sioaddr, DEVID);
> +		if (chip_type == 0xffff)
> +			goto exit;
> +	}
>   
>   	if (force_id_cnt == 1) {
>   		/* If only one value given use for all chips */
> @@ -2767,6 +2797,18 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>   
>   	config = &it87_devices[sio_data->type];
>   
> +	/*
> +	 * If previously we didn't enter configuration mode and it isn't a
> +	 * chip we know is initialised in configuration mode, then enter
> +	 * configuration mode.
> +	 *
> +	 * I don't know if any such chips can exist but be defensive.
> +	 */
> +	if (!opened && !has_noconf(config)) {
> +		__superio_enter(sioaddr);
> +		opened = true;
> +	}
> +
>   	superio_select(sioaddr, PME);
>   	if (!(superio_inb(sioaddr, IT87_ACT_REG) & 0x01)) {
>   		pr_info("Device (chip %s ioreg 0x%x) not activated, skipping\n",
> @@ -3144,7 +3186,7 @@ static int __init it87_find(int sioaddr, unsigned short *address,
>   	}
>   
>   exit:
> -	superio_exit(sioaddr, config ? has_noconf(config) : false);
> +	superio_exit(sioaddr, opened && config && has_noconf(config));

If 'opened' is false, this could be an affected chip. Are you sure
that it makes sense to pass 'false' as parameter here in that case ?
Doesn't that mean that the chip might be one of the affected chips,
but the superio exit sequence would be executed anyway ?
Am I missing something ?

Guenter

