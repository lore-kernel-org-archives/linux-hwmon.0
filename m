Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 021461F8F1D
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Dec 2024 16:36:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734539805; cv=none; b=ZshIbbhDmA0nfwrhkcnbKXGE812fFs133tDXYIiADigt85ysE2IDThpTyYGgKTnJQ3gprGtGIGFciGbL54OP+R//IHtpQsZdglC5BpzlEaxfTQwLMk6+GXuuMm5HAN0G60N2m+LpBY4gHv4IssP7F5wfsquoKX6fEY2Fzl1ZM4s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734539805; c=relaxed/simple;
	bh=BvDJp/Q3tUaA2l1Wwsc80dpyRQaUhmI3zKZfpduBitU=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Vi6AXJ6RtYmyL7ZXSG0Sd3ol8X1zdawnKCCsUe5pbbuJoE6lNkgNQKQObeKu/SjE5WGv9eneAUm66VTf0nu0xa1i7yaNpAD/ZIVSbZr3UzgeetTEmzVQd755h8AyAAnNy8r8vg9KcLyujpyUGNx2iPgnLZCKdJ+Eva7uWGTEb9w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NmhA65Fj; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NmhA65Fj"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-2ee86a1a92dso4746082a91.1
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Dec 2024 08:36:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734539803; x=1735144603; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=TGy/TRjvOmj7SEboaw2Qsb83b1vIWi7/VXlDIL3Xjnw=;
        b=NmhA65Fj8ym5M7Ofj9Chm6s7t8yZgHTRUw1/AiUkIPW066QYM9w3e4hVU5SF/ZLPvQ
         S1XYxrc00Yl32KKZrAlGJbVT+wU2NzYb/l1PO74S11P3f88U/pY+WJHv8Z6AlTafpiuF
         KdtLuHU6ublrF9lhiYQF2r3RTb+EdhqOdj3n42wGeG0KBPfEjBpi2/P6OEYeaBbQ9+6F
         i1VF+2pvXpfPivDWAWzqA5a4bmTOH8CYC5eR+cg0Oo3leuYv/tyxIz0qY0OfFt/MlYDr
         s8oco7l0madzQX2rV8I+uzEqolcZ75fOH3zNoeYt0ZopU3Ya20obRWNxA3Q1z1n2bt9t
         4pBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734539803; x=1735144603;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TGy/TRjvOmj7SEboaw2Qsb83b1vIWi7/VXlDIL3Xjnw=;
        b=JUCuFoZ13iLyoSGNYojax1ja7oYQyMQapLCK90WFVDT6w7PYQGwVw6H7M7DRTgLD19
         daaJPADiRqbNotl3lENcMiVUVz94vc71TWkg3+/UC1OOawmTfaiON01RId1NqbYG+aTS
         Y4/yKrl7jU/FZAsRYUbqXlHqLbNwHTtLsvdstElhAAB1p0MVaLVCZypk06rMqPBdWHmD
         o4lhjPNauLKSqaE0PdpXarwf6ChaY66KHuOVm2UeJKinyzQPezn4XMdsve7vHxSz+OOa
         q4/3H6NJ8jgR1M0802eCtlQ/8UZBgYt/+mgpiUgYDMvtCM/XdRmmTFH80SqK7OEB1dCh
         WKdg==
X-Forwarded-Encrypted: i=1; AJvYcCUPECNtv4yMh4IV/+h9USAgKPyNMiDoOm98khM+bflsWiNsuILN46Ybmn0e9GyIMjJSDYpShP9crhHamg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzluykpnBWca+R/ia+rfUeddLerW9f4O6W3ux4GCc5kR8+jqO6J
	7g/6x7mYRyHBQKo73QWysmXfS/DcSERifRmfTPUIQ6576lonjaXm
X-Gm-Gg: ASbGncsBJ3qow8V7b6GB+b/jS2qCBTkt6E6g4wSiiH3OF0heSbf3+c17+NoG/uitM6c
	dhvdoMvleZq9LGhzkd0FXNJr0fDei2Qbtt1EBBUmOsTYjSXxfSKOrDEGEBsk/fOeeAl/dSmgWzA
	avRCOc9zvXS+4HVdkTQEFAA0o4o4LLDLqXZm5yQfTz/4+jcIpkmMp3HxmwYZZ2F69/V83XJ+u/w
	l63GhSbMfr49AAokwE85LVBt+tw59EuI/b1gqYRKe0Y37zi37AChN0/M4X7EYjJkKEt8WrGXFt9
	l96LAUeri1hVBEIdBw0PgQPlT8oxRw==
X-Google-Smtp-Source: AGHT+IFiS5aukM5YqRLBgRrVqdD+BxVbxYu1pHxyhCXas4J8l7ji0zdmDwyiHCMBoV/7WffaVELjow==
X-Received: by 2002:a17:90b:520b:b0:2ee:4b8f:a5b1 with SMTP id 98e67ed59e1d1-2f2e935ea77mr5253228a91.24.1734539803236;
        Wed, 18 Dec 2024 08:36:43 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f2ed644974sm1636392a91.28.2024.12.18.08.36.41
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 08:36:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d97d5227-9672-40cf-9df4-804b22affc3d@roeck-us.net>
Date: Wed, 18 Dec 2024 08:36:40 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC/RFT PATCH v2] hwmon: (lm75) Hide register size differences
 in regmap access functions
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20241218150404.2713377-1-linux@roeck-us.net>
 <Z2LzPeqyxqJz06dZ@ninjato>
 <bfb3ba78-206d-4f28-a57d-c25e7d90361d@roeck-us.net>
 <Z2L3dhneuMi9ckUe@ninjato>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z2L3dhneuMi9ckUe@ninjato>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/18/24 08:25, Wolfram Sang wrote:
> 
>> Ah yes, 'client' can be passed as bus context, and isn't used elsewhere.
>> The access functions need lm75_data, but they can get the pointer to it
>> from drvdata.
> 
> Yup, that's exactly what I did.
> 
>> Maybe that should be part of this patch. I assume you'll take it over - do you
>> want to make that change or should I send another version ? Handling it in a
>> separate patch is fine with me as well if you prefer to do that.
> 
> Since I already have that patch on top, I suggest to keep it
> incremental. Also easier to debug if something goes wrong etc...
> 

SGTM. I'll let you handle the series from here.

Thanks,
Guenter

