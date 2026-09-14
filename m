Received: from mail-pz2-f43.google.com (mail-pz2-f43.google.com [74.125.228.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 896C4481236
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 15:28:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399723; cv=none; b=MeZ9eaW8vszf6OXhnpKVWAnGKULQJBkNMcqG16tNvPOTmM462HC/MedM6khrzF//iZaef0dDIH/QhVtBqGKcFLwBXtp9yJAit0tAGj3B33YHMVQKBL8jOF0yco6tul2i4FXYR2XQBPu+bBuFNR5sCH0KPirqnepqmJtB8yJVz0Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399723; c=relaxed/simple;
	bh=/5GD500jhxrjrGdu3756syYeLWpVMCMPoBV0ibDiq+k=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BHo6qbHsnsEiBbAACzG6DxSOfvRFqBJEStTJJ1YSmm2LuSDYJQu9wnAlM/sn+nuWiikXsEQNpCsfuF4ANfch0O2mJaGVPhzKwD+KJvjNmheJBiVZNbiS78Pa27wBQlzX59h8S19LjpdtI0Z0XFa4L3wt4irGAczp4Gw99hvLXjM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ko2q6DFA; arc=none smtp.client-ip=74.125.228.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ko2q6DFA"
Received: by mail-pz2-f43.google.com with SMTP id d2e1a72fcca58-8693af0d7c4so2899626b3a.3
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 08:28:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399721; x=1790004521; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=P1JKkCEZE/08JY/nIzj8bs0RkzGsOhreN3VjKeZuF/k=;
        b=ko2q6DFAjx/o+eac30ySmNqgpBKJnOfuY+7jneFK5LLdxpUzTS5AhAX4HMZEJh1kmk
         rMG3TrXQ3NJKyBrHcaot9gRyZn4M1IOOdA5NOBQCPO+Oc5BsWRNz21VtUDO5s0iJPE6l
         Y6YBX/AFRCiLXYyXqoSsgW2y21HQLq1OfXgCIts5oxsfh75AwEC8L3HLeqrz45QNpl9G
         BRgc4Pt4oGPCqXMSjoxyT3UnK4qZ2Ho+92ytRb7BKCkXGAhRWbDv4KpdQ51v8fqQBTuV
         ppjq75Sn7RQewbguvj8paaVq5H7zytk3n1nDBVYTeMO74V+2h2RRiF4e5hypORlXusUI
         ta/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399721; x=1790004521;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P1JKkCEZE/08JY/nIzj8bs0RkzGsOhreN3VjKeZuF/k=;
        b=rEvLOSW9HK5llY4CEgy08kudR+8it85yAL6cZnULKfu52UCzLHbaZlMcTAG45i3B7x
         CdMY6nbDcIqPynI6s7sN+ZKcVn3E9YRnW/5LxYc3sy/7v/A9dfLX/OYnZMHQ0CcQff5q
         6IJ8RbWyD5t1EmjG3Qt9AWe8p9Cn7Jug35pOoFnfOfwUWLutPlzF2SesqEwsazyfgy4m
         xIV1NPaLlI5BYvBAJO0Rdv/sPM/kDklukk9qCfmpaJIxncvnbDh5tk9wPY3M4vLwxi/2
         AhQ2/XrESiVer0kBYrk6kPrM89gcnXKBdkq1w0o0IjGOer/mrotqULGV6RXL93Ze8Cte
         vMDg==
X-Forwarded-Encrypted: i=1; AKwUvByoufy1DIsEMxoiKllHVBQuUxCwadxb6qL/UVVLRvqae16fVTkeMIfz/sSCmIkvolMTkbPbr2O7Z0O9rg==@vger.kernel.org
X-Gm-Message-State: AFuF++l0XW0jNyss6OQ803QdNvPkaCf5zRfAd2zuxxO+uI9G9MFmkDNP
	gzWZ+RPa9fvIuyXtyDae3fKHQzMdtDsJUPZ1V7wbwqS/N4s7XPi60FaG
X-Gm-Gg: AYBFou0ecVM5GoMPrAl+wWk7jOc5T5raHSa4yXhG/LrySND/bLMd9/+SwzWDTt7vrth
	SOxpJ3R3QWF3CiNTRRZGCDCZaP6lQVDpyqAMWtQHNvQ1mjWuKUEQ96ZEClnXSn3c3zH7jdstEB9
	F3HmcGiDg9Fzdvas6D0p+6k9q6BDo2jehecrJp+nDYkDMlb30BoyFLIHT7yDUi167Uiw7aNjgRY
	Fkzi8wdFHCDtBQcIIo59xUzHafgi6KBy7afcSUdT6hFsOF37RapCkp9s1kLCJPc6fj4KZ6hYMeX
	HsUrp5Xesnx0g3A80F8QELMsJ88LbbR87ceMzEj8+VY5Tj7HH5t/3TIGY3rBEp9gUsikTNEXX70
	/1vzE5Nuv0QyudJOVL/vGeeEbDt9btzqy6wvEEMMbtPTRkBy88GxvbeXMcXLNuLP/nr7GEHbKYl
	MWS2O3vwuI8BrmRb+8NS6KYls3UjlsIUp+xF5rs7AaeK8Iomrb3E8woVA4MS6Q510M1uH8I3k6/
	ITtlQCSshH9
X-Received: by 2002:a05:6a00:1797:b0:857:72ba:ff12 with SMTP id d2e1a72fcca58-86f865b48c2mr6631339b3a.26.1789399720794;
        Mon, 14 Sep 2026 08:28:40 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86b2a5c052csm4929479b3a.58.2026.09.14.08.28.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:28:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Sep 2026 08:28:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Yixun Lan <dlan@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-riscv@lists.infradead.org, spacemit@lists.linux.dev,
	linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.de>
Subject: Re: [PATCH v5 4/6] hwmon: (lm63) Add Sensylink CTF2301 support
Message-ID: <db900549-54be-456e-9fae-5f04c69e7d1f@roeck-us.net>
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
 <20260914-ctl2301-v5-4-522def70acb4@linux.dev>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914-ctl2301-v5-4-522def70acb4@linux.dev>

On Mon, Sep 14, 2026 at 04:18:04PM +0800, Troy Mitchell wrote:
> Add Sensylink CTF2301 support to the LM63 driver. CTF2301 follows
> the LM63-style temperature, tachometer, and PWM register layout,
> while using a 12-bit local temperature register and requiring the
> ALERT/TACH pin to be configured for tachometer input.
> 
> Register an optional thermal cooling device when the device tree
> node provides #cooling-cells, allowing thermal zones to control
> the fan through the existing PWM path without changing behavior
> for existing LM63-family users.
> 
> Signed-off-by: Troy Mitchell <troy.mitchell@linux.dev>

Applied.

Thanks,
Guenter
