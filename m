Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.176
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792521348;
	b=3s+lruD4CYkpzeGdiV8LYjmIFz1bghDjhbEeBt68v3zwx85hSkmzlYtNtDA2ZvQyUqe+
	 y2kf1K2nM53ALeB6JGxCothtrQ2BLiTR/baqzNwwoycqZBsaiQYPIeB8fv6Nd/jq8T9XB
	 QHgXplUL0WSwgVRXh/HwRm6prg+46pmr91rtMuks5UCIrrnn8gJhodVMqQ+bYpaZQeFpo
	 qBfVqL84TpA2Bz8rkNY3RtSUJEa9CvDWQj8Z9D0eoBJv2cQIkARIWyD9gfyazILGKFMq9
	 0m3T/ApAOBN4Sd5BfR2c6ZmZT6PKPDED8MMIHo3ZV7DaQZDQmnfKjDCtHt8wqvVfl7Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792521348;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=DGOTzV020qB20GCiRn0PGx2SM2yjPltO8CpsAfbbpWg=;
	b=3cpCM1DtwJWSvnJrVlIfaz1WSDw2KJ3vWqpwiLeD2StWB2FL47ayewzTre1HMBU3cgwG
	 Y642tPyJ9vGNcoMxdw8PEZXgd6cV9JWK8f+Ir5zIhkly+pUB71faFg0581GqTlvCM6Ren
	 D7s8leEtmWQcDXsF61oCrmvK19iBXka50JgobzP7CT9CByQRa+4RAP1UlA4sTvnB1CBoR
	 mjzJ7PiM4cLwUqblP03NXAGSuBgReIzCYj31NYn5294lT4dNALuAOBiQrjWFQwnG0I8zq
	 e281919nWlh5eT/hM0HH4l4dcHLRDZFfXsXz/Q1vIwkxAL0AwU1YnacVyIGoAwunQcg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JhnTFu1T;
	arc=none smtp.remote-ip=209.85.215.176
Received: from mail-pg1-f176.google.com (mail-pg1-f176.google.com [209.85.215.176])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31857606A319
	for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 18:35:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 31857606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=JhnTFu1T
Received: by mail-pg1-f176.google.com with SMTP id 41be03b00d2f7-cd6a7b62ce8so61597a12.0
        for <linux-hwmon@vger.kernel.org>; Tue, 20 Oct 2026 11:35:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792521347; x=1793126147; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DGOTzV020qB20GCiRn0PGx2SM2yjPltO8CpsAfbbpWg=;
        b=JhnTFu1TeDRkBXHoYIsw9ulmTkE+fbuH5mj2ByzKgPZZuwEJN/jXbxBSpvJTzytQyF
         HdVubb57dUKpj51ldO1W4slgCsC/UjO7nkFqzX7NCwhaF/vzPf7wQP8LwesnNKLE9O2B
         gE/Uh08g/4Pt9DLWR10xxJZW2GPqqBpzoNzVd3FXxiueKf1P7/aa1mjRxpQPrwBxo/p7
         LA9ZLMwfNmJ4gCPpffcEquJPNQlMCkCVl+xWOIfCjPo34d1kcx0JYgTJTsHeVuYkuH6X
         hgmJuWiCL0KuCCYWmidVlE/CtxJBjVOLNcvvP63BpUmavIYF8hOxXpSq4Gewl6lS65l4
         6IqA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792521347; x=1793126147;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DGOTzV020qB20GCiRn0PGx2SM2yjPltO8CpsAfbbpWg=;
        b=X/MHTKeWb6cKEoJfCVhJIodV5sAMRbXQX1oyLPywt30qWOmpt1UlLofuKAuwCuQGgl
         bBp9fZmV6liXK+twbeFcNyiTMcwddLc1VHdibk1t1yGpQvXQGynSKk7aj4poA4A+YFL4
         9Ed4Kg7nK7VzGqz+wD/FS1eTA0X/pTWg6EbSV5dmBb6TmIDfCILocjoyRmCG1Yl0M5sv
         UgTLPzIxO3H2wY+dIcZ9fdFSPsrss583lcDQXkzgBCo3Nn/AkI5P4UZJYVIvQRfFBNIG
         mb94Z6FuA/7tqpobAw1jX2eJNm9b3MCNSIfADGm5b5Fg2Isq+t8kwE7hHZHp9LnYuzrC
         VJ6A==
