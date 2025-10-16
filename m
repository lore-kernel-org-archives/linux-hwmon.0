Received: from mail-pj1-f48.google.com (mail-pj1-f48.google.com [209.85.216.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED0AA2DA77D
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Oct 2025 20:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760647677; cv=none; b=PeyzQ2JojYGfHFeK9mfRDNwtVnnI02oPq+KnQwqvjFN1TaOF34rfIgcdT7wJQpiwICVLN+gdqc8viUgPIliB4wDNOBH4QrZX+mgf6hmWeXVsRSpxBZW73TWDwcga3EuB+xn311k11w2pcH3qOsnvEMMQxL3Gb4ZMIH0yEf225BA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760647677; c=relaxed/simple;
	bh=ndgdnL4NvZXc2YXbgp6JkfbQHOsj4MuJcCkc5VpFe/s=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cy2YXW9r6DtRjO7YZeGXxD+/AnVhK/RbdorqqoBISaxQ3gM/6M2BOLRlWwf7BWkM01hUIP8fDTb1Tp+egnPShjwJuP5DjmQrayXOc3GIkyLhalBd3QUqAmUDGQSc68OnpW6VWhJX+6426qZIWZtL1b8f5UylNzEQ8GYidt0wyvs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=UAsYphbZ; arc=none smtp.client-ip=209.85.216.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="UAsYphbZ"
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-339d53f4960so1241664a91.3
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Oct 2025 13:47:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760647675; x=1761252475; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=onqj4CjIVJRLh43lyfVP55yMWDw9oV4qH8HlU6gjd2U=;
        b=UAsYphbZ4MRTWb6nOF2oYdTwBM7kMjqt3H5KRekV1snBYxE/SwbQfN7wge5KyO/PY8
         83gMgfYuD5ePzwm5dnfRiOovj2f2xMJvBK/nVrcXkk1I9HPIZKOhy4XgxDRYedCwaqSY
         Qt3W+raQA6SFeD8aFEDciCGljFlf9QrF+yuRtUeH8CH3qHO/72boG3SGgxrsPywOz+VB
         tqZ2p9vNZd5epbHdlQJa9zg7dlOtszigehn3JHyezeBbljes4hCBUUZ7C/V6gt6yOCN3
         c90pGCgVX1V+XpQy5s0rVkPoKp+lj1FaBxwjqeblBwmC+mtMPQokFNb3wcWc/26D+N56
         +0qQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760647675; x=1761252475;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=onqj4CjIVJRLh43lyfVP55yMWDw9oV4qH8HlU6gjd2U=;
        b=k3cni7N64Ng2stXlW+iA47wVsVYalvj0xk7sJXTQi83OBObH+LEqDJ/QGX4TJJ88sA
         zK0zC2qh4Uj1TnnRT25ZgK8rBtfRor/xe0jbHptTW3XpYKqvywXQJPh08M84FPw4tfk3
         /egVSvUdlTXoeeBm/wDHrLORQP7nFTYLyTXgS4ksck6wj3WEog1liBTMG9G6bhBH1T18
         WeAPlG5oEGIWshIK9caY+ZmmIE0dsOUbrplp7EiyObVtEk+gvabkRmKTjMK1V29Q4qoh
         6L24/Y+cY54+Q2l2Yfb0J0rkxbL+jlwSYODfWEcj1DYKlVOFRRrN7B3hZTPx+Vh6ujCm
         W6lA==
X-Forwarded-Encrypted: i=1; AJvYcCXI7zNLuf/XnK924mb/pGVQ5eKjNo+Lw5cdpZbsTvwc4od7gkyw4SVs7DqAN0QP4ax2AuPRlrJFLggh2w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzWhUCYxzU0PwjusUjLe0yiu97QbmOcHOJZQ3D+fc2rQixkWlQP
	PZiv03S+IsymGmsqNBzzbaZQl8DSMdhLmUemzUbXzeogzBa4y2E2Ucmw
X-Gm-Gg: ASbGncuRSGHvoCI4kkoTcbEBP68SbG8H7thp/o5n4r4b/AOBoV3d/8HeGo3a7kQc7Ue
	zqnykBq+bwKaMFAIRBykVFQJG8+pddLzYDDMF9XVNHpBfGufytdkSrB1lrassnqFS1wsri6cnQv
	TOFlbym1gRDzvm2brJQTe/KuqPDD+pALO1Me4TJlxdhXN7K/BbK+NRyIrwVswlTCFNME8mLsCtH
	T0CG7Op2aRlX233qB/FvVLMSoCNtmESaMBMcyf9yCxycEDcs/WeR+hrx8y7AQKEugeW6aU2x0ra
	o28eHbPwTHl/dcfJxD0qvDFxQu8ZaMMwhtFDtTLHR92+XFysteAfSJ2H7+1Z6I7l32KwywZCnry
	8mxz0qyvTB9jyh1BfIT307LuHyJjZ7RvP1yRhv1ynd7FnFMYqzrwltLHSoHa4iVtT20JJ0mcBS9
	fziGZNdCsoA3wE
X-Google-Smtp-Source: AGHT+IH4G3cPfsZSOD6swv+Nr/r1bSZCKg8w/Ox7KOwwd15eIqRctEk/RfdSNTo8Nh6NWlqwEHC1PQ==
X-Received: by 2002:a17:90b:4b0f:b0:32e:8c14:5cd2 with SMTP id 98e67ed59e1d1-33bcf8faac8mr1245917a91.28.1760647675393;
        Thu, 16 Oct 2025 13:47:55 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a22bb5b8fsm3746596a12.37.2025.10.16.13.47.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Oct 2025 13:47:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 16 Oct 2025 13:47:52 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ankan Biswas <spyjetfayed@gmail.com>
Cc: jdelvare@suse.com, corbet@lwn.net, skhan@linuxfoundation.org,
	khalid@kernel.org, david.hunter.linux@gmail.com,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] docs/hwmon: Fix broken links warnings in lm90.rst
Message-ID: <dff61b90-31fc-4c96-9bc7-0f8aa8404689@roeck-us.net>
References: <20251016103049.2573-1-spyjetfayed@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251016103049.2573-1-spyjetfayed@gmail.com>

On Thu, Oct 16, 2025 at 04:00:47PM +0530, Ankan Biswas wrote:
> This patch fixes warnings in Documentation/hwmon/lm90.rst reported when
> running 'make linkcheckdocs'.
> 
> On 2011-09-23 National Semiconductors became part of Texas Instruments
> and national.com is no longer accessible. The datasheet resources for
> the chips are now available at Texas Instruments website and have been
> updated for lm90.
> 
> In 2021, Maxim Integrated was acquired by Analog Devices and maxim-ic.com
> redirects to analog.com. The chip datasheets are now available at
> Analog Devices and have been updated accordingly.
> 
> Some additional broken or unavailable links have been replaced with
> equivalents hosted by DigiKey.
> 
> Signed-off-by: Ankan Biswas <spyjetfayed@gmail.com>

Applied.

Thanks,
Guenter
