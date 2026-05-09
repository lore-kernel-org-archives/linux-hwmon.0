Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1A0738C414
	for <linux-hwmon@vger.kernel.org>; Sat,  9 May 2026 14:14:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778336071; cv=none; b=TMihtBGvKdQ91EyMHdO46/Ox6dI3tLb+ILF6CDOeD+pyAJM66H1zPwX3sd59AIr/zxDthsQiZY6a610LcSy9jRbbHLhC27qX2OHPeyUzaN9s10q7FF7+agkzaYoiiIfFNBTncx3AZnHp9MK/vwT51S7OYA8gmgvvsgmfsQKciQo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778336071; c=relaxed/simple;
	bh=fVIQH2EWhWzjlxv9cJPtI+TZdFEzV66Pj+PTiEmdEf4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=iVTS/wD4BPsxdeqqutBUsDKy+2f6SY7re+H+xIEITxDMYTkIwR20h7c//aqkBCajPwYdIK9RzNtNlgkayjjjbi1yz9/OmGNzgix/oPsHxlR0OJFx0zQCLp+au3FO1E9HL8pUHL+uLcgOJsDTY3Ar5HFov9yTJ2G7fY/4aOcLOdA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bxI+QCml; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bxI+QCml"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-8354461da74so1402391b3a.1
        for <linux-hwmon@vger.kernel.org>; Sat, 09 May 2026 07:14:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778336070; x=1778940870; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=G8kXhF5s0O3Ic9ZiNv6RXHFSbFRQgsl3B4rvt8vDPgI=;
        b=bxI+QCmlDzFIlqfjW9Sb3cn/Mq7TxlkLmWDOiQHiW+3Vmw/RoC8XYNg7tSd0Mr6r7Z
         qAE+EHT4FW21OVe1I+bPWHEJuIDw9U0YKOCqime+u9Ew+yU7eM1mN4jXlKo26bZ49tm5
         8nZ+5bv12q9zFIu2vxrtVcdbb4dAhzVABBk4/9xRV8DHw6Zc9aM5Sgh9LJb+uzkHtQs9
         MiPtx6HbbDIDh6yfxJwQIwxYz1jJxJs6+WUoyCejhJdAsu7u3eNlIgt1DVcF1cxIRfzd
         0EV4yi3LNDMC095e98+/Ezdn5BHn4q9Li6kZg3fowQq9FrysP1L9cEJCwDXrM3CV+Q2Y
         Ae7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778336070; x=1778940870;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=G8kXhF5s0O3Ic9ZiNv6RXHFSbFRQgsl3B4rvt8vDPgI=;
        b=FyVZX2QVODVzadB+wVncsAHreDZeyaVG+58U7asd3HrxuIINAv50usNZtw+iGygnok
         hg8t/nZLlYFAxIKwkYE4kJSYD7fb9b5rjHgmy5o/U9iquIEirj3chSVn9JamXPcmJcsB
         WbFdKaFyGR2EomG19M6PLSSmt6H51N2isGZDaxBh8R2iFYOvB72+LQCHTUpPD7HJ/1ep
         B68W142//Y1lXPyJ/63e3D3S/nB3KZzEquVQXXmLCtbjN6649McvjiuBjifO8OKXQUwG
         5EOvTkz+lIaLbg+FFHXfAOgcD5h9UihS4sMbgeujrh3TLpv57ECMkhL5EePl0uqwp+pg
         96NQ==
X-Gm-Message-State: AOJu0YyFpH6uvNR6usFIRuvzdpfJy6/RuUIDHtI1u07shw5tY/HYlB+z
	blKWE3K6gHyENSSGm6F5IM1b69wDMXoenmZ49pDHUYUomOBCyIYJw17o
