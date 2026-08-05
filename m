Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C062376A12
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 14:52:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785941556; cv=none; b=QUBr+HoZU0OHqlpeLdH+y2n95k7vX1z79NpvGnHucuzTJua1agKg4lihSR+gR8yEh8gAu/2DjbWVazteKtDprHCdXdPzn4XchAJpi6nRNO2CCibDO/U48lfXVAIY3+gaYYgCRqRj2vReVatqrikoUsbNo/K5l/LjrGBGBFU/2Bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785941556; c=relaxed/simple;
	bh=/C81Zz2wSznh4fvYucZlMc47ebdXAcwSWaIZFbaESSM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=I7BjLkFxcwKGSXcyXNv+JZrE/psALCu8TMSpjRAzAtKDT7zxYMSWjmyzeS4U6BLxPu6r3kVKmZZQ4CHfqeM/CHg9y3qIqmZkNgZr7uJxWROn5Sb6SwuBJKFMv5j33jTP76jd6P1oALt1wf3MKPCbub66oa5npvL/Zpqlg4YynRQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RDtgbnby; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RDtgbnby"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-ca97d139d8dso703530a12.2
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Aug 2026 07:52:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785941555; x=1786546355; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kwocLHVaxXHnTep7ZJEgelRNXP21eWJpVdKcO4YQ9bw=;
        b=RDtgbnbyGM00oAt3P2XLhREUBe1wdEgiHAwPFEk0owgAwZx3Znz2LJYlJ6mShw5yhN
         14j6hliMz9iqxLSm/Oy3XUQz/xo3fkFEJN/kPtiosGPLtX8G+iGJ8QXH3PODVBgW1IHo
         70CTQRgrCUfJvfDnUN405+tU4+fOeMR58ZBJdSAD936MMsaJO86IRUN9IaprCKc9HZvP
         C1AZ+71065lr0wyWhESGpWNBFUq/WtrhmTTOIf9kaQ0X71oB2slsYGSyhqVNgjzBQGqW
         TkmKtTDkN1HD4JrB9A9Xdr5JICHQPmf0YSHHQ4N3vy/SyOIN1noKTS585KGMqOHCd4+w
         75xw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785941555; x=1786546355;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kwocLHVaxXHnTep7ZJEgelRNXP21eWJpVdKcO4YQ9bw=;
        b=Wh+ROqV8cfjM3L7G7WC29gXBT5vPMgMOASsEu+egZdSDc234SqSDy6MhLtDY+rx6yK
         2CVR+0bWIBikaqtuiVX9wTvp13fR3lshEHJW1UWQ/S68mc2NEko1v7W38Ip2FgMymQu6
         WUy25vGO4C9HMPPAIPektFqKuiWrildLPZa+vwIcfWk/0hkMlmVlSQ/NsP3DnYgzJChF
         wkk+YOz486TXI1le43lYHfzE0oPLzFHgjA8Lsdx3uoY+1cL8VOR26oycIK3OvNaxHBA9
         sSS0pyJf/0/c//r6ocviWF/dQkgNfAZ5zvAj09fTJuLzXR9cuQ4hjYdcDUn00L6wPQ/p
         lebg==
X-Forwarded-Encrypted: i=1; AHgh+Rr2ahA/KRib2aAyGwtoRvwPj1IEL1/yD8JNlGFnq2kAbuSV4tvi44F5eyF+1JPrnBWTdjEif8n99y5xrA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx334zFqf7DFfaLvUbJ3Md3+0Imkd4thws+Bz07eRXGhcyq0T6j
	VGtEoAlcj5G3cUYxyvHPlspc42I8cOOY5nDQFjRmK8mYxRswcj+yKlAG
X-Gm-Gg: AR+sD10DFxKvFcznvh7qDplSN2PJOjWUAp7Ll+n6fmvzItmeNR+rBSYph0iyvqLHmeD
	C9U/czPC9f+qX4lprSH+ygsKIry6hx0ncvIN6wdJd0c+AZc6yvUfgABaqBkUUHJywIxH2NM2h9V
	vRF3m8s6MhsOLSmazZ6Te65FNjqy5RGu6BeR/nJV8gYrU3bDFyImwQ+kDNajKsAw2tp0x4gqQAu
	X2pYj2XylIOBw21FepjZZYZaLr2Wf95HTgSBigci2Raf5/NV2L9AZI/NXZNtnOF0EowG+9hLTlR
	dsFQ4TQwGKyhtW6Cg0O6tDsK+3Ar9Dmt8zo5aRfEsRKIENEU2c0e36znk8AL/j3/3Y1/RpHuy1G
	/WFfHZKoWm8vp0sOZuNEWqgNmxbstQmzpTk9qCPGYy2DP3ZBpPMtep4VVblwWEDIQSa/j4e1vli
	C2LzT5H0pbkd4oDostFEevie7kUXFgM5c+9BgYu6IXVLWEuYqs8Blk7wIwG7b6MzHJwjRkLTzpQ
	nMLM9DwwcfN
X-Received: by 2002:a05:6300:4045:b0:3c4:396d:4a7f with SMTP id adf61e73a8af0-3cb85e37f2dmr8862722637.15.1785941554561;
        Wed, 05 Aug 2026 07:52:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315867bc341sm27229460eec.27.2026.08.05.07.52.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 07:52:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 5 Aug 2026 07:52:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Qingshuang Fu <fffsqian@163.com>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
	Sam Povilus <kernel.development@povil.us>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Qingshuang Fu <fuqingshuang@kylinos.cn>
Subject: Re: [PATCH v4] hwmon: (ads7828) Fix external VREF regulator handling
Message-ID: <49df89c7-9cef-4e62-8277-058ab171c458@roeck-us.net>
References: <20260805061645.1331652-1-fffsqian@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805061645.1331652-1-fffsqian@163.com>

On Wed, Aug 05, 2026 at 02:16:45PM +0800, Qingshuang Fu wrote:
> From: Qingshuang Fu <fuqingshuang@kylinos.cn>
> 
> The driver currently has two issues with the external VREF regulator
> handling in ads7828_probe():
> 
> 1. All errors from devm_regulator_get_optional() are ignored, causing the
>    driver to incorrectly fall back to internal VREF even for transient
>    errors like -EPROBE_DEFER or genuine failures like -ENOMEM.
> 
> 2. The external regulator is never enabled. The driver calls
>    regulator_get_voltage() without first calling regulator_enable(),
>    so the VREF pin may remain unpowered if the regulator is not
>    configured as always-on.
> 
> Fix both issues by switching to devm_regulator_get_enable_read_voltage(),
> which handles regulator get, enable, and voltage read in one call.
> Only -ENODEV (no regulator specified in device tree) should trigger the
> fallback to internal VREF. All other errors are propagated to the caller.
> 
> Fixes: a8ddfea09566 ("hwmon: (ads7828) Accept optional parameters from device tree")
> Signed-off-by: Qingshuang Fu <fuqingshuang@kylinos.cn>

Applied.

Thanks,
Guenter
