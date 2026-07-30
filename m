Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 60DB235C694
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 02:36:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785378975; cv=none; b=eSGxPPgNnwH3nqxAUSivyo6fVoscFT9CWLDKF2w3hrVdZTwd7StaS1TL665s4vGFsvsXJoBIVF/3Jl4QkrTb5ziafJ7Yy2mnG0bxCgFId0qoZ1ReEU5LV8S/KMvK0amSqXV0ky2UNZ35Vi9i8IeFUh1KwixS9o1WhVJ/1Fxx4AU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785378975; c=relaxed/simple;
	bh=v+NXQOectydoDdkAldsRg+teWH/6aE0/X7otk5/649U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=kLOBoX3pWOBCmmqxsKeojMJsi0CNWmAJBSB/GvWM8+uPIqUoRXwEipnUx3jI01dBOv9Fpbb9DuaxcmnDBDj0E9yS15/V3ItJYxyubrSG12DBSmn1VPwvIdYm7nW6xzcuYg8L/dAYNAimSL1aIDddLVhTE1O4XLFJ8Tn+QveBv8Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nioNz8RX; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nioNz8RX"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-8487b7b3fc8so1806214b3a.3
        for <linux-hwmon@vger.kernel.org>; Wed, 29 Jul 2026 19:36:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785378971; x=1785983771; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=qFcbGrazQ4hsDbTo3q32DnWl0U0D+49o/G2t63zLjQk=;
        b=nioNz8RXZF+YTSXXndVcNFfUOSg1A98u6Z+5PU7wobBOXGVtDpP3W9kK8wF9E0Hk0S
         1cZBTXSuTw5HR9cjoS6IoVS2nCDx0+x23hoj5JrbqLnuhID0/+IVZI1RXeN4Ul79NYj0
         rhhJYwOI4m869MeYG7RZo7HmPAp5ZaN1HQQ2cm9TLeBcwIQ8fihU4sXJl941SZW8Ziw8
         aylhFgenjgZFA0zNJ9Kb1vQccs3kPGZQjVDXsh18MM/m5Oiu04XH5wvHJjPzvGM519cF
         sJ4MpcLL78dm2cmiBYHguggUSaQgZL2komisFeZU1+gzLNXtItrDQcLe7le+EWKVyrU9
         nV4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785378971; x=1785983771;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qFcbGrazQ4hsDbTo3q32DnWl0U0D+49o/G2t63zLjQk=;
        b=Ilgns8ncz6AUY7J9/1t+Idvo+JosXf4Qa1El3xUlP2VYZCvROJ56A7tnKKgWz9qzwq
         26SkswpkhK9cJrHIh5pG6/Qk6r2yI6xWp3Fx49YpRBDJtpMvS4ncd3i5kRLLjpmD02Bi
         +lxHdaKRojO00hAFSclpxxdhfBVrCaZ1vYK8uki6bVHXOV5GQr0v9jVGqttKFWHuzlnM
         PrZdToSVNb4Esm0obBUc3RpkcuH0LfpYAq0C35yvGSyPivo3i9LRicg0Ducc6uSsmrVY
         1vFuDQLXQrfDQ+ZhSOjEDLHIiLGt/XocdJ/6jtgvoyJuTa2RwwDI3VywtgDt/Lgv4bMt
         ovhw==
X-Forwarded-Encrypted: i=1; AHgh+RpQjUiODNJ5RRsa7gj2UK1eI+PrAg5kcvL1y0x8kqwM1Ioe3jP8Wo7zmD6zh/63HlCYcZBn/coblwZ7Lg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoEeGnMpjDOImI8SzF+s7jTexsE+fZXZUsD/fPOMFiqC2rNt3O
	l1yqRT6w7+GsQ8DSh7XiavxI1YlwpZyQ5AI5WK/6rrC7ky6iR1eVxDrN
X-Gm-Gg: AR+sD11bWi++x5wRvf14VPd0DiCExAKyZjQVKr6eLe/rKbrDX8OEJqq7H7rEqflRFAx
	d1C6rIvYi6n6OBl+/TEMKSjO6Bj8O2Yt1UzR0ua7vYM4reKMZwyd867CkQGkcBOUVRSyuLhHVeE
	pIP8t+eCiMRpKwNlQLxHuKqAYIbqa17LkuHKUbjyXJvDVclVwt0zbkiqOTSZg4A12vvkfmqC57V
	IwHYL6PfQkdYaPCriFBFwjy/TBHgBZB4UXFPknM27c1/6zyvls8EICKyb6SWtMWVNhaXXwmfUht
	GT7epTEr4eomajRdK93+NWpsRWxyAq0JTtUCzAGVGCXVlpLd04P4H8o3hIsll358ei90yG03gnT
	KdZFytprN9oovimf+misgb8w/5wUD2aRfLUCmdMjutsWzMsJlJXzkura04xNtPc683qiWKk/s87
	rv6yLQ+fcrPRrFsU8/1cReknt/LVx6CpRrhfOtR3b+t0kUUhs5cf9bXuUiPAwwZaBKilTm36OhQ
	Q==
X-Received: by 2002:a05:6300:14c:b0:3c4:397a:69aa with SMTP id adf61e73a8af0-3c9005749b4mr687469637.31.1785378971135;
        Wed, 29 Jul 2026 19:36:11 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-31504d373c3sm15058591eec.23.2026.07.29.19.36.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 29 Jul 2026 19:36:10 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 29 Jul 2026 19:36:09 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v5 1/4] dt-bindings: hwmon: (pmbus/max20830): add VOUT
 feedback resistor properties and complete examples
Message-ID: <dbfd8393-9a69-44ce-b49c-f08d57e2fa66@roeck-us.net>
References: <20260730-dev-max20830c-v5-0-a7553f84ee74@analog.com>
 <20260730-dev-max20830c-v5-1-a7553f84ee74@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730-dev-max20830c-v5-1-a7553f84ee74@analog.com>

On Thu, Jul 30, 2026 at 09:03:33AM +0800, Alexis Czezar Torreno wrote:
> Add adi,vout-rfb1-ohms and adi,vout-rfb2-ohms properties to support
> external voltage divider configuration for VOUT sensing. When the
> desired output voltage is higher than VREF, a resistor divider (RFB1
> and RFB2) is required to reach the intended value.
> 
> The properties use a dependency constraint to ensure both resistors
> are specified together, or neither. This prevents misconfiguration
> where only one resistor value is provided.
> 
> This patch also adds missing entries in the examples.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied.

Thanks,
Guenter
