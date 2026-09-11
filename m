Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 05FD933BBAF
	for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 14:50:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789138212; cv=none; b=t4Q+hKR4qoI2CUVvzLEzBFmSvUB8YroJ0liFW3oHs33PHsyCMbcdJy2iX0kSK52tsAeRbowO8+T9tCTCVdWeV2K66bbWf4kQba/EG8U5EeDYt86Bz4i20iDL/TE0Atu+wPkfQz1Xy2Ojqco0bucZJW1pyf9vvadRHraipgYWvec=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789138212; c=relaxed/simple;
	bh=MZZFH2RiZCO5VD1jdY4GuTbEQSKBZF1HexyL/oLxyuA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HNxgbtABHJt7LK0Gb+sGH3xM4+BNlbrtc8j7TB5G2YUG73bCxVpbZCQqx0PwcZMBcN6N43yTuRyyc7rUULFa5sCxi+dBA2XDdYtd2zngZaWXiu3jcRNvOyvJwLBg4mQ1WXJKUxroxGi0zs+i1l+ppckbICtY3n23N+qu6smHJO0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=beq4rqWj; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="beq4rqWj"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cace91f112so8380865ad.0
        for <linux-hwmon@vger.kernel.org>; Fri, 11 Sep 2026 07:50:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789138210; x=1789743010; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=uF9YgASjNxZc1az0Lm4LSS7mti+D9Zg05V8N/WBDhjw=;
        b=beq4rqWj3fxPPbO0K0gCHHnDTzTupcUalOIQVCjKVtb6Z9Sq3KXOoQMBgcD1pnLZal
         uf+NSsZ2E891njitL9+C8EOE2VB8WFMnSJOZ+8idE7x1qF8SfBns9FRzRHEX0GXU/sl6
         E/4QtK/gR7P2vbYNp3+zBUS9nfyhUDj+x/Pvr+UncDn4d2ED1BWqblOfuCVk/Uxc3/Ew
         hXInTKlzruH6oQ5MOObg5GuZrAdHh4vHViyjSJVXTpdF2MX4JRB+TWtgsIwkuaWq0RrC
         VlVxeW4vTBPWOk+ANk9MP948aJn3gJUOPIRrES2zKudQ1MFIb9XjiACSeKO1shaJYxx0
         uQXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789138210; x=1789743010;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=uF9YgASjNxZc1az0Lm4LSS7mti+D9Zg05V8N/WBDhjw=;
        b=TPOr+2T3L3KCThFd2SD3LGUFstAJqIA5c8gyEkNBIlMIrS/WAUpw9xZVUfzdH/TAlx
         uAKJ16+XvhUmh37Fe9fHRF9KYVfefQfz1gd39Q2ILAvdLYJcxcqt16rE76ERBe/HClNI
         f57WWaov1Qtb9dDeNQD7L1mfSyFM15WWpSvxVO1wXzvczJe2mgIJ149NWWcx5iWPQQOC
         gFGVcANLp/BYUJ+du5BEfk/2ecm91XSASM5h/u5XxOSNVEvCa/SHucyps/O18ozeKdra
         3p2j0Nkr2h4txLoLyCg3H6GkjIo7+1ydNGRl470SGOiGQeHcPnS6SWhj+LAQttWM+K7L
         s4og==
X-Forwarded-Encrypted: i=1; AKwUvBx7+e+7UWoceH3maQjt76Cjh7u7h7+pgyQKosV+1PA0KapJ9l1bVQqsaAUmm4xKP9yzQh8X0z5nW/T/GQ==@vger.kernel.org
X-Gm-Message-State: AFuF++k5lJ/iQdabhjiNHTWSDDkDGXfXKYwF7b8xqF8LBqSvxSYNMqjG
	LiBchANKIobU3HJHyZLpBd9mH621Qu/DIMb9yu+b7NyJtJqxQjzvinD2Ykn+iA==
X-Gm-Gg: AYBFou2xrRo3XDO+61KlvyDnoTUw17/OdjUNySV/Tzoyy6x7nnVMXZjkcNNPsIVpXNp
	MZykPs/dZEiom7RnDBnn+frv22HcitYFfCkK3o7jymckGWUtP5dPyvhMAcdrEgchN6/KoWiIl9n
	POFAKcT9VZ96o0IxVtenC0QBBAVqOuMcG4aUIL5d/3Rw4aIV0GBC5kABuJEjOIxsw1JYwTEY0Jg
	t0xJ9whweDxMXPtw+DYE3JGwykNyd1hMUFvM3oP+NW/8a4vrVcc9YbH1ePqcd8m0WNXh+e0U5j9
	5js+mxOWP4H6Mn35w2KELVu9i6/qf3plpLFg++lC7uh0nmu3B8xo29e7QRZN70SN+L2UObt0tHt
	r1q+4pTua+DFTcp3y0w0W9rr43rbKMRWO0aZBU/mlaLf3SDf1ukOwZ6vMoq65+SQoBs9r6SZM+N
	Ohl+kGjWaTggz27hw2tAemKRHGlzFRdXhum2AUuSD41IpBpSHNQK8+J3YG4hnRTUEvb3G1RidGu
	KKGrOpKG7RD
X-Received: by 2002:a17:902:e891:b0:2c0:a555:80d6 with SMTP id d9443c01a7336-2dd2a1c3a84mr80855195ad.2.1789138210144;
        Fri, 11 Sep 2026 07:50:10 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2cec8483sm12749235ad.44.2026.09.11.07.50.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2026 07:50:09 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Fri, 11 Sep 2026 07:50:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Yibo Tan <lhfff@tju.edu.cn>
Cc: Paul Barker <pbarker@konsulko.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1] hwmon: (pwm-fan) Stop RPM timer before freeing tach
 data
Message-ID: <6bd382f6-5e41-435e-8ebe-2f5598a393bb@roeck-us.net>
References: <20260911071809.130151-1-lhfff@tju.edu.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260911071809.130151-1-lhfff@tju.edu.cn>

On Fri, Sep 11, 2026 at 03:18:09PM +0800, Yibo Tan wrote:
> sample_timer() rearms the RPM timer and accesses the devm-managed
> ctx->tachs and ctx->pulses_per_revolution arrays. The cleanup action
> which stops the timer is registered before those arrays are allocated.
> 
> Since devres releases entries in reverse order, driver detach can free
> the arrays before pwm_fan_cleanup() shuts down the timer. A timer expiry
> in that window accesses the freed tach data.
> 
> With a KASAN kernel, a test-only kprobe delayed entry to
> pwm_fan_cleanup() while normal sysfs unbind ran. Each of three runs
> reported three four-byte reads and two four-byte writes in sample_timer()
> after its backing devm allocations had been freed. The helper did not
> invoke the timer callback, cleanup actions or free functions.
> 
> With the fix, three matching unbind runs completed without KASAN, BUG,
> WARNING, Oops or panic. Instrumentation confirmed that timer retirement
> completed before the first timer backing allocation was released.
> 
> Split timer retirement from the power cleanup and register its devres
> action after the timer backing data and IRQ actions are installed. This
> preserves the early power rollback action while ensuring the timer is
> retired before its backing data is released. Use timer_shutdown_sync()
> because the callback can rearm itself.
> 
> Fixes: 01695410d452 ("hwmon: (pwm-fan) Store tach data separately")
> Cc: stable@vger.kernel.org
> Assisted-by: Codex:GPT-5
> Signed-off-by: Yibo Tan <lhfff@tju.edu.cn>

Applied.

Thanks,
Guenter
