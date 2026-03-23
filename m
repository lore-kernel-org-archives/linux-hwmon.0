Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 864FE3BD22F
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 17:09:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774285792; cv=none; b=fm9h6D0H3c+xC5CxOT4AXEFCzd76IJPJKRPVp1FVwjcwu1SFWikBTJHgASbQCd+ccqZni5q8SnGv/1r7q42O7apuV0/e21+sEyaEmnxI4wby8baCuvB9XGyor3mkQmwlwHlgzrM9kN8k/7QkjiblTxx3Pu7H5MohLh7QroUM9qo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774285792; c=relaxed/simple;
	bh=FTiGPOtUK7IUEyEAjJ2944bpEa2m/3Tfs1oZ3CkCxJQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lRvbiVfM17ErT8IgJhIwdwYlxsTMNA2NSRsyB4roslj3NxMt/B6dUrmX6gW+OsnUW6ClOSe75ZbyAb1yG5XqWLycfU5Ic1rFZLXxIv90GLLyJulRnwSCO8u4pL5k99LqWatA6br7+uI5NKfhVZrjq64Dk4OTfYMwuPmuVk9eEZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fDqf0NHR; arc=none smtp.client-ip=74.125.82.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fDqf0NHR"
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-2c0ecaae7dfso7361411eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Mar 2026 10:09:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774285790; x=1774890590; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fRiDJmNeAhOABhsNL00fBBa0Xzc4AxmsBUECZBx9lsU=;
        b=fDqf0NHRkPlHQa8aUFmx5i6yo0NxCgpTqwRXzSHkM6SfYnb/JXvFPrmWLlAmS0KfpX
         gpG3eFCa9ZKjtYkYZTkta06JHy1i7phthePNfaUHzZ7yc8pwm4E1kyFQs7Y9HCmislL4
         eGRSzxJSVF09FoTrRrmocwf1QqcUF2uUChsbfSqrkq9JT0LsaG9gEj/fQ097SV5yi4rA
         RRrBseXHX6AatkqhfVPZqaiw5I6WYfCIpixxgX04nREGQ5/W0gQ5FrHUxbDAYMPwEqq3
         d2yYyh0KUxTU7RsbObQabixTCClA7yLSKmZDWnnQL/PtCzAfpRV+w6jk4sfIAFDk/IAp
         gbbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774285790; x=1774890590;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fRiDJmNeAhOABhsNL00fBBa0Xzc4AxmsBUECZBx9lsU=;
        b=M5WLJ9Qmxp+jvKK9nJ2kkexrgwufbWXflq340vRFbnmKejY6IYgB7GctLWm4JKGZNA
         T7zcDufV7Hoc61gxxhZBN5UgcvRu1u2LVTp7r2yolwmhliwiVlHYf1k1lUUAT90kaMmL
         S4hZcBEZLAE7WpBOjDgKFuh4uJcWAEocRFOKW46Agm3+dNrBGj1C9Vi3gzH1lTLrX0z8
         fA6PrBnjCdnj/R11Yt1WIYUYn/Kfp4HyZrW82fhDpnpMjwfTyPU8a5wdN6oESmklHH/r
         68gUKrvoefxu4MLPDJZY10UsZKDR3qvB/RAV4iuFps8rjM1AShxob3jtqYpLcClqFL2L
         vfSw==
X-Forwarded-Encrypted: i=1; AJvYcCWj8CRloAEIZwSQ/HMHKD5Lhypmr86X77Rr0NnuO5Y4bbnRQMnmldmA9avjM9AKySszoSIDfYsGfu/GYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzaHfNJMJkYjE/BLXD81PReKLkH89nPtvOUhwvsCSruchhrCFgt
	dkxXnE5y06pjuOIjaM0C9J+POkdKweiqrmMJhpYoIrD89dJdYQX1JUB/
X-Gm-Gg: ATEYQzwTMZMF0qAWEiQJjjjm79KmDDWAFZ65nEQ5PQ2cWqIDylH19Io6zfipf0fM+Dh
	1641qSAKJARgaxY01c9eMCcLfe7t1EKC9jDw2Zs/jlzXcUPf8jqv98yeVtraytBwvOUogzjt8NT
	WLzY2PK7wwrcuujgNP/GsN9ACL0P6Hzd3cOu99rAsb5iJhUFfbukQthwjdrRGVAMGeP3IuIWrsZ
	i8XrUiyK6zFUdxnZu21BboJlhkFuE04KD7N2oDdZXfuqCKQOmrL2YlR/I2U+S6XwI9UZK6M4HVy
	NvijNjUT2OoDMm12c0XEKR6yL33Uz3ni8yb3YgL0dM7PTzR882OFvAJC/9LgM1NHuWT3Qn0tU+D
	NRS4HkEiIgD8lajwUvxRvkcIm6xJJlNRIbsBy8oEiztcS1aPCKs1JX2C3QI63g1rPs2tTE049zR
	DQWh9dL6bU4pBICOWVYq0CBYJwOym1sdwMCokq3uBMhp/18E/zB9gcBrZeHoSljTUha44WWpLY
