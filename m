Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0C03E3160
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 16:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778950090; cv=none; b=ZV+q0X2l2rtfkPQJPyy1GDfsHl1Clo813GHl/uF/+8B4/O6+go6ZMLEPFFUi3rNhuuaExocnhLQHifN6BHV3cMVMv5/EIFjhncsNDGTBqlKkwg2j/5iubTOxZXLbNkhaMHH6jQCeKqS8BkOaQ2ZYl+QZ8dZxmQZU+sow7b0UrHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778950090; c=relaxed/simple;
	bh=WMlOjIdiNANsBwMFWWoNNCkhaCE2V7Ythj7cNr6DgmA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=AqExJWNVYr8ex0J9k9OUt8zMeeU9WpA4fg1rloUGbq3nAF86mo55LBGI+g+3IqIjCj84kjf90GSKx7DUvbiCmKbE3lqcqZ7ekxHGrz9hLpEyrI8PewNnbfUoZzfcSsrP/nEhcnfjnabKGKa1vfcT/HTRNgk1WbE5Svu9te3xzsI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=amoeVVAG; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="amoeVVAG"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2b4583f0a1aso5171005ad.3
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 09:48:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778950087; x=1779554887; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=hYWEwhZdGymCfPIDAOUC+rMTpJ4gelKJp/fgl5s1WHI=;
        b=amoeVVAG2Ut3LrKUflGiDIxjSBS/mchQPFNwDKVmgNsYOXSLAmMJMEtgh0f4JFeEc1
         AZ8CGtSbwbAf+29ZPbLydKhZue47Ea43MvcJJ/cywVJKr9R6t5dX3M9BFv4/KxWn210A
         DrHhW8RzY5P0jmhSovJTU/9e+XJOAqH0Iou8tIY9g8gsPO1Cn+DlQj8KAls9XR1mgZ2b
         1ZTZ81DDmUDEno3L8F+6wXhkKKccpIwwXM7MIPethny+AkU/amOeC42PfyGBpMsokhDk
         id3WTCl/GFA3A2cvkXryxoBeVYyq+drEcIlLh3nwAxHExNDV/tvX2jkesgKPD8O0mMau
         9d6w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778950087; x=1779554887;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=hYWEwhZdGymCfPIDAOUC+rMTpJ4gelKJp/fgl5s1WHI=;
        b=fODfmTm6b/P7qYfJEjy+NSXnNltVE3iBwLO8XDIIj51UCyHMr5elxbZUZGuSJng0C2
         rQSrJeBSkjK8iNYngsRSrRESkRxdDAwe31+3ZQsbcoWMliRhe38vhSs8pF3YIfIakX3h
         z4E2u3Z7rdhNjdfQNvw5caVr5sBEHFMrgwW4+em9XQznit4JBI1y9mSBDnuElO1Lx2nF
         GV5cpbX2p3RUi3HrJXHKLxupPVj6gGX5fmXePY6uEISo/010ZWi8nE5HYctYio7YFqHp
         SZPsEilm9eDiKwnwIYIZE7mMSz8aKyOTlIZE97Cc2B13nRjFv4Smfg3bDLEkeDcFBcFt
         9koA==
X-Forwarded-Encrypted: i=1; AFNElJ9+4wLPEfJZOaRQq14hWj1L5yGzTjc/ZhRjMi/v9vjAoHHt1xMB3aYUQCnVGA/rqugu16aK+fICWJNxaA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxD3O2PjieecFkKuqRtKFUTbkcq1RUYgLlFOLZwcPcpo/eKqsvU
	N2iFOONVwvKMMColcG4gHGI5+rQhccCdvouxGwxdX5+iY/74thx4DOQD+hlEqFFA
