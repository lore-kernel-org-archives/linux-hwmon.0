Received: from mail-pg1-f171.google.com (mail-pg1-f171.google.com [209.85.215.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F5283BFE4C
	for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 14:40:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785163261; cv=none; b=ikb+Izs2CV4dlL9HBHfWQwLQ0wR/erXQe4cd+yfBvIf2w8p7xrWVQydVXOoNTJm6Q5VsI31K0vfF412SMHprFQSYbXA0bDJAlrx7Nj2PdXonvKjxfKEvndAbGfrz1n8rSggZgGQe6/BvQWuHnY3+S/+pVCWCdIv5LLllaWoP0eA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785163261; c=relaxed/simple;
	bh=wvl91n51wxypXJmL8HGPrJwxT9qd4auGeVKT3kaht5I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=T888a1nIlqVLgYqstrm1Z3HqMqKQjIgPKwcCBxMHbpI2PGJjUdB47MtgDRkjpUy2O6aVVYmRnUAufQTKevjhormGEkQAjY3wSTH6CAn/xjEcLBtBxqoJVbV06CAupdvVl0oCNRtEXQIUmBDkfncT76iV0GdyhH8YhuvO3CNGVTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=R06I3Xey; arc=none smtp.client-ip=209.85.215.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="R06I3Xey"
Received: by mail-pg1-f171.google.com with SMTP id 41be03b00d2f7-c9aea40d799so1405712a12.0
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 07:40:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785163259; x=1785768059; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=xx+STKr/dBmKeham5t3qgpvsDfEAeS22wxKe0J4lUsM=;
        b=R06I3XeybnRKdn5YJF5l2zDGt/su7CVUFbsTYUV1270yxxqPqC9b2ODeH5YsdCWQJU
         N7vAAbkGzCQCAbPs4Rg0L3cCtkvsAgWzl6hh1tIf8M0XnodcOtBoAFlaR2xlnFzEA8kD
         U7VjQF4MeTmRzARkfCdRXkR6zZQx8I/j1qxt4Ym6lw1C/kd8ARD5zPrVsR16Bq7TuP5j
         6hnHmeOZowCBgYQ+WMcX1FfReuYyKqGwetKYNEbFq8ryYnE2ncYmhtk7P5vmofLypsqz
         o561ckb6tZa7C0AlHnLD1kXKoMK4doy7adyX2NMbJWQoELbsMrvTucxisUi7a5e/D+8v
         +7aA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785163259; x=1785768059;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=xx+STKr/dBmKeham5t3qgpvsDfEAeS22wxKe0J4lUsM=;
        b=guXZOeMGOTbO5qFol9g2Rc9ILsYvkjiJxLmnJSTr0KUGZqYyiuj92xZqEefF6E396Q
         kD8CPRhKI9LXt5GnjOI/vw8ZeRF7PchBzyIL0EmYPs1RIBe/sG5A0ZEXmnCmhhSoAMyv
         m0/378AxB4feGY2Fr5vSpwPLHKFrNMcf4jLVHxRe87oU6pCsaYTz90Mq96jhKMXG3yYm
         p0x33oU9Pllyjt3XWSY3UsZUKt8QI9g/Oyut/1TihEk0+9jp83cP9ErKC6KwwqBxLUjh
         Hcjt485sz6PNQh8gZJJIOy1Qg2OwtZXlef8eYCapMLUtqqB8W+nV5KL1F1pWYc2vxisz
         M1dw==
X-Forwarded-Encrypted: i=1; AHgh+RqtNF5wlF80ImShKktsJa1w7uedLgOExOyu92sV/CvfU/nLosYJSWl0u+xmRNgbIEGcv+fZRwACEDU2YA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyrSAzOvrmK6oFMP8R4hnqyAI195FmDHCD5D7ygOKjy6P3jyX04
	NpDxwBfVpqik7UcnwyiPOMPwExJ7XSIpvGLSx4ve20NmskI+fgfd5Bbw
X-Gm-Gg: AR+sD107FNAtE5el6AHY6XZYNfxcD4U5YLyfE4lLDDO0gvvSOpOfFy6jCJKzi2fdwXz
	APS/oo4zAUP5Id5VDD1oc1U209tynHJrhm/EZebUi6daZLdsvwdXL+jDAx/TKl/amMfP467GEO2
	HGPbi1flwlmqlErk/794Gx8mPl/5atzROSWAlB8/4Dki1STORgUQvckmYphoA7foq0Hyvtti7op
	CNHkEIAhfKBp4KzF22JXnMlEbVRpEkgPRU7Aqu0UInb0WXSmODHS6wqYdO0ZjCKl8dODl89ud2N
	sE1FDqSNDSw1Fxuqci/gg1LMwFOuTCpjH01Dn3njJ4dYMywTJhjo6zjjcLKXZnVTQOoNYc1Tt7Q
	lGZ6X/uEK4f9uujtxg0qplHwHwKiNE4Gz+u0W8KeoSo14L+/ZL9uO9LRzlaiOhdxXaVgC5CiJwx
	zVCgr8x58/yXhkap4=
X-Received: by 2002:a05:6a21:d8a:b0:3c4:5f94:f22c with SMTP id adf61e73a8af0-3c67df2078fmr8871424637.43.1785163259133;
        Mon, 27 Jul 2026 07:40:59 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e127asm53995972eec.2.2026.07.27.07.40.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 07:40:58 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 27 Jul 2026 07:40:57 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Chung <Andy.Chung@amd.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 2/4] dt-bindings: trivial-devices: Add Kandou KB9002
Message-ID: <62e18422-771c-45aa-b464-3fa34ec1ee22@roeck-us.net>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
 <20260724-kb9002-upstream-v5-2-9523c3ffe83a@amd.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260724-kb9002-upstream-v5-2-9523c3ffe83a@amd.com>

On Fri, Jul 24, 2026 at 12:47:38PM +0800, Andy Chung wrote:
> From: Andy Chung <Andy.Chung@amd.com>
> 
> The Kandou KB9002 is an 8-lane PCIe 5.0 retimer exposing an SMBus target
> that reports an aggregated die temperature. It needs no device-specific
> device tree properties beyond its address, so add it to trivial-devices.
> 
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
