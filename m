Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A352D3128D3
	for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 15:57:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758729427; cv=none; b=WVEXy/IGx9x3ucMxTaeDnevLjui4icr5kSp8oTYgvsSShWSY+4Lpq9ziA4FQsIheU2mx/68qRBFIK1nckdnE1dScD4O/9IFLKmLXWnp2oR/YgAgkMKN22GggvhxVcnBj9NKH/c3gEcehrkDyvxOJO69hL9BwyOQW6bthFyXRKpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758729427; c=relaxed/simple;
	bh=W0TpT8Re8zEvNdcOFlrSerjKhi4ru5BnujJu72RiUyo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r65xWjgxZW/boiBa+iaR7gV+HmV14X5d0uGqB1McJuA952U+1X3rmDcCOPqPUZdFGBjO+zIqbcc9QlVRGQiF+MHA8B0HQBfT6GO0UQy5K+bASi/hUqEZ3LchmYnSrQMSk2aJm8Q9MKWs3Zy6Xw/n2pBcNEjTVEm77p/UaS3xQag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D7B9H7dw; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D7B9H7dw"
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-780fc3b181aso186407b3a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 24 Sep 2025 08:57:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1758729425; x=1759334225; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Q0NQpLAHxIcZklHB5SuD326usfKg/QXFllwVnvOnGGs=;
        b=D7B9H7dwLYDywWYpVnoKzixWI5VJvO2UIpjcFHu8Hpv1rGSx5+TmTXWHls+DtCxnsG
         Fmw4CwVQB4gEGuQaoFyvFv2Mq0OSW3OvteCafq8mYPS8y3PupOt+wBUyEtxmQ6Zaj0rE
         EqT0HzoXmcM4pweoG/IEJ3uVP8AjvtbleXGbi4orHsOwwKH50Qzw2xk/qJer/qajeYQi
         ULmhH2hkyoVS/DEYUKwtD++j6swIpUn/ZpK4Nw/wPdBerBxjs1Ul4EQf73zFVRMS9Vdg
         j2UDWm6IIArXQjs+IEPM+s9SkiGZd903DU+4sAvtqhQjg2Q44rumCl6Md6jA3MZXLRPr
         kQJg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1758729425; x=1759334225;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Q0NQpLAHxIcZklHB5SuD326usfKg/QXFllwVnvOnGGs=;
        b=VJpz1ZDUbtDu8qtG/IzaDPr5fCT8f6HSyEeWco9pkAo5cFJKY3qI7iq727gSX1xA5N
         d6W8fSJwkN0iODbie++XIUqRNryiYJL/81fc3URq3exN/evk0Aql1/JHit/iNUvbZ9ap
         AIvln6qe4XhZ2BwIh3kEZwtDhzg4535lyoo9RAmBb2Iq57Rw0jmxgBPlcpVA5mXCP8hR
         CjItrD2c5oUoasbHiCztAWMjPCsbjKr9f4TVKZy86pfEBLM/IA+qgYfbsumhXy7w1RpW
         j6zgVzWm1DApYP7SYE3fqPnGbxCPfIqw4tODJfbI48uHHCEjET62x6COBfFVf4LsgXMz
         jrtQ==
X-Forwarded-Encrypted: i=1; AJvYcCUiuAtu9opKNE7hVNpZKwaZFi8YZtRx9KD4KBteoLcw8uqZqliBc51tpJGz444wmU3va65Zgq0PXBaZXA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxvQBy31rqSChkSw6taIg76KXGJO9nk2WEejsVgMAI/CWr4WBvV
	S56BnvO1hN26+blsaVA6aRLnkvri3uPx8dGFmJ2uyF8LvN6LNeFQFErA
X-Gm-Gg: ASbGncvSoj0jDBviLt62+IVowN4NDEWyu9KuRua05wlBaR807HGVQ8ClT3ijGdiRd1w
	zyua2BwD6SeOYoGGTwqwqEnYCdqHY5hASw92SmAcc3T4jmHppJA9VZIKMIU7M5qSwXJDPJmpXzt
	4t3hcaT3CwogOuasHoL5duRRyGnmviPPSuOI3eDQ8ZHjuQ7hyd+eg/QJg9QGwMUv8/NBVLCl299
	ift5Czo2h0RyoZpDnoRKtMv4NulOBTityWoi/0KGLbtfV70jeNX9d5Dy22eKtPgNvCACqZyRqlj
	ui5G/5MCP4WFMkzOfzZqMOGMbQVek6aiTJ2vOIToKP4lwL0GddHdBxhJGqQ3o/eZw06nW4fbqyN
	8o4itGdTpMRNpuc/KSmNFnH41+RsLoch63Lg=
X-Google-Smtp-Source: AGHT+IH2mynAyO0z3pd5SH7iz3XlqDdNIzCuXVUVABS5OUSwkQYfwep+60Yy8aTy35z0xTBi39gWAA==
X-Received: by 2002:a05:6a21:99a5:b0:2e0:9b1a:6429 with SMTP id adf61e73a8af0-2e7c508fe00mr160845637.8.1758729424848;
        Wed, 24 Sep 2025 08:57:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-77f0fc4cfbcsm14373088b3a.61.2025.09.24.08.57.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Sep 2025 08:57:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 24 Sep 2025 08:57:03 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Mohamad Kamal <mohamad.kamal.85@gmail.com>,
	Jonathan Corbet <corbet@lwn.net>, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) add TUF GAMING X670E PLUS WIFI
Message-ID: <bd032e11-1da8-4555-bdd7-39ed9e818650@roeck-us.net>
References: <20250914084019.1108941-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250914084019.1108941-1-eugene.shalygin@gmail.com>

On Sun, Sep 14, 2025 at 10:40:10AM +0200, Eugene Shalygin wrote:
> From: Mohamad Kamal <mohamad.kamal.85@gmail.com>
> 
> Add support for TUF GAMING X670E PLUS WIFI
> 
> Signed-off-by: Mohamad Kamal <mohamad.kamal.85@gmail.com>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Guenter
