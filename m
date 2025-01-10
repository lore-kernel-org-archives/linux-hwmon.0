Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C3EA9211A0E;
	Fri, 10 Jan 2025 15:56:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736524576; cv=none; b=cd+hk3bqGIbVh+jBRVEXezzyaIIbPiTjysA0FerZq4mYikzPjfUZsFaPaS2t1NiHq6Qdme0AHEY2akh2a0Siasv+dYcS5lU7TP/KOTY1tCsa9Ru1oFI41JbQkXzM6N6vXJKbBmkcu06QLYW9yiMVturY0UF1fZf9Z3wBLFZphso=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736524576; c=relaxed/simple;
	bh=ToQsmdXKWvCSr0BzBHqM+gitrOvjxQz7G5WKePtfSrM=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=agme8UJCE65hzQDjeo9D080Yhb+9kMQX4Sw9gBJEzQDimm3txauJhL54L/aMwyTeVDQlHIlINZrrH0rWZ57SLBLiw8nhG7odjipoQyehYlqfu289ZJZqnW35tJFkJL3CeR8i2M3orv5kwORfO5ZVPrsmRWSQqAd/r8vLyW0lm3U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lZxOX1LQ; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lZxOX1LQ"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-21654fdd5daso36633505ad.1;
        Fri, 10 Jan 2025 07:56:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736524574; x=1737129374; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=LXdERwEI8Ur+tD6AM4wNZnNq7gIDWzgVayKNEYmnTHs=;
        b=lZxOX1LQFFtw59TvOy8ei79313zve1hEJXSxHuzx4TewlEvOP/fX+D6PWgpoSBgu0T
         d38fdyYZu8dPFEjuFcrAnXV0RFKf0+EzqS9CW/o0CxaZ5omCplgKY7LkIn/fRiuX7NWl
         YxPl3qSKr7sLVq9B07QCT9z2OWDlIld5sPF6+W1XutVG5DQWQKeyrHE67TahMKSeZvAF
         z2RUIM3rqEvoCbxmZl+z2bccHazw4owDzSA60QPegKD5D119DDEZ6/7zLQMEFHzUcdcz
         rVO3//qsGrU8AOmni7ECgewbd35e/PiYr5n8eA8d/2xfKiGRMwExigH5ekFL/ey712mW
         Z7RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736524574; x=1737129374;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LXdERwEI8Ur+tD6AM4wNZnNq7gIDWzgVayKNEYmnTHs=;
        b=KT01ljD0RFH1CjuokeWQCCPcg0bN4KNGN1iG8Qf07cPsftzoH/Fe99SxlXhXgKFga8
         kd0rMGIYNeOZk4e3mq3/ip1UbHytZQHBoxxsWkPDKiUTYd+o8PxN0vxin95YQtoQH010
         mMDF/DU0wmV9olh4nhoEX3QEsDR5TblKJwWpmNGvqruMYpoXzWE3Gi6/ugUktvcOGnE8
         Nokh08AccdCxF3M6b/CNouSbiov/lpJoojMPqvpnkWVXmHGibxORMR9LFyyAnW8DIYih
         OjdjhExjRAdKG+I6a8GbpgD6l4iIqhSvuCW/Bu/v7zNGZ/0WvgQobOi9waUpcLGfkMBh
         JWfg==
X-Forwarded-Encrypted: i=1; AJvYcCWQhjPTICIQCFtG5et989ov95+qD3MCSjpvY+EV//UUsRrU9NA6LeWvA5W/S4BVhnp/1Qk/+ZjZzQKC@vger.kernel.org, AJvYcCWguGeiqOqZMWW4phfLb6jtcesGshqOlGVE2k6jZ8m5S9wru2NaqSnSOWmuhemFnTDup/vI58wCceHwWHMw@vger.kernel.org, AJvYcCWlllIqO1I5+StCp4bth9zqZb2lZ0LtOOAYlAmqFR8TCrsSUcqNkXkUC0fW0QK3DThrIE/ihu/fY42N@vger.kernel.org
X-Gm-Message-State: AOJu0YyNYwKoGjF9EfM5pJFdm0PIjbdlB7XchhmNyxABUawBagfm9MCd
	aWFiaw2lH5dg3EzXsStHeNn+ENy69GMjAafRzjMYZ8OkVCI5SZhIdilgeA==
