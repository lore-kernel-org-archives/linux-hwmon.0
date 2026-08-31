Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0B75D39023C
	for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 22:22:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788214959; cv=none; b=hlnIFAsOyick6KXNCVMZCzqc+YzqLQ0lpLx8V5Y131GJMx++Wj3ZbV3GtWJp3Eg+XyNfowQ9yu2ixlxfQBklwqubPJ/qnWufJ/4hxnt1jzRukOnDkEp2r0e++LeH27ftwCLU/8d/judchmm0n7VXgVeFX/uk2b+I6KRc+OH8xdE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788214959; c=relaxed/simple;
	bh=ljnjZMSn9UQEVZAaBfqHdBvvnkvZ04PV9d3uabECpp4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Mg6qOElgmauX99rv6xRndEPEcpcZv6OZBPonmVoJHkF/sEK6bLa/N+vE9g/tlM2kaX0IT/7CpbUV78uRkHarYpKbAN0kGRfxPCtrCt4tXBwbBVRbIhz9K/aUcWIJjTgolQiBFpw08GSQofTme10ol9tur9X4MGnffzNEPr1VbDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=notkqRw5; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="notkqRw5"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cc1e1ff659bso304846a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 31 Aug 2026 15:22:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788214957; x=1788819757; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yB66osd3zdM1Z7DmAjc15br6sG2z09XFVhX4xOJfkwQ=;
        b=notkqRw5XjYdzyA3Ra52hBb5Zi2y2pcgd1qR5AINbcTUdZTpKLlDsd4GczESt6glGi
         VhtcI/gztry5l3P+bg5pr+ONJvEWWDwFJkML292sb5Bo9LMTlM2jrv23VxSXYZ6WUQzj
         F+LUQQcfwFBjyapp2nszevH01dyKalt6POM1ubfuY6vMxGZemq5D4h/oYBxeHBLkOnhG
         lUU9zp0igxTcUzy9sqdVHDZOkVraOXO+Zbpiqh/ienArl52J9CXTYv8pKV+XjZFSrFlT
         UbYf8kvIDS6qFvYr6fCNCb6Jrkza4ABGsmFLo7ZuuUefkP1e8FUNrKbsxgD5thkpg5sh
         As3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788214957; x=1788819757;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yB66osd3zdM1Z7DmAjc15br6sG2z09XFVhX4xOJfkwQ=;
        b=F9di74vM2a1a942/WjViLDU49GVOJG6oamqM6dKwPX/FcvKEh5Z/4Y9fyQjQjjMLfU
         nMQCq18BcnQa/ZE56Kra9HL6L8tD2Joz3+AmuZsBafGx0gANhaPUbEAgrtOsX+6EWLHX
         YJdWyq/IsMOFo7W0R4b5pq/rQC5ICSSy0JFGjnZ85FfeyVA6dv64Qer6/FnHo037XvS3
         jIXCdti9/kB5qFTtLmqh30O2GhTVQ53MrOxT3jq+nnCWX/9G5s4G7EMEG7hh0bbwdP0T
         pQKPCSpzDXy9q52EznQjMxAo/3FDbqRT4o2LT94ENQZ9qTT9/8zzn2dEtFB3LpRvfeO+
         Csug==
X-Gm-Message-State: AFuF++k9YH0yiJWPQN8J/LtnXXZCtG8+CF70Q3YDkSqhdkkQ2/jFtY2H
	1vJojc/8ZK0VdsCebpzPeCMtJe5+oPWxb7pZgER0fzBVQAHgW3IZl1Hpcs6S5g==
X-Gm-Gg: AYBFou1U5X30HPnXhmGGocWRtQ+KzgZNzsyJgOhYVS5QB/s91u5xC4yN5jngM3pbrdz
	OIZ5UXELkM1RaqZXoiRVA1bsXc4swIprBFr/YUQ05BxlIsqYxhW6DZbZmRVkHdOjK6DQk/CqjQj
	peEhlULCpBd9ow1oVxHQYzcAWPm99ndIa7mpKpkcg/dQOdjjWQ1mmL5rr6Wg5CaL1LSdc+c/XmC
	IQTuBq3Asik3RLB4foa+KUWRjC2TqF+QSGTrL4Kyq21ywk+/b9IyzYNebufKAJ9kKwa7zg4QBtt
	Tn8/h4MJfTRJeZtcx6l4aaLa4++1g4NshZrj8G9hQR6lRZbPm4PJixTSPkn+PMLF9mhfpoLKOFM
	kjHdCla2FuwjVUVN7JMr+ToZraT8/nXMYYpc9PHjmK6w8sFV3Jr/Htp369ni1OZz+vOnumWR8Li
	MHcCpQ0D69ExIvRHtLeIcXFojep0JfyXEQKiCM0SR73LSl7QlbHzivabRG2Xh7bS7H31xNJVg5q
	iyV1X8QAxR9y+ix2LbvI0RLIZO6zESkeCvMTZNFvmRMw3aZ
