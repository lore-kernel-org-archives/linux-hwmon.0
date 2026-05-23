Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A530E388E63
	for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 13:25:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779542748; cv=none; b=DgnNtC1wLBBIH8v5yG9bmXuTaL4N1l7gO1K+UWSu2V3IAc+ePJLb3NxbJb6Gfm/Exkq+5GVGySXgifVwVZvRmyMYS6O8CDH42xC4vGWjwie2YSVYjjSYccfSPPDwKCrqqdpqTFvo/kqupGABg+aB1Qpat3LFYj4WeXS02GHfDWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779542748; c=relaxed/simple;
	bh=UX0IP7xihBChjrpo/odkCL1ZyaibPxjek6niLQhTmaU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=QV5ZObRu4pjfk5KD4rFZZk8+qgpJGZkXfKzCqi4cAnB6Fmo+bZxuE4DjLax4c4ApwscRoTkX1V/f1jKr/LX9OiN1DbAtNt77286/lYT2MMYdD78Q/lUQ2+KocJ1ky0CoD7yaS2qNp35vfiy7IBSejFybhTEUndSegSDgPZV4jqE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ERV2CRVH; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ERV2CRVH"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-841513664bbso1547878b3a.1
        for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 06:25:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779542746; x=1780147546; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=blQr2jWp+450CTW4x1TpNt48UncOkO2+EXLbv7JseiU=;
        b=ERV2CRVHLou94P2R2vyp5FbeD9KTy9ssEssylunJVRMhVEQB9jQ9V4cuwz37v+TMR4
         ZxQmkclFuvoGtZSXyiZaJYsVUuuyCnGoaw4k2g3t1J3i5tSWziT1j0RsAjlhSZThlpQP
         NbQRY5tUHjXR3YJj8BrsoPvrBeehjVQJyN2mUxiU0/GJvr5TcqQBSHeoLqZ1v79cJ40A
         9YDk/1i7H1l2n9iq5ZX2GXV9anK6brjmvU4jDo1maap5MFanCdnh4sIzPLxLNh7Yhc7c
         PmZGftb5Dp3PJJWzTpI1KHZiVnRQovp9n/WLgwPFfgaaMWT7VB/o5jUAd13V7tLGFrfq
         UJOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779542746; x=1780147546;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=blQr2jWp+450CTW4x1TpNt48UncOkO2+EXLbv7JseiU=;
        b=TlrUhYGP6b8/9rU5OPtDdwV4Df/2ApT5z5fC/5WC6KJQnIVIbh1qeWXLRIh0SHRlca
         K9LhiVliLn1VIYWECOobYFlURyYctenTVF38cthhQY+nvmPPiQcxjDA2czT8yqRwq9ok
         3jHoKrBTO8l9kdoD/37A8ejiz1/dO0eqo0Vcv9KWIgGKnQPaYfE4Qpb2pRxzwf3LUFYu
         cpax5lWGKjqoeJv8Pw7pau6dWWjOdq8whRpEUhdcjo7dtAS4dIhFD9NIyGT11NuGoyG9
         jyS9Dpx8zMuP23Gk6PXi3Y17g12pqQKXJIJtKSQlUxIwaLD6VtVh8WkAkNQv9TwPvtaj
         0f6g==
X-Gm-Message-State: AOJu0YywaWuecitWNyskDtbQ+i+kZ3Ix/vHB0N4w6H2uIrEPkl6oaJv2
	8MhXWp/2FMq+aZfwj84b7XoAuZTFJSUb/swk3Lop7v0e2Z9VluzCIjvG
X-Gm-Gg: Acq92OFNOkmYvRr1eDiIEslhI7vwZEl+yFk6iZuTSMhWcDl1DS4TMMoEkQ1He2uEJRq
	tWTrqCLqQsbMdCD2tn4W9ybqs0snOeT7v5ClzlibJakjvlBb0Bs4ZVuF/sWk2fuzE9kOakZsUK1
	UUpKwIY6eFSxg/v1DT8thvPj+4voWeAzE0lWMr0xkgaBVGLkvG8aM9QJQSnM2wO1mPz7Cc93xAG
	4dsbKdcVr6BYtUIqbGVxpPPAusl+lw5FO7mS/6I3mFqTKyMcBLiYxtc52QcKE4g7OHWhDl7z2+Z
	eCCdgz5kxUVYpqVdBvt+S7PbONC/q0/rBim5WI+0zz2YDwn8D5i7Dg3tokQqxM6YNofKACkTOhO
	lbCmK53av72jd4bHEBegapvNfByCqZ1GjU9hDd/Dcu3t0IhrDFBXB/AI80Bp3pktZ/X4uYUHH6b
	O17+2bT7J2gpFgRUs5ab2K9IUSB4zYvoIcAP8G8hTRnfvPZ4kNm/DmZ558sjaKesRd6lVN5TyO
X-Received: by 2002:a05:6a00:a96:b0:82f:6cb3:645a with SMTP id d2e1a72fcca58-8414b5956bemr9259342b3a.31.1779542746451;
        Sat, 23 May 2026 06:25:46 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84164fb00b6sm5846609b3a.40.2026.05.23.06.25.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 May 2026 06:25:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <e2586cf3-85b3-44e9-a2e7-10910d53f535@roeck-us.net>
Date: Sat, 23 May 2026 06:25:44 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/4] hwmon: (pmbus) Add and export direct conversion
 calculation helpers
To: Stoyan Bogdanov <sbogdanov@baylibre.com>, jbrunet@baylibre.com,
 robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260522082349.2749970-1-sbogdanov@baylibre.com>
 <20260522082349.2749970-2-sbogdanov@baylibre.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260522082349.2749970-2-sbogdanov@baylibre.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/22/26 01:23, Stoyan Bogdanov wrote:
> TPS25990 and upcoming TPS1689 need common computation APIs but
> the current implementation is static to TPS25990. As a preparation for
> TPS1689 support, split the math-only parts of pmbus_reg2data_direct() and
> pmbus_data2reg_direct() into separate helper functions:
> 
> - pmbus_reg2data_direct_calc()
> - pmbus_data2reg_direct_calc()
> 
> export them so the upcoming TPS1689 can use the same APIs.
> 
> This has no behavioral change on TPS25990 while allowing TPS1689
> to use the same.
> 
> Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>

Please do not introduce new API functions without discussing it first.
Keep this in the driver.

Thanks,
Guenter

