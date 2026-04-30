Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECCB036B067
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 18:02:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777572131; cv=none; b=YSMx0rnOsNV8Tq9An392a0ptsco50ZEqAEMbvevgeK7i700F+xgq1z+T7BK9jkhEvcCWSCGir4H2XYEzFnPq3gA0DTOZ3AXtvdtlclmi0CiWELQbUYOG9n4JlGkvLDT62N2vAUOGDm1LXNxK/4kBGKomd25ZT8F++JffZjqSlVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777572131; c=relaxed/simple;
	bh=TjQVyiNW0d/QpKdXaOOwNOt3wWdEoZxGqrOPCXfVMDQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=D2AqNZR+O/fsvqkveB/jqGqYVV5NdxrcNKJH3qniPexsMnP8QKnBT81dZubKYUVvAK3dIDQaq6MVpjFKrI6x4keSY0n/JNrDFkJ86GQuWu54VVBHYbeosSNFpvF9DQlJ7XT/RI8rgFMzV4eOZQRCWeTlxbV/vwqOpC3gw9ts/uU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Nr28MbUu; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Nr28MbUu"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2adbfab4501so5520185ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 11:02:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777572129; x=1778176929; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=OlLiEMiCGBJhof3S74oNd1EFniImkuyGLR51eTHqnLU=;
        b=Nr28MbUu4SzWapW7pkEty2w8nnM60E1k8Gd5/dyOD2FY+N+5xC/vPiRarjVKBnDrHl
         RZZywzgaGOo/0PDfnIEleASMAPnv3cIXqslx/8/E3DUPCQ/eziuLqHiiESdJU4LvedSN
         9p5ZDUDx9bv9VjcREKFWdqNz9Mu8C1BRtg/F1qk2UY7b9M2qAinf+Su+LUBX8ciwu9/b
         WafmnchD4RYOn1vK0zT1wNXRIBaEObth9UzSqw4X8kQlEh3xv0BFn1Gf6/ukk1wXkQwS
         duW30J6l9xKJeloMXU9XgRP73R2Dz4BXDToVRHS/U8DHwAAq1io3D8NBy2YjB6CH92Ve
         //9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777572129; x=1778176929;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OlLiEMiCGBJhof3S74oNd1EFniImkuyGLR51eTHqnLU=;
        b=WN4xMvJMUAtB5u/33Ikj1uimA//3ciYfelOwl2vbkaFkasejmSOOQYmduKaZKuRpPv
         c1HbAB6u3ePbOCJc+DkbqLSM2NTv2ngXf7eS/lZvojonW7srBmhM/0oTCB/wwy0aXzXG
         u/jt5jx1Wt/k+nRPnqHf3zE3o0NIJo/wrO8z1NyLwTI2S9nCxuLOu0hfxSnyG/0jFkjp
         5RhRrr8q4l+B4a4lVFeBbzQ7o4WAehshkaqEHGxBjRsSszJA0IS/xeOn2/B2qBwo5XNB
         Bof6zgde8gAe+K64YblseggRj1MMa/BR4un4aH3lvUPwQ2mAtg+AiXIa8gmUqmBVIiF4
         KR1A==
X-Gm-Message-State: AOJu0YxlQymMByWZYzUM2jcN9W2xBy1T7WA2xMzlgzJ9V+aSkVm+IDoy
	ILh4gb4iCNLVxtJ2qz0i0PmwHBj1kWbGtWYqMWpv5FlyhyEGchwvjugc
