Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8D9D13A3F7;
	Thu, 23 Jan 2025 04:14:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737605669; cv=none; b=AllVzjDy/YN4W63bU/qLpM8hceI0+E43GphZXsqUnCcqKIPwRu8qOgeZtpdEeUuS7SoGciqX6OwOH7LyfPY8/TF3mn68TuiIP+DUZZILQNod+WLtbgEuHSpV0eBIX6j8ZqGYi6CcvdsUh3i7Qtuh1ChGRW4wYYHUfaRQu0VHHvo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737605669; c=relaxed/simple;
	bh=qtrU6sAP9FlSzkkMqvxUmpp6wbofX5GmuU7joEJT4Rw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QjPVyPr51Q9AiFRUJjikC5skrQzb1ilqXoJHhSRurrS0FMO4Y6HLJdlxZwXU4lu3OstvXJWeb7YsRQMnWPCXNjTtukFs0zHfTMlohE1rbnmCU1CbOy4VSe0vb2ymusQ5eZeuk2Iw8J4sNHONcRRSwOJIOvknajuHvuQFO0b3rv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VcjOcb8l; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VcjOcb8l"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-21654fdd5daso6508985ad.1;
        Wed, 22 Jan 2025 20:14:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737605667; x=1738210467; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=rfNNFVvQHfZl2o3ezZHcz2HE58fuESFVNAsh4id7Vgk=;
        b=VcjOcb8lLxURMRuKe6uUS4v8flHC5mxXtwAoZE071KnSpg7I1GELI2yGl9SrGEgs4N
         QEk8d1ckObr/FAOcsApIaEDc9I1L2JBdrv7tUfo+N9C5AoTh9OCbithzMKZfwFAGlITU
         Ka67i/2BP7yvP1m/hPlKWiUcDKLNzInw7C6SWUKTD56FgLdd7nj6dY1XedJKRnBuEndW
         eLeZjIUhkkSCQ5M/B3hEJ/w+i/681ALOslOZj5Hxm4nQ8sdruuKaI5GOk8sxUjS+DTNd
         A+ibHfkLJy8ihFe450urtF+L+8ugabZO0vesraGAnj9CLSiUMv+SWEma3FJB5eMhUHRW
         bjeg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737605667; x=1738210467;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=rfNNFVvQHfZl2o3ezZHcz2HE58fuESFVNAsh4id7Vgk=;
        b=dH+0wF3BZfjAFvrxARBravau6+sZsbx53shzQUAjQgqbyr82IzsCTw9BkUOe0pNdH4
         zQP3lCBVTt+jdJiV3WVjKp7kxa4m3Lr74lfJkAFy+P/CKZJ/MoqryOdRU1kNQmgk7iAc
         7fwgPzO5jDPitRHZ0zVkxJbh9uGJyDP0c53+a+jzHtdy9Pu6TFsjtWo/7x+WFrbncmG7
         GkI2nZsX2TPvnUw3+euVw3iGam+T4p1Wg+PjBMYRianQQBFBHQ/z3dShFFe85rtwjAxE
         hqUcU0/F+yqQDfNtB2iyhN0F6FuMW3xL5fpjE9c4GJkuP0Z0aKfwHwKNBzKQA5PhMYVB
         5e8g==
X-Forwarded-Encrypted: i=1; AJvYcCV7v5EzVIrLc6mqsxjIyqylJUKw2dppMcCjgFfW3kMeS3U21hq6TokRf9BlgTuGZyMRnkFQEECZklhIoq/a@vger.kernel.org, AJvYcCVp5lSSI8dxixpGGhMgtyEPfFq+DGgGNZ8eJ/Zi/E6fzx2GY67rmo94gLsfBVXwA+cFLd2Z/B5dTz7wYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxI2NvgeKeZkjAXd0TGlOtwHWuGH5kKqJgdQcuHBQ0syTrlZ4Bz
	avMY76BIPETlV9UcB9OLZraTPPTiiLtQCzPCgz35G7AJrQ8yyxM8Rlrv3g==
