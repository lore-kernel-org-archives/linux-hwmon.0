Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC8D7191F75;
	Sun, 26 Jan 2025 14:59:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737903582; cv=none; b=KwkViHQWMKbpgz3rXjrW+cyIqy3jyuhbq+A3Vn9lc7hUOhDpK4uo/2vtSn1wH3VpvWFQ+Hxam+XUb5CZU47wn5v/ggpRvxd+hwqdeByz8bWmTbRM9YWZFaMpcW0MfQg28MtBqYdKiFAVuRbi9Vb7j6XZRwXew3feRZonuWI3eWI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737903582; c=relaxed/simple;
	bh=uJ12OBZuzNxcOXbauuPdBYs/R2mQsHEn97BFEXjOnF8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=o0YcsQ548Uz34gXpWpFKlV3Xy71o21c5ofl850TwhvD5XXvrn7uHG+3QkykeR2YgLgjpSB5vY/wo6AX97zryvT3pY8H0P9HftcsfUWhupABxmacSmPn4peQBYsbOTxZ2VVcfz8i4zQq8x0ZVUwCcKz0eHpUoZHWXdPbQN0TVZ6M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=GB91e1E4; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="GB91e1E4"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2156e078563so49696475ad.2;
        Sun, 26 Jan 2025 06:59:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737903580; x=1738508380; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=qweapBg9FbSRisDB2eQFpL2LpNTVTMmLDCEAs2w79a8=;
        b=GB91e1E4gBafP9v+GTIq6zCk/4EKmXu7XoVFPHOVFaL/wFE0QKtCQLROEW8lFbs2gA
         xz3SRheq18bk7WsSfOIKxZjqhyCBcGD9GNqFnub7A/I6MXAC18nHxaC3TRpYfUDYfhef
         YHPlEruRdEqbhZTRLVEHcftfWveOQRm0zNIJATp3YuxjT1ZauzfDZG++D00CJtOGsMvj
         F+1nlKNY0IxomYSBJmAv/mYjVm2AgDnbEiEOp9lysjjwFkTH70QpFygvV8LHFfU/75kv
         MZpK2VWnLmGhpobabwyial+OfQIav+0URzSr0DPFkwGSxY5Prok1FDZjiaPvboD/Mtb+
         eb2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737903580; x=1738508380;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qweapBg9FbSRisDB2eQFpL2LpNTVTMmLDCEAs2w79a8=;
        b=T0g8NadLJ42E9hSauXfNcB606EPIXTEwZIN0S6bTfLUYXPKalfCmhcCs+0aOn/V7YV
         hypO77xx2JH2xDhjD4tJ8d2oY9MzF2PwA6aBRExLzKeMs9QzsstYx3daEGZrQw1a5DEC
         7p5zObb5IqpEIyWk+sz7YWtxwoeLPo7So6F0PJOifEodaA+MyloXoNmGl6AM260E85l3
         +DUvkcbuU8VRQpR3J4zwBECHIS9hxsslVFpNEyeygV9d7iQTv2pn2BDfoSY2I5402v79
         hteDbP/47/VPGN2s+SZ3J0BzKNKNeJt1br452T+S0ZnQTS9gSUWEdG1kXj1R0hlqI0zB
         lM6A==
X-Forwarded-Encrypted: i=1; AJvYcCUOzOzOLBk6J/3TaB3XbmKWRgv8UGq0buxyeu/SHLXa+dPmLMSC04omnN+4o7LSRaRc+3zeD0VliMrddR33@vger.kernel.org, AJvYcCXiwU4bhezrciON1uiGNMF15PaQ4wejvp1xopC9rHkSxwQYU0SXkeEBhNSlVhEWAzSpy5gU7h9HgfqU@vger.kernel.org
X-Gm-Message-State: AOJu0YwVlRRBa3Dcf2KCchTeGs2SsZis4PpXSo99L3i7nGR8mqySG26A
	ECZ8gTck1iULKeqv/i3G1bLiDT8uV5/tszZ6GdYEUikQmi4CfZ/h
X-Gm-Gg: ASbGncteR55+subQ8QsYihdFxvyAPbzzpIjH9eFiuLqVWeXJfFT8YS2Q1BwOCWolOga
	+AdKUdealmZmiCczs6PwbgUwss8hx+j71YQRc1Ity/JW7CM+FtAZY2GwqupcTxStc8ITsZKKk7c
	PctQLdCLt4aFZ04Vugnuulobg7fBRawpP2Fgc7x4SLzL/48/8A6zsMBWbz5AK//lRvJXf8FavY+
	ekStiOeYi3PHLOaeQIaqMLOw4rV4KKeLkjmaMLx9U9rdv+IZjUQvF3RhW9XUSkm1zZDn04gWDt6
	2etHGVedj2Pz5+5rQEdBfbOchk9FxgbdM02Mv9Yi7d2oYEyqg+gTOA==
X-Google-Smtp-Source: AGHT+IGksXodijLY9L/txQLy3N5ocLxE8IK2yLcs9mY2c2TYAMekVSWc4QDqxo99BoAniI9qw97Ccw==
X-Received: by 2002:a17:902:fc8f:b0:216:6c88:efd9 with SMTP id d9443c01a7336-21c3540cf8fmr578100305ad.15.1737903580004;
        Sun, 26 Jan 2025 06:59:40 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da414d905sm46797975ad.180.2025.01.26.06.59.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 26 Jan 2025 06:59:39 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <1f76d87e-cf99-4114-bb3f-d812bbc5b45f@roeck-us.net>
Date: Sun, 26 Jan 2025 06:59:37 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: add driver for HTU31
To: Andrei Lalaev <andrey.lalaev@gmail.com>, jdelvare@suse.com,
 conor+dt@kernel.org, robh@kernel.org, krzk@kernel.org,
 christophe.jaillet@wanadoo.fr
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org
References: <20250126144155.430263-1-andrey.lalaev@gmail.com>
 <20250126144155.430263-2-andrey.lalaev@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250126144155.430263-2-andrey.lalaev@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/26/25 06:40, Andrei Lalaev wrote:
> Add base support for HTU31 temperature and humidity sensor.
> 
> Besides temperature and humidity values, the driver also exports a 24-bit
> serial number and heater control to sysfs.
> 
> Signed-off-by: Andrei Lalaev <andrey.lalaev@gmail.com>
> ---
...
> +
> +static struct attribute *htu31_attrs[] = {
> +	&dev_attr_heater_enable.attr,
> +	&dev_attr_serial_number.attr,

I'll accept the heater enable attribute as sysfs attribute,
but the serial number is most definitely not a hardware monitoring
attribute. Please expose is through debugfs.

Thanks,
Guenter