X-Gm-Message-State: AFq9FYLVgLTna4bWPxu36s8ieYNuXf0S561vWF/8K0v0BvFJbmg+JUIA
	3ugZ7rsfGiDbmMbWoC/bYiaYNXuCfERtLASbUnpFgfdrLjvzs1Vr1cIF
X-Gm-Gg: AYBFou0n8Rgk0evnGXL1EwQ7bhnh3A4r+xoQ56fgf6vOBBo7iKhqBo4BZ4s5qNS6Yhm
	MQ40TTiuA4GqWWdeHxuWp8P4fBYpW6Qtzn0Iu212yMAFZrOxPzBQ3IXS3wQKkB/rib5qe+J/puK
	4XYE25yD9sBE+PKosEfJaFDILtFylm4FgzGZlEt6ICTnwmjZDJqMUN7VqEjWSJTvO6QwUO4+Awr
	vXW+JwSaphWaV1V19y+zDhdot54LQQACMZk9ReXeE3G8FwEiGrg8asSThKcfH6s57bBdGd0PvaD
	FtKVLAjIlAN4QCFApJjvyRVa1bdmPgz0g+kOEk0L+686THCRsHR+Vs6odgQGO3Vuh7IyIkUUayT
	CIuFs6g70CehWcj42ISqlfaqDy7FTeE1YxvQQ8croybf91ZjQq/5EHp/X3fDEfw3ATI7u+WSuGt
	zdEuYlbKrJJ80uy5kYr2BkzBSi8zHQ7xvhovWjp+dU+xnBwxD96A078Z9HX93WibNGZd0w39BcY
	cFePL/orcHk1E1gJecLxEs=
X-Received: by 2002:a17:90b:2d06:b0:3ac:d19e:85f1 with SMTP id 98e67ed59e1d1-3acef1792f7mr8928974a91.53.1792521347516;
        Tue, 20 Oct 2026 11:35:47 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad8035a117sm701396a91.16.2026.10.20.11.35.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 11:35:46 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 20 Oct 2026 11:35:45 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: xzhangjr@gmail.com
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (coretemp) Retry failed sensor creation
Message-ID: <42ee0ffb-c0f0-4426-a568-28be267e4a93@roeck-us.net>
References: <20261020-coretemp-retry-sensor-creation-v1-1-7dd4851a34dc@gmail.com>
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
In-Reply-To: <20261020-coretemp-retry-sensor-creation-v1-1-7dd4851a34dc@gmail.com>

On Tue, Oct 20, 2026 at 09:39:35PM +0400, Ximing Zhang via B4 Relay wrote:
> From: Ximing Zhang <xzhangjr@gmail.com>
> 
> coretemp_add_core() only logs create_core_data() failures, but
> coretemp_cpu_online() still records the CPU in pdata->cpumask. When an
> SMT sibling is processed later, the mask makes the driver skip sensor
> creation. The core interface then remains absent until all siblings are
> cycled or the module is reloaded.
> 
> Package sensor creation is similarly attempted only when the hwmon
> device is first registered. A failure leaves the package interface
> absent for the lifetime of that device.
> 
> Retry missing package and core sensors whenever an eligible CPU comes
> online. Determine whether a core sensor exists from its temperature data
> instead of the CPU mask, which continues to track CPUs available for MSR
> reads and hotplug retargeting.
> 
> A package retry might fail after per-core data exists. Keep the core_data
> array alive until the hwmon device is unregistered so failure cleanup
> cannot discard live per-core pointers. Publish nr_cores only after that
> array is allocated successfully, and rate-limit errors because a
> permanent failure can now be retried.
> 
> Tested on an Intel Core i7-10510U running 7.2.5-1-cachyos. With
> test-only fault injection, two package creation failures and one Core 0
> creation failure left the unpatched driver without both interfaces. The
> patched driver retried and exposed all five readable sensors. SMT sibling
> hotplug and 20 module unload/load cycles also retained the expected
> sensors.
> 
> Signed-off-by: Ximing Zhang <xzhangjr@gmail.com>
> ---
> coretemp currently treats a failed package or per-core sensor creation as
> permanent for the lifetime of the hwmon device. This change retries missing
> sensors as eligible CPUs come online while keeping the CPU mask available for
> MSR targeting and hotplug handling.
> 
> Tested on an Intel Core i7-10510U running 7.2.5-1-cachyos. Test-only fault
> injection reproduced missing package and Core 0 interfaces with the current

Is that a theoretic or a real problem ? "Test-only fault injection" very
much suggests that it is a theoretic problem. Have you observed it on
a real system (without artificial fault injection) ?

Thanks,
Guenter