X-Gm-Gg: AeBDievjP8r9BNTqSc/SWXA2Zd9XjEoQOgIeexKXliIwkA+n3ExiXlDOKI7aabljRwR
	YUX5I5Iw7gSP/38vr9B/HGUOw+ox5v8eN/muMTCtG+Nwvlw30FvJeB76QzFrKdfAMgn23tRyqwr
	Rhk6kgXU0BGxjci2xXmAN3ZPbq6UE6TTL6sx9ZkV38LjUAFdHPOpIniqwP1wF/iaCeb5JidsuLY
	YAESNEkJDox6/HNrr+AL6SM/EAiW8Fe3lAWqu19gUAGy52bttQb6QeE1RQwoGg1TlH8UTVeM1uY
	CYgMZ/wPX9rLeRW5d6qQqaRTcf0Ap9BunFVcj0dxs7YYzOsO6RC/K+ZuzK1aIXj+jBKEK5jJG1Y
	+fIIevGqzjiBMc7dDPZ+l1bQknxioAT5/C7E2XBEA9p5M1dB8EjgFlVnDR+wzMHmoLsokIFtKrx
	Z8/9Mu1B8UoDZa0ftV/V0aQVJhTkvVq4Yta06iY/ARQlDCoud3tRBL1LctiERpl/t7IzqCmbFxX
	56Yd4qg7TiOVTwvJNYjEg==
X-Received: by 2002:a17:902:7c18:b0:2b2:5503:1b8c with SMTP id d9443c01a7336-2b9a23161dbmr30073765ad.11.1777572129269;
        Thu, 30 Apr 2026 11:02:09 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b9cae68476sm2256685ad.80.2026.04.30.11.02.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 11:02:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ec8d207e-3fa7-40c6-81c1-62de974043ec@roeck-us.net>
Date: Thu, 30 Apr 2026 11:02:07 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] hwmon: (ads7871) Fix endianness bug in 16-bit
 register reads
To: sashiko@lists.linux.dev, Tabrez Ahmed <tabreztalks@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260418034601.90226-2-tabreztalks@gmail.com>
 <20260418041150.93415C19424@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260418041150.93415C19424@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/17/26 21:11, sashiko-bot@kernel.org wrote:
> Sashiko AI review found 1 potential issue(s):
> - [High] Passing a pointer to an `int` variable (`&reg`) to `spi_write_then_read()` for a 1-byte transmission causes the wrong byte to be sent on Big-Endian architectures.
> --
> 
> commit 4f7407427267b9ca42b213449235bc095cff57b3
> Author: Tabrez Ahmed <tabreztalks@gmail.com>
> 
> hwmon: (ads7871) Fix endianness bug in 16-bit register reads
> 
> This commit replaces spi_w8r16() with a manual spi_write_then_read() into
> a byte array to correctly handle 16-bit sensor reads. It then reconstructs
> the integer using get_unaligned_le16() to ensure correct behavior across
> all architectures.
> 
> Closes: https://sashiko.dev/#/patchset/20260329073352.270451-1-tabreztalks%40gmail.com
> 
>> diff --git a/drivers/hwmon/ads7871.c b/drivers/hwmon/ads7871.c
>> index 9bfdf9e6bcd77..9b52aa496d522 100644
>> --- a/drivers/hwmon/ads7871.c
>> +++ b/drivers/hwmon/ads7871.c
> 
> [ ... ]
> 
>> @@ -77,9 +78,14 @@ static int ads7871_read_reg8(struct spi_device *spi, int reg)
>>   static int ads7871_read_reg16(struct spi_device *spi, int reg)
>>   {
>>   	int ret;
>> +	u8 buf[2];
>> +
>>   	reg = reg | INST_READ_BM | INST_16BIT_BM;
>> -	ret = spi_w8r16(spi, reg);
>> -	return ret;
>> +	ret = spi_write_then_read(spi, &reg, 1, buf, 2);
> 
> Will this transmit the wrong instruction byte on Big-Endian architectures?
> 
> The variable reg is a 32-bit int, and spi_write_then_read() reads
> sequentially from the memory address provided. On Little-Endian
> architectures, the lowest memory address correctly contains the least
> significant byte, which is the intended 8-bit command.
> 
> However, on Big-Endian architectures, the lowest memory address holds the
> most significant byte of the int, which is 0x00. Does this result in 0x00
> being transmitted over the SPI bus instead of the correct register
> instruction?
> 

This is a real problem. Please fix.

Guenter

>> +	if (ret < 0)
>> +		return ret;
>> +
>> +	return get_unaligned_le16(buf);
>>   }
> 

