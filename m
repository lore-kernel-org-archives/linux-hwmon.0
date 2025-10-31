Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A68CD2652A4
	for <linux-hwmon@vger.kernel.org>; Fri, 31 Oct 2025 17:30:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761931835; cv=none; b=cHsPS8NClJrwoHAbuMXRLPNFRBVrqgYo3tgAP7Tp23yMaxKNAcKmkLb301lpPigv5Z8Cgc0+B2535pkU7b2Hbi+D6iFPTtgjQEqAAk5ip0UYUD4J50ZjnBHvCaUIO4Mfws4HXgj7HYjHAHx+GrciFtT4VOONOwSnROawl5DRucU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761931835; c=relaxed/simple;
	bh=/4NUosojYw14l9RP2wTbIe+vINI+8c9ZZ+FQrVCN4hY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Hxo97DRCLaEwDtjKzYcK7u94dllW/SBzVmrdm+KkWsMrZhtBPPJKznOTvpDeR9hXEuS8wRCz2oJUvFcLLmbpwvuMQyKkV5TAqXLNKbQmw2wqyPlTwQ8M3N/fdl/kJsctj2LK2xpBFbJyfYl5TRcyNqJ6UF86Rfc1RNkGTaVmZsU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=aDsGvjIB; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="aDsGvjIB"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-781206cce18so2970586b3a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 31 Oct 2025 10:30:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1761931832; x=1762536632; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V9IaWectU89+Tfdd2SWxnAs2i8ZZ82BZgrVmURYyxk8=;
        b=aDsGvjIBStJFdhyBHjbFrRYGPuLwTvMi84iTNFwXcVOryGad+fjAWS4evHuDh3lJMB
         qmGzKq72XYJgsdxJIcy8TbPN7HbEWVMI4tatUU6Aapoyt/oTyup+yOOHx24i9isxUA7j
         7n2mVO010HBzf/DMOl1v0RAM8mTD21krFIHgUAgvVOQm0Psekl65qINTMIzeH3LDlMwd
         fgSgqnX4nvRXVCWeAkYiHQuf9W06Zu5zwyiA5cbA7///2CnzWFb8g3sxDG0hCK/X5+hd
         ksRlITkIc7hR/44lgchTbK19BGwZOPEQO0zTMRb+NZB/PaxQWkUfy7TGcvwUR1aYH++u
         PzXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761931832; x=1762536632;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V9IaWectU89+Tfdd2SWxnAs2i8ZZ82BZgrVmURYyxk8=;
        b=o8iGcJphhPxEOrwQWsiv3QObroDHb30vk/FSd4yPnORfFBM/f8X3EBrQkvFGW021kY
         KnQ8kmoMpXdfmWnGuzBd4PHTz9m8F7BAhcnz8l1mJokiMgqH8rKQYGXuLBm5LfDUQiIV
         GQ+KzQ4eRwST4CDu2pQJaCsu8qBXCagU0SWCEE3mk6x2e/lWM8CTlXJ6fCU9VEK8berg
         1/KgdmNGo4kglZ680BDJbI5Aj8I74dh5OnEUaCdZvx2sp/EN883tKwvVLEx6MkYPataE
         RXaGpoPCrnql10bNQZAD3X4Wx3ySFPjrHB1USo2D/BxJmc6uWNTNZoFBsqOoFv655rAI
         n1Yw==
X-Forwarded-Encrypted: i=1; AJvYcCXMLMio7AHC1s5JC6RMz7yy9L5rXExqZ5HoeEWmUx51o+KqNms89PihX8cYfGPKsVLJpzNIyw+wGZWWFA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzlpOFE3QC7hZ1MUNNldoxARQ1JfwjL0hKANTXgGWRWKC6AujO
	6/2YYNOPtFVICExfzu3d689KYC1xvg/+oKFaQAN4byLrKh5SCzN1rdGZBRy5qiUYqps=
X-Gm-Gg: ASbGncuBsLTpQTVIfD6pUVRaF8keyHyahoE6BItkatQLzunJJjoI7poRZL7xHL714ev
	/HbBUMD6INd49fkGHEHnBCy4SPQrqrXbsCSvhgolNyZaCwxtS2MkJCJ8bO+RMPCnqhGIeipNh1k
	+4RSYLK8lKQ3nF7h1s7uUADN1VwTtTlzD3Uu/P+JHxv/xHpdSaxFAeLru10kpKgGLI5WFDn7Y1E
	322MmhvLNjoaqV8W2zxOPetE06SVxFxOx24xKanhs3DLxAElJJipUQ53jxo30tg7SSCPzTT4sHg
	UbQg3ix6SEC38snd7Dz8fuuwthwg5/YhHmsZ5lzRcu6I8+zcWtdOV7YW2oRSScEqYTt/Ivjb4M8
	aOB95rqdMYbdbiageojwUxEm6oaOIKwvaU7AUchHJXmyzmHyBPaYgOpjlVG+m66vly+HkK77x2g
	hhr6cMXpiYoF+81zmy
X-Google-Smtp-Source: AGHT+IGHZuSNPg64weN7MygzE+D+JmL2pDp9GEsG2OfutOUVQ3cd7U4bVtqYoUkGlzWxt2+UcaITRg==
X-Received: by 2002:a05:6a20:914c:b0:341:471c:9392 with SMTP id adf61e73a8af0-348ba87a6ffmr5874081637.10.1761931831675;
        Fri, 31 Oct 2025 10:30:31 -0700 (PDT)
Received: from z440.. ([2601:1c0:4502:2d00:2da:2c8a:f651:af34])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7a7d897e862sm2857660b3a.8.2025.10.31.10.30.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 31 Oct 2025 10:30:31 -0700 (PDT)
From: Igor Reznichenko <igor@reznichenko.net>
To: krzk@kernel.org
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add support for ST TSC1641 power monitor
Date: Fri, 31 Oct 2025 10:30:28 -0700
Message-ID: <20251031173029.904313-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <35d41d46-5bc8-43af-a84d-6b118fff08e0@kernel.org>
References: <35d41d46-5bc8-43af-a84d-6b118fff08e0@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>>> On 10/28/25 08:17, Igor Reznichenko wrote:
>>>> Understood. The bit in question controls the alert pin polarity on the device side,
>>>> independent of whether the pin is used as interrupt or not. I'll drop the property
>>>> for now and revisit if there's a board that actually uses an inverter or needs to
>>>> program the bit explicitly.
>>>>
>>>
>>> This is kind of unusual. The requirement used to be that devicetree properties
>>> shall be complete. "Only if there is a known use case" is a significant policy
>>> change. Has the policy changed recently ?
>>>
>>> Thanks,
>>> Guenter
>> 
>> Rob, following up on Guenter's question above.
>> I'm not sure whether it's better to drop the property as discussed earlier or keep
>> it for binding completeness. 
>> Could you clarify what approach is preferred?
>
>Don't you have there possibility of interrupt (not only SMBus Alert)? At
>least this is what I understood from previous talks.

Yes, the alert pin could be used as interrupt in principle.
Datasheet calls it "Multi-functional digital alert pin".

Thanks, Igor
