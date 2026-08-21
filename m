Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 248F043CECB
	for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 13:59:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787320765; cv=none; b=BJhNLRGrV2cWnmPwbs5dxwTEXfZuMAAqybR6Gh/0KODbU6g6MndR7q8BaVfSQM8vR3paYNKu/vifVf++KbzeSDSkeTUQvzQgVEfGRWrkx4BLu7ZgNbk/8yEIeWQpvfEIbkFzYKY8PlU7WWCJBXERq0LUQ0Y+oZQ5xcmMKpWxjEY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787320765; c=relaxed/simple;
	bh=qtr5M9kRcMlxIU39pBaXTYFjjWSfbfDa9Yp8m/Ek44g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bCcR87fgRj0AX1PxSnM9SgrICTO8Sr40Fvojg31ndgUsdpCWOxCCsagHAoqJQs6m6n72Cq+axn/CIDFdu4lFjXlRkfgBhNdIi6XcQQfd9MBZgWsUfYPFuNSb6ecRK2pN6vYaYge8IGMMyqmjBWGtK1CRPu8IXh1iS8vpiZdK1iA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IVzuxtT6; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IVzuxtT6"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-84e507b079dso556377b3a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 21 Aug 2026 06:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787320763; x=1787925563; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kp+PiTgHyCi6WI6FjAvRbpzQuRf58nwxWK7WgL8b6UE=;
        b=IVzuxtT6PrLe3K90ab7XeNtWn4Eh8ecy/oQYM87LIr7yWGNCyAG/xY5s0q8v2PF7Zu
         zz/pBX+IOuJY0MnyhexifVxWjaAqzXV5WBCVd4BFRRCmI3c8Inilp5wze7Ni2FHGr/Cz
         Mu4NkBMYHTZtyqcR/hrT8ruHGyNPge5YoAVpxo5QVcOytlPr5WqR5TVftS4yL5L/yATU
         T/baZcf0/ZCqUhpHAv7274a5nMwB/Rd5iUsxiV6kBzIaBma3szIo/HvW+FDouTlsBczj
         N1ouO8Dqz4iOKpeeHgFzD0uQqoUse6AXFLkEKvJNLSNopt3zPugJnu3KWR9+syluccLy
         UOTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787320763; x=1787925563;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kp+PiTgHyCi6WI6FjAvRbpzQuRf58nwxWK7WgL8b6UE=;
        b=bDqlwF/Djfx9R9bXa/zapAdpI7KC0MUCrJjer1FQF5Wb2pfaaZMj6uSdZCn9m2a6p1
         uv4nFMhGQHNNyOrMjKFBkRXVNVOvtCiMfrsjoR+M43vCkHyhCaXoabjm/l97+UgJzJuf
         BIoeiLIgu0Jl44NL99buYhRCTjapfvHTlBPPW6Q8UpXIkNDN7+0mPdKFi3znJyXnq2gt
         fv7xXXtgwrkaLQhswyaD1v0mP5Zqd6m0IAf6CVn7Cdlotvns9y3r+o7LSWbM8kiOaHyw
         juvs7EqO+E9nc4FcttPk7mCcIJKbXBsI0pQS1XppeedkxYgbQOhCG5dgpsaiVr2NQHOe
         t9pQ==
X-Gm-Message-State: AFuF++ngm3Ep2h5LPlkwYlaNo9Z1xLuSCRSjeHV1WfJ+7T57rAggbO2Q
	Il7C6Oula4mamozM2N/lIxzQ3gh7msGy3p00HuQVe5Tbh3Plmdbs1Ru3
X-Gm-Gg: AR+sD10ocvQrxTNsBcoq4jNwTH4tD1iAedskDOdUwPNu2AF7O0xdUMHE81olBTXlltC
	ZPmGnudfWQABS7vIEQ5qSOyeJzqXzNWTWGTEft3/36WSBYNEZLktIRBBeE9wjaPvUeYMcAlKZwQ
	CmHjDAyNR18M1fnCiTXGqwd/VHqtCEDPfPlzG/AsU+wFAYUxRO5y+OD74m/Y5NlpMDB7HFJBQuo
	v+HiAnwOhcQE/k230P64hw9YEd0V4/vhsTB3Y+2ddn59oupB2eL9Xc/gVmC7AI296WzKgjwdjsr
	9ePmLb+6AFzjV13GvnsC8l7g3vQgqeAEHs0IidottTX9/Ut+ws0Q0sLNytmkyesRrj9XJcwKgFm
	J1/z0Fi1EIOeFx58BG80Ip0tumUtDaqzSlpJqHs6FecGVnSMtqTm1mcK/X0m/FAJGiySPh6dRyz
	w39BdvN8q6lDt0SY74T7dJTcj0V08lNJ7TrZyJWs05RxZXbUmgUzVkw8MqNAdxWDIcXJarAJ5Kh
	/hhQrpadgbcRGV8sEiZazPFTuNDLyCxGvOL3w==
X-Received: by 2002:a05:6a00:4106:b0:84e:216d:7e52 with SMTP id d2e1a72fcca58-851f9fd44b2mr11427077b3a.14.1787320763354;
        Fri, 21 Aug 2026 06:59:23 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-851d3392a96sm2912683b3a.20.2026.08.21.06.59.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Aug 2026 06:59:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <00ee05d9-1a7c-47b3-8961-e1b63f7bf3fa@roeck-us.net>
Date: Fri, 21 Aug 2026 06:59:20 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (pmbus/ibm-cffps) fix format-truncation warning
To: hanzhijian <hanzhijian1991@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260821115703.2017414-1-hanzhijian1991@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260821115703.2017414-1-hanzhijian1991@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/21/26 04:57, hanzhijian wrote:
> snprintf() with "%02X" and "%04X" specifiers on an int argument
> triggers -Wformat-truncation (and thus a build failure with
> CONFIG_WERROR) because GCC assumes the int can hold a value wider
> than the destination buffer.
> 
> The value comes from i2c_smbus_read_byte_data() and
> i2c_smbus_read_word_data(), which return at most 8 and 16 bits
> respectively, so mask the value to make that explicit and silence
> the warning.
> 

So the perceived overflow never happens, and the patch would be
purely to make the compiler happy. I am not going to apply such patches.

Guenter

> Signed-off-by: hanzhijian <hanzhijian1991@gmail.com>
> ---
>   drivers/hwmon/pmbus/ibm-cffps.c | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/drivers/hwmon/pmbus/ibm-cffps.c b/drivers/hwmon/pmbus/ibm-cffps.c
> index aad94bcb9..dd7ff3a19 100644
> --- a/drivers/hwmon/pmbus/ibm-cffps.c
> +++ b/drivers/hwmon/pmbus/ibm-cffps.c
> @@ -166,7 +166,7 @@ static ssize_t ibm_cffps_debugfs_read(struct file *file, char __user *buf,
>   				if (rc < 0)
>   					goto unlock;
>   
> -				snprintf(&data[i * 2], 3, "%02X", rc);
> +				snprintf(&data[i * 2], 3, "%02X", rc & 0xff);
>   			}
>   
>   			rc = i * 2;
> @@ -177,7 +177,7 @@ static ssize_t ibm_cffps_debugfs_read(struct file *file, char __user *buf,
>   				if (rc < 0)
>   					goto unlock;
>   
> -				snprintf(&data[i * 4], 5, "%04X", rc);
> +				snprintf(&data[i * 4], 5, "%04X", rc & 0xffff);
>   			}
>   
>   			rc = i * 4;