X-Gm-Gg: ASbGncslzwSbgaUgPFJTQmfvjDXyYuKNrqYVgt5Gtom5i8YeMMvlHsFUAI2teIgGtyq
	smyCjatNUgv+mXxWnMOELvXmX6WFu+MNhrnpQRTRv7xCo1YMLIRp+QY/hcVwz9Myd1oIDxTHTc3
	yADy0l0n2Lcn6HSSmPng7wekHSbuVI9w1c1FdNgiN2Ll+oXwbmRjezHGfWhmw1C+D1bCw5kzCGX
	16g7p9wqPlD8p+rT2vwwxl3n20BqA6vVW8YoRGzsREX5XxsBbm1jd6uyyKqd2HjLsby6q1WkK99
	dazghpm5T+9p5egwF39Qw7oiwTzGWw==
X-Google-Smtp-Source: AGHT+IFbGN0UTfy48hBPWj2ftdGuYJ/F3oFaeWpbL2uK16+Id0qeNQwDjaX3vevSq0MczbEmX58BSQ==
X-Received: by 2002:a05:6a00:2388:b0:728:e906:e466 with SMTP id d2e1a72fcca58-72d21ff5241mr16996813b3a.21.1736524574023;
        Fri, 10 Jan 2025 07:56:14 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72d40548916sm1700480b3a.36.2025.01.10.07.56.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jan 2025 07:56:13 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ba0e0e2b-01ba-4261-ace9-82485e1c253e@roeck-us.net>
Date: Fri, 10 Jan 2025 07:56:11 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/2] hwmon: (lm90): Add support for NCT7716, NCT7717
 and NCT7718
To: Ming Yu <a0282524688@gmail.com>, tmyu0@nuvoton.com, jdelvare@suse.com,
 corbet@lwn.net, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org
References: <20250110082612.4107571-1-a0282524688@gmail.com>
 <20250110082612.4107571-2-a0282524688@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250110082612.4107571-2-a0282524688@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/10/25 00:26, Ming Yu wrote:
...
> @@ -2288,7 +2329,19 @@ static const char *lm90_detect_nuvoton(struct i2c_client *client, int chip_id,
>   	if (config2 < 0)
>   		return NULL;
>   
> -	if (address == 0x4c && !(config1 & 0x2a) && !(config2 & 0xf8)) {
> +	if (address == 0x48 && !(config1 & 0x30) && !(config2 & 0xfe) &&

Why config1 & 0x30 (instead of 0x3e) ?

> +	    convrate <= 0x08) {
> +		if (chip_id == 0x90)
> +			name = "nct7717";
> +		else if (chip_id == 0x91)
> +			name = "nct7716";
> +	} else if (address == 0x49 && !(config1 & 0x30) && !(config2 & 0xfe) &&
> +		   convrate <= 0x08) {
> +		name = "nct7716";

Please also check the chip ID, and the other unused configuration register bits.

> +	} else if (address == 0x4c && !(config1 & 0x18) && !(config2 & 0xf8) &&
> +		   convrate <= 0x08) {
> +		name = "nct7718";

Please also check the chip ID (0x90 according to the datasheet). Why not check bit 5
of config1 ?

If there is a reason for not checking the reserved configuration register bits,
please add a comment to the code explaining the reason.

> +	} else if (address == 0x4c && !(config1 & 0x2a) && !(config2 & 0xf8)) {
>   		if (chip_id == 0x01 && convrate <= 0x09) {
>   			/* W83L771W/G */
>   			name = "w83l771";
> @@ -2297,6 +2350,7 @@ static const char *lm90_detect_nuvoton(struct i2c_client *client, int chip_id,
>   			name = "w83l771";
>   		}
>   	}
> +
>   	return name;
>   }
>   
> @@ -2484,6 +2538,10 @@ static int lm90_detect(struct i2c_client *client, struct i2c_board_info *info)
>   		name = lm90_detect_maxim(client, common_address, chip_id,
>   					 config1, convrate);
>   		break;
> +	case 0x50:	/* Nuvoton */
> +	case 0x5c:	/* Winbond/Nuvoton */

The new detection code should be implemented as separate function to avoid
weakening the detection mechanism. I would suggest to rename the current
lm90_detect_nuvoton() to lm90_detect_winbond() and introduce a new
lm90_detect_nuvoton(). Alternatively, add something like lm90_detect_nuvoton_50().

Given that all new chips have a chip ID register (called device ID), I would suggest
to arrange the new code around the chip IDs. Since all chips have another chip ID
register at address 0xfd, it would make sense to check that register as well.
That would only require a single check since it looks like the value is the same
for all chips. Something like

	int chid = i2c_smbus_read_byte_data(client, 0xfd);
	...

	if (chid < 0 || config2 < 0)
		return NULL;

	if (chid != 0x50 || convrate > 0x08)
		return NULL;

	switch (chip_id) {
	case 0x90:
		...
	case 0x91:
		...
	default:
		...
	}

Thanks,
Guenter

