Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BB2E375F8B
	for <linux-hwmon@vger.kernel.org>; Fri, 15 May 2026 05:57:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778824651; cv=none; b=k0lQw2gHc0hv4q7jja2W64caIwEEBDwajlakzZOtOpKfzyTE+D2In+OPVBb2VNfDy9rM9dynbGdloTU4dWvh4MAKAZC5tGOLl0YKQ6wdgCotbGe9szc9s/+QzUfUd5Rqlb4zJ2h6qAEtNmxcC0WhEA0jPu/owHUHEq3WVuztiVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778824651; c=relaxed/simple;
	bh=r5e6TuQ1NCV2vaU4CIicwlZU2+01k6MuDaFOpuT1ns0=;
	h=Content-Type:Date:Message-Id:From:To:Cc:Subject:Mime-Version:
	 References:In-Reply-To; b=nuoots/6fbgDdi60pl/p5Rojonk2GA4cezJpB/BUupb9ND2LmpzjfTm7hV6byMK66q+bA/F9jUUsDXgBKOvGxREgS3GnRnktQDCnidimTxzKvDHzPMbVHbzz77jD/+x1AVfUIKdTzJwCbVsYtbFTDSEjxlp8COQ3l2EKhvYgdek=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai; spf=pass smtp.mailfrom=nexthop.ai; dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b=N7L6vH9w; arc=none smtp.client-ip=74.125.82.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=nexthop.ai header.i=@nexthop.ai header.b="N7L6vH9w"
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-134fe980658so1196256c88.1
        for <linux-hwmon@vger.kernel.org>; Thu, 14 May 2026 22:57:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1778824646; x=1779429446; darn=vger.kernel.org;
        h=in-reply-to:references:content-transfer-encoding:mime-version
         :subject:cc:to:from:message-id:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=6Xo+YwL+Yb2QrR2P2Ltiyg4Gh1+azYLyGV72B7KNAe4=;
        b=N7L6vH9wRpZh+76s5sXMvlZpwKBk8XwMkoxpYIzDk8u9Y+txSnlQtmApEz2S7UKlVc
         3+WqClg8XsI4t67OOzNxNEY5b8TnAb5CFoCM5wJdxXol9wImdkhq4eihDVXoqUyTcvGw
         tllmw0z/NUBFgvSF/9/yZke2l6G9mKbKZc6xmXvRUkY1SWG/zrp8nDf43+2IAMcttVOh
         2VFCtlxytUzbs9Ti/ik/oz5aHAS3eJ59tf5uLUvqh/THCxlO4WpNrE08bjL3CHHeQEdD
         ZZuCDZu0NXHopezYetbJJkRzcTQK7Y9LqIuwgCes6qXA+Ow6U4/IEPV14sr2Uxr0ey2O
         gNsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778824646; x=1779429446;
        h=in-reply-to:references:content-transfer-encoding:mime-version
         :subject:cc:to:from:message-id:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=6Xo+YwL+Yb2QrR2P2Ltiyg4Gh1+azYLyGV72B7KNAe4=;
        b=HyU12jdbKDtjcMDfbRUOXl3JW0b39GegfVrPBoiVqfn5e4hhgYELrbZoAzniPs1mSz
         JWQJpfmKHxIMiRA9sTkzXUfi1fBkqJsWgY+d7SG+Yv9VtAJLfAuMxaWqELtj+UosBkUT
         nyvS3YMKoowqZOyaeGOBKLbHZsHmlqdF/BLraQDYTEe4qA3TRPeVw7N8e7BZRmEtEwMO
         DyYtSGm1aszyZ6a80p2qBytfI7vOpV93zrlpWNgOC+T693cV6o/Ulcgq9AquFs3YHrI1
         Hekm74Hvmew69KqvPMJBFsMWMylcol2lAo6OYU09utvVWj6lC0R/zXFNPeXWCQSoIZT/
         icHw==
