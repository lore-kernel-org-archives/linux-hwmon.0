Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0CA377EC6
	for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 16:25:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774887935; cv=none; b=gNYlwg3pSMVab3NfLI0P4TrNMDIRkyFRWL0eW8F6bkG86aLhkOgGbB6f+2lUZtNp4uH5VN4BHLRjd87CANUF7gH4W8wEK8qSKbo+Prrtq3A75tLLR40+4C1xoxl6wrg+caW94KDI1/qP2jXzlgyCFfmTIX1V25unUvu6zqiof7c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774887935; c=relaxed/simple;
	bh=EEy+oWaHG8rzWzzQ/PLp6iS2nvnI2KQAis2/8F6dGSs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lkC2pBOSXeGnIa3al0GoeN/T+/chbBi87fMzMKM9CINN1xOHlCRH9aQm9srabtY1AeAhIk+u75Rezu6V9WOhKhgKVKaFzwVx8lq+KOZ8f5OBZndVe5iMuo1es+Vmr0/wr121cvz83Mi8cBa8UhV8YoAZ8mVMHiHxA2ynzRfRVXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DejAES9U; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DejAES9U"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2b24fdac394so13731345ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 30 Mar 2026 09:25:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774887934; x=1775492734; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=30qgmi/fk4YrrYyUAdUDt/ehh96Nqq21NpCvChGzSYU=;
        b=DejAES9UvpSRl17UZ2FjDElu7QGhxjNWBw7bbCVRCdYfwEj3qW7KuHQl/fUFuopI6U
         /ybjWxX60jY+kXFuav+FE8rtlTMyjShuP0GmTeYrfMinZmorPAfC48PMUeCvZk+GEpbh
         /ZthEkP9vwqRJ830mnN68xLixQxgF+TjnLkoqFxSI6WNdovCQa8lRqSRKMKHoKF+R7xp
         iZiyHgfblU5EHhjlR1bXU4wBsxt0GVPZb0nk8hCtV/7hcvK3ySBavk4mQZnRsoSbbZpF
         PI0ppVZnjXdbGtMudQwwQl4BMs8sPF6CP80d6lyO1Dx+Abctp3ZAZIuC7gMTtGnp1opD
         0HQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774887934; x=1775492734;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=30qgmi/fk4YrrYyUAdUDt/ehh96Nqq21NpCvChGzSYU=;
        b=nqa7u/Z96kiTHHCJjjmhmB0lDbJdjbYcaWGbvUzXskxpdkSf9J9JoAXnDp72XoapBB
         R2/dzV/klbNt6I52QaBAgH5iHBQ0/+xjHAIAYMhbdrezKFYRFN5ttX/7IYJvnCic2mS9
         qz8HI5GYuhAkXz6NqZGHJiz8L5LGTGy3J4FyGyHv1ioDFoU47Lx9AxQtcbB9gMcT67VP
         Fc0rAtSLjESvhUuZGq+mVdCruNDpt5+ewxthshUh7+OHki5svHXAnMXs0K1iSWHhz2Jj
         4gWmfPMZxkerIgI8Df8Xb5PwAptXe3f1gsjlrqVgU9GYops/oEjkknJrWA+tukoyu74Z
         6lfA==
X-Gm-Message-State: AOJu0Yyt4ETsBNVclC+Fo5ASwPc9qgOc5L71GPrVwEn4oFSy+lttwCLO
	+n5tPYiafgxQtqIA8ATzMV0qtDqCypZHSctRZ5yzzvQ+IlAj6kj4kBnw
X-Gm-Gg: ATEYQzzXZ/yx+u+aBJ2k8DC08KaNlPTX6UGXk7CcTRhW406IZyd7/rcMIbcAf7mw7N4
	QvhDSZA+3RYIlgfr8ametGCUnK9jdHvl3L47I/Uj4UYObE+rJhyVtpx6elG/26C8ZqmA8QW2RsV
	QvTs3JTmLzXX1Lw3GXEJAtIWE6yPpTFYEPGy3A9TDgUstm61Agouyuzm2CdK+oauFDSi462x72R
	QltHxHh47vJegwuXnz3Kq+zaVR6b4zO2BVhvshMMhVQuGUeAJitNqieyncW29jegt3fOiTyNLXQ
	hE/W2fjGE8DR+4GJSc6DvrgVawnvWLdImZn/wjQw92AK8M4rnyaLpsFA7rMg4R7PeKzg9zBax6w
	XihcGXvwdac4bgSnQUJvBajmhnhGisyCmECe4fTi/QpLwG82J1NTdVdilwcggL0RNgs/7Snr2iK
	GfZ962XMugbAC8zXBKUGFUfBVBsyHEuE3aW6dz2ISMG8zGm/rFAoAQ1FqnVBocXULSmy/snfsp
X-Received: by 2002:a17:902:ef44:b0:2b2:58c7:2cd6 with SMTP id d9443c01a7336-2b258c73377mr26088925ad.5.1774887933658;
        Mon, 30 Mar 2026 09:25:33 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b2427660c7sm84120725ad.44.2026.03.30.09.25.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Mar 2026 09:25:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fd15c1d6-09ec-4553-bd53-2460c71824e3@roeck-us.net>
Date: Mon, 30 Mar 2026 09:25:31 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add support for Infineon Digital eFuse XDP720
To: ASHISH YADAV <ashishyadav78@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, Ashish Yadav <ashish.yadav@infineon.com>
References: <20260330102345.37065-1-Ashish.Yadav@infineon.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260330102345.37065-1-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi,

On 3/30/26 03:23, ASHISH YADAV wrote:
> From: Ashish Yadav <ashish.yadav@infineon.com>
> 
> Hi,
> 
> These patches add support for Infineon Digital eFuse XDP720.
> XDP720 provides accurate system telemetry (V, I, P, T) and
> reports analog current at the IMON pin for post-processing.
> 
> The Current and Power measurement depends on the RIMON and GIMON values.
> Please look into data sheet sections 5.4.2 and 5.4.4 for more details:
> https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp720-001-datasheet-en.pdf
> 

Please address the issues reported in

https://sashiko.dev/#/patchset/20260330102345.37065-1-Ashish.Yadav%40infineon.com

Thanks,
Guenter

> With Best Regards,
>   Ashish Yadav
> 
> 
> Ashish Yadav (2):
>    dt-bindings: hwmon/pmbus: Add Infineon XDP720
>    hwmon:(pmbus/xdp720) Add support for efuse xdp720
> 
>   .../bindings/hwmon/pmbus/infineon,xdp720.yaml |  52 ++++++++
>   drivers/hwmon/pmbus/Kconfig                   |   9 ++
>   drivers/hwmon/pmbus/Makefile                  |   1 +
>   drivers/hwmon/pmbus/xdp720.c                  | 122 ++++++++++++++++++
>   4 files changed, 184 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infineon,xdp720.yaml
>   create mode 100644 drivers/hwmon/pmbus/xdp720.c
> 

