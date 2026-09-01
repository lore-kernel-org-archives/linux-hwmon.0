Received: from mail-pj1-f47.google.com (mail-pj1-f47.google.com [209.85.216.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 392D733AD8B
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 23:05:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788303902; cv=none; b=n/+OOPtgqPioO4fecyNccID0Tih6lOxN7bvG4+Nza5ypUQoaomePdI4ctfKaBVOJJNL+lhQsestxEuhufZlwVZ4BvR+G4SPzbFbYG5RPgFUgPQhbdO7kEJd47G9CFwnfJJ1gQwNc8Tm8BsZBTwUGti269HUqz57ywelMGX/wasg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788303902; c=relaxed/simple;
	bh=ZYAobeaBlJleat+5l5nceo/cdwNEYU0y8usfyhJ/c64=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BXOprUhoIAdPsf8y2wYwOOH8RTuxwO1+zCJr1U2+fLGJfJiw4G5NcaNXEtJBwwZRQtAk/zkwhy/gu8RV2QxnYQJnyG246ln2YkU9MsByLRHwz2iYrjb4VPYj/RxFl5WExxdG1p56Ke3Akg6PsKMd49Xn9O6YThk7fiQ2BHs9Sn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=X2Npax0P; arc=none smtp.client-ip=209.85.216.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="X2Npax0P"
Received: by mail-pj1-f47.google.com with SMTP id 98e67ed59e1d1-3964e480f76so532278a91.1
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Sep 2026 16:05:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788303901; x=1788908701; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=tmOCGEePW4HCHBy9intmcc0xfKUaVb9xCHFv+Cs6LwY=;
        b=X2Npax0PRoi6XRK0cQa1Y6yqGK8RELCUaefRYNR+zdJbMcvLPiRji7OvCburefm5iw
         /bfpH413LZzN4Y67ssW0N0epWupx9/pDWE1pTX3vDyrIZHQbM/TcKhL5+aka3eYhaRKI
         xw31JjC3sYpbSRMgH3CyqRHW/VLdRkFA/hzbQHB1jAGvExPTIji/md+qoi2ARTqo2Oei
         JTyYQKGYV/gJSyBQRFsJ8oMzwkAAmaNBtQM/hEAGl+86H+JsGrJzPuW8+DPWxFNic6wR
         tpu8NOzMUHf4rZt92XwI16X42b7lhx8FIhX3t9yWaEA91BgJ8nxxILWGj41+HDhNX4Tq
         GkWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788303901; x=1788908701;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tmOCGEePW4HCHBy9intmcc0xfKUaVb9xCHFv+Cs6LwY=;
        b=E0jB5qUoy97VC3rMoSXbauVkJjHX9fsbyqHojNhzKYPuL0bsfA5L1QZeGJbzXtNZot
         y8+4kGyhrKWpPy3NIDLH97xh0/jZ2xqgKXaCHb6CgNv1t6UDt1XsEuU86OlldypST6rI
         3vksh+7H2wHI1xEsh0gnpKCeAddQ3DbwToD5iBRNEhhjWx4YNJjN0sZ6/Vp8Xfp2qK0Q
         6nnOQBvgot+TX/hVPirkQ7xXkSqWav8eTkExWSO84E6+g2xVfxpX3gAFYpBV6a0ZMIwd
         sNaOsCpJR8DFakTSF9BBOwv3SnYY0vbe3P8XnRBjOqPYNggTdReI8tCAzRXCEdwN7fb0
         mNFQ==
X-Forwarded-Encrypted: i=1; AKwUvBzQQoBicHslcLp7QkVo0hKN1qSNNN4Z+CtVluf8Xk3wbkIH5kTJkHHkMjUdv921hvmutIHR82GlkSgbuQ==@vger.kernel.org
X-Gm-Message-State: AFuF++kkUCAsmaBURW3LXX0/s6Q7sG3J+pbMXDFa/cH3r39ePjBERVkC
	fJdwSfAvvV/ZeKkt/wmNAv1GRbcvQxbhPLs/rLkQFMh7VeTa3GAvRp9f2T2wdg==
X-Gm-Gg: AYBFou249AyOEG8xeM5C9kozk/45mFIf8u/Q+QRf1hE8Ly656A46Ta+zYoH6L8d88xp
	labpKwptDyVc6kIPT2d34+Bj88kD5DcpvCDraV82yEv6R2rtyprWb7J8pL1pCyXiLH9CiNjtOvi
	+Kiq9AWX8T8jtLIcfiJf1MRGZRNHQRKdl0e9h8RwRAyrNWIo3Wb1jNPDS7n9Y9E4XtnqvpSpNpm
	ikpNJcp+IAnOTg2SmUMz60YGLure3dTJleOFsuyk3rmgUmsxNPROcn7jRMzVFWNHjmq0QEUKg8r
	kRmsZQI7FyDdbdc5udqkxRmMuuXQrf8dnrxBVk3IZPmDX7vgxXetyBLLTEExdP9TWrAKbCvrR3A
	jqzxW7nWfYQW3EKNjsHCLzz7m5/ePK7EiliiBx63HIEzdjgc9OYORtMKknBw2zhPs5YwkqJPfoU
	2MHh7KusWWyrX0MwF965Wa4aYjdw9bhED4Q9Do0MBWsZM5ov/hZJvpGocTYnRlPcMlGDhCTw5NP
	A==
X-Received: by 2002:a17:90b:3d89:b0:36d:b424:4f17 with SMTP id 98e67ed59e1d1-39aedf89b82mr567737a91.1.1788303900563;
        Tue, 01 Sep 2026 16:05:00 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-32f07bdb15bsm1138117eec.26.2026.09.01.16.04.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Sep 2026 16:05:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 1 Sep 2026 16:04:59 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Pengpeng Hou <pengpeng@iscas.ac.cn>
Cc: Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Ryan Chen <ryan_chen@aspeedtech.com>,
	Billy Tsai <billy_tsai@aspeedtech.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-hwmon@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: aspeed-pwm-tacho: propagate reset deassert errors
Message-ID: <e3e4ba55-9b54-41a6-9130-52981f83f106@roeck-us.net>
References: <20260830125044.97718-1-pengpeng@iscas.ac.cn>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260830125044.97718-1-pengpeng@iscas.ac.cn>

On Sun, Aug 30, 2026 at 08:50:44PM +0800, Pengpeng Hou wrote:
> aspeed_pwm_tacho_probe() installs its reset cleanup action and configures
> the
> controller after an unchecked reset deassertion.
> 
> Stop probing when the reset controller rejects the transition, before the
> hwmon device becomes visible.
> 
> Fixes: 18c514cc0e02 ("hwmon: (aspeed-pwm-tacho) Deassert reset in probe")
> Signed-off-by: Pengpeng Hou <pengpeng@iscas.ac.cn>

Applied.

Thanks,
Guenter
