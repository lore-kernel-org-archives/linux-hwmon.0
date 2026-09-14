Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAE293D413F
	for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 15:25:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789399528; cv=none; b=e65y1Dq4owwLoTq7fVhvENz+EXC1xIKcHJ+CTc8D45dfjit4eDAnLihk2cqYff2IFNMZGVFTXGPKhmLKMa8EvhrfoOfyIc1pTrBwxRKcJTKlLUYtHPfQIf0VmNGuvBltYISy9pUKqC5rB6O0qBCNHe6bpDko/9T65UfdUHqu14A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789399528; c=relaxed/simple;
	bh=JsitQ5yVI+ckuRgULmGEejyoQ0v5+5wEkvo1/eyVDEA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jIar3WUOcnt2NEzalYLaY4Dvfh+lZ1zMFd3XoROkN9tEnjR6t2axTCkwxuybc5KmMFHyirtVaJ5ij/uoWnz3OUw+AvQGL6HoZCMPFFYtjHIa7OirbmfWEqlIvCV59yQvxcVuMcQSfy95iNgn9Wst67NFZFKh2/q/kY+qBsss6ZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DjfML91l; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DjfML91l"
Received: by mail-pj2-f12.google.com with SMTP id d9443c01a7336-2d747f0135fso19474165ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 14 Sep 2026 08:25:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789399526; x=1790004326; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=0s36K6HWM9MRnuF5ojiV/2hv+/EMX34xY9X2Gy3IYkc=;
        b=DjfML91lu7QMpFp95iqueao6kc/0i6ioIFsfKFa61M11kl0qWLyMmu6tXcsyLt9iMc
         AhRa1zaU5Ua5m3NtX6TqJTWuVdWNe04pjqQ1QjyAx+5lxUKgt/s5tjXZTId6W3/s2cgS
         UtwpX5OQqIFEhiiMKd2g+x7h8uV476Wleu3RoxYkubZOXX1Ur6TNa04/oHsSrUkiA3mf
         A90Ux2j9ZejofE6wme3ULwOfd0teehROeksHG8aq0GiZTGd6JLt21ry596dKaXqRfR7Y
         1T9mar/l/xUktAwYr6b+cbV1JjD7zncX5U6NGl+QpBcGWCoo618Wlb+dLTblVDaPkJPk
         WEJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789399526; x=1790004326;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0s36K6HWM9MRnuF5ojiV/2hv+/EMX34xY9X2Gy3IYkc=;
        b=jMgdeiUwAgzRotPBFFmSeQ6bsLK6qpzzNvWfiddjbkmsnc3SiFs/FyoyrmH1it8WGY
         SHQ4cCk0YwMbK+Gnynld7VCt+WanMh+Az39G9m3lhoRFhjUvgB3740CGfIxyVqFTD9Qe
         sW+VX4IHR3X2UT0hH9K5gJH74ZGfc6B9dCHHDWpmapgBKwmgU8SEtWfDJPOsWk8jP5U4
         7OMUNrFRxQgNXGTpA/aslb+1hhpBvPD7mxQdGi4KvUh9NkL8KRxM4dEnyXUQ8Z36W1gQ
         lm1HRj+maUW0DhBiSb5OfCiTIDl4pkbFIRnDANctHk6VfjnXePcFbzqlZYJ0PjViyQnZ
         +GQA==
X-Forwarded-Encrypted: i=1; AKwUvBwaYGJPj9OyCAyfMtVKqOfmIaVJXLl3B96iKB4TIo14zGYSeinfgwOX76yjl9+W/juE5C0IsRo+FNn8bw==@vger.kernel.org
X-Gm-Message-State: AFuF++nXZ4y1yAdZ11UWC/nUsg+21neahkFy4dSeLb3RjaSc5ooWoDd8
	9UBK16xiIjip0iiMk+C+qo93MW69/0lI6OWBwXtXZDbdWkgXMRvUMBcz
X-Gm-Gg: AYBFou0P87joCyvRaOQ6iVzfBeUn6717wZSgYUAMIfTAU5ysKxPIu+YGkIuAWKstXWv
	1UPDbFUC3EVN/lEgnu/fUda68YRcolj9bi0VEzkfyJtikAo73UuBvsGy78VQOVeXekl1D21r8yx
	boUOPv3uJm5szvM5JRHTYcgiSx53NaPUejO4k7Gcrfku7b4yDRTQ7pYhViBD5wzvzu72lr8gcAE
	elYlAoACQ+99sWLNQHXNiDKVH2WSThVPBIG2fHJW5T/BpKt5s6Evi+RwuZHErXr2i9Czt6S/sGy
	Bli/e8LLoxYURkVZ3YXqNaKDX7p4BFY1aewxmCScvv96Yr85Qx28oI0zRdNU43V1tsnspVKpLmM
	/hsv3MpoagLAcWxAQqj8ghChwyTuokvjne8Ii7UdvDoFrZc4hxs+Cr/LdTU6HcGdAT2kqkVpi6m
	Kv/x6KTGY08/22QIISAS+S6w7OGLeMDdSX2m4M4PndpEXzMOqvTdnFNiwath0cXC2NwWhPrfEVg
	hchn43wPuC1
X-Received: by 2002:a17:902:f541:b0:2dd:1701:3b6e with SMTP id d9443c01a7336-2dd6c73381dmr58285075ad.16.1789399525652;
        Mon, 14 Sep 2026 08:25:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dd2ceb4024sm50932585ad.33.2026.09.14.08.25.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 14 Sep 2026 08:25:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 14 Sep 2026 08:25:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Cong Nguyen <congnt264@gmail.com>
Cc: Simon Guinot <sguinot@lacie.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (gpio-fan) return IRQ_HANDLED from the shared
 alarm IRQ handler
Message-ID: <53810ee8-8b5c-41ed-8644-ba23fd69bb81@roeck-us.net>
References: <20260914104136.1797979-1-congnt264@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260914104136.1797979-1-congnt264@gmail.com>

On Mon, Sep 14, 2026 at 05:41:36PM +0700, Cong Nguyen wrote:
> fan_alarm_irq_handler() always schedules alarm_work but returns IRQ_NONE,
> so the kernel treats every alarm interrupt as unhandled. On a shared
> line that risks the whole line being disabled as spurious.
> 
> v1 just fixed that, but it was still IRQF_SHARED, and always returning
> IRQ_HANDLED there defeats spurious-interrupt detection for the line --
> if the interrupt ever fires without a real event, nothing catches it,
> and a fault could spin the CPU in the handler.
> 
> Sashiko flagged this in v1, and Guenter confirmed: this interrupt must
> not be shared. So v2 drops IRQF_SHARED too.
> 
> Fixes: d6fe1360f42e ("hwmon: add generic GPIO fan driver")
> Reported-by: Sashiko AI review <sashiko-bot@kernel.org>
> Link: https://lore.kernel.org/r/20260901160931.DD3811F00A3D@smtp.kernel.org
> Assisted-by: Claude:claude-opus-4
> Signed-off-by: Cong Nguyen <congnt264@gmail.com>

Applied.

Thanks,
Guenter