X-Gm-Gg: Acq92OE3kxdrgmP/CSviXXTA0lOgexnlKXyCMTbgWt+1GS/qyqV7MqhTPmXlZehqgG+
	i7YUuDspAiekzDoRyhkKQ4jzAcdVT6xHBb4zw5WCaifGfc3k9nbFY9Q3uUU1kH1y8J3pqZ24b3U
	XbyEA5g1ESKJbl07vmUhm6MLTVnHWP5g/79YdnRnp5apTykKu+YDmJ8KpfoydR2QhzgVzBzWREx
	lvXyuQBHik8vambL/wXLSNaMrX3bo+FXj0WqDJezx4l5OFxyNuGeZFWzGSQ7DNhCujlBHPZWROJ
	ptDdl4eVFhBV3vtts8FH5MWEwKKgt2YtM5Kraf4O1ig//wYw3sjjRJNbEMBCrsCCWM15nXvFAej
	5ajtu0TAHFnY1hW3JhEyLIWnibMNc+L5X/OVJKWXBAo8aJyBQtK8JEs6XHjFYRY++N0zuilQO5k
	VW6aUOYRZcGZLAFq8ZtoeOdQL9utwGh2zlxRDkjbeIkkxc7RYKQePDIdHrCHSpf7YpNj6DBt/t
X-Received: by 2002:a05:6a00:1c82:b0:82d:30f:b197 with SMTP id d2e1a72fcca58-83e3a2237e2mr2394839b3a.22.1778336069866;
        Sat, 09 May 2026 07:14:29 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83965d36c10sm18887263b3a.25.2026.05.09.07.14.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 09 May 2026 07:14:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <53d965b4-ab1c-4cb1-9fc3-c99538336d53@roeck-us.net>
Date: Sat, 9 May 2026 07:14:28 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/7] hwmon: (pmbus/adm1266) RTC fix, blackbox, FW rev,
 rtc_class
To: abdurrahman@nexthop.ai, Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260508-adm1266-v1-0-ec08bf29e0ce@nexthop.ai>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260508-adm1266-v1-0-ec08bf29e0ce@nexthop.ai>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/8/26 16:33, Abdurrahman Hussain via B4 Relay wrote:
> This series fixes a few issues in the adm1266 driver and fills in
> some gaps, as listed below.
> 
> Patch 1 is a wall-clock RTC bug fix: the driver currently seeds the
> device's timestamp counter with CLOCK_MONOTONIC seconds, which makes
> blackbox record timestamps non-comparable across reboots. It carries
> a Fixes: tag.
> 
> Patch 2 writes the 16-bit fractional-seconds field of SET_RTC that
> the driver was zeroing, restoring sub-second resolution on records.
> 
> Patch 3 exposes the firmware revision (IC_DEVICE_REV, 0xAE) via
> debugfs alongside the existing sequencer_state entry.
> 
> Patch 4 adds a write-only clear_blackbox debugfs file. Devices
> configured for single-recording mode (BLACKBOX_CONFIG[0] = 0) need
> an explicit clear once the 32-record buffer fills; the documented
> sub-command ({0xFE, 0x00} block-write to 0xDE) wasn't reachable
> from userspace.
> 
> Patch 5 exposes the non-volatile POWERUP_COUNTER (0xE4) via debugfs.
> The same value is embedded in every blackbox record, so the live
> value lets userspace match a captured record back to the boot it
> came from when correlating logs.
> 
> Patch 6 registers an rtc_class device backed by SET_RTC. The data
> sheet (Rev. D, p. 22) explicitly recommends "frequently send the
> time stamp to the ADM1266 to synchronize the UNIX time and reduce
> the time from drifting" when running on the internal oscillator
> (no external 32.768 kHz crystal). With this patch userspace can
> drive the re-sync via standard tooling (hwclock, chrony,
> systemd-timesyncd) against /dev/rtcN, with no driver-specific
> sysfs ABI.
> 
> Patch 7 disambiguates GPIO line labels on platforms that fit two
> ADM1266 devices on different I2C buses at the same slave address.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Please address Sashiko's feedback.

Thanks,
Guenter