X-Gm-Gg: Acq92OES6WiUDUsgpzJpHyEwWOzwUYs9mrSyJUjogQJ8cvPsYkI+TJSsV6vNoupFkt5
	YA5yOCG8nNPLDoMOJLthN4BUdMpQuYWWg2nITRyjC718bT8W/8JQ4nsRAjsYUepGV0mgJ+BLiA9
	ZvFSpNXhltv44iDqKM6RxBAWQRM37s0uHLLOx1r2xf4Ldq77s+squRRAeQsoMFe6wNWLPvFPiGy
	4kPgjXzgYiJPLT+mCPZL4LDi7Rp1y8ds1SB/FNfD2y5vCw68zR2qqYoXF3v2q/m1HGEMqBwwec1
	Sj/79CIsce0gGGaa7aPFG+BGRyVjF3fhX8/Wdf65RyeYSilha9rB2KfUsj6I4sxuVHvaY0d2PPK
	gHCo3tmE82ZOuTkGzIl8Fdn6Qu5sR87ONcPa9mkZEgZ2G9OrKH5tcsRtceeXadY7i4rnfFsj3Mn
	WcQ6HhPLtEXrWX7xiqBKB/+/yxG1T7YQCPprMqs5HNgsFlGd4fQW6JUthvFAiDp/UHNN8lQPfZ
X-Received: by 2002:a17:903:8cc:b0:2bd:ba87:40a1 with SMTP id d9443c01a7336-2bdba8741ffmr16241715ad.29.1778950087111;
        Sat, 16 May 2026 09:48:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2bd5c05f727sm98761795ad.19.2026.05.16.09.48.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 16 May 2026 09:48:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0c2187c0-be5a-431b-b65d-a5fd6bf47212@roeck-us.net>
Date: Sat, 16 May 2026 09:48:05 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] Documentation: hwmon: lm75: document sysfs interface
To: Chen-Shi-Hong <eric039eric@gmail.com>
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux-hwmon@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260516160823.1461-1-eric039eric@gmail.com>
 <20260516164022.1792-1-eric039eric@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260516164022.1792-1-eric039eric@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/16/26 09:40, Chen-Shi-Hong wrote:
> Document the sysfs attributes supported by the lm75 driver.
> 
> The driver exposes temp1_input, temp1_max, temp1_max_hyst, and the
> standard update_interval attribute. Some chips also expose temp1_alarm,
> and temp1_label is available if a label is provided for the device.
> 
> Add a sysfs-Interface section to Documentation/hwmon/lm75.rst to
> describe the supported attributes and clarify that temp1_alarm,
> temp1_label, and the write permissions of update_interval depend on the
> chip.
> 
> Signed-off-by: Chen-Shi-Hong <eric039eric@gmail.com>

Change log is missing.

Yes, I do see Sashiko's reply, but that is not an excuse for neglecting
to provide a change log.

Guenter

> ---
>   Documentation/hwmon/lm75.rst | 25 +++++++++++++++++++++++++
>   1 file changed, 25 insertions(+)
> 
> diff --git a/Documentation/hwmon/lm75.rst b/Documentation/hwmon/lm75.rst
> index 4269da04508e..fa8ddcaa0c2b 100644
> --- a/Documentation/hwmon/lm75.rst
> +++ b/Documentation/hwmon/lm75.rst
> @@ -181,3 +181,28 @@ is supported by this driver, other specific enhancements are not.
>   
>   The LM77 is not supported, contrary to what we pretended for a long time.
>   Both chips are simply not compatible, value encoding differs.
> +
> +sysfs-Interface
> +---------------
> +
> +================ ============================================
> +temp1_input      temperature input
> +temp1_max        maximum temperature
> +temp1_max_hyst   maximum temperature hysteresis
> +================ ============================================
> +
> +If a label is provided for the device, the following attribute is also
> +available:
> +
> +================ ============================================
> +temp1_label      temperature channel label
> +================ ============================================
> +
> +If supported by the chip, the following attribute is also available:
> +
> +================ ============================================
> +temp1_alarm      temperature alarm
> +================ ============================================
> +
> +The standard update_interval attribute is also supported. Its write
> +permissions depend on the chip.

