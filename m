Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ACAA3CF1E7
	for <linux-hwmon@vger.kernel.org>; Tue, 15 Sep 2026 04:38:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789447102; cv=none; b=F65d6POcxMFdDoUhFOCtdoJ8t+sO1qfqmBDdpeP+qPTZ3SAW2kC+N9XRP+cyIARyYfwQTHRBo6zsFd1Xy36jj3LOpzoAEI8AcHy4s+1J+R8ndQi0FG+rghaeUmRFzdPS2rfZ1Cc+UfYeLEBdPbGdl3JBouHa1PrII93bcvbnXdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789447102; c=relaxed/simple;
	bh=byONPyUZbkcaNu5MmKjxg+IDL9AWfX3kyeQ9JGh+YMg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TJRG4ZOcJ45BWw7U+BTve7m6g8IS9hIYkV+YGbU/Q5wfK28RGak+Fwe/es/Y1GU2GpS/E3YoaQEFBwLWjvBKQSrgCcbadKJUVNOXen2FgNajSxbXCvmdrmtZ/DySVUrHoYGQyuNWfVFIvtyBCgCN7x+DFJ+LD8Wmf3nEDC7ZJ1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RZU3Fx3w; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RZU3Fx3w"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-39b31b4281eso2850015a91.2
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 21:38:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789447100; x=1790051900; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uNE3bwaTCGDX6nDbrRzGF5uf2GpBaOmhy8mPPMtypEM=;
        b=RZU3Fx3wmFiq7fRosmJ43OKj+j+MVx/0aKvlZtCyYo5VMC0XAARZqP5v0SHCmv4MvS
         BXrlRgnTgRzVodnATslPzDcPK/FdB8NEFIZ1La/F2CfObFiUBCi3QrzivtQQQtQpK8IS
         IweXH5ZPMhqzVYwSqSA1msO37/4t2bPKcmREHLmEBn7/o4yEqWsns4iX78czqWjYE20F
         fOlRB0hJVdD306cV0hA27RNG/MmB+U9WFd4H6TuZ6PP0Eyo8aKj7GHyiK/9YeaGe6RUN
         zu/jRml+vDhkSe8Waeu3XfXcxMNTEw6+ak+wuZHCmsEQc3v/elG4Y2AnYK/d66ZiDx4w
         s1lw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789447100; x=1790051900;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uNE3bwaTCGDX6nDbrRzGF5uf2GpBaOmhy8mPPMtypEM=;
        b=2USRvuczFFkp09xL97HspF/RdmMTKnE3ssedy8SS5Nl4UOl2eAAdaqPkKQV7grShNb
         BvP1uzSAbhRhNrFeCYmnOdBIV1ebuFwkPyOwFHMfwPG35EFh24l2g2+Vd/anZSwFqC2n
         +wHYypJaBaFJId9g+HhVW+78Bf+737p/xfo+/WwLLtM8yKOFp8167dFegTlxVte3gPdz
         tK2fPVl9DqTECFK2K/wZ1L5OjwHRJ18+iDDQPuE9KAGPVLm7rPb/mPRqXjBUoCqh5kN8
         pq1TywNx11v/WvGHLsJNY8K/KPeUC6Uh0HRR6ojg9BYFsbB3BARHVrmrpfzwikVj9BL8
         YXwQ==
X-Gm-Message-State: AFuF++kJpRRiD7+3R/X3GiNZXvxQ7l+IzcBdGN7JC8FOtHC5mZ28iIvq
	kproEaZutv8KSXrX32mg6TgHSb9MH2sbEokl5CGAyaHpRVWZbNHIyX1q
X-Gm-Gg: AYBFou3NB10vAazPrLvrbzN5l5eqqyT9aIwrKnGAaePy4gZS0d/rqcgU3pcTscfAGzx
	5rY6vayXrxny8cUzGi0/ZsYnVmrWyLsg0uyTkpizkP0v0MzDtkydEjtwYbxL0nred++/b3IxIB5
	1dMh27NsBylzCFE0bdupyy/giIwi5drt/WaLMCFhn/ulcScOUu9bmdKsC0x2ACYTQnV8CoYxmzm
	HyuR4uQpMmF+0j8ZC3kfnYqOK986oL2OqBbOYGg5c7GpBJC2srzWuiFSXgP8q7r5ZaazmwWBdiV
	5xuEUB+YHVp3lTac1nx9dFghM1tFsZ/Xen2xwNul3z4SmgJgqHMyqXn/2oWSTwLhqwqEsN+fS6S
	1ou2NcZqj7THrOUxm+cr+RYtaBEIXJYPUSDQ58pKAgu2XZxB8JpZ6geqpT28KCH5isUH0EgsfY3
	HEqobX0UYmngtafCWJtTp4a2uqxerwUWVNFfuR5U2E0QgtZBYRXInoW5/DxFe14+eyZqV0zJHu4
	sy/vsuTVkwCR35N2I6nu9/igxGJKKyq3MgJsglYWFxWalOc
