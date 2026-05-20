Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A276B2701C4
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 13:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779284357; cv=none; b=muoJGQkD1dUm4/485qVXgQhjCNZgFBg5/ELVBGadDyKj5A3k/Eu1XjLpexaKR79kRHOMq8y8WrGAZ6jse+nkXYHhHATQrJLNwfwIl+aH4Y0DLgJOBx//aclbHmlNNGqrJ2BjtB16OLCJTwj69Nyv9quyN8boT9NQFCk38VPK58A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779284357; c=relaxed/simple;
	bh=oaFdq8z1elXJ2kvvKaYfJ7RYMi53L4i1xZbiNUaix60=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mZ3sgxecRwSbJkUcTqgOYg00a6URfYIV+16qMROdiFy7POx34Pkpd5368Vwl18CGcd2O2sKpNJTvqmkMU5dv8KebEzpZ3ucvFMRe7HFvt2EwvkkdDoGEAvpinxspa6zmO/t4xE/XXtDU/xIOnnPOd0vNMnsZgYIoND8wNvAIB9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LcA1+J23; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LcA1+J23"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-303f2fb7225so3040360eec.1
        for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 06:39:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779284356; x=1779889156; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XydIKcKEN1f8CDYCbBpZkqLXM7ghEeBzqIONwAcRzBw=;
        b=LcA1+J23VlhZIvCQK/z/UPJhLlLioKWNlYnB0G8F/sOzOvAE5gZyNeQrPHBQEDJGbN
         Kd5DaUcfnVSUvehSXP+qWmfLz2C0Krom4oFIzxJGXDeIpp0PRM8PwZ6Ym/wFwQBzycYd
         Pbwt1RXpGNj95YSbr8jh93T8KLDhfdhsU91HGiRmQY6oIR89y7clxLKm/Y1v1HmjUyhj
         QA7yw5FUW5kVVc4+zlRYX4ZQDHf+nVkJfnVO0Zlf/T9InwoGGl+4RX9t4BKZqRkDyGH4
         /8JyDbXPXWAosHeUANAx6xvzrKYN8RLDOhqpymdciQZjCOmwepfYkI+ra+yxlAirvM3Q
         tPEw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779284356; x=1779889156;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=XydIKcKEN1f8CDYCbBpZkqLXM7ghEeBzqIONwAcRzBw=;
        b=IKPc91PsarvC+Ine8nXQF9XhJiwKxGmPpGkLHlIBMA64AqhZJKmQrivJ55zrr7RNkm
         zi2zwwhmS10JFaDjFEi8O8wwwZDzTEvufHNP1jkpt15LsTJ0s41FoPHtGcIYCpBYVHD/
         pEkcElKpFIt2irRBZw67C58BhySpfiEKF3cWyTFjixMrW4fWxj+vqfW7yizNUFKTSX7Y
         WuOyjTWrDjwjM7J233Ij/nzx1hKpDdW2Re0/dj47/w7BR46n6wY/or79HsoxEvZCnQ5s
         8k9+TjhtOVmhMkb+hLk3EeVZYyIyZYj9RT5+oHjNK+wBAPHM8nZmcYZ8qAEsIBu8MVqv
         pxSw==
X-Forwarded-Encrypted: i=1; AFNElJ9HHLxXA0BlTdewa7mqx50B+lio+e94w7w6T1DBZObewo9D8wSVryiiQhsyRJo97bHBhor1kW1KI/18MQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yzbn+4Ttt8reLv/QopSHipjZ2J804OI+tZu9zOGcnfVzmGYhtmV
	Ut1BnG414/7DoX/2suK5UNgJiG8Gx8qDi4kpIY3AZp97PPE+Q29C7x/q
X-Gm-Gg: Acq92OGU2xlbclMVcwJwzwlsETvbmm6X2d3T2RI9INoJg2w8TJaY3Ax6w0B7Ub9mW+w
	jhR2vhpCYzc6BiCDzabWnA3Eswm1GF6D6Im1n2Wsczg0K++u+jQMPuxtefgnX9hxZpVvfz6tzl5
	C4g/b9HMUkbfn7+iKiRavUrqi6c+DZYUBh+P24Jk3xYwIeSx4OunVVWM5nUV3EG7SICV4H2/JFC
	m2k3GtjzCmP8llGf429dQe+7jzOKcDThGXEpYOB+9a5PrD/7OYdrFH9YHUzxJ+k5WcJjDxtGTJr
	HTOX2fmdrBi/AQ9ndGRrXL+2htI0bjeU+HP1cqgaEh/Z71vFAnLsYRzUNLgSPNtdF7Kg15/om6N
	1xJ6cNYVm50y1FZHZ7VCGxXipej5l2ZiJ+slmIHSm1tyhHHEWb0eBuB1abklcPZ2ai06Og4B2V1
	9un5SIU8w2afSVeXNRyWjdx5wiSe6gZ3pSYhWL
X-Received: by 2002:a05:7300:a907:b0:2c5:220c:5670 with SMTP id 5a478bee46e88-3039818eec3mr9988056eec.2.1779284355819;
        Wed, 20 May 2026 06:39:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-302978ad18asm18456851eec.26.2026.05.20.06.39.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 May 2026 06:39:15 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 20 May 2026 06:39:14 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Shubham Chakraborty <chakrabortyshubham66@gmail.com>
Cc: Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>,
	Ray Jui <rjui@broadcom.com>, Scott Branden <sbranden@broadcom.com>,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 3/3] hwmon: raspberrypi: Fix delayed-work teardown race
Message-ID: <f1b970b8-1785-4f96-ac79-d3bb79c53101@roeck-us.net>
References: <20260516164407.25255-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-1-chakrabortyshubham66@gmail.com>
 <20260517080445.103962-4-chakrabortyshubham66@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260517080445.103962-4-chakrabortyshubham66@gmail.com>

On Sun, May 17, 2026 at 01:34:45PM +0530, Shubham Chakraborty wrote:
> The delayed polling work rearms itself from the work function, so use
> explicit delayed-work setup and cleanup instead of
> devm_delayed_work_autocancel().
> 
> Initialize the delayed work with INIT_DELAYED_WORK() and register a
> devres cleanup action that calls disable_delayed_work_sync() during
> teardown.
> 
> This addresses the concern raised during review about the polling work
> being able to requeue itself while the driver is being removed.
> 
> Signed-off-by: Shubham Chakraborty <chakrabortyshubham66@gmail.com>

Applied.

Thanks,
Guenter
