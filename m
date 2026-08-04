Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0709B469843
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 13:58:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785851940; cv=none; b=H2OeP5D331oxbFH1ilQO1/CPldCT/Gwh3sOVBhmYABzLeSeympKc3K9Syq+kkUH2weqiqb2Slqz6BnkseEPydgcyQ/sBJsTHClbX7L25laG+Do5SFUHOHf9JVgP07TkIa5Kj2agIU2NgmR8LPjiOK+yr3S9mpR+nHy2wh3rUE0c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785851940; c=relaxed/simple;
	bh=1OQBoAhCWQ27z4TbCoxEkZMbX/0Vwt1ZYg8nnzYUxtI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=kVHzMYCqbG1IOtXytLb1kFgoW/x1f1ivq3VUeXLifi1p/A1gP62efTQplsKzad4UoAywBpZpg3NyOHOzVMPqxzdBscYQ/u7ohAs73BTGQZZh7rv2K4hTKqX3zdz3teOSZHqV1PnpBi4MC1DzTXklgCqj36Bb8e77SxZHZM+DZAg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XF8K7ppF; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XF8K7ppF"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2caf228a910so34613045ad.2
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Aug 2026 06:58:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785851936; x=1786456736; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=zkuISwW42BAC8zrLAFu0d6zrzkKDpQ7MpBwlJbTNguI=;
        b=XF8K7ppFOMZTNDhPNkw6C1vRJgK0CsZR27UlF/zEQ1tLwXyXh05N+vwPdLjBjOHwB7
         LgXBrM9wAVrVYlEnHx49Y9uXSBEcOBVW2I9kN707aQomZN4VV6JnUC7/JjIYDpvAYFVB
         Bt+LgcVQ8evqoIxxNP7F0mr49oHgDW7dv1o2ox20TFdopTJ9zU8fFhI7EAj4z/7Ubnfh
         WlfzlpzsZ+NnaJ3UAIBymPs3X1nZ2DkRdQKbnARcn5OuVVbQMZADKCqKM6Q1ZyGRtcXQ
         bne1GtllhyqhXuKbRONCE/TS7KhwJ/lzGTuvTrX8m1L91F30UM+8yxGAKo5dLMEdIgPA
         7cRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785851936; x=1786456736;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=zkuISwW42BAC8zrLAFu0d6zrzkKDpQ7MpBwlJbTNguI=;
        b=P3msI1unIFGK/iEzxuE0DSageLGdeg64rSIp4DLXv4ipzmKeA+VpQIQ3rLEiE3GL1Y
         IIt/VS0X6VoPi8QUo2A7HjL9Yh2ulaHV+F8xYfq7QfzxSX8aETjXjy9MXHyHAdDeJI5C
         GM67S+gc2lWhl8eh42gyrPrkYWJyPcyHd2Eve+q5JN27rp6thyElTbk9ozruIMluSxLQ
         g9YIoqKBmzBAbZiNVZ8DIBh/mxjp8HWGsy3JmRYkB8bpIm/bHGtKilFSNN64y3Ak8B6F
         6m6pNVD2yqgsG6ZjA7jB4Nn4clsNSwyzFJp0GwsVBbpxiR/m3NaLwCjh8M9GbyAiLW+S
         rJxw==
X-Gm-Message-State: AOJu0YwJupjNlysX1WWqROxzfZFRwM8Jlk4VklBuxrijKxF+g4hlR/2S
	xSKA30Lg4KHaZ/r+F+SBDlS5uvT7zK9Exy8nDv+Y5zQBU2g0RAE/24or