X-Received: by 2002:a05:7300:a287:b0:2be:617:2dec with SMTP id 5a478bee46e88-2c109710f75mr4970709eec.17.1774285789326;
        Mon, 23 Mar 2026 10:09:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c10b17b90dsm16291595eec.10.2026.03.23.10.09.35
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Mar 2026 10:09:36 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <25366e20-f7e3-4b6b-8496-ca4ea8e6109a@roeck-us.net>
Date: Mon, 23 Mar 2026 10:09:34 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/5] hwmon: (pmbus) Use -ENODATA for unhandled registers
 in MPS drivers
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc: "wenswang@yeah.net" <wenswang@yeah.net>,
 "chou.cosmo@gmail.com" <chou.cosmo@gmail.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>,
 "stable@vger.kernel.org" <stable@vger.kernel.org>
References: <20260323163343.183186-1-sanman.pradhan@hpe.com>
 <20260323163343.183186-2-sanman.pradhan@hpe.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260323163343.183186-2-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/23/26 09:34, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> The read_word_data and write_word_data callbacks in mp2869, mp29502, and
> mp2925 return -EINVAL for unhandled register addresses. In the PMBus core,
> -ENODATA has a special meaning: it tells the core to fall through to the
> standard PMBus register read/write path. Any other negative value (such
> as -EINVAL) tells the core the register does not exist, causing valid
> PMBus standard registers to be silently hidden.
> 
> Replace -EINVAL with -ENODATA in the default case of all affected
> read_word_data and write_word_data callbacks so that standard PMBus
> registers not handled by the driver are properly served by the core.
> 
> Fixes: a3a2923aaf7f ("hwmon: add MP2869,MP29608,MP29612 and MP29816 series driver")
> Fixes: 90bad684e9ac ("hwmon: add MP29502 driver")
> Fixes: a79472e30be4 ("hwmon: Add MP2925 and MP2929 driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

At least some of those have explicit -ENODATA returns for individual registers
(the mp2925 driver shows it below). Please combine those into the default:
case.

This was originally introduced because some chips react badly if an attempt
is made to read an unsupported register. I don't have any of the chips
available for testing, so I can not verify myself. Is it well known that
returning -ENODATA causes no problems for those chips ? If so, please mention
in the commit message.

Thanks,
Guenter

> ---
>   drivers/hwmon/pmbus/mp2869.c  | 4 ++--
>   drivers/hwmon/pmbus/mp2925.c  | 4 ++--
>   drivers/hwmon/pmbus/mp29502.c | 4 ++--
>   3 files changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/mp2869.c b/drivers/hwmon/pmbus/mp2869.c
> index cc69a1e91dfe..4f8543801298 100644
> --- a/drivers/hwmon/pmbus/mp2869.c
> +++ b/drivers/hwmon/pmbus/mp2869.c
> @@ -391,7 +391,7 @@ static int mp2869_read_word_data(struct i2c_client *client, int page, int phase,
>   		ret = (ret & GENMASK(7, 0)) * MP2869_POUT_OP_GAIN;
>   		break;
>   	default:
> -		ret = -EINVAL;
> +		ret = -ENODATA;
>   		break;
>   	}
>   
> @@ -536,7 +536,7 @@ static int mp2869_write_word_data(struct i2c_client *client, int page, int reg,
>   								     MP2869_POUT_OP_GAIN)));
>   		break;
>   	default:
> -		ret = -EINVAL;
> +		ret = -ENODATA;
>   		break;
>   	}
>   
> diff --git a/drivers/hwmon/pmbus/mp2925.c b/drivers/hwmon/pmbus/mp2925.c
> index ad094842cf2d..a62f6c644bb5 100644
> --- a/drivers/hwmon/pmbus/mp2925.c
> +++ b/drivers/hwmon/pmbus/mp2925.c
> @@ -132,7 +132,7 @@ static int mp2925_read_word_data(struct i2c_client *client, int page, int phase,
>   		ret = -ENODATA;
>   		break;
>   	default:
> -		ret = -EINVAL;
> +		ret = -ENODATA;
>   		break;
>   	}
>   
> @@ -203,7 +203,7 @@ static int mp2925_write_word_data(struct i2c_client *client, int page, int reg,
>   										 ret)));
>   		break;
>   	default:
> -		ret = -EINVAL;
> +		ret = -ENODATA;
>   		break;
>   	}
>   
> diff --git a/drivers/hwmon/pmbus/mp29502.c b/drivers/hwmon/pmbus/mp29502.c
> index 7241373f1557..4556bc8350ae 100644
> --- a/drivers/hwmon/pmbus/mp29502.c
> +++ b/drivers/hwmon/pmbus/mp29502.c
> @@ -456,7 +456,7 @@ static int mp29502_read_word_data(struct i2c_client *client, int page,
>   		ret = (ret & GENMASK(7, 0)) - MP29502_TEMP_LIMIT_OFFSET;
>   		break;
>   	default:
> -		ret = -EINVAL;
> +		ret = -ENODATA;
>   		break;
>   	}
>   
> @@ -555,7 +555,7 @@ static int mp29502_write_word_data(struct i2c_client *client, int page, int reg,
>   						   word + MP29502_TEMP_LIMIT_OFFSET));
>   		break;
>   	default:
> -		ret = -EINVAL;
> +		ret = -ENODATA;
>   		break;
>   	}
>   

