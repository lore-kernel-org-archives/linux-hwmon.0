Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CFF504446FC
	for <linux-hwmon@vger.kernel.org>; Fri, 24 Jul 2026 16:51:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784911918; cv=none; b=m1eC2tfqX08J1AQkpYgoivHjpjQBvPWZiMoymjSOpiO3b+dllehSLApQoqf4TOEOHm87plBLUYwDyXtW75zW7maCmunCh0C2DgtPly/Bz1JKvcan/gUvYP7sNHmjvttYS1HKdZXLDY37Dj0Dk+pFXUsJjYweSeb1OHRRQwriPAc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784911918; c=relaxed/simple;
	bh=t8Ji/sVdLJdsE072Vnuy/Ml12Q6VvXWCvIgrXAbVoaY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M8VbhD8Dh5yHID6NYrjT7d9SHqfjOQh1q+tSESsq422eU4btpLkFjDvO3YTnXGlOehzX3O4p/w6pAidFMihx13blBSj33OjkyWY8u/XaQWyDydqxzxfldSyvmQ9611TFPhcMEUA4MO1m/z0DK5ZKOA7kor9wd3pSb5gFcsdnSI0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=oCU2ThHw; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="oCU2ThHw"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-84a652535dcso397383b3a.3
        for <linux-hwmon@vger.kernel.org>; Fri, 24 Jul 2026 09:51:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784911916; x=1785516716; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1C/GoAkmFNMbDtN6SIF9YJ0GbcDsRXjGUvhLK0CpR3I=;
        b=oCU2ThHwYL/MkTUbAn6KHIkbjPvEClzn2q+6b5rondZn90LD5tLrml8dFyPVl4TcPG
         HG+jGN/fFyztDOtiEzMSHYtiKyosax43c7b5qwPFiuTg4bh5wMYgrE+rmcZXPl/6+ijy
         qjsLC3g1xoRKz8xm2rwb8QJyZbNc5YpGxrOZmwjutnahPvFaThWPv4eQnesPeLvcYQAz
         /bQsUeKs4Vrrfio8qHgq8xKN+l4cZ7fM8z+huwg8MxA3sKhZx23qC8ao5/aKsLodyJHz
         02mYSy5bTZIrAYoxAWMKhbAvXTo57a/dTl2YgylY/gouoOfo0tIf9L9L53MVPgfBuXYn
         vZyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784911916; x=1785516716;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1C/GoAkmFNMbDtN6SIF9YJ0GbcDsRXjGUvhLK0CpR3I=;
        b=sHP3Bj0rto8WpECy/7HkkhyBOmbJZDX2tpW1tDQmGrp6aBruI2pcO1VpSe0m/xZeSS
         BP2AQaafZCJxU6hUmV8D+pvxGxbedrYfZC2UVibIq2pTdFv5o0q/SoxxQxBxSsYKw+3W
         fRKjUlwprmovY4IycssW/09IHXr5g8UV9lUKQPYHTM+nm1dUNViGf0Ap2L3Rdlr/MPzI
         6WnEIUoJQwJzHrRntDMOfVFS/uxbk3sVE6D9eh66fasnk0m7076eiidpmA2FKONwWJyF
         gndyRSTfciEwtYchbH8UobCDdbpCnjK9ND47A2Aest1SzWM9XB0NyVMHkz+FjWwh6ptk
         87KQ==
X-Forwarded-Encrypted: i=1; AHgh+RoJs6gTYLX3uLbXf3GC4ydaygzBlAL+Pqb6Ul2/b/LHWXFS4uzmuAXFZhlO4kWaDhAw3m/LdV3rm1ZZ0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzCFh6DHv5Xb/7M8jtVCeL+S1EqxNXfLiieO2Rsn/fw/ESezXNS
	jCaTm4umTcY0KQZEQLIbf4v126hIvqjt4wlmjHmf9YsUnga+LixWwC1S
X-Gm-Gg: AR+sD10cb5FwGpRPD4Du24cCaygvqJQyHQW0i0T6xHylaBQE5gHxBZrABF3qYPzZ1Gh
	8l5iLZ6QRxbl96A+8AGg16x1XL9Z2/WT+XkSA9BhjDyqa0BJwiQ/pblFV2AmaiUmUYmqgNHVvty
	ipdwoOgns1JYKrBT46MPBrVqhZsoRGX72HBowA7aNvyDDkdOGxFrNkO/6NyOqqQx5zAZc4Fh5Qt
	DT8j3Ytjj5vHlCQMSRfgr1iBejbtd5TmtCoeMD7xssVHs/rOCf7GP8M2AC7ZHXk6N7n7/Fmrn9m
	+FR6rz1nDB2NEx/UnMD2DlIi291oNO+djMc39Nz1YUCe8bBM4VmOkU+mbFcZ1a3L7roxpIC0jo4
	PvjwnMy36fYF1FIqlf5zpF0SqtZZ26p/GhiOXwgcpcfiCJInpSM3w2SsOYPy6+d+l70qvXNAACB
	PFRX/calRLrMI16Qk=
X-Received: by 2002:a05:6a00:b93:b0:848:2f84:f426 with SMTP id d2e1a72fcca58-84e2bbfc88dmr8648923b3a.63.1784911916103;
        Fri, 24 Jul 2026 09:51:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84e5341e69esm165061b3a.43.2026.07.24.09.51.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Jul 2026 09:51:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 24 Jul 2026 09:51:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Chung <Andy.Chung@amd.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 4/4] hwmon: (kb9002) Add documentation
Message-ID: <2b71e6e3-d831-4d56-92c6-a4de72d7a3a3@roeck-us.net>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
 <20260724-kb9002-upstream-v5-4-9523c3ffe83a@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-kb9002-upstream-v5-4-9523c3ffe83a@amd.com>

On Fri, Jul 24, 2026 at 12:47:40PM +0800, Andy Chung wrote:
> From: Andy Chung <Andy.Chung@amd.com>
> 
> Document the sysfs and debugfs interfaces of the Kandou KB9002 hwmon
> driver.
> 
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>

For my reference:

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

(waiting for DT patch review)

Thanks,
Guenter
