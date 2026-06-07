Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EBC634750E
	for <linux-hwmon@vger.kernel.org>; Sun,  7 Jun 2026 23:03:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780873435; cv=none; b=oKadRXze8G+RSKiqcd9RzIxgkpiM6EGKlxSRp8h1qBhPgfTX6iqUDf9CilQpOF1XXC1leBAmXzgXEaWu3JHgiDGFQWatOE90Ecv2vSLsbwj4rjpll46O5TSpA6HkBj2W2qV9M0zV7cPAnNO5N8hk9CseZO6hPMDGbCUSDTZMsI8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780873435; c=relaxed/simple;
	bh=C1B4l2Xal6aTmfSeMRH4zSmYixqOCXWHPfKQNxkkoTU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=EkS/rJWeWbKB+F4rZhV61O/pJZo4SrhCXeXpWnact4vuNr06UDkbwbpa9DjqAc+mm7fWZEiIXipVuJSaZX31aYZGq7RXSDKuRMDE8JLALUs9VRUBCHXcQAlq/nKeqIN227tCpNJ6Sd8L+A9KOoN5lywa1qYkpoWhH+PekjphxUs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ZCgVFnd9; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ZCgVFnd9"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-307631dbfedso8275192eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Jun 2026 16:03:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780873433; x=1781478233; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=IGoOnrVocML2WYduq9m+qccXAGqCDRVbLZl5L797H38=;
        b=ZCgVFnd95+MEaKmJElbzKeYg3D7v/qjGxbn+t2R+whGG6OcHK4drbRL72NHCssIJeQ
         OuDN4Tgs80py+tOSy2Fth88nSIPljuLUC6WNEb9MdPEbW+RoeZZ0Nwyh5FmJqvjviDNg
         2atj5eNjHyF+bU6GdUIyNGww4GZ5KuWQ7MJwFZbTpfrXOjb0WfuJFL8dL87oHZztJzq+
         B4a67Gkmr/SkH+ZDiEJOzXqAtyzdWtYNoac+ZI2i5vzII1tZ9SaSa6f53v/OmukEQr3p
         /KzSyWRQjZaB5tjHVEyUhKI0lJL0NhARJ0xxz+Fxd1oubk1RJ/uPAH0icSnIsSpJ+sgB
         ahww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780873433; x=1781478233;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IGoOnrVocML2WYduq9m+qccXAGqCDRVbLZl5L797H38=;
        b=YLHlTM7KgzKCEGjU0U3wLxSs0djJozGzG0BUGPoSkHUaDhFWzM0/we1fVWDmahQsng
         tcR38xRgR8k0YsAi9KaiI1j6VVjiPE440IwRVxCxxo0Jr6MkjWOIauTabg8Wu4QDDiZO
         akC9ABvELuF/qKaia9IZdYwDDlOa7Rp0S6RDfBswCSWlaXCm6YHUV6+fLnN9iba1Ib8T
         lPfePJvWFJj8Q2cWWtZUaaEl2ZleotHg4lbxeTkyajZjN2RrChybK/u47RcxP0aPsezC
         WhQS/E5aXYaqNL8SGIvDpIoMMXQXLRgHFholo/T0PVesWRrnQZ/XSR/ZCabNIUm2C2sH
         RxIw==
X-Gm-Message-State: AOJu0Ywwe7scAzc1+fGBnWOM970hAFgdunvBlsTpJFhzmHOXAEdzAhay
	ETugpMhRARyevXzMV0MT+hG7x08gWtwR6CAQcl71Y6ZeXi04DE/1nuchyr/kb1ds
X-Gm-Gg: Acq92OFVugEtC4f9UWj7c49e0hDXPEeObXGj5k58lID9Ozug4ZNxit56szBTnTbZ6kp
	4JEdXsEaKNVBjCEzssmHkn8tpalgxRiTwc52qWtFyZRmw8yWh+9vGF78IsIMRXnnFOKsqJ7xSse
	3hgdpWcEHniN9LI5gxytW7cNgA4PdCxxH3zhmjuPiPq4OIti4+rK5juBukTD9EsplUzpqE3/10X
	F+UREwQrkMMOXKzviYFkzUNnBEnD52dO8d/SaDqXhayiaXzpg0D29ylJqJaUDTkrgJ1Me9cezoK
	+Dj55w/sUZRUfe8bkEsKrdvXz3S5vx1djQ26JeWlZymGYgK8QVxdceK2Zq7Y2i6cmKHAnxEdftf
	i1A8E5/wrvuabAOUAGRMkZFGw2cDFCqjJ4vkYN8OUb7unINGfWAisDrKSounS/kUI92swCywSHK
	pMCDcQUlM0svLEMN1o0T2QRqYqsch6GAEJLdWWXRHTd3gMRp2ReOTsOWPGvZXRvx/a/OBwqxnHM
	UBcX8gqF9UxN0tosyF5EQ==
X-Received: by 2002:a05:7301:1e94:b0:307:26a3:75d8 with SMTP id 5a478bee46e88-3077b270c7emr7756399eec.1.1780873433011;
        Sun, 07 Jun 2026 16:03:53 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3074df8076csm16036537eec.29.2026.06.07.16.03.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Jun 2026 16:03:52 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a0c5c1e8-9a36-4835-a5d9-7bafda79c36f@roeck-us.net>
Date: Sun, 7 Jun 2026 16:03:51 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 1/3] dt-bindings: hwmon: lm90: Document SMSC
 EMC1402/1403/1404/1428
To: Svyatoslav Ryhel <clamor95@gmail.com>, Jean Delvare <jdelvare@suse.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260603141033.111300-1-clamor95@gmail.com>
 <20260603141033.111300-2-clamor95@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260603141033.111300-2-clamor95@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 6/3/26 07:10, Svyatoslav Ryhel wrote:
> Document SMSC (now Microchip) EMC1402/1403/1404/1428 thermal sensors.
> 

This set of chips will need a separate bindings file. The EMC chips
support several configuration registers (beta configuration, ideality
factor, consecutive alerts, filter control, just to name a few) which
are not supported by LM90 and compatible chips. On top of that, the
EMC series supports up to 8 channels. LM90 compatible chips typically
support two channels and never more than three.

Claiming "compatibility" with lm90 for the EMC chips is simply not
appropriate.

Guenter

