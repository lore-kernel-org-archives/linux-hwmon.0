Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65C662B9A2
	for <linux-hwmon@vger.kernel.org>; Mon,  4 Nov 2024 15:04:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730732642; cv=none; b=k0eJurs4t/dyqZ0vlDZtqi58BFI5iJd0NVEfkmkwnJVbS2jkT2CYqQl2+VANOTKHcPoKvMM2hPbiGDjb/oYNpX4oQ1TaSZYWzK002ifZ/uqANOneGUbJQCmoolvO24RAyp+xjCMAg++iaA6eypyvMpBY7pbhziQ4sBv5A0ykM/w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730732642; c=relaxed/simple;
	bh=JA78MqzMLYF/rZIIXSLbq2ezrV130pnaTCD9BdvDqso=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=HlSyOGHfPOM5BSS24yEs6VJTFzBDBVG1utJ4Ukmb3SlIt36Ar5n8Lx1oeUnHT1Pyxe/6kddoblUj9uRigsefMGoaG11A9oEqvaQssNYKJmAHj1eJwgii9khT7Rxd2h6tL/XWlovtX/KM4xiyooZN2iZrSpSomqOU7+9OfbaMz5A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dhNfQK5H; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dhNfQK5H"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-71e467c3996so3652831b3a.2
        for <linux-hwmon@vger.kernel.org>; Mon, 04 Nov 2024 07:04:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730732640; x=1731337440; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=tUTt03eVpe0ssMqJVv+XySSin+XRbpdo7Fs+nC70IVY=;
        b=dhNfQK5HlTylLWaLz0xGy0D/3DZkMTqWGrCRAnH9ukIzcXKGbce0Z+XTr0uiW0kteC
         pReIoDbM7kZ8QazYQg5my/pU8MGpD25K18GB7iILoOaUNS7ReglqvoPtGjjbN6RlskkJ
         58mRfVSgBKhgQSgpZw4C1pYRTCrCb2EQM3ZJixMmM0BIkyet261tNW4ibplAfq8JPJlW
         YdXA80L0h4jSsxQqM+iHTNPuTCVfdFg/T1wiqJZhCMJ1iXveJDG454G643RTAGrYtdtO
         dBhzEzm/t7qW3D/NY0MNEyEdNp5GTgxh1Thvan1pPxpApZAEYdMgU94j204WLA1wAQMN
         ymhQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730732640; x=1731337440;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tUTt03eVpe0ssMqJVv+XySSin+XRbpdo7Fs+nC70IVY=;
        b=VMpisN9Ci+KJpojkIiCu1uzUGEv1myzC6Pnd3B0ScBaiP9WnN7w2FKsS4eUeHdGQ/L
         9Dc5vc1WnKXPKXzV2pgwsUFNaTA5vOeasQZYnJL+64T6s2uJXGvEa2Lap90/ZtVlRQet
         /FhGi9SvUjeWb5zOSM14BDgT57y+n2NeUOAQ4fDGe0COUZ+1iVTN3hU5IA8Hfn9Pg6Cw
         bi5pg/dDVUWw8Pl2ygcn3+xfsIPa22WFTAXz0HMXqpDVCgKyarbWMK4O5mUu0hn2Tk8k
         Gfe40p1JNs9wD+oRLNANpxLXERIWD9NR6dtvddMI9Qn5K+LBs4HVGYI8+WT10f/qoDCh
         8f1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWF35/+2O/9OY8tP6j5w/cENp5ZJ0+F6CB3EN17ZZyJz0mYlr3sIeS9Nk8MZtCfBQ+g4k+DL2F/gU+lPQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwsfVKiqIGpNrk5hpI7HgDbK/3u1BW944qXXsJszJ4FS48r95FX
	p9fQcl87lYEuxmnPbaTrZ5pAUcvAvDurdqe1/XQwcOUBceKKSBtuzEO7sQ==
X-Google-Smtp-Source: AGHT+IFdnSNifjrEe0Qb+iUjJff+zCu2Yl2HbG6CFPUgsTo6bZcN8AITmmI4UCMNYYhy0a+1Acgmrw==
X-Received: by 2002:a05:6a00:2282:b0:71e:6ca4:6f60 with SMTP id d2e1a72fcca58-72062f825e3mr47910733b3a.12.1730732639021;
        Mon, 04 Nov 2024 07:03:59 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-720bc2eb5a1sm7549432b3a.150.2024.11.04.07.03.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Nov 2024 07:03:58 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ed296133-4139-4618-b8de-f8826064576f@roeck-us.net>
Date: Mon, 4 Nov 2024 07:03:56 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] hwmon: Add trivial userspace-configured monitor
To: Ahmad Khalifa <ahmad@khalifa.ws>, linux-hwmon@vger.kernel.org
References: <20241102174639.102724-1-ahmad@khalifa.ws>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20241102174639.102724-1-ahmad@khalifa.ws>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/2/24 10:46, Ahmad Khalifa wrote:
> Add a userspace-configured driver that can receive IOCTRL
> commands to monitor devices over IO or ACPI access.
> 
> - registers a miscdevice at /dev/trim-control
> - awaits attach/detach ioctrl commands with device details
> - reads sensor values from: 1. IO select registers, 2. IO direct
>    registers or 3. ACPI method calls (single arg)
> - applies basic conversions: multiply, divide, dividend divisor
> 
> Useful when there is prior knowledge of the device or when
> experimenting with newer devices using old device info.
> Another use is for debugging other drivers when raw reg values
> need to be compared with what the full driver prints out.
> 
> Drawbacks: Not aware of any device. It's readonly. Readonly does
> not make it safe as it still writes for address select and bank
> select. Needs an ioctrl and cannot be modloaded through config
> or modalias
> 
[ ... ]

> diff --git a/trivialmon.c b/trivialmon.c
> new file mode 100644
> index 0000000..11e5829
> --- /dev/null
> +++ b/trivialmon.c
> @@ -0,0 +1,844 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later
> +/*
> + * trivialmon - Trivial Hardware Monitor Driver (Trim)
> + *
> + * Userspace-configured monitor controlled through IOCTL
> + *
> + * DISCLAIMER: Don't run this with other hwmon modules for the same device.
> + * You could easily FRY your motherboard! You could also easily FRY YOUR CPU!
> + *

This is way too risky to add to the kernel. I think it is much better kept
out-of-tree, with lots of disclaimers and users (hopefully) understanding
what they get into when loading this module.

I had thought about something similar some time ago, though limited to i2c
devices and using some kind of command language, not open ended ioctls.
I gave up on it for the same reason: For some i2c devices, just reading from
a register may be understood as command, such as "restore factory configuration".
If such a command is executed on the wrong chip, such as a power controller
or a display controller, it can easily make the hardware unusable. It is bad
enough that this can happen with a kernel driver as well, or with someone
executing i2c commands from userspace directly. I really don't want to make that
even easier.

Guenter

