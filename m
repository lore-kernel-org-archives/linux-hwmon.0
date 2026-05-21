Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE162349CF6
	for <linux-hwmon@vger.kernel.org>; Thu, 21 May 2026 03:21:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779333667; cv=none; b=AFz+ulCayBrc4077/SY5urwvyRSZttLfwlQin4fcc93pTBpuNr2uv4GMWEDDV81OiYhrZu2eWDaJQuhAD1DrirEkwVQZxOwe2XB825RUn3pdJrhos/hXcTFT3CVXFpK9/r6vuCpGiu+pdfzTcemIMib5bZ6ns+iXvc+c5zMcJ7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779333667; c=relaxed/simple;
	bh=nBRs/4+4lIS1FVs1LHhoV3i49yDqQ5+KQ4/SxNY5D68=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PPKdcwN3ohRy96cRQO5UmHmQGHx2Rm8gsie0U2i48HuWqKPrtTLSByTemz/4Z1qIVQZ8c/6MLGETLXLaFYZcphnLWdnnmh+3kdAmnWEs0Pxyq8CWhFE9zKpw2+F0c4/W/tj+24EXzBj65iitE1e4qYL/JXgPmxrRT2GT79HnAo8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BjYfYFeJ; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BjYfYFeJ"
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-304106b1204so2050956eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 20:21:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779333665; x=1779938465; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WbHMFjNKeehaSqwOnPCxaXlVw9gZNG/Qs5AE3FPln0w=;
        b=BjYfYFeJLPK33W8w1ISPY9B+zeI55cUQRPoeSU6LQcntoxHNDCzdwri0sIwW31Kupd
         /4wxyU/GHJ4hsIT67pmiIfPkec6rzE6wHGHdG0GonKpLiJZoSfhZ3zUvFw1+U2tsd8Pp
         hpXL6/orJZU7MOsEpY/99HAbAlC310R7byOiEK+G72GbmxRgqnBsbaVBehOrlTR0/rhD
         q0zp6sR4VFC4AbmgSwyukDOYsqFQdcGd0fCW51xlT3/wshg889NX/mqYYbn7izmVSq/j
         +Ig+ddfifehD2hzoEtotztmVMQKnKu+Eoade3m4Xm369tOlcMpEODll2Y4ThXh8dcZTz
         FFOw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779333665; x=1779938465;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=WbHMFjNKeehaSqwOnPCxaXlVw9gZNG/Qs5AE3FPln0w=;
        b=NKULikjdcVGd73W6xy+2EXphN4T19lrdBqxZbE28CBrqognNiv0Z8u7zvAAZyeL4GP
         uOKjBpLHL9UKcn2Csd734LsnTqxUSAmlJmpY1drGUoKAO4R41BwxmEx4ARRwnYPBkszU
         UIhJRZT+dTc07y8e6Zp3jwBweYpWrJY1StFodhy3zmxFEdn6rxS97+JU/JWyqqhayyAw
         +vvqnvYvXKjRAN/ghF0bERXYDnuqsynuqyPVB254RsLJHJu1rlFEL2tbZqm1A7J878CL
         D4FFnZUsLywUlW7dlbfq82IsCHXznfhD2JmVFEU7RlWFzforQ08Db+OhIfYNv5ihYQN8
         WyRg==
X-Forwarded-Encrypted: i=1; AFNElJ8Vb51jtJt/Gpu8K3RHlsDTJ3tJ41SXIpqU2aDOWKiBt9fRa+5bu2GvUy8Zo5J+0Pjw+08VM2sTl0PdoQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy5CXsBJHNeiO4dx68MUWAaFXp2HRNIf8x71TuuqWAZrHfWFibt
	oeTKE56rNr6D8G4NB9s0TWLBNm6J02jWX4fdLnqo4m80NDxGhwYMFMWmA5iM0AoH
X-Gm-Gg: Acq92OFNILxJCt0c5XnHkzck55mojOWHZMBIg4LzTwKhiB8BvZyrmw+uHQRyuNNtlSW
	O6236d+XaXaZV/JI8H2KUmImjOtvYTr6jDXJLisMnsCBorli7s4O/joerXdWyGBhigRcDGLP5dL
	nHsORC8u8XgNLfYpD0X5za7yZAnxExq/gTIZuWiKYPxeKH/SPRqYAnI1QT2uVQ2vq3ZS03yYRMe
	TPJq+TdPua8URUfU+rPN/myZCDxQ2BUKHBJUS/mM2FwnWOCq9PPXBcjbZ6Cx+0LlliZA3xGoaT/
	TjAhF2Wa1PR+rnwkk6ImslwZyKH2HiSAJMt09ARyJ7bBABqGoITWJaZmZt9kCOpPJfpsMc1fSwL
	I3ogYU3OJyjd3oN/XArGJbfSxdfLLC/T5G8Q84Kk5f9o4aFYrB2wj7nqLwwYshcQAf27VVVPRNz
	BP2s4lxP7pibEOAI7TB6jbyuorKMj02+jtEMZk2POvHXZlvEA=
X-Received: by 2002:a05:7301:2c05:b0:304:2e9b:8f56 with SMTP id 5a478bee46e88-3042facd675mr705429eec.31.1779333664533;
        Wed, 20 May 2026 20:21:04 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3043620b9a7sm475886eec.15.2026.05.20.20.21.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 20:21:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 20 May 2026 20:21:02 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Alexandru Tachici <alexandru.tachici@analog.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/3] hwmon: (pmbus/adm1266) add clear_blackbox debugfs
 entry
Message-ID: <0e599493-c394-4a34-bc30-c2cd31e0cce9@roeck-us.net>
References: <20260520-adm1266-v5-0-c72ef1fac1ea@nexthop.ai>
 <20260520-adm1266-v5-1-c72ef1fac1ea@nexthop.ai>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260520-adm1266-v5-1-c72ef1fac1ea@nexthop.ai>

On Wed, May 20, 2026 at 03:42:40PM -0700, Abdurrahman Hussain wrote:
> The ADM1266 blackbox can be configured in two recording modes via
> BLACKBOX_CONFIG[0]: cyclic, where the device overwrites the oldest
> record once the 32-record buffer fills, and single, where it stops
> recording until the buffer is cleared. Deployments that need to
> preserve the full record history across multiple fault episodes
> typically run in single mode and need a way to clear the buffer
> after the records have been collected.
> 
> Expose a write-only debugfs file alongside sequencer_state. Writing
> any data to it issues the documented clear-blackbox sub-command:
> a 2-byte block-write to READ_BLACKBOX (0xDE) with payload
> {0xFE, 0x00} (datasheet Rev. D).
> 
> The clear is taken under pmbus_lock because READ_BLACKBOX is also
> used by adm1266_nvmem_read_blackbox() to walk records one at a
> time; both paths run under pmbus_lock so the clear cannot
> interleave mid-iteration and corrupt the read sequence.
> 
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
> Assisted-by: Claude-Code:claude-opus-4-7
> Assisted-by: sashiko:gemini-3.1-pro-preview

Applied.

Thanks,
Guenter
