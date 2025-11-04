Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87A282E5B13
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Nov 2025 13:16:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762262176; cv=none; b=Q94TcX0QLgtFxv1HxEjZobY5nvr49LLXn5cmbel4OfawDCuWkCsJN2bvimelm8YoNhKvv041qbiETz9Mfk6R7mwhyzqr4dW+a+jUAsbkJWXaUmrVlwRZ64OnLy1mQ3wpJexvFeXzvtD7TXrYboLRHdy5wh4JEv5qjxN3ParOZis=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762262176; c=relaxed/simple;
	bh=eT6+mVKiRJ6esqXL2Wy1HdGicAofzh5jbJAwPnzc6OI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=HHGoq6hrYVcEV1Oz0npXstgpBJslBbh6ikzq9g1I9damORPOkFfeQTk4QdVwjLcetMJcE/r0DVfD6UxtP0Ke+MOhWRBLjDsH71NLwQCHNyzkai8h/7/ICN9k2A/J0lLJDsiTVPkF52I0d3Kj/zOK8TrhBg4gm/aru/GI5ATI9rw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BJE9DrXy; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BJE9DrXy"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2953b321f99so37559905ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Nov 2025 05:16:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762262174; x=1762866974; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eT6+mVKiRJ6esqXL2Wy1HdGicAofzh5jbJAwPnzc6OI=;
        b=BJE9DrXynicLKSEpoxPiycQyTVezToWTDTpSwovLvaqFFSR/lWqCd8V89tZhLNmv29
         lWVfkpqiIXbSE1cgCDLmgK2G58DW1Uaiyxhv23FeihYuq3E0b3esafM3QXwvgK9d+jW1
         dyX49KcQNDPC2QsyDvP1MJgmp4y5FQRPYvru9RtbljYUSIXXuX+8KYAtMWf8FyFVlgHF
         LtWl2xMiImHTQoY2PsAdIvuB3qCyOMWrtAzxyBXE+wxKd3MpCvsJJV6inAftPYyrSVXX
         U6e848s0n3mVU0hhKdZZAdO3Mg8awbrrhKtgTQbO19qed5H6RSaFLoCtpArUywwYfBbC
         wSNQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762262174; x=1762866974;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eT6+mVKiRJ6esqXL2Wy1HdGicAofzh5jbJAwPnzc6OI=;
        b=Zkqzyc6tD2ql+RMvo3M9x88ZVEyylN+Kr8wf5zdzNGzeiOBlf6rbrEP1GOq0JEK8kI
         1v7OxYmk5TVmIx2+LCpu3L0WVBQacXKBcAnunfdT4E92L9vFWRRBxsPfYpHDNmxa0E7l
         Ep9snPHLyGX2l6IaG8Up10kK2NaUSruRD/lcMU40wJGpOQfNZo+SjK3HqmbwBxVNU2kw
         MuuvRAHLjrmivfK05kBE8cDIRP0bC3nNJNkzFmFi6+uEDrUWY7cJyzZYb5yq0e666zcO
         Tgvz100Sd0Vm6UxCQ+4UKj5cZmT7e4+wU+eoMs1HHx7PPNFrspjHRdiA4qs42tfsoa7s
         CPrg==
X-Gm-Message-State: AOJu0Yy4CA/faNWzEYRux93LTzE4KBU8x+27BzXmBV0DDIl73KFb5Jve
	zPWltm6Wy3rhOhEc5ffmym6Uzqdm6z4LFpvhOiXeh66kMfpad4D8n2Jf
X-Gm-Gg: ASbGnctpVid4HeqR/wCjSPzgbmBqw6nKeZ5Keq/u2YPEwkLN3cItjUTrRQGuyliackm
	lZoofS3s7oJE7ggcSuYXUxQYmGj36YVDs6cWxqyopbnbL4Sg07MnG2Eg8BuMJmkjMxeDBz3AIn0
	YQ+lYs4NpgXAj37Lhgp4Qpm65wSffu6P7JeeP+Ibc8ovy/iebN2bjmZTmkPJyxRFvrty0V3OVSb
	R9aS4DX9z553q32VzNAcfJODcJI9ZnOX//rvoWu+nm2rY7Vq64H3WQF23VxOjd2DNQ33wyQyqBZ
	fYiMfB0qb1oFcfbdZB7JAfaU345nJWegrIxQIgxQ7QzR2k7dweFVBdHhOASqAFPu310XufjQoX6
	iDR+EUzm2Gpe7DhWqiV9txKXNzWUnx+26rKV0xXbXnjlo4juCR5y/aHEXrpFEVXZwo7uV31NDUS
	90/40fN1us4QujedYA1lB83bN1zIRUXIe5l2Yh8dN3nL+/hfQp
X-Google-Smtp-Source: AGHT+IF9DEjhPUGzLu+gd2bxIVjWMZ/w7hYCxzRQfmp9jTItHUja9B+y3vsPWu7unTyq9BVJ8eltDA==
X-Received: by 2002:a17:903:2349:b0:295:7423:4be2 with SMTP id d9443c01a7336-29574234e50mr121162925ad.3.1762262173474;
        Tue, 04 Nov 2025 05:16:13 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29601a609c8sm26753225ad.92.2025.11.04.05.16.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 04 Nov 2025 05:16:12 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <876e3dd5-c579-4d2b-a9b4-a053787ff9ce@roeck-us.net>
Date: Tue, 4 Nov 2025 05:16:12 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [nct7802] : missing of_match_table ?
To: Gilles BULOZ <gilles.buloz@kontron.com>
Cc: linux-hwmon@vger.kernel.org
References: <3aaaf4c8-c063-6461-67e7-2f946adcf585@kontron.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <3aaaf4c8-c063-6461-67e7-2f946adcf585@kontron.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/4/25 02:42, Gilles BULOZ wrote:
> Dear developers,
> To have the nct7802 driver loaded automatically by ACPI, it seems an
> of_match_table is missing with something like "nuvoton,nct7802", as
> done in other driver. Am I wrong ? I've tried to add this table and
> the driver is loaded as expected.
> Without that I don't see what to put in the ACPI to match the driver,
> and also what to put in a device-tree.

Ypu'd also need to convert the driver to use device properties instead
of devicetree properties for it to work properly with ACPI.

Guenter

