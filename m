Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AA941AC45D
	for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 15:05:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789743909; cv=none; b=Bdu/eeoeVNi3kHnXpBiMJgCBgxE7pkrKKVIHMjxW4UJyfPp4xBgadMzXXr+jVm1VzJ2bfVfR2d7jTB4jyfzLfO7WRJ9gzMo5oTeUzZZ8/P2d+svN/YI2V9h7OQBZrTESaXEIKyVgiNNsb0MWfd5YloQe9dPYNlLIEE6NtRaozp8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789743909; c=relaxed/simple;
	bh=f8mvvksl1SUaVUErzE+wRXUolyqXSD1KXdzSFkjjDE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Gwbr0wi2EkFKEKaRkJo6GsaPW0KJk2poFGjdtw7FdNN8M0QUowjHS1EIOl02xm4eW8Cwx4z9dUTHxfLQFedT5KShF3IvmquZlk4NeQJp/xaJy5fD+ihoBrstqJt7yl/UwdKYkGZ7tvMoAeyJSlowey5K/iHHr4EdIY4v0fg/Uws=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LTT7/XGJ; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LTT7/XGJ"
Received: by mail-pz2-f42.google.com with SMTP id d2e1a72fcca58-86dd69a1b15so278240b3a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 18 Sep 2026 08:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789743907; x=1790348707; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=e7y/CcPBO636TJGAw7k8rF+8LZq12IShhUAQly8K8oU=;
        b=LTT7/XGJdCSSeGDn6WqL0si5ZPiQRGsWXA9G24uNBrdbQkiyE4jaP7vCPjT4a0ZGk0
         X7nCTS5FOGS6wKbuCSOxXeLJ+b0I1x/xc7ICeiu4mGKd8dYYORqqEV67JXhBiNnzUbsd
         hf/iv63j8k3zVTEvirym4XgqwoHrSICiCwKLJWavSKwGgqrFzPJjs2EE3OzfJnfgT8E8
         oW9asAi+JlkvLLKHaBW2zig18FLEuBdMsUm63R7twIuvt0JhcIySv7qC5i1/9IPHcfO8
         YEdCV7pK4krnGuthPnhHqRoWnpcO4uow2SywN8pm06aKE1PQrNyUdsi0eKo9E93Z7tne
         n0/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789743907; x=1790348707;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=e7y/CcPBO636TJGAw7k8rF+8LZq12IShhUAQly8K8oU=;
        b=DV/8DTgkyp8WjT30OanAMgOyP8ooaVZKzQJqR1g5km5mTvub+ySVCecoh1byzA+TpL
         nx3TJr4FvElsrvUPTZpzrDXBqu9Spp/7FdJmHPu3ncNrXmEwbKDTIN8YFJiM8wI5YeBu
         3/rs8TR3FlPsyAXGn8QPWR4CzSoA2IU/JmxX6YR+uNmmGkAFdZ/nJh/Uy5iqPfDv1zK4
         TIs6UWfjIgMg3Q6HMEZbGnBVRfzBnluaRj1JMjN6tSDVUN2ADxGX9w5tgPowkVdj2ThY
         +lBYiNVY3g+HzUpf+hlM+nkMxxtcv5PlT5ANny25Ky+idbV7iUB9EwuzUUy2Dupujv2x
         vgGA==
X-Forwarded-Encrypted: i=1; AKwUvBy4m7/NXdGnvP283Y7fwYCWvkEX27JlvS2LwwGSUrN2sxnGg+sl9L5Rr9+RoSP56A0rFjO3YTvPb+j7jQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kljPHwV2H3YJkDF9hEEknpAH4US66OmdsU5cm0TnYxKiPxBXwh
	YRJl7cncqWPBYoO2dt7QiHdsWh6RRhZQOH73/frJrLRHQVUh7k61Z651AyOCksuT
X-Gm-Gg: AYBFou1DNXmZCJRt5fOQj2MWJGAZULkBZkj6BZfTbU1hXcVIlLb/CHuqgxYINESRyjH
	1wsEnn10gjYjWFPANF9oR9x9cfyEymlB0DAqq5396XkD03KFRwGepeLZ30LECzNJee5hATk1bV9
	jty4jDeiNx+Ichkv6vfPOBvSIHZIGdRT4hvatBeDMvDiYuqBODe6fyRCdh0sTcEwgvchfr7o56/
	qrZaN3CwClZXvsJNL8EVZq5Qentk7rTpdtlsK7RIeda2fO5uwmghoZJ/EuTShnYsXUS717tpQQ5
	YYtyUsw+AK1Ri5z/nk44LRNrt6uSMeDV4NoOrO/6+A6wc67lIeeRaQ7r1R5g/B/9myE2IGHtdUD
	UHsPfIAFAgGXUNPV0sK6WDCIpdN10qUkW5iHPop0LnoKle9TB200I69KIoBORdl6GO87BnujQYx
	aiJQpzzADenIXLrV/XJbU40iMXvIXSertxNmyFuQ1cEDEEiWZqj70t/+f+ApUS++koUveLSyZGf
	7tv0daK2orc7oO+h5QTTF0=
X-Received: by 2002:a05:6a00:6c93:b0:851:8bde:7861 with SMTP id d2e1a72fcca58-874d259ea4bmr4306819b3a.1.1789743907066;
        Fri, 18 Sep 2026 08:05:07 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-875dc8fd8c3sm1042506b3a.16.2026.09.18.08.05.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 08:05:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 18 Sep 2026 08:05:05 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kees Cook <kees@kernel.org>
Cc: Kees Cook <kees+treewide@kernel.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org
Subject: Re: [PATCH] hwmon: pwm-fan: Add const to channels allocation type
Message-ID: <4db2b003-f66e-4c15-a9ae-a8b4483f1168@roeck-us.net>
References: <20260917211417.i.173-kees@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260917211417.i.173-kees@kernel.org>

On Thu, Sep 17, 2026 at 02:14:18PM -0700, Kees Cook wrote:
> From: Kees Cook <kees+treewide@kernel.org>
> 
> In preparation for making the devm_kmalloc family of allocators type
> aware, we need to make sure that the returned type from the allocation
> matches the type of the variable being assigned. (Before, the allocator
> would always return "void *", which can be implicitly cast to any
> pointer type.)
> 
> The assigned type is "const struct hwmon_channel_info **", but the
> converted allocation type would be "struct hwmon_channel_info **", which
> is the same type without the const qualifier. As there is no general way
> to safely add const qualifiers, take the size from the assignment target
> instead. No change in allocation size results.
> 
> Build tested ARCH=x86_64 allmodconfig with GCC 16.2.0:
> drivers/hwmon/pwm-fan.o
> 
> Assisted-by: LLM coccinelle
> Signed-off-by: Kees Cook <kees+treewide@kernel.org>

Applied.

Thanks,
Guenter
