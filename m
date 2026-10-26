Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.42
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047678;
	b=clDqMz2VgUxPa/Lx3pcufSvkb1B5oshi1oGFf7vuNCi+7Mzm9NcaFNPGBwBGOsFi8W98
	 j6t6j4FLkkcukLNA1j8Jh/QGolMPu/nvG9cVLlTMW6Cj/ZFh5Jzof6Eow82hWg/+PI+yO
	 f0R+ratAnJzoa35D72T4iolaFPJKzfK/iBn3/Q4NHKAHlkJ7TaNfFUscs6CIBPSr9IGAV
	 ZIq7g4yyo3+qt/hMMRA73ojsiIRxuypNUaRYEyDiDnmBQoaYm7T5yfszqdD3OJHSYXQyj
	 tAjo3/OyF9scNl5yTKnC5r4DkrjhnttJqXS/GOIjUvzDio9I8M3w4iYFM+lhUZoawMg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047678;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=SBmctSjaoLLILJHNPpPv1PuNvPvq0whtOyZw1gjKndI=;
	b=rFqHEE9jHmEwPuc0+FYaxVmwh65L31MixqqGK1692tlKnkVOgCNrFOSg41e8S2OY3Yo8
	 tQawaN2ISRo1sydvAv5TinSZcEUYiat2UQERtxcDI2yHTjPu5yJO0pWaoP+uOM4Ba8MJS
	 LRWIu2S7A2SBUEpdu1Jq9+UF544OBS484AEJAL/TB01S5JIg1kh+Uj7VMOav5cL+HdlJZ
	 X2CFYM+KfM71Ra4XK7vkvdlKTJ+Dn781lK6GgVR+lKIh+Jbflxn73EqO3WctHqVYwDAaY
	 VAL3m10Fx3oXjJ0PlZkjX7Pw4JsLZAKzrE9ZspCi57eUj3LHiy1f++CMGliVrvrq5Sg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=irCKRdav;
	arc=none smtp.remote-ip=74.125.82.42
Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53866606A31D
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 20:47:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 53866606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=irCKRdav
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-19305bcb72cso2564927c88.1
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 13:47:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047677; x=1793652477; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SBmctSjaoLLILJHNPpPv1PuNvPvq0whtOyZw1gjKndI=;
        b=irCKRdavJ1ic6tR9vsqNpCYqnE/IzH8mECl28f7EEWDTHhJizVrT9hOcsCXrlL6zhx
         NSTeoZXboKZF99CJNcnVHZdKUUSk5kEkbSSU5w1xeKbhNKltgulw2WPFtfizm714ls6y
         aSNJB9P8YNNi8xWqwQiUgEtWrDwZaXsZUHUpfMb0ZY8lDKo230xFmBsilpkMBNegfQP+
         SexeY5JCZOe+PHxJAJ5H9eePOWUKl5K/iewGcknIEklYTQHUg6UXLnMLfi0fxIqeoLXg
         f10hQdO7YPYUiHFezZ0LvK3EPCqgGJ1sN8RaFCl8Roj9LVQbseKNdPAK564zXvqY3N6l
         ftKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047677; x=1793652477;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=SBmctSjaoLLILJHNPpPv1PuNvPvq0whtOyZw1gjKndI=;
        b=nmFGrH2LOhIpQqT6AVCrD3VQRn9Ih6rCv7CXrXFIuWrw/D7oE4IlS52BojtM5H6mVt
         17Vt9sVrWEbuxXGCmXz+WmL9Og9OcR24hQ9wzPUPI9ShpYyz9c9M9Rl69YCgpdvBERPk
         cQX+riyESiqfAd686XCwhQ2hgeui3rq1YZ18V2VMXBSoVSo+YeU5xXS4JhAaLfnrlcMo
         7iJhuRVMqQRKP95gILYY+jADbQyEX53Vl8ewhvK9AKw4JD4w5no+DSHA1+I31SYNSHpa
         Jh/IxeFJ5l+e2QUuGaWfTj3Z8yXiCdYf7u/PRqWG2hqZg4aB/khFGaZ+Xw7n/Gb2k4cs
         e5Xg==
