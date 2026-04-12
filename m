Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C460A21CC71
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Apr 2026 21:26:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776029168; cv=none; b=WNMxlaZqDFri1sz91O802/Jyu4Z8Qy5qTKruwV1gwN02K61exxjrM27iKDeFsxrrB8gSgBqntiIm44+QboyvyJ2u/6ffUpNVFurrO/GXgpd7VOkdZA7nDb+Plmfy9BVVLYN1oKqSLb1h7Y1GdHOrJfbZZExbCv1Wo04ghbQGT3M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776029168; c=relaxed/simple;
	bh=yNLe+SGJdzNljhesx4aut5AQpUeuoltAcUMEObSLyyo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=sOHkbDdFTh3pTZtJkex6HFwAE3pd79YFUQXDW/dH9epXtBfoL8K0C+83WkNtrqvIeEoebaRkCDzpowP6H3pANCUkpHvDtPJxNhI/Ruc9yMfR/J7ymd7azk3rDdgglZUTiuzxRfl1QJ1fXsfh+ahSf7VuWKXsTrxNaamSRJf9x0M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=S/1gnAtc; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="S/1gnAtc"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2b4520f6b32so3860224eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Apr 2026 14:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776029166; x=1776633966; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=g5YONsemN2vvgZ9asQJIXKdXNxh3MWkRpVIQ/RmrGZw=;
        b=S/1gnAtcRW4q8vMrKXaZo+3yw/hONK0ou8exVTXxPO09fhkJQ7LKAk5HtqX5y/ivtg
         wUjWMeRoWe+QUjx+YMXo43S0tOqd4YMdsgxbVjZngJ4VwiempCc7fqqQvKW6B4eRLKeG
         +W+nli4HZ/oJV5gS5BGXOztyQ2GbDp4xQZq4+4NnOhpqWYgrrTknIbf+YoKyHh13rB7y
         6wfkfGWIKKC8wBnXGxe//lfOUw/THWKln6exL854wxvn1a6tWK2UA4QT0wXikZPnHX3B
         2RzZA/0acMSs4JoWHNlx9MmYs02AfvmImXcpXWhHRadh5Rq7GyREuP/viHg61SIISWd1
         Fm5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776029166; x=1776633966;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=g5YONsemN2vvgZ9asQJIXKdXNxh3MWkRpVIQ/RmrGZw=;
        b=TFkDuxjtBR0Kw+ccy/r8kAuULm9VU9aYETr/zH/QHyFLvB0RQDS/8gah4vFfBZXCc3
         Ms0XgXRXigjphdHsJU6gqUzF9B1BPsq9kL1hJrrVVsz4mc8RTTB6owIXLCJ++Jrm94r6
         NKikb/PJMyUzUxQS9d6BBUq7hNAopmRT5jLnkcq5GwYCMqqZ0y7SrshGCyTELjrgdvX7
         X47X0vYgakoj83132LCMbSekYloJv18LqwBBOO/XmI/cx7A6HrEeCXrF55/LZ+mNITgv
         Oq0uQBdBAeqyUA6c71Tu4Ku8CpaH+5D59Slrd6AGb+u7KZTfDyisn1fEhqpHcylOd1S9
         /tXg==
X-Forwarded-Encrypted: i=1; AFNElJ9Xg35MCmmpxsGkqRJQhLED4m6uocjxA8emu679s3RQqI8jaq5xQCJK+fpytBgTE1cvv9zIDJLFG0GOtw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwoNnpGCgGv1h+ndYckKx53rJB9nDkd41HwGlV69fV46Jp0jqul
	MpMw50CVNKyTXBD2tFZ4kwseNcaDpp4umv/7iC6ucYfYPND2iiFWiwHI
X-Gm-Gg: AeBDievh2YAjiQoBUQxhgOG3JpYvzoEpEVFunJrbft9PP+nC2xrIHiiw/Gv3PJJFU7R
	ctOc0BzynNU3Xqyal1B8iAoIPoA8OmjjhQFVMSnipmFTAxzsVYBomMLtYj7NmXDlx/GTiYB7GRf
	ZwzqD6OmPTaHeq0OwNaWmK+MvP4ig8TH7tDvysdjOC/HZHT/X4VaWw/NlJc72JMdC3u9C4UwD/x
	gi2PtX3i1g9gCt6Pb0wAt+EvVisARKkHtKbTSbr4ydC614Ce2od4ZnjhI46IrAIrl1ZgGh2PlMB
	MQidiUGrWkz9teWjtXi8b9TSsrdnMY2wHwCOvbgwlrrCaTqUnUvQogGt8/ZX/fmPa29Qcvn7Jsp
	HaNVV4t4xdK6EceDSL7gsJdNQFi5Q4USmLiRuT1B/K1rCVXLb1Zo7RtsSFCn38Gcatw951a7UFl
	hHX2+tmh13IT12oDNyt12ycmjjpF4HVkcnB7WTIew6e3uwzKk5ny3/hGZ1cFhu1fOVb/T1XEzZ
X-Received: by 2002:a05:693c:2c84:b0:2c5:d833:a4f3 with SMTP id 5a478bee46e88-2d58907b4admr6254248eec.18.1776029165814;
        Sun, 12 Apr 2026 14:26:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faa42dasm13905817eec.7.2026.04.12.14.26.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 12 Apr 2026 14:26:05 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e7418ef5-b41e-489b-b913-aeebcf9a5235@roeck-us.net>
Date: Sun, 12 Apr 2026 14:26:03 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 12/13] hwmon: spd5118: Add I3C support
To: Alexandre Belloni <alexandre.belloni@bootlin.com>
Cc: Akhil R <akhilrajeev@nvidia.com>, Frank Li <Frank.Li@nxp.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, "Rafael J . Wysocki"
 <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>,
 Len Brown <lenb@kernel.org>, Philipp Zabel <p.zabel@pengutronix.de>,
 Eric Biggers <ebiggers@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
 linux-hwmon@vger.kernel.org
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
 <20260409105747.48158-13-akhilrajeev@nvidia.com>
 <19218853-499c-46a2-8843-0bafa17c81d5@roeck-us.net>
 <20260412201629345ffec6@mail.local>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260412201629345ffec6@mail.local>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Alexandre,

On 4/12/26 13:16, Alexandre Belloni wrote:
> On 09/04/2026 07:19:25-0700, Guenter Roeck wrote:
>> On 4/9/26 03:57, Akhil R wrote:
>>> Add a regmap config and a probe function to support for I3C based
>>> communication to SPD5118 devices.
>>>
>>> On an I3C bus, SPD5118 are enumerated via SETAASA and always require an
>>> ACPI or device tree entry. The device matching is hence through the OF
>>> match tables only and do not need an I3C class match table. The device
>>> identity is verified in the type registers before proceeding to the
>>> common probe function.
>>>
>>> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>
>>
>> Acked-by: Guenter Roeck <linux@roeck-us.net>
>>
> 
> Guenter, I guess you can actually take 11/13 and 12/13 for 7.1 if you
> prefer as they don't seem to actually have any dependency on the
> previous patches. The worst that can happen is that the driver won't be
> probed because the I3C subsystem will not enumerate the device.
> 

Thanks, but Linus released 7.0 today, and the 7.1 commit window is open,
so it is a bit late for adding content to it.

I can queue the patches for 7.2 after the commit window closes.

Guenter

