Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1DBA1377EA7
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 14:33:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785162802; cv=none; b=isSPyV8RX67ECIgtladVwi0mV+zHr0q+zdJkc4Lm13Zpr7C6onuqOiQCmPVs4fyb7/JN+9So/v80GloipzC3IHywLvc4damkHE63nkPhd1IAAJ1x1lSxU8FSPrbr5TGpKXL6wWCX/gcVYwePsW96f12oJ0sdrM8Ck5hgODWCArU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785162802; c=relaxed/simple;
	bh=new4zwNPLhJEQoTrCIBzt7QgXrBvmxMz5tCaYXOr62g=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EntJKF5Eq/hqUzSuuJvDyIh4uDoxGjSZebNgiEnWSzJIYCwnGcF73W2JRbWNHomdV/QaqswcACAjW8gbtGxuDd1V3CjDeyEapbfO3scVBrYB1aZw4t8LvVXbd6vF8UPM8vfdYvpWsJ31icgUc8B/PiExo9ZgdvJvetXOkVrAKl0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JtYNk3bn; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JtYNk3bn"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-38dfe7eb825so2158899a91.0
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 07:33:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785162800; x=1785767600; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=S7utgMLZZMr+21I647eSTRB6uBO1lsFo9Abm+BkTNAg=;
        b=JtYNk3bnW9ExuRirS5AipCcnWXwE8SlObd0/gfJWHoLua1HQup/3wueqhaaefmLK7p
         QNwbdSvOY//OFTKJLjboE+KRMcEaZAVT7566KyT9Y6W2r7HpcrVNxBM3zYIjaWu3Yvtt
         wuHErqeZBIowyOUW01J/LMgvzi5tJFCdBBhqHulgOIrkUTvWo2xuqp2kClfgTY0Grgtr
         UYsjmzi95muZtE4eTfASK/CTtzH4jgdyYdbuWoX+S7Gxz1o4EBAzQvcvOToRZML2P1vs
         D4nl84Uvz+cZql1T5nYHNrj/8Rq5+YVW+3J9ZBCiHDAHosa6IWRHykmUAhvhjxn532LY
         wyVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785162800; x=1785767600;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=S7utgMLZZMr+21I647eSTRB6uBO1lsFo9Abm+BkTNAg=;
        b=ZMtc59Q+zZAUkM130m70WftBQMvBaEzZrWwBev3wjgjIC3xgZ1occZ+ZBJjR2gbmK5
         +5bwF7xwfx0lNKFrMvsONYkzGh4Nv9rDn1A9AywXFT8gzo6p1oJjzyiCEmlqfl7AxOqU
         NfY0At244rS4uC20db5LYobiUbvB1koyOUKoq3Crk9VW6jblFGZlK5WQh3Tm4IZVPmf3
         GoGVGMaZ0AkzEhV0MawY3AEliUyMuMs99VEXpu8UvVIJDF0rr0bRkM+VVe0UZYHxlHcy
         R0uPedZ/tAaw/wtf2+ObES9mQEP1S+xz4UU8wvpJwyXM+Ch0u/Y/Sgo4fCnJV3vvtW8y
         fjRw==
X-Gm-Message-State: AOJu0Yy4KdUOChyDrcup2Vy2lYZEJDd4yd7I9i14Oh8GSNoEg1KInblB
	mSz4C7U3UxoQJAZLDmp2ityzzijYSIF/g70OFfbn+ZY6NAjJSf8kz42yjTePsA==
X-Gm-Gg: AR+sD11kg5AG/fewKmC2xfl7c4/NVpSP3S+WgrnCX4fdgWhqir5m1iA3+5LRuNQtu/5
	Lppm7KftdkhsHgOp8fP/K1TUMq/MoW8RNnqW/Q0DIbyYLlaXSy/uFecZB/uMHHCe/0gAjquQvrp
	KJR2I3eZYGmzzYX3Eo1T5LNhgTI9aAyNLcPq0ObbDbtXYJ7TkJyrcuSyEUJdGC6gqC69on8uyJB
	X4GAgv9h1S9IDifPwaggv32tVffkxadZvCjXRfAY5DeBH0KBFK60UWSD/hDMbo8nibr1Ze0aUSk
	0y+vbGa8HCqoCnuU6ZqvpYgTp9ASePZzkbvhhZ72HEROW+bGOyHoU7D2CJKzbe8vbV7QPVfAnM5
	7aY80phOli+eG6RNS16YI1wurMMPWdLX9ngQ9CSxt7QjYn4FrEs8RNTa8t3IrEwsTjB/33twb21
	qzSZJ2akXOqUr5eLo0TVAmW3K/mW2odOAmqrDWN7uhwSSPUozF3Xh0iDtjdAteyQ==
X-Received: by 2002:a17:90b:2703:b0:38e:5b59:c2ff with SMTP id 98e67ed59e1d1-38f293cd41amr8279002a91.3.1785162800350;
        Mon, 27 Jul 2026 07:33:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc44cb92sm53859742eec.13.2026.07.27.07.33.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 07:33:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f15dd16d-0e3c-4d7a-a8db-59ca3d34d4dd@roeck-us.net>
Date: Mon, 27 Jul 2026 07:33:18 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [hwmon PATCH v3 6/6] hwmon: (adt7470) Use cached PWM frequency
 value
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Darrick J. Wong" <djwong@us.ibm.com>,
 "Mark M. Hoffman" <mhoffman@lightlink.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260727-adt7470_thermalzone-v3-0-21424d550c3d@gmail.com>
 <20260727-adt7470_thermalzone-v3-6-21424d550c3d@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260727-adt7470_thermalzone-v3-6-21424d550c3d@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/26/26 20:34, Luiz Angelo Daros de Luca wrote:
> adt7470_pwm_read() currently ignores failures returned by
> pwm1_freq_get(). If the register read fails, the negative error code is
> returned through *val while the function itself reports success,
> potentially exposing a negative PWM frequency through sysfs.
> 
> Fix this by using the cached PWM frequency maintained by the driver,
> eliminating the register access from the read path.
> 
> Apart from the corrected error propagation and using the cached value,
> no functional change is intended.
> 

An alternative might be to use regmap for caching and drop all driver-internal
caching. I have done that for other drivers; typically it simplifies the code,
sometimes significantly, since the update_device() function is no longer needed.
Something to consider for later, maybe.

Thanks,
Guenter

