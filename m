Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E354725B09E
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 14:40:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784472017; cv=none; b=HudlKqu8gZYAbmoFpERbko2EZi4rE3Px/2pmIMYJLU5Pkbzlb/QGbkiqWNoavAMUjqQSaGqn1gy8YcEVnh/Jwj9td/n2kfWjmvQDnlYnH3WyDMFcNNlmmffEIEI1W6Jx4h2ztHmJFTRbJAhz8n0ba0lPP4Z/K9LxOsjiDAIL4YA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784472017; c=relaxed/simple;
	bh=o83V6SLRt8Fq7N3WbKtRn35VeS0QJ+5A3Nl59jwaIsQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R5qU+aTinTilL3PqVYb0ura7EUMstjSVhToSwIEJiAKOC337ElIxysr2LCYRAU2f7i6/DQlPD4TUmwgwngub4Eb5z1y31RcJLgXZXqmRaW41xl+rTucjdf2kBDcvPUPs6qo27KGe/E9f41A96BKh41a4M7b3Q/JPoc5ZKxngef0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BFcsoqjz; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BFcsoqjz"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-2cad4170e8eso124663615ad.3
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 07:40:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784472015; x=1785076815; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=yEiZC5cPRs6be8u/O3W+95SkWQ3GKtANtruKW/XJSGE=;
        b=BFcsoqjzuDGln/VtfytvDyM2HxsVHZJ9JCpgzzRntTT6KHtTfema9gy3bwqotIXdgF
         w2D2kXNVqyGec5D+bkOZI1HU5BJwPytDr+m+EUYz1YKFCIfG/LIBnpVcyPdMdBChuS7q
         oryl5pBoE5EzgU6xk7Ajj9yJU36aNozMNOMbugDDFwTTe6oXdalzAUZoAdqmcFES+uFR
         HFhMLWbeFFUC5ZsU4+fuBVDt+8rqdyX/E1HXLVjY1Mt+MGbL2EzugRsuuVTNNqb2AQ71
         ls+siHqCv81PE5Anvkl880eyoW3qU3zbObQn7Hv5VWAYwAwybjrVP2izAQyyTGyIa9ly
         OZEg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784472015; x=1785076815;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yEiZC5cPRs6be8u/O3W+95SkWQ3GKtANtruKW/XJSGE=;
        b=qiUyPVdEvd+2ddVr3u8QRfHWJfwTPLVw+WRVxRd5R8r4pm//KHyxQfdswlhFHoLMQp
         yyDjOjbodCx1JdDAlVD/DKkQ3siLzAidCj2ZZtbX1NqlGTuzE0BsZL3XCvQdhDQqlCCF
         i4vsmlAcJw8qSEWwS9LwCBDmtfjh9O3lvzZXNZiEPcSkKtKM7Q1zB07ZqlZTlMR65Kr8
         YQIhomhmC1Otc8yv1IwBxEU/NDR7BPG3wjn+3pVGg7jRbZLTrnjmvcJY4Hm2aK0FGta+
         p86ZriQgf+JfpYgLgxAFvHntA87Zn8aOVxTLZkWFy6ZkOsy9KtTTWSNoUQe6LdPqdIa4
         Humg==
X-Forwarded-Encrypted: i=1; AHgh+RojMJ+toVQ6FNfmQZo6Kwe4l/BBUYxBm2qEHHma6ujFIkTyjeLS8irxgaDceOnXXmmtjQ8beDOdILY5lw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4y+Tlxq6C00v1XSVzPJd9XzaekBEda+2XFGdM2axaLF/qBX5A
	zBYWzHGGxR348MUonsV8/9PYcabuGkcEhBHOVRxznAfLPWczKAtMs++HrD7oqQ==
X-Gm-Gg: AfdE7ckVEE2Sy8DVi57004L8rYYrkv2aGskz3RUr+kP4mYq+cV1FmG4Il8608FZxxdY
	vnv4YPKdNBeSTkCToEAJduJBTeSxnnGeGN12Ogv9FYvWZWU+4N/iUDyd5faHCgYgj+U8yQdmYVD
	l2PA1MW2JcSKTNxS5wZ2oOESjpfNhDyUg3wyZed2v+coUPKFt/oIRuxdwfFi+CUqt9eF/nqTgHr
	+OJcoOtRjLBvfIV2vPwIhAZ4DFYsa0xzpnL9wOvNadLfesA3NPxmYHoHue6PUOQYnVlaihMvtan
	A2PLc/xMM+H1RNM4yzYO7JlWgxo8vLWlYjX7s0hZeQGWljyLoY5IpN840j3lntv9bSbHX8YB2E8
	ZU6Z7fiJzKvhRE2uR35VINv4N5vVXMM15UJ1bXLV4qjedEXGMOi3et2n0M7vJVV+5kED/kNQvLJ
	sxKWHmESMyVsm3VFs=
X-Received: by 2002:a17:902:f708:b0:2cf:477f:57cc with SMTP id d9443c01a7336-2cf477f5cc6mr73332755ad.4.1784472015429;
        Sun, 19 Jul 2026 07:40:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf347119dfsm40940175ad.56.2026.07.19.07.40.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:40:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:40:13 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Shih-Yuan Lee <fourdollars@debian.org>
Cc: Henrik Rydberg <rydberg@bitmath.org>, Armin Wolf <W_Armin@gmx.de>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6 3/3] hwmon: (applesmc) Convert to
 hwmon_device_register_with_info
Message-ID: <8323060d-afeb-48fd-a0be-892fdef8a844@roeck-us.net>
References: <20260710123236.10508-1-fourdollars@debian.org>
 <20260711093323.14529-1-fourdollars@debian.org>
 <20260711093323.14529-4-fourdollars@debian.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260711093323.14529-4-fourdollars@debian.org>

On Sat, Jul 11, 2026 at 05:33:23PM +0800, Shih-Yuan Lee wrote:
> The legacy hwmon_device_register() function is deprecated and triggers
> warnings in dmesg. Convert the driver to the modern
> hwmon_device_register_with_info() API.
> 
> This conversion does the following:
> - Dynamically allocates standard HWMON temp, fan, and pwm channels.
> - Configures HWMON ops callbacks (.is_visible, .read, .read_string, .write).
> - Standardizes attribute naming to match the HWMON ABI:
>   - fanX_output -> fanX_target (HWMON_F_TARGET)
>   - fanX_manual -> pwmX_enable (HWMON_PWM_ENABLE)
> - Dynamically registers non-standard fanX_safe attributes under the HWMON
>   class directory via extra_groups.
> - Cleans up legacy sysfs nodes, groups, and unused show/store static functions
>   to avoid unused symbol compiler warnings.
> - Avoids recursive mutex deadlocks when writing to pwmX_enable by locklessly
>   resolving the entry and invoking the underlying raw SMC read/write calls.
> - Avoids UAF race condition on module exit by using unmanaged registration and
>   explicitly calling hwmon_device_unregister() as the first step of applesmc_exit(),
>   guaranteeing that HWMON nodes are destroyed before static structures are freed.
> 
> Signed-off-by: Shih-Yuan Lee <fourdollars@debian.org>

Applied.

Thanks,
Guenter
