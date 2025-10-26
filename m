Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEA291DB122
	for <linux-hwmon@vger.kernel.org>; Sun, 26 Oct 2025 18:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761504407; cv=none; b=K/YGjJ0AMa2825xn6M4PR4zAL/cg/QoDt5xkkLhFV1K6ftjh3wWj8pbXcGMD4mzREniC1y/nDTjF6P50l9r3ppm+ncqrivempenDkAOCv409bf0YIwgsMB9htlIDGloVKw9VS1GsC/bZeQqY+Gt7WxbOrc0W8KycrXTgvpSvkj8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761504407; c=relaxed/simple;
	bh=9JElRUYcelJHNX0v60zr/J8lWtgoWXeCAYKccVAcB3o=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=t/s154ArfsP/7P1YOZ8JD/4CdYeTsNAj4gBEQoJ7cPS8yqgiZeJsji8o46IMTPwvYUOnyivMbV4NNenChz4sZohP5rVmKSVqdEdORquLt1Hk62QEgPSbjnzIXPRuuC8QGHun51PWpo9DMnlhOkRuoJ+ql2DRvOcuM5cvVBXZtJM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=nfuU5nc0; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="nfuU5nc0"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2698d47e776so31012195ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 26 Oct 2025 11:46:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1761504405; x=1762109205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kr+uTiTscqC5xNsxJVLhouOq96vCtcj/UADaRDhqzhs=;
        b=nfuU5nc0POpV4P3j/DGLhWJQXNqr0k1HE9XSR9yoHSEwcBdUbWJrDZYIJNC/Zigl6F
         vHDtRKR7oa6eXm8LNFt350e4RLDLiyPUquzPNz6Aw1x35N6To1Q8ve58ATIPNEeiBo11
         ur7nEaXMjxSGzSoYn4diJtavEwxzJPcZVVmszzlpx690+BugfkfxFVkZgxNNGpnNZlZP
         Mm5mcMN+BY8C0xEeM+VI47tSDq5MCuJIZWbXA01kn/aNtazHm6o4pnG9RfYsx/ARUmMh
         ysw1c0ZBFcNMlGfNTBSpKL19nfZYqEPPjLcU+HpQ0hrU3LPAQzmZmrFNLRF1ld4A2q4w
         VUaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761504405; x=1762109205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kr+uTiTscqC5xNsxJVLhouOq96vCtcj/UADaRDhqzhs=;
        b=oxhpn3FR8CHQdoLUxJGAFFIBY9VZNdvJgPbw13kMpD3CxpNwOSbup1IG9uhB/aYDk0
         C9n7ZAB4cPWLu5CuxAQteE1dGaDtrkpbE6Er2xnM1oMv9fJihuAcPFjF0Mh5BO4VQ7FD
         5w+fLfHnxpYC5U6gqH2gNZ3TAV5KEUnpr26PzInti5VMT6oHuVvuxxwsFFOKQwxlT6ac
         YT7ys+2bnDV3K6Feo0Mq/SHxW71mqlC8h5akUfOr/oR8L8iTD7c8n7E6R7dSrTHVQb+n
         qy3U9Flg8bXZZtWQUh5n8sgtcd9OX/7Ti76eKVMGwRcs6BQyEUGFI0AjrveB4WYHDeyR
         3ugw==
X-Forwarded-Encrypted: i=1; AJvYcCW3v//Vh5z0KappeCQJyrR2iqEAeyeyhIh4sSOEmC6M7TAmdl8/YSfKodGo1B5D3F3eTDS89jk6LDAQ9Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxFbEmq52w2Mksb0Bczyrdm6v4KzbQlBPsvXT1+Sweims7MXlT8
	/Jr3I+4uoo2i3g5Jc/OPGmEd8WcEYOC+fk4E3QZMuSoI9M8iCP0q75HhjAgluQanNcg=
X-Gm-Gg: ASbGncteTsqvAl5/1WcW/AU6rAQ1Q2g09PNk8KjtspJgeg7n9l4SUToijcknRgL+mEr
	D93ZlymGop5nm55PPDhK/7Og4rIzgUS+mNyL94BVzy8vTt5vJKb7LMuYfhASIdUoFkTJEA1jZX/
	WQjG77o7zfda2RxkiASQye1iPkx0gQOd23n8nbLQNeNnsYELle23tnGqubjSxgaNSujEtxWV0Ek
	W5fMIXILAaGg79CRRUr/g49BCm2ktRmmpiobuILh/T4kjtrCD8BhLMkYMV64BR3Hjsu+Xaza8Zq
	vIezhBd5dTzRS3cUwpn+ACDBqCy/RK0YtaRauOraySGxc4EMfZFQkRCgjMDQy4So2JX62WKDrzh
	IFWev00Jq3ZRnSON5LCG9FAhAz1qKsq5Tu6StBUG7rdTG8uDanh5N6GbeAO+96wAIK0EqaBwUjI
	Sw9KqC38vCUq3aCHug
X-Google-Smtp-Source: AGHT+IHyb18kbZzmWwrapG89GEeH9zIO5kUERUgBm/20I/UDyDk2AQLJZ+iiUs1VcHb79+gHNkmW7A==
X-Received: by 2002:a17:902:db05:b0:24e:3cf2:2450 with SMTP id d9443c01a7336-290c9c8a5e6mr441023785ad.2.1761504404962;
        Sun, 26 Oct 2025 11:46:44 -0700 (PDT)
Received: from z440.. ([2601:1c0:4502:2d00:a43b:396a:591:2ee9])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed7e2851sm2432460a91.6.2025.10.26.11.46.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 26 Oct 2025 11:46:44 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: krzk@kernel.org
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org,
	igor@reznichenko.net,
	krzk+dt@kernel.org,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add support for ST TSC1641 power monitor
Date: Sun, 26 Oct 2025 11:46:41 -0700
Message-ID: <20251026184641.631641-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <408c1698-a8ad-4e16-8def-352c2c265f5a@kernel.org>
References: <408c1698-a8ad-4e16-8def-352c2c265f5a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

> Subject: I asked to drop "binding" and not add "support for". "Support
> for" makes little sense in terms of binding. How binding can support
> anything? This is the "ST TSC1641 power monitor" not support.

Krzysztof,

Thanks for feedback, will fix this and will create following patch versions
in new threads.

>> +
>> +  reg:
>> +    maxItems: 1
>> +
>> +  shunt-resistor-micro-ohms:
>> +    description: Shunt resistor value in micro-ohms. Since device has internal
>> +      16-bit RSHUNT register with 10 uOhm LSB, the maximum value is capped at
>> +      655.35 mOhm.
>> +    minimum: 100
>> +    default: 1000
>> +    maximum: 655350
>> +
>> +  st,alert-polarity-active-high:
>
>Isn't this just interrupt? You need proper interrupts property and then
>its flag define the type of interrupt.

This controls a bit written into device register.
I omitted interrupt property after looking at existing power monitor bindings,
especially hwmon/ti,ina2xx.yaml. INA226 has very similar bit controlling alert 
pin polarity and binding doesn't define alert pin as interrupt. Overall, I didn't
find many power monitor bindings defining alert pins as interrupts.

Thanks, Igor
