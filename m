Received: from mail-dy1-f176.google.com (mail-dy1-f176.google.com [74.125.82.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65AA53F5BFA
	for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 23:04:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781651055; cv=none; b=uD0tGDJkavFITYcbCvspstc3UhBu4vQxVtPLlvhUdQRD1721S/f/ms+zh2FrZBho1ZRvHbqKLQqXji8Lg59IHT4Dmzi3esHAHn37nHRk+zzdo74ydVHg8cbT8oRxFUZQPjC6Ga1Yx9F7SUC9yCCT7lTdPCKtVkYMXYnql4YklUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781651055; c=relaxed/simple;
	bh=Egf1TNJVCp1qsA4CxNzOFFLZCIMtWTzZtOkuoF7vf1U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=gdTWcM0xf4fAO+STcBgA+Ub/vwaChByABggP2K0inzlFZPVQmr4viJa7+0BpQR8LTn06eYX1gGwu/T9HZ3QRIE3FI2RJlMZZXY1DfwKdKeBXQC4MXX8coXZDTo52LdB20b8cX4T7IVv7aIRTUZ4wAmXLq2jVzOKoJf5UZthCWOk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=qo0yhz5J; arc=none smtp.client-ip=74.125.82.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="qo0yhz5J"
Received: by mail-dy1-f176.google.com with SMTP id 5a478bee46e88-30bcf74e617so358607eec.1
        for <linux-hwmon@vger.kernel.org>; Tue, 16 Jun 2026 16:04:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781651049; x=1782255849; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=q6ZAICOGGMkSvj3UFmPFyaMXy3D0XGzchb585QqUnoU=;
        b=qo0yhz5JyRXpsjVk6USehdcj8rDinC9JO+GRZAz+lkBcfs2MDQHWGkAMCOAaNJVp5v
         pcXaTKsiOfNhmR66nmVcZ+QvgQHta4malXHUDbzmmR3nlgotv3x0Zvo3tPM4B5O3QblP
         TVCs7h8KIkjafRtIWuAdZLgKxcPhrDuE/6WSdgmNbHV/qEbDLGUanXM/aFINHIXnJeeP
         QnDwQpVbOYE8gMctNsE1wGNmvh1Hr6YzRY2udYigu/a1gVhtWr9v8//R0szjoL2veD1J
         61gzXEjY/OGBNAMvSNw+2z9g0yC8Q6wXi2w7uK6xZYtpn+CKvS/fN+z5B+OFU8aDLngz
         r7eQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781651049; x=1782255849;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=q6ZAICOGGMkSvj3UFmPFyaMXy3D0XGzchb585QqUnoU=;
        b=AxBIZ0xWWEgWgHL6L+z3gqphtAM4sHpkiarFV1d/G7SMyuEIjo4QtFHPxlLNXHTxlc
         h5uYORzcBdEzFkRax9WfswINsP4uDP5H0LayW8BZx1nxa34Tz04l+DkxQIiDrs+sCeKm
         a/ImN8d334/C4Zryaax7mLIG1h7JxFps0495JkArX8w+hGm4+PCt41gsXubEFZK3rb/1
         q3NT4wXsGC+iLQBmbiSvWIvaMkbenirjfwRf2EX8hriNiQ5eus6a1y6vJEWji+rFeqFm
         Tqa1nBNkRm/46Zx9AcTqKHpB2JhmaTUtZptMBNmEnKRKs0xiKggE8KQzStckSJkycmxO
         u0Pg==
X-Gm-Message-State: AOJu0YyW7Q0yDT2CsTm8st7Xy5eHMGAzQI1Q5msYLC3yoK5Xhh5Z2Yn6
	fMpB4tINeO9V671hN6Gok/cvSLLjXJ/0UKh/LobgatcuJw5xIBo65ziN
X-Gm-Gg: AfdE7ckuIMQO+D7TWZPNcHSB7+PnkywX6TY+qo4Lao4eIJqVjPQ860ATsbSWFyGZR6i
	4wU95Ek158pM5yM3BDshEi10exPVZXEdjMDvOGBDTxSeTMqUW10VyAQLa2rpjlZxWIwf9x+qzyf
	/mOrGKCwWJOTvb1i7RLsIg4rSkqmmj4KwhJCbOtJof2oCWEJL/Q7SRt2Ib+70lguBYgVCa688c2
	rep+A3BE/Opx+Yh0xRumzj2fFsKnxV8mDFS4e5ooF6OabQY+yU++fSDQpkmY21rhwfpTqsrF3tj
	C9mFnq/ZmQXAwRiypyKplqPzHu0MnaQuPRW0yfZLd05zx1U56OkfQAhcwePirq6gs0s9xwtjXLZ
	SrSzidi0xRZ+Pprs6/EuTo+Tp5dE2n+gtkDpvoZQXYpuW09oPIUIzCH5PmFOK8nQBrnSrj3iD3e
	BHgVRi60Y/21UnoCxddw3kgt3GBl5HzjoO9PMd
X-Received: by 2002:a05:7300:cb82:b0:30a:e531:31f9 with SMTP id 5a478bee46e88-30bc9ef94c0mr871993eec.10.1781651049201;
        Tue, 16 Jun 2026 16:04:09 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30b6191bf9asm15037538eec.31.2026.06.16.16.04.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 16:04:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 16 Jun 2026 16:04:08 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ximing Zhang <xzhangjr@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (coretemp) Clarify attr_size comment
Message-ID: <4e831941-8df1-4b45-a612-33457e569fe8@roeck-us.net>
References: <20260616125631.35537-1-xzhangjr@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260616125631.35537-1-xzhangjr@gmail.com>

On Tue, Jun 16, 2026 at 04:56:31PM +0400, Ximing Zhang wrote:
> The attr_size field stores the number of sysfs attributes created for a
> temperature data group. Clarify the comment to describe the field directly.
> 
> No functional change intended.
> 
> Signed-off-by: Ximing Zhang <xzhangjr@gmail.com>

Applied to hwmon-next.

Thanks,
Guenter