X-Forwarded-Encrypted: i=1; AKwUvByqnBT4YMYgQE93gBYny5mg9rld66Fv0AZgqtTCJd8TTSTkL2UZFySVUNDnZ8SooyMnQCIbVl+rxuESJw==@vger.kernel.org
X-Gm-Message-State: AFq9FYIpFEv/0f5dRDhTiuZAJeaLhJjg/EIg8dYnmXH251WfYoXBur0O
	Ee4yHngeFBRMbhkDTJNfg1imw28kBkTqOvnAwKZ9ndyrDo2jjTPWGysj
X-Gm-Gg: AYBFou3lJJ3I9tDvqxmiWTIEY3k3ulFxtgIlLekdf7YKAyUAf842fZrRFksW70+rwwk
	qnhHUbIQuOBius1wyB9r2LYPvxIdxWcRXDcNNR/lWkhboOsNEhRDE2SDVDvubXVh1pRQgOZNxXi
	4cT2medZbnC2gN7sgso1r2NBpJtIAAIthT9WX7m7opJ7Soq8r6zzvCTK0cd6iahBhXMEYdRLK8B
	tEiYpflkGxqJckCUGVcHwDiVkeHMhyOGkYWneW9ICK9NOHDJJCn+dDtN1On6ZQdkPDj61TGHzr2
	M+cUHcuEykSOHxmZ+4QfwHU787XcFQ4Jsi7NQxHtJ+YiRkzUqAqwFE2QEl6A2DW5fFL3s28aJ/1
	YikSr2ysXDy3VNPO9jzapd0rleNJUrUeIKV3SDaCxfTH/UUIxOCSZZygqn4MGsB4x8Y8KZxHiTB
	SXr0T4c7ZETHaiy4BypzxPuwwMHFBHa413tA7PKIHItaKB6KCQ5DHQlC9LM5VdM4+oKsAG1Y4nx
	FIAbeprpRalYWYe5REdqQxLdpZx+ioQMSAe0W78FBXlQDcGkalnPgMVHrYnq7lPonwJpg==
X-Received: by 2002:a05:7022:5f09:b0:15e:6541:3099 with SMTP id a92af1059eb24-19933e10e21mr12324517c88.7.1793047677064;
        Mon, 26 Oct 2026 13:47:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2eefbsm27586280c88.7.2026.10.26.13.47.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:47:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:47:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vas Zayarskiy <contact@vasily.cc>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 1/5] hwmon: (aquacomputer_d5next) Avoid truncating
 scaled sensor readings
Message-ID: <494625fc-168a-42b4-9591-cbf5fb2e981e@roeck-us.net>
References: <20260927191316.4137752-1-contact@vasily.cc>
 <20260927191316.4137752-2-contact@vasily.cc>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927191316.4137752-2-contact@vasily.cc>

On Sun, Sep 27, 2026 at 10:13:12PM +0300, Vas Zayarskiy wrote:
> High Flow Next power is reported in watts. Multiplying the 16-bit value
> by one million can overflow both the signed intermediate and the u32
> cache. Store power in long, perform the conversion in u64, and clamp to
> LONG_MAX. The other existing power conversions fit in a signed 32-bit
> value. Return -ENODATA for unavailable power instead of exposing the
> stored error as a reading.
> 
> The power cache is updated by HID reports without the hwmon read mutex.
> Read it once with READ_ONCE() and use that snapshot for both the
> availability check and the returned value. Mark the corresponding
> updates with WRITE_ONCE() so that the shared accesses are explicit.
> 
> Widen the shared current cache to u32. The Aquastream XT conversion to
> milliamperes can exceed 65535 mA; clamp its negative conversion results
> to zero before assigning to the unsigned cache. This also permits devices
> with scaled aggregate currents to store milliamperes directly.
> 
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Applied.

Thanks,
Guenter
