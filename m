Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D2DE3557E8
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Feb 2026 09:29:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.176
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770802150; cv=pass; b=FY2jOtfjlDB9NPWMX1oz++71oo1BDhyNvLiubgO7KRuJXvNdBv10JOuN1dkhldZc/tJtH9vvGIdrrf0hQCsGIOudQLttlHG5lZOsjO9tdAuU3emSFpeqb9Vk3iGnEhK3ay/fx7UgwhvR4XS+qk/HNOKfZbOmDynfXk8d5XXbcM0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770802150; c=relaxed/simple;
	bh=st7mBB5P+w+XMEMxHebgxziAw2hDjCjrDF/7PALOjBg=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=oFduPu5yJMNpogz6n0aDD9rU397BIgZ+SQy5ATsWDDYApokexuy7DGlCaQaLmPoe7bP+F9xyyL62i/6gtL8/GZ1/l2PzTIcs+u3KmV7QGkaBQYejACTQdG4gqJg9CS3UMje9Ci1oUW0KktNLXb6Hbez6c7Ng1cs04loojfSKhAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gV4prTCP; arc=pass smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gV4prTCP"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-8220bd582ddso1128720b3a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 11 Feb 2026 01:29:08 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1770802148; cv=none;
        d=google.com; s=arc-20240605;
        b=dv07oamWuWYN+Jtg/E/+gdbLZ7SOyTY9NRd4Br0ZP+PlQxhZopCdtVxbsowAZ5jsSA
         i2i7BMwTCHMHUT9qV7dENTfSE7oK3jVrlVDyhBF7YsGUFyZMye156pMe+iY+XtMm5Qbl
         dfIjgRTuX/yw9VHOnedRAsM8DKts7sXW7z8YnOyr55RBRUgmdpFj8FXSIkpg1mPyZ1PW
         Kv/UstTwltbLFnTVl4fVWLoMmWm/ZjmWxqhLcqrVC8k87NCjdb9rc00E+SMZnJJrYWYU
         b3Fe3FlDOBcSjeVHPf1r3Nj9Ut5lPi1nnsygLZn8TBX52stUu3jyGjUCjGgSRhsBlgzS
         TJqA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=aUbA9gGxOOEYzhQsTmOgo18IUBnbAndmse6CKYRwrX4=;
        fh=Fz6TPv9IcsAgDss0cNfwrsPTjZ2UDh3amYYXw2lrNN0=;
        b=Hjr9rJYubs/83PIllpGP+D00uoxTdTZAbYpMi8a7xMom2NoJBRfSdkN21bzl+YRgAN
         oWkJQnzlg1si71hsEEdmKDjOW1RZlPCRy3yoFxpBr9ZgOX7FrDISMs4G5mqGJfMnKUnU
         W+bZP6hNijk5DnABOAfi0nk5lf5kKOUZyHxNgJDOOZz4Fm4iRcbcgDipPsMpQ9n1eMwy
         WdozBGdPrRTpEWDdo9Tbm5dUyBRpUyDJez/1qjNHZbNCaUE8LnsjLZIwMrttJ0vwEBVc
         BNWweMJvIeJKlrPfJYkRxNy3ZJwFK/gmtuCbDxohXcvm/5uqiw/aiCDlYHIXL3rOtPuM
         Io/Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770802148; x=1771406948; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=aUbA9gGxOOEYzhQsTmOgo18IUBnbAndmse6CKYRwrX4=;
        b=gV4prTCPGcaW7kHfvuw7dDZDeFham3IDmLo/TMBg1YWwKvU4bruk7+3B6X2wZTE6Ka
         li08cX4GV/dWkSqwfuAHtH4Rp2bPR4WWx9hvn2n0F+teZq1O0bH1hZH2zkYeE1NGaLyo
         RFjLwm2y+fXWushdHwbIEQqsYUzCahvrg4POOwnNVfs42PX0y5Ky9o81baJYnkFNKb/7
         7d8k3cE2tW0H2NFVxLL5lj0juFlLnk/5+n5O0z+MxMBOHCwHn/Qc1NYWUhTVbZCyYoZH
         clsdzwQlMnFgOYA8y6ZLMggLLN89nUBoJoLPdxSlciyJ9VyGL9Os+gwORmRARCWLWfqh
         InhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770802148; x=1771406948;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=aUbA9gGxOOEYzhQsTmOgo18IUBnbAndmse6CKYRwrX4=;
        b=ch8K6wOxhjjMVZnSKu961DklnLm8iqD6Vq6ID6PPTfAFLFZB9gSapHsXHYTr/LYrUM
         6eKRD3pqQfkGplhPleiWFHlFd9LcJnkhHJx+BPzdFmBRlyL1dGVhmrxAmKutEx9qlrQH
         RT6M7zqgol9dSqq7qRNJZPROW+2qOIfbo5c3vgIXLTpP+WkDenv1+ry1vMmxMTWrZqlU
         VVD+4S3xwV5A3SuCGyFQPmHCxIqu8L9MpdDPtzWy9tPnrxgWZp03Ehc3duVrkkI8SzBs
         RSTpFzd4jchfKN/5aLeo0kw9ghjim9Y3G0enjD/5b7XTyZLG3Y/8Vg3xHlI8C+9dCD0i
         z04g==
