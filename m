Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B0683043D9
	for <linux-hwmon@vger.kernel.org>; Wed, 26 Nov 2025 17:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764176622; cv=none; b=gKuZPzXjYd+xW8ArYWmIbHMStgjA5gFqGp0PWg236rE+DLGapYT1JPEMK3iGdARBp5zl3bMHyfOBEm0tq42AqcgMe5Zm+Bdh1d1ZLZqcN3m1b14FuIblpUbMowONChObd2YxguvLPnL6yHvn5dHFQmCoY9hgNCNGm/HyAVxorxw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764176622; c=relaxed/simple;
	bh=i9pfg1GJs47zunkf5ZGmkV9sjr0+gS8elcdDiLI0h6U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ky++dtfJIz2xIqD3S4M31q3jR9CgP+Q7euqEVjE2Ynd/lzrubvWPfqFxwrZddj4XRqH+2/s+2WTcf+czFWB5hcLnUklDL8+jmVA6dw7RddC1W+RQWOCwQniS3Hd/zVBqLRg0Cxjsy4ytVnTo5+I1ZaS5IZxV/23ho+WFXZije1I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Erci1itL; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Erci1itL"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-bc2abdcfc6fso3533a12.2
        for <linux-hwmon@vger.kernel.org>; Wed, 26 Nov 2025 09:03:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764176620; x=1764781420; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ApJ/yRDq+bDqsy73D/kNhlWrZJdpub0g7lw69ubez20=;
        b=Erci1itLlEdLbGaVaTrqqQs81ieX41XT2tsXQC2zbyTdgHX6vuGJcLuHVKswbz4Cvd
         O+3H5xTWKKPlmUfBjBSjtuQ7/R7uwwchMUBLwLGqgJEGTD+yazExhkmB8TKMQTDHvL6s
         vKzsz3KRXA3iZyeP01Vp6SqDyH9vBuUVZssPpLYMVUfj16vtpDOOeNdJMZ7ObZ4cZ0dq
         DaHE6G/llt1BIX7UHN/kORgj7A8ZXcTGjt82oMYvzfQSUFTZhjUEiv49g672nZ9TOQB9
         rZ40127ZStNTGDQ9ggyo3ULL/byyp3qU5SKGtpujN/X1kUWkDSuRE3df63v+fTAT5Eym
         TrmQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764176620; x=1764781420;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ApJ/yRDq+bDqsy73D/kNhlWrZJdpub0g7lw69ubez20=;
        b=EwB8ph9cupEIDRrTmiFJS7yZYbIsBMvggovSrOPQYTJkH0O+9rNFgjXjX6O8TdOV/7
         Pa+9r4XPTDw8LjRFrfsdhnU8dxYWnjZXQfsH1GvpQd6jHVaai0yfxv5NZUFnC7X+hehY
         v/+IMeYewpfPCGS78HPpjRO2if3RcYevHPVAjvgebHoWP88qj1H2HJZEBhgVI+9QnnTs
         dG6aCFZvhte9zGl2HyL3lSdjxY1sqFCu76YD8BxC3v6+CCh7NQqiI552e2n/LTve0mMj
         HE9u9dnyyUI5DALaB+3/rRUady0+EUv0DeBv4JLRze9uG6PFtJFAOpI0xsb1dORDr2vD
         z6+Q==
X-Forwarded-Encrypted: i=1; AJvYcCXWCxcfIjkXFBnms8NewjALMwDin6kV8ZFaHMP4m2/EAXw4B1S95R7xz6oIvlCqD/jOsHQDU+sBII8jrg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwpSi4dXTpWcLKCNoEJFLLY0eZrN9SlXBaA+X2rY+IXYfIUTwxV
	GhOCmZYCEBddvXzuDMu718uejPd3c7W6+Ia4wvB/tmrXeWFcNY2gpLlk
X-Gm-Gg: ASbGncsbD8tORLy+rxNN9pjzLZ+vo2/DoCuvY+nOAC7Y1pMu62JEwDSGclvXFyhMHAv
	Gy1WaFfDwhQMcNtgnFcYWjsXN4UU18tLbVPZut3DeHmqzftReGO0XpIXiuVjmdBRDmhbfnQasmD
	SlVty2u+h6ddnejoZdcBG+qA1tAIL/S9Vpv7VljWvKgfvaR8Hqnfle1HL6EBBd/CFzhkK+fGq8z
	MPYlJy2+/J66fPWv+HhAuAL2j34sAO2WvAQaUAljbQ7fCa/VlqRKsMKVu9gZWN/tO5wGYDMkyoA
	CGnGgl9xINX0wZ51kZ2aWNaVrFIw1rCXZPNXkgufauYb3E2+jH7/4CwA+gmQjFgoRkB5KhlOjxW
	J71DLmjBoeb97uFMgPWWu4aQfj4XeBRlAZhGLCXTEZkeTuAxThjO6qlS4iwwAgOeiIzI+gZ51bE
	at1Uh9z728QOIPYUxwQSSONus=
X-Google-Smtp-Source: AGHT+IGxEZ4BcELAxm4cq968LBJ+FzQ5uyJqol7KhvCIqh0Xm/Vumvz6VIjtOgJraFdDY6MI9ur77w==
X-Received: by 2002:a05:7300:570d:b0:2a4:5c3b:e2bc with SMTP id 5a478bee46e88-2a719d80133mr11188944eec.19.1764176619354;
        Wed, 26 Nov 2025 09:03:39 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2a6fc204881sm84462943eec.0.2025.11.26.09.03.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 26 Nov 2025 09:03:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 26 Nov 2025 09:03:37 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Haotian Zhang <vulab@iscas.ac.cn>
Cc: Alistair Francis <alistair@alistair23.me>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: sy7636a: Fix regulator_enable resource leak on
 error path
Message-ID: <bcc61b94-29aa-47b6-b399-dd5e70db9418@roeck-us.net>
References: <20251126105445.1810-1-vulab@iscas.ac.cn>
 <20251126162602.2086-1-vulab@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251126162602.2086-1-vulab@iscas.ac.cn>

On Thu, Nov 27, 2025 at 12:26:02AM +0800, Haotian Zhang wrote:
> In sy7636a_sensor_probe(), regulator_enable() is called but if
> devm_hwmon_device_register_with_info() fails, the function returns
> without calling regulator_disable(), leaving the regulator enabled
> and leaking the reference count.
> 
> Switch to devm_regulator_get_enable() to automatically
> manage the regulator resource.
> 
> Fixes: de34a4053250 ("hwmon: sy7636a: Add temperature driver for sy7636a")
> Suggested-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Haotian Zhang <vulab@iscas.ac.cn>

Applied.

Thanks,
Guenter