X-Received: by 2002:a17:90b:4a85:b0:39d:f731:e5f3 with SMTP id 98e67ed59e1d1-39df731eb5dmr204600a91.24.1789447099934;
        Mon, 14 Sep 2026 21:38:19 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1438d89556asm3067248c88.13.2026.09.14.21.38.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 14 Sep 2026 21:38:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <b7b45dac-d9ad-4af3-a1fd-8d9aced30dc4@roeck-us.net>
Date: Mon, 14 Sep 2026 21:38:17 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] hwmon: (aquacomputer_d5next) Avoid truncating
 scaled sensor readings
To: Vas Zayarskiy <contact@vasily.cc>, Aleksa Savic
 <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>,
 Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-input@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>,
 Randy Dunlap <rdunlap@infradead.org>
References: <20260914233728.22725-1-contact@vasily.cc>
 <20260914233728.22725-3-contact@vasily.cc>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260914233728.22725-3-contact@vasily.cc>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/14/26 16:37, Vas Zayarskiy wrote:
> High Flow Next power is reported in watts. Multiplying the 16-bit value
> by one million can overflow both the signed intermediate and the u32
> cache. Store power in long, perform the conversion in u64, and clamp to
> LONG_MAX. The other existing power conversions fit in a signed 32-bit
> value. Return ENODATA for unavailable power instead of exposing the

-ENODATA

> stored error as a reading.
> 
> Widen the shared current cache to u32. The Aquastream XT calibration can
> exceed 65535 mA; clamp its negative calibration results to zero before

That isn't a calibration. It is a conversion or scaling to hwmon ABI units.

> assigning to the unsigned cache. This also permits devices with scaled
> aggregate currents to store milliamperes directly.
> 
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>
> ---
>   drivers/hwmon/aquacomputer_d5next.c | 12 ++++++++----
>   1 file changed, 8 insertions(+), 4 deletions(-)
> 
> diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
> index 1ca70e726..9178ac4cb 100644
> --- a/drivers/hwmon/aquacomputer_d5next.c
> +++ b/drivers/hwmon/aquacomputer_d5next.c
> @@ -19,6 +19,7 @@
>   #include <linux/hwmon.h>
>   #include <linux/jiffies.h>
>   #include <linux/ktime.h>
> +#include <linux/limits.h>
>   #include <linux/module.h>
>   #include <linux/seq_file.h>
>   #include <linux/unaligned.h>
> @@ -599,9 +600,9 @@ struct aqc_data {
>   	u32 speed_input_min[1];
>   	u32 speed_input_target[1];
>   	u32 speed_input_max[1];
> -	u32 power_input[8];
> +	long power_input[8];
>   	u16 voltage_input[8];
> -	u16 current_input[8];
> +	u32 current_input[8];
>   
>   	/* Label values */
>   	const char *const *temp_label;
> @@ -976,7 +977,7 @@ static int aqc_legacy_read(struct aqc_data *priv)
>   
>   		/* Calculation derived from linear regression */
>   		sensor_value = get_unaligned_le16(priv->buffer + AQUASTREAMXT_PUMP_CURR_OFFSET);
> -		priv->current_input[0] = DIV_ROUND_CLOSEST(sensor_value * 176, 100) - 52;
> +		priv->current_input[0] = max(DIV_ROUND_CLOSEST(sensor_value * 176, 100) - 52, 0);
>   
>   		sensor_value = get_unaligned_le16(priv->buffer + AQUASTREAMXT_PUMP_VOLTAGE_OFFSET);
>   		priv->voltage_input[0] = DIV_ROUND_CLOSEST(sensor_value * 1000, 61);
> @@ -1070,6 +1071,8 @@ static int aqc_read(struct device *dev, enum hwmon_sensor_types type, u32 attr,
>   		}
>   		break;
>   	case hwmon_power:
> +		if (priv->power_input[channel] == -ENODATA)
> +			return -ENODATA;
>   		*val = priv->power_input[channel];
>   		break;
>   	case hwmon_pwm:
> @@ -1426,7 +1429,8 @@ static int aqc_raw_event(struct hid_device *hdev, struct hid_report *report, u8
>   			priv->power_input[0] = -ENODATA;
>   		else
>   			priv->power_input[0] =
> -			    get_unaligned_be16(data + HIGHFLOWNEXT_POWER) * 1000000;
> +			    min_t(u64, get_unaligned_be16(data + HIGHFLOWNEXT_POWER) * 1000000ULL,
> +				  LONG_MAX);
>   
>   		priv->voltage_input[0] = get_unaligned_be16(data + HIGHFLOWNEXT_5V_VOLTAGE) * 10;
>   		priv->voltage_input[1] =

