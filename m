Received: from mail-pf1-f177.google.com (mail-pf1-f177.google.com [209.85.210.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B5A33E1D15
	for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 04:53:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782795231; cv=none; b=j51vWgc/3/IVJsWEiB+SCPpobbv8lWcaDpQvFXbUsVl6XeFeugnWe713iJRTn5f0ABcgvHIOOIhSiFO8O2gVE98fNtTVQI/de8wye8FCkdxLKqODGX0SjPSS1JV+kCaBemO3CG+DA1TGhVXpPFyCwx8bQPoP2SD2/rspmO9R4VQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782795231; c=relaxed/simple;
	bh=GWZK5uFIxA58sOim+D5js6WZNmhLN/QK+82zh6v+r20=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=SmcQeXMzC7u5VFbsMfBXCIaBxBlJDmbb+wBAogqbroHl+rrBEMlNsIus8aepkIJ4E9jwUKuMKgsSayoC9AiSSf+4jtrU3u5S57zoH/zoRIQ9HkcnfIhWAW++Q3SmumYQpXzoA8S0ra8dIyO1k/qU8yBqt+nE8YGtptr7ZnQOPX0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ixdeT7PD; arc=none smtp.client-ip=209.85.210.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ixdeT7PD"
Received: by mail-pf1-f177.google.com with SMTP id d2e1a72fcca58-845f2909cd4so1155065b3a.1
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 21:53:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782795230; x=1783400030; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=ewddZF6yjaIWU9H37hyRpIMEFzAEtlWMegUSvPKP7O8=;
        b=ixdeT7PDQ8x4Zc7RGbArjKpI1iBtg4zI4zquYvGcjCpPtKY/xDa4lzO6J6XeuiivPX
         7tNtk20BBZ+dMHH2Vx9fr0H/c+5IZdAqrETvVurev3AHkp+T/+8xHYEU5vvMWhRLpguZ
         dI3y+dR/YlGKoAwTdntCisbT8xJg/AogctMKSpgjXmEdUVzCnC662GnWDORXyvDRPyIP
         mpYHppH2qur1Td4J4IkgI1sTnuWfYP3uyfV+77MUOGPrauvco86NZ6YmZc2AOfOrxf3q
         uaREo4OY7AoUKnL53aF5AJlLw0j/VYDAzg2egpoADa3dXgoH7tXpSlz4AsF6e+Axr/8R
         APPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782795230; x=1783400030;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ewddZF6yjaIWU9H37hyRpIMEFzAEtlWMegUSvPKP7O8=;
        b=K+8Xr2d7Lmj9biaOIr1yPEuj/KCQUhpshWRMjM169at2rqoBa2/Uuj630SCqKPjj8n
         jfLMU7jgFDcrXgvLnpvBZcIfjQF6c7fF7Y11nkwyVy3frF2NLu5bTJnI3LFUcoXV9Wxk
         ldE7754AuJ9qaCVv6fQXERLyuTELGpygN+4IyUYkIbVIROgbPmfvmeUAy0dKyLOPWHMd
         LWoSX5rUtkVcsde34ymdAMURr6ZDs8hdFTtocC+jVD9RlBzCzctiXRovQ7N6fvnEEcig
         6fMF/8dvbDjzfts6M2j8g5W7dvh+OlCRMFOeo4/Tqq8tsBWkXrPrYpTTUy6KJ0Zx2Ikl
         PJjw==
X-Gm-Message-State: AOJu0Yyn2WNCgwCn1NhPDP32DGbPiYqdAH6nDqtxargTSZ5Mx02dtt5M
	ib+pOZ1stRA1gnoJebDrCGBCuD046K332+r2tqacus8NuaolTJ5f1UMI
X-Gm-Gg: AfdE7cm+RzH4E+0HljuJt5WESgC1da9wrGIEDl1a1md2Yg8szOBnXkXe3S5GFcVbFwE
	AQNs32P3NoUHuZ/K6Pbj99K2Rgq/E27v2nEEiFYypcWXCGDTxT+5CyjTxLpX6YxRLqP5ClqQiNb
	/EDVrkHU923RLC92S1sHchZREhpOwFq0JciRV+WS83rCwmNrAc7KqU5s/BOOOnyzog6zr2QtZWn
	leySqRyiUAPTNWSg0GUQVxhMP/1QBkuCeXHLX5hAmiSF1p8T3A61BnK9JH8ES7B3I9JRJWlYXpK
	wliKg7AJWkLcQ1tI07Nfm13yQCmQrW20j5ZpEh/i9Q2OvBadTN47htBFfcy5ixIAWNouv7M0Es2
	1o3SdLc//Vqb9af5G/uTUzXhKk/ix3Hp0sxhE7mNqDlWnU3Y0/Vn4fpPJUUX/kG4U19DGyXQ1Uz
	SOPY8YM47DmoLCm506ZINCHobKypxWf895yfHIFD4B5HYriiEUi9oGmq1pcNprog==
X-Received: by 2002:a05:6a00:cc4:b0:847:99a7:c751 with SMTP id d2e1a72fcca58-8479f1c6f6bmr1697370b3a.25.1782795229875;
        Mon, 29 Jun 2026 21:53:49 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847a037b015sm967606b3a.50.2026.06.29.21.53.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 29 Jun 2026 21:53:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d306dab2-efcb-4626-b480-c4e8779cdeed@roeck-us.net>
Date: Mon, 29 Jun 2026 21:53:47 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 4/6] hwmon: (pmbus/max20830): add VOUT feedback resistor
 scaling support
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20260630-dev-max20830c-v1-0-a02786bde470@analog.com>
 <20260630-dev-max20830c-v1-4-a02786bde470@analog.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260630-dev-max20830c-v1-4-a02786bde470@analog.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 6/29/26 19:46, Alexis Czezar Torreno wrote:
> Implement support for external voltage divider scaling using the
> adi,vout-rfb1-ohms and adi,vout-rfb2-ohms device tree properties.
> 
> When the desired output voltage exceeds VREF, a resistor divider
> (RFB1 and RFB2) is used to scale down the feedback voltage. The
> driver reads these resistor values from device tree and applies
> the scaling formula: VOUT_actual = VOUT_measured × (1 + RFB1/RFB2)
> 
> The properties are optional. If not specified, the driver assumes
> no voltage divider is present and reports the raw VOUT reading.
> 

This will require a detailed explanation why only PMBUS_READ_VOUT
would require scaling but not any of the other vout related commands.

Guenter