X-Gm-Gg: AR+sD13/Pz+N+MQdachL1kf9K/LRcwPZK4BaT+c/qo2StyrY73ug7P2lbiZCR6vBAHn
	FstXsUCfIUHarJvkbX+6wVH3EnOZ/gIY2oPbeqzzbBqieJPN2tO1/UVUCjmE8ERu91kpVdOKq65
	OQsNgT6XuJ2B22I8/aJ6gAwyXIxWHA2jf+o9ro41KFbwdcfurL8FVPt6LyF4z2zkRU82Hay//IB
	4Am0ib9Zxd9yt6EWGzeaaOSB2nytn94iwH3y6FA6gU7D+zgP/vwXBjau2G7KMhv06KLPFB4mOlG
	h8kxcLwQeYkd5VajpYodyNQlvzgM2jDS9AiuNnPoUCuPHRg1MImlUs1sgECvZ00zaW7QhCWTuR7
	g8nJGUVBxPr2huvRqZS3c/uTU0rlictwMGWg2uwVAOHUz6ACZiJdi9ev/Dycpjli93X1XWJbClC
	AAQHvh0mABdmz2e+OmyjGGxiYP0aw7XHbiwdeU+vKWEf6KdNjHpClNHynPCD4BTwX3f9bNthagD
	aWXJwvjD5xx254Rc3dEcmmMc1qNd1CwhpQHww==
X-Received: by 2002:a17:903:2d1:b0:2cc:6817:d9bc with SMTP id d9443c01a7336-2d0523e6ee5mr149437475ad.38.1785851936086;
        Tue, 04 Aug 2026 06:58:56 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31586402e53sm8194292eec.11.2026.08.04.06.58.55
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Aug 2026 06:58:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <2a49b3d2-a69d-445b-b478-edf0f3b763ea@roeck-us.net>
Date: Tue, 4 Aug 2026 06:58:54 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (ads7828) Check return value of regmap_read() in
 probe
To: Qingshuang Fu <fffsqian@163.com>, Akshay Bhat <akshay.bhat@timesys.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 Qingshuang Fu <fuqingshuang@kylinos.cn>
References: <20260804091719.651479-1-fffsqian@163.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260804091719.651479-1-fffsqian@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/4/26 02:17, Qingshuang Fu wrote:
> From: Qingshuang Fu <fuqingshuang@kylinos.cn>
> 
> ads7828_probe() issues a dummy regmap_read() to enable the internal
> reference voltage when ext_vref is false. The original code ignores the
> return value of regmap_read().
> 
> If the I2C read fails, the internal reference voltage will not be enabled,
> and subsequent ADC readings return incorrect values without any error
> indication.
> 

This only applies to ADS7830, and the command does not have to succeed for
this to work; the chip only needs to see a start/stop sequence.
Worst case, the next command would enable it.

Given that, I do not think this is a real problem (much less one requiring a stable
backport), and I am not going to apply this patch.

> Check the return value of regmap_read(), log an error message, and abort
> probe on failure. This prevents registering a non-functional hwmon device.
> 

FWIW, that logic would apply to every single driver which doesn't access the
chip as part of the probe function. I don't even want to get there.

Guenter

> Fixes: 7a18afe80977 ("hwmon: (ads7828) Enable internal reference")
> Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>
> ---
>   drivers/hwmon/ads7828.c | 10 ++++++++--
>   1 file changed, 8 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/ads7828.c b/drivers/hwmon/ads7828.c
> index 149cfcec78dc..91ef0c4a08c4 100644
> --- a/drivers/hwmon/ads7828.c
> +++ b/drivers/hwmon/ads7828.c
> @@ -112,6 +112,7 @@ static int ads7828_probe(struct i2c_client *client)
>   	unsigned int regval;
>   	enum ads7828_chips chip;
>   	struct regulator *reg;
> +	int ret;
>   
>   	data = devm_kzalloc(dev, sizeof(struct ads7828_data), GFP_KERNEL);
>   	if (!data)
> @@ -166,8 +167,13 @@ static int ads7828_probe(struct i2c_client *client)
>   	 * voltage needs to settle before getting valid ADC data. So perform a
>   	 * dummy read to enable the internal reference voltage.
>   	 */
> -	if (!ext_vref)
> -		regmap_read(data->regmap, data->cmd_byte, &regval);
> +	if (!ext_vref) {
> +		ret = regmap_read(data->regmap, data->cmd_byte, &regval);
> +		if (ret) {
> +			dev_err(dev, "dummy read failed to enable internal VREF: %d\n", ret);
> +			return ret;
> +		}
> +	}
>   
>   	hwmon_dev = devm_hwmon_device_register_with_groups(dev, client->name,
>   							   data,
> 
> base-commit: 848acc8ffe1b7cd5f1bf427b93069becfebc2c9d