X-Gm-Message-State: AOJu0YxA7OckdAhBenUNUq4k5YCX3D6gK7JdXZp6qceSCvCHakmLbniW
	9FifiaLCHBgxv/d9hx1Jg+aoziot5AuINWUbC+iPqXy8xkapTJWsi1Uw+6tykgnPr2aYeK0ffj7
	NSQzVHUICub5Xp8jSo1evi8hdK0Zw7M2ghqQQ
X-Gm-Gg: AZuq6aLfOa6fmYzp5ul0NMQoRxeU9G13xhPV4+dmxdHdt2Omsfpds5sIVLvx5qbQYn+
	yqxRowvEeBvDO6plffODv7RT/l7u3JC4TG7pSOBTvEPOJfHJPqKPTXZKMSepLKE/PHbGgFwrJme
	P5dwqKbaPkzMg+fadzJ/lcyWUguR14GH/tUY63oLCsicUE9heT0rxxYDt+GBJf/7K9Fv8W/NRgC
	Rct+y7Q2RkPlked7v25RpZ26u2d9zNDdmAx/9/iAgZpDduTmKj+jJAv5CmO1LtckbDYtx8zM/4Y
	leh7qQ==
X-Received: by 2002:a05:6a21:6016:b0:366:14af:9bd8 with SMTP id
 adf61e73a8af0-393ad3ec860mr18302078637.78.1770802148294; Wed, 11 Feb 2026
 01:29:08 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Richard Weinberger <richard.weinberger@gmail.com>
Date: Wed, 11 Feb 2026 10:28:55 +0100
X-Gm-Features: AZwV_QiVqa8nk_229fGgFvAqqTvdw2d0iztKljKI9n_cT6yo2PG5Hw6XUKahYLw
Message-ID: <CAFLxGvyhdpQMnW6VqyXjLPKyZSQvrV-+GFdUogV4JX7DiGePyg@mail.gmail.com>
Subject: PWM implementation in HWMON and backlight
To: linux-hwmon@vger.kernel.org, linux-pwm@vger.kernel.org, 
	DRI mailing list <dri-devel@lists.freedesktop.org>
Cc: ukleinek@kernel.org, lee@kernel.org, danielt@kernel.org, 
	jingoohan1@gmail.com, Guenter Roeck <linux@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"

Hello,

The backlight of a board I am working with is controlled via PWM.
Naturally, I thought this would be a straightforward task using the
pwm-backlight driver.

However, the PWM in question is implemented using an NCT6106D chip.
The associated HWMON driver, nct6775-core.c, does not implement a
standard PWM device interface but rather its own custom one.

I am a bit puzzled, is there a specific reason why HWMON does not
utilize the standard PWM framework in this case?
Also, in case I have overlooked something: do we have a backlight
driver available that can interface with an HWMON-based PWM?

-- 
Thanks,
//richard
