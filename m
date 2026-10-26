Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793047738;
	b=c+0L1FWFX7WrYJ+rZX43IEMZX9qVXwBke6V1o8YSMme/HUY0/H+awe+sQxQheTIaRpEp
	 jrPYuoK7KsEM+NMjboLw1i/Fq+Grf54tvdM/UcHb9xEVxVdweGuuzPaS+wyLz4MMTdWEj
	 oZPAMo/61AjA8iJGXVqi+dOBa5gtcddX7VDerpHsUJ39ZQyojkcviA6qI1KnESEnZrB4w
	 GFvmOHCK+yglZOmdo2G5Nq0eZT8AOBEvelfq8R6v1wwN3FsB7eTnRM6MB1oFOdkRM8CVF
	 oP0Np39FpD/mg8CkOOS281GWhrSq2d3n/iH5RUH+g7cXr6pp0rk2MdEA+3KqgEalBow==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793047738;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=VWSRb8yy2C8r4CEpyXfNyN5KcdBnAUygpb0eI5PXXg0=;
	b=RYgOFWcjM007B1WDkm7KOml561+5M+sWl8cKpkAuQzmijOz7BgSp/za6ABrNhbmd626M
	 6+GwmgUKmQYDJwZAaIV6K9Cev4I81t/Two/iWUY78WT4mHaj4JkXkKigPQgOS1qjowKq/
	 dRlQvqlngJopQqPLOysAvVu74o+IuRtMx9wSBCCKXuyTiqKvx5ITgmwfITqoO0yr0PlNs
	 r2p6fsFdlxksLDCIC+3P4lDb6iQlC+mMccU85QTBLvW2Ik60zhq3W0k8O67cGT1fS9zCC
	 o0WcsndqpQ3c9CI0V3iONPNRJF9BBFO/u32/4Xlnv5hsWrFFxsWR2d8hL9Ha6OywoDQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BbHojwCE;
	arc=none smtp.remote-ip=74.125.82.47