X-Gm-Gg: ASbGncsvoxmbcrNpOPi3M8T4R7kEprXrFt05/y2roUfMVom6WxG/+AyYGGuzSQvMMpb
	HnFC54wZWl7mX64L9IPIEa5x+GZYdyxA2LRxChuirOtZ9L5OrLRGOEM9Ix+nD1dSxD9xLZ4TUc6
	KIO8DF2wh8gTyGYfAMwl0r4X/s8mvAwo3FzqxgSoklJddQc1UUj8pMaVnIx3dIwRND6iHwtEX8B
	A3NG634QIbV9z8Qfy6a3AdmxfgJzwmH1UVv2+k5qXfJ8f13ZLCqe/8XzZbKHsxGX3q7YpFq9GLR
	Xa1YXxVfuSZvUZGxhxEn69Fo53iDeFBMOHjfI5D9GcLc+oqkFq0iKQ==
X-Google-Smtp-Source: AGHT+IEQOFeZKeE0yHsIXzVFjspxZYFEAtq4ZuVfDCRkrP3p2CAD1SPzcxYQo8R0V+GLyOZOxLI4tw==
X-Received: by 2002:a17:902:ef11:b0:216:3dc5:1240 with SMTP id d9443c01a7336-21c355ef44bmr339855005ad.45.1737605666881;
        Wed, 22 Jan 2025 20:14:26 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21c2ceb790esm104342725ad.85.2025.01.22.20.14.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 22 Jan 2025 20:14:26 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fe34a39f-66aa-4dc1-bf8a-860f57592087@roeck-us.net>
Date: Wed, 22 Jan 2025 20:14:24 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmom/applesmc: add imacpro
To: Atharva Tiwari <evepolonium@gmail.com>
Cc: Henrik Rydberg <rydberg@bitmath.org>, Jean Delvare <jdelvare@suse.com>,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250121123114.3393-1-evepolonium@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250121123114.3393-1-evepolonium@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/21/25 04:31, Atharva Tiwari wrote:
> this patch adds the iMacPro to the whitelist
> as one iMacPro has been released (iMacPro 1,1)
> 
> thanks
> 

 From Documentation/process/submitting-patches.rst:

"Describe your changes in imperative mood, e.g. "make xyzzy do frotz"
  instead of "[This patch] makes xyzzy do frotz" or "[I] changed xyzzy
  to do frotz", as if you are giving orders to the codebase to change
  its behaviour.
"

Also, "thanks" is not part of a patch description. For details on how
to write a patch description please see "Describe your changes" in above
referenced document.

Guenter

> Signed-off-by: Atharva Tiwari <evepolonium@gmail.com>
> ---
>   drivers/hwmon/applesmc.c | 4 ++++
>   1 file changed, 4 insertions(+)
> 
> diff --git a/drivers/hwmon/applesmc.c b/drivers/hwmon/applesmc.c
> index 7964b0e0c5e8..20e390d595e0 100644
> --- a/drivers/hwmon/applesmc.c
> +++ b/drivers/hwmon/applesmc.c
> @@ -1373,6 +1373,10 @@ static const struct dmi_system_id applesmc_whitelist[] __initconst = {
>   	  DMI_MATCH(DMI_BOARD_VENDOR, "Apple"),
>   	  DMI_MATCH(DMI_PRODUCT_NAME, "iMac") },
>   	},
> +	{ applesmc_dmi_match, "Apple iMacPro", {
> +	  DMI_MATCH(DMI_BOARD_VENDOR, "Apple"),
> +	  DMI_MATCH(DMI_PRODUCT_NAME, "iMacPro") },
> +	},
>   	{ applesmc_dmi_match, "Apple Xserve", {
>   	  DMI_MATCH(DMI_BOARD_VENDOR, "Apple"),
>   	  DMI_MATCH(DMI_PRODUCT_NAME, "Xserve") },