X-Received: by 2002:a17:90b:2c88:b0:396:b98b:a3c2 with SMTP id 98e67ed59e1d1-396d0f52a0amr47177952a91.8.1788214957384;
        Mon, 31 Aug 2026 15:22:37 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-142e0bf8a13sm46202975c88.0.2026.08.31.15.22.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Aug 2026 15:22:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <555c7300-c742-4b91-a67e-5a4aa144bebe@roeck-us.net>
Date: Mon, 31 Aug 2026 15:22:35 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3] hwmon: (spd5118) Select page 0 unconditionally during
 probe
To: Armin Wolf <W_Armin@gmx.de>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 ggirouard@bungeetaco.com
References: <20260831193424.95135-1-W_Armin@gmx.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260831193424.95135-1-W_Armin@gmx.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/31/26 12:34, Armin Wolf wrote:
> Some Intel i2c controllers can be configured by the BIOS to reject
> writes to the SPD device. This often causes problems when the register
> page needs to be changed, usually during resume.
> 
> Avoid probing on affected devices by unconditionally selecting page 0
> by writing the SPD5118_REG_I2C_LEGACY_MODE register during probe.
> This will fail on affected controllers and thus prevent the driver
> from probing.
> 
> Signed-off-by: Armin Wolf <W_Armin@gmx.de>
> ---
> Changes since v2:
> - restore original register content if i2c init fails
> 
> Changes since v1:
> - Avoid zeroing reserved bits inside SPD5118_REG_I2C_LEGACY_MODE
> ---
>   drivers/hwmon/spd5118.c | 55 ++++++++++++++++-------------------------
>   1 file changed, 21 insertions(+), 34 deletions(-)
> 
> diff --git a/drivers/hwmon/spd5118.c b/drivers/hwmon/spd5118.c
> index 9724cf70b61d..038d9e6e6a73 100644
> --- a/drivers/hwmon/spd5118.c
> +++ b/drivers/hwmon/spd5118.c
> @@ -637,44 +637,31 @@ static int spd5118_i2c_init(struct i2c_client *client)
>   				     I2C_FUNC_SMBUS_WORD_DATA))
>   		return -ENODEV;
>   
> -	regval = i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
> -	if (regval < 0 || (regval && regval != 0x5118))
> -		return -ENODEV;
> -

Thinking about it, Sashiko has a point here. I think we should keep
the above code to have an early exit point.

>   	/*
> -	 * If the device type registers return 0, it is possible that the chip
> -	 * has a non-zero page selected and takes the specification literally,
> +	 * We must first select page 0 to ensure that we can reliably read
> +	 * the volatile registers on chips that take the specification literally,
>   	 * i.e. disables access to volatile registers besides the page register
>   	 * if the page is not 0. The Renesas/ITD SPD5118 Hub Controller is known
> -	 * to show this behavior. Try to identify such chips.
> +	 * to show this behavior.
> +	 *
> +	 * We must also perform an unconditional register write to detect if
> +	 * the i2c controller blocks write accesses to the SPD device. Some Intel
> +	 * controllers might be configured by the BIOS to do this.
>   	 */
> -	if (!regval) {
> -		/* Vendor ID registers must also be 0 */
> -		regval = i2c_smbus_read_word_data(client, SPD5118_REG_VENDOR);
> -		if (regval)
> -			return -ENODEV;
> -
> -		/* The selected page in MR11 must not be 0 */
> -		mode = i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE);
> -		if (mode < 0 || (mode & ~SPD5118_LEGACY_MODE_MASK) ||
> -		    !(mode & SPD5118_LEGACY_PAGE_MASK))
> -			return -ENODEV;
> -
> -		err = i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE,
> -						mode & SPD5118_LEGACY_MODE_ADDR);
> -		if (err)
> -			return -ENODEV;
> -
> -		/*
> -		 * If the device type registers are still bad after selecting
> -		 * page 0, this is not a SPD5118 device. Restore original
> -		 * legacy mode register value and abort.
> -		 */
> -		regval = i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
> -		if (regval != 0x5118) {
> -			i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE, mode);
> -			return -ENODEV;
> -		}
> +	mode = i2c_smbus_read_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE);
> +	if (mode < 0)
> +		return mode;
> +

I also wonder if we should strengthen this and bail out if any of bit 3..7 is
set. 2-byte addressing is known not to work in the first place, and bit 4..7
are reserved in the supported version of the standard and should always be 0.

Also, if we keep above check, we should only only get here if the page is != 0.
That means the register value has to be 0x01..0x07. So we could bail out with

	if (!mode || (mode & ~SPD5118_LEGACY_PAGE_MASK))
		return -ENODEV;
followed by
	err = i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE, 0);

Thoughts ?

Thanks,
Guenter

> +	err = i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE,
> +					mode & ~SPD5118_LEGACY_PAGE_MASK);
> +	if (err < 0)
> +		return err;
> +
> +	regval = i2c_smbus_read_word_swapped(client, SPD5118_REG_TYPE);
> +	if (regval != 0x5118) {
> +		/* Restore original register content */
> +		i2c_smbus_write_byte_data(client, SPD5118_REG_I2C_LEGACY_MODE, mode);
> +		return -ENODEV;
>   	}
>   
>   	/* We are reasonably sure that this is really a SPD5118 hub controller */

