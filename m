Received: from mail-pg1-f177.google.com (mail-pg1-f177.google.com [209.85.215.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36A5038B157
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 14:51:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785941477; cv=none; b=mWg69tZNanO3yFTxOJ8pSxG8nxwtxdunEkIoKR4jSjdx9fkWCCqe/tgxIi2WcRHtBLC8kX3sPK4u+0QeJQC/Fj+X2R/9DcRFZ6VWioqvJNE9VLxv9wPv+vpbClFP83QC6H+cSv5nLv1FkqAwpnjhmIzx1FE4uQPqkJOeO9McUaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785941477; c=relaxed/simple;
	bh=a54PobIngwcskOksbmABYW/waa+T5utlGIv0Yv6fjjg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qz/+L2iNzxJaiyauvCD+/MxIr6YwCjOIZMRvz5CUKwY7H5Oaae8nCNWPKa6obfWjsDowKPnUN+WIkVwv8dXusv3ixuV1z+lr4DuYtW5jYG5Yey42Pxtj/7whvNdlG9vsEIbiTmjy3daQBzhdJEjBoIP2yj72Y2NME0frHJ1czEo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aDTDnKvd; arc=none smtp.client-ip=209.85.215.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aDTDnKvd"
Received: by mail-pg1-f177.google.com with SMTP id 41be03b00d2f7-c9e0b89e228so670941a12.1
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Aug 2026 07:51:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785941475; x=1786546275; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/HCcmYl94Ibxacg0pmrVPYwkwUUIj7x/fbF8hhgw3po=;
        b=aDTDnKvdlntrBu1c9tCqm8v4OjkzShgl+cWsjVz/DrlXgE1GgXzs0Und4dvnt4rEnl
         zin247r6ZCAU0B3QwwqJLcln6My4e+moyFlJh2Qa9/SHJE6darxHMaYw8wbIhUZ+Y7dw
         YK1sZvZGgcvRCRobTiwUDNNUgsDFeaUEY4TuF1PVbyYcVFuL1p6lcuGpZb1DRJNnL+mw
         7I4JfQGVa6wIr5J3kM3IZye56JyfHOoYSskaC+zb2EKXT8gaie/FrdeWZKuPGinWRFC4
         oc2dZ08cDOan1TTFGh70eKV+Tc5YB5ZAlFiNm0yg31E2VNsgfzZwPI/VJ/VKK0YfBCZr
         uyMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785941475; x=1786546275;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/HCcmYl94Ibxacg0pmrVPYwkwUUIj7x/fbF8hhgw3po=;
        b=Fl26e+pqmK1F1Bva1ibjFf9JYurho/bWg90vjioBp0CwXej3phGkQ/xE6u2Efk25TB
         zzOr9oQyPdn3Dx2R1YDluBO0CBoMI/EeIjJXdOpyWZCJ6VGPV60zmf3jcZ+E1O7rENS4
         CZvnIN1xvtku53JsmHOC2SmPV0skOpoUCdcemXknl4wJ3tTTjPALDJgdYNujCl8d1YGD
         hr4xIBZGawpaezSw6umJ5hP5tBEzlxXJd03ksX1so/mxs7I1uNkNXBf7j/baPvbApnSL
         MmsBLN0oV1h6/s29QeGGyfSXntIGRkRssmWeKzlpVICL7Cb6/08bODpTHvO6H7K0KsMc
         bc8w==
X-Forwarded-Encrypted: i=1; AHgh+RrGGo/KpyRbnV5tzcy+T6v82K+Hw8FfC9emjqLEuErZgR3EzhDxtCbO1Ep6vQa5N2uYNm/RPMuVDKdkqg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz7KlmHam6nim2LIUsvvVrU2BwMKoommK0fg1lZF9Rvd1n5c+aH
	aAPfoM+Ic7o4mwvCQB5W07iJFvSdaZweHhCMWPM5I/4hCwwAXLsnxG7S
X-Gm-Gg: AR+sD12Dg/0LVOdOvFTPSAiFuszZZ4bUq5YqvjZerKByYYXpG5Bepktb8mvQxnxmeun
	8c9f/DRmDuB6mUeZH0Wn2dKf3zXJymN6e3b1vIDC5npVcfRTlOaFosolKT4cKYanGsFWeFJE5GJ
	QeiAb6/BAeaw9dsEolVj8H5UK8OByurjnD1vUIWn/fW+1h3p0D0fThQycNxwmA3jTE0wlO8k5Ud
	NoJZGszjg5n+MhQgekjuGkB9IQw8Je5fYhmzos3sJ2HQp9NV42Avyhvo9R8gTSTICiiUDnH2B3o
	UHIfJrlKvDPWF4XawCojQwHhYH0n6yJwN3nBfu15/67T+KT6sULV6c292b6qgRAP6fGbr/HoOfI
	0Rmztdrq4a/1hbRqt9aBpfLBYIelvS6Zn167YOVZJ7HInNZWN+MbSHkjExUjBXZU1eua7M4gDxT
	0YqjPeDE8VaZoKaJYi07xyaMxKLlEGr/DRGaKdF2s9TGeOUWLZl6+XEJjZ1S4GW6IKRLf3nF20y
	w==
X-Received: by 2002:a05:6a21:6446:b0:3bf:b84c:2984 with SMTP id adf61e73a8af0-3cb8a4ade7emr6721275637.11.1785941475224;
        Wed, 05 Aug 2026 07:51:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca508a48sm13607179c88.1.2026.08.05.07.51.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 07:51:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 5 Aug 2026 07:51:13 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: corsair-psu: fix possible out-of-bounds access on
 missing string termination
Message-ID: <9b8ba9f5-6055-4389-b88e-8e5a4ce1b7d9@roeck-us.net>
References: <anLj9gPWRoRDbQBV@monster.localdomain>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anLj9gPWRoRDbQBV@monster.localdomain>

On Wed, Aug 05, 2026 at 07:19:20AM +0000, Wilken Gottwalt wrote:
> In theory it could be possible that the REPLY_SIZE sized buffers for
> holding the vendor and product strings could be end up missing the null
> termination (for example by malicious hardware built on purpose)
> required by the seq_printf() call. That limits the debugfs printf calls
> to a maximum string length of REPLY_SIZE.
> 
> Fixes: d115b51e0e567 ("hwmon: add Corsair PSU HID controller driver")
> Signed-off-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>

Applied.

Thanks,
Guenter