Received: from mail-dl1-f47.google.com (mail-dl1-f47.google.com [74.125.82.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C99FB606A31A
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 20:48:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C99FB606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BbHojwCE
Received: by mail-dl1-f47.google.com with SMTP id a92af1059eb24-1a2af4c8d00so1056171c88.0
        for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 13:48:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793047737; x=1793652537; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=VWSRb8yy2C8r4CEpyXfNyN5KcdBnAUygpb0eI5PXXg0=;
        b=BbHojwCEj3NMw4yL8Qh098Vwpg1TpYShXs8tFqPGTbveTn3VdbWpkkaj2IycjbIJ1v
         Lioq2o7voyp5xc2EAsMynXZ6s6mm82Vz98UJMUTsMfwdm6U9oVTK9SFXoHvKy4gnzdY8
         uOioZbAj6c9EvzZBh9GFTGk4CpseAysMG+l39AkqUgWbHrmAk7sGc7QJ8EMB030iBlbs
         o0gc36eqHukwSWYCQ6qLDbpIWurtGczA9n6RaDmywMIZMUbp3l+Tvr/FMQcow0kGZkzz
         QLGupQiaTfKDJvIJEu2Ffyd3zuoEcnA2Qy0+cJpBHDjQHmXHlgEqqSeet30XLCrfdbsf
         FjNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793047737; x=1793652537;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=VWSRb8yy2C8r4CEpyXfNyN5KcdBnAUygpb0eI5PXXg0=;
        b=PgaqryppUQtqKQEALwjDmrGe0F+2yJ7ho020y2VVH1N7nXySlMt7wbgY4wkyqITiQD
         Ast8Z4R0hO7ewOzJZDNDner4Tt3dujV/4aBG9Qz4ElnhAiTG5mD0mGo5+qm5cz1d6FnG
         kdBE0K2zaMgAdp7oo3eXJE8u8AbnOvrFox0moNKx92rzi5xv3n6rM1+1pGPHyuQzQCsK
         sehAilBaWpD+TKiIr0P2OJ8K0huVyGSm+0sv3J8C2512laZqr7m7nbLGruWhqRWN2YL1
         xy0mWNIdJ0nQ6l/S0Kw26QbHzT0xMBjA1u7qkYZEhER/DVJB36ldCx3woozloTgon6q5
         CSIA==
X-Forwarded-Encrypted: i=1; AKwUvBx8t5Jy42yyOHfZdgLpvGvD2gJb0DKBleGZyMwFc9Yu2pUNPb8UL0/9Cj+ZhaO3+H6rsNqL10fP7oDj6A==@vger.kernel.org
X-Gm-Message-State: AFq9FYLhLPWUFK81IwQhONF3wgk9W/MNaiD5AjTzAk5m4typwua5nXr6
	2JcH41aId2uDfOUogq19wIAMYJWYcNUClHYpqgDH4oXM7DLZfVUT+9JscYQ7hA==
X-Gm-Gg: AYBFou0ddDRmN4bvY6tbIHN6HHUtP8en7Af5qNdNr8x44VnDQdfn05Zfa+CFbbJRFVJ
	VoGJnROCvBvxu44cQTOTYT+xjO0ezPW2Ha83Q0TJuE5UyWXmQmUKNsF4lWFmnUd7YxdZyPFJUd2
	0QdjsxzvP60N+Im+b6J+W7mfAVXcFFvdUMi1ABzsyYIpZRRsrH2IeRkkP3FThscPs/JSug2VdJD
	F4zD6mYlHx8tqn0/PTJhaQw4MGtMfZGKpe2vdXfMwKd3Qcu9xI4yadsi1fe+Md6C1ZJAHkLgpfR
	PiqNZyGYbQC8ILfJsTGmP323y5CSgFQaqTbZtL+O6uG1ESdmjharNX/CZymae9ZANgJq9pNuml8
	Xi/I6V/VvrlhYt4A4tchLi7kZUP5l4Zoq9XizCHVxw7XKAauQ1EiZ7Rl/EE4wCj6sE2gIP5WF/S
	gCRIXIvVuOdKrhg5G/gtvtSxOOBkmmJgpG1a6hzYe5e/vbyNOkPQRwobFksPHRA3tjZEdJe37zA
	6Rew014spH8DZY/QxY5Vb/UO0xNVgD8x9VX5+ROuawFhv9OxBk3adfSoZGht6t+NFW/Pg==
X-Received: by 2002:a05:7022:b90a:b0:14d:baf5:c415 with SMTP id a92af1059eb24-1993499de9fmr11845388c88.7.1793047736520;
        Mon, 26 Oct 2026 13:48:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1989ff2eefbsm27592312c88.7.2026.10.26.13.48.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 26 Oct 2026 13:48:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 26 Oct 2026 13:48:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Vas Zayarskiy <contact@vasily.cc>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 3/5] hwmon: (aquacomputer_d5next) Validate incoming
 status reports
Message-ID: <6ad47f82-3074-4fd1-bc9f-e3db57171e6e@roeck-us.net>
References: <20260927191316.4137752-1-contact@vasily.cc>
 <20260927191316.4137752-4-contact@vasily.cc>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260927191316.4137752-4-contact@vasily.cc>

On Sun, Sep 27, 2026 at 10:13:14PM +0300, Vas Zayarskiy wrote:
> The raw-event callback runs before HID core pads a short report. Check
> that the report is an input report and that its length matches the HID
> report descriptor before decoding sensor fields. Otherwise a truncated
> report can be read past its received data, and a feature report with the
> same ID can be mistaken for sensor data.
> 
> Apply these checks to every device using the shared raw-event path and
> check the report ID byte before updating the cache. Legacy devices keep
> using their separate feature-report read path.
> 
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Applied.

Thanks,
Guenter