X-Forwarded-Encrypted: i=1; AFNElJ96MPkMLnXfKh2qRaF8UmChIEAiLEFGmh1RZRnXkZ+KbaFqtq8Ysfh5xqpZpFOKrJeV2BriTkf6/FiC5Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YxpS2tYRPmDW9Ulxcr7Z1X7ToZBwDIqHQHWU+Fzz+AOOScAm5RL
	M1ulpAMTN8BkmacmRiDgu8l4DZXrycZdsBfGJeANPiBl7mY3Xr8RfaWsAIYSloa5Dro=
X-Gm-Gg: Acq92OFcyu6sF4K9C6crHkg1sVb1NqL9AW5omiXnGeGQKaUb7O1J42TCCor7iY1PUx6
	yPFoFzbIhV5KTfLPayni4dI4iurGNsqhsVhR1sgUv14DqvFvBnrZorNUTDWOdsXCpC89ZVQIM1G
	16BQpTW6XUtTKN9ddOMl7TU33Hip/0Di/i5W6fILOp7TMqYkpOmrrbuBcF9NDxpSdMvWgmmTAvL
	IOEPN2Z9Jbbhz9UTs6FvhURhGLhkqXphnAuxCHzNTUc7+ynThQ6FJ2/VhcQVfy8q1LJdUZdZgTy
	lZ1mMPbfJXKnPM0NtlrX8F6eB7LEGzy+zkAN5Jbl1QSxOPqzvGMU/F0DlDdZ4jZJqrLhChdHBSa
	/ISFjYQxpOnCkWl37OOL/bmQKf4WVmUiwT/n/TjxvnsdamL3orHpPKuIRmDwgX1+VETPZQJM1Q6
	ZV0BSFEUQoEL/PJZOrJIVaX6Y=
X-Received: by 2002:a05:7022:6294:b0:12b:ee92:a60e with SMTP id a92af1059eb24-13504c54a3fmr989575c88.8.1778824646418;
        Thu, 14 May 2026 22:57:26 -0700 (PDT)
Received: from localhost ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-134cb5b3c20sm8310172c88.0.2026.05.14.22.57.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 14 May 2026 22:57:25 -0700 (PDT)
Content-Type: text/plain; charset=UTF-8
Date: Thu, 14 May 2026 22:57:24 -0700
Message-Id: <DIJ0PKKGIBSW.36AIGOA7ZDF5W@nexthop.ai>
From: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
To: "Guenter Roeck" <linux@roeck-us.net>, "Abdurrahman Hussain"
 <abdurrahman@nexthop.ai>
Cc: "Alexandru Tachici" <alexandru.tachici@analog.com>,
 <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>, "Guenter
 Roeck" <groeck7@gmail.com>
Subject: Re: [PATCH v3 1/5] hwmon: (pmbus/adm1266) add firmware_revision
 debugfs entry
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
X-Mailer: aerc 0.21.0
References: <20260512-adm1266-v3-0-a81a479b0bb0@nexthop.ai>
 <20260512-adm1266-v3-1-a81a479b0bb0@nexthop.ai>
 <c88265fe-deaf-48e5-9caa-e70f0677e7f9@roeck-us.net>
 <DIIXOTP9ML0G.RVVC1XIP3IF8@nexthop.ai>
 <53fa7ca2-a2d1-44a9-8d15-48ecae68d3c9@roeck-us.net>
In-Reply-To: <53fa7ca2-a2d1-44a9-8d15-48ecae68d3c9@roeck-us.net>

On Thu May 14, 2026 at 9:48 PM PDT, Guenter Roeck wrote:
> My understanding is that there is no in-kernel API to inform drivers
> about a rtc update. No other driver seems to need this.
> I see a number of options:
>
> 1) Use ktime_get_real_seconds() in probe, just like every other Linux
>    driver using the real time clock does without problems.
> 2) schedule a timer which updates the clock every hour ? day ?
> 3) Attach a sysfs attribute to the i2c device to trigger a time sync.
>
> 2) and 3) are a bit excessive, so you'll need to provide a specific
> use case. "Because the datasheet says so" is not a use case.
>

Going with option 1.  The current ktime_get_seconds() seed is
CLOCK_MONOTONIC, so this is a bug fix in disguise -- I'll land the
ktime_get_real_seconds() switch in the pre-existing fix series with
a Fixes: tag.

Thanks,
Abdurrahman
