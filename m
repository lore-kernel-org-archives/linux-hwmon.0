Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17615244667
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Apr 2026 14:25:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776003937; cv=none; b=Gb7Rmv87vmXRN92oOBK0hndQTDC3So5eF5HvN+mXIRB6gOO+iFsDFha6HKzYcqbv6tC5kgMh3RbCbujB4ktmAv9Xgvahb7AFmHqdV/xKqiw1dygSXhMWy8m9rTgGhfLe4gxuOM8DttnxJIpnsEpAiy8VwMFMsk+Aqwz1INrNn+4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776003937; c=relaxed/simple;
	bh=VVOC4s3iXK2PZz2ie4uah1Tby+qhawXzz3OeBhh68lM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qNBB/QuWUPd7JsGgZno4zg7Lew842eyqjzQYtClDBKPLKmKOlddARjWEfkz0Ye96paQr146gN6bhSZo9GeF5kPT1tX/t9GI+rAu2iHTk+pOnlhfo4mO3Y36msWFdJE9SnRMUMRs09hFzV3NW1airOiG3AWXyCarfsins2uLALeI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mYQDKcj/; arc=none smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mYQDKcj/"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1271257ae53so10941621c88.1
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Apr 2026 07:25:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776003935; x=1776608735; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=M30xANEd1ygJtod+3qHO0f8EgzfcgPO7IE86jmDM8co=;
        b=mYQDKcj/J7p6alVm4WoQdQH44A1GyVjfkCjkCpzqUZCawHKRfekA7UJvuPWlAOeLJc
         KAlLbYwtNH+U/Lzvy+l1eYgOay4SxSdtZ3iiAn1qiVQv0Xshql9ka2r0hjlX3gQkYP9x
         ct9KGzIOtCvwTR6giQqGC277eHNqf3UfyeH3ls8B63IwnSRrv82bZgZjAIhkBF6TBHEI
         L2k2bESdeWJSNACi3C5jpCUinrBEZW6VEHmgn5DAS6QWOqV+H4ach8yjE4XoLSDtHROF
         xafMWOEpuXapzryx0v4EROOkpLpcqjdfQq62LOZvmEqVFxSH0/c0vg1s7CnybywlL271
         jjjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776003935; x=1776608735;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=M30xANEd1ygJtod+3qHO0f8EgzfcgPO7IE86jmDM8co=;
        b=X1mQw+Gazuj6AMbQqdJ/sYYPsaAXdM6/7UzNBs+MQzCY3eBH+V1mXUIwwRI9FcRN4x
         GIvorTqONyaKncQgVZg/8J5VhJdrNS6WYa7tIeWgjlI1fI1WxGY+QfelEYgkY3AsUAK6
         DewrZhaTgt2A0m4N6OKKezMXOMLdD62/Yb7MTRHJ71W0Ck686kTUxIMpMathiY0qCbD7
         2yPDNK/hZJ+8I/NSTLPWV6tzyWxMmOG70WFvQGX36LNbZ1xI5IbmfabfMofekCXd79DJ
         6mwIjQq37iR084k3vyYBciBeLiQkH3eSflhABQx9AuvUWRO26par5DotgCNDsE2CeU0Q
         G/tg==
X-Gm-Message-State: AOJu0Yy5nYt88vFqNpruHGXmTfWvRm4l/B/FVVsnZNdpR/DQ8oMoweg8
	w8ySjW3MfgZhR5pMilMa+M7RFeUUzYkCxsMtQDPm0hNe4E7+ewKrlICI
X-Gm-Gg: AeBDietH8LM0SLFN/vB+hPNRB4aYgRicxC2Am7vOEP/k5ug1qz4JMr0EXztwK4djF4Z
	TSLWkfEbWgf07g69vTzdun2uYHdAmh2LEZQHm8oozqNInAdHRjJ4xak0MxLF2ZJO0KW52gKmT6E
	jOQp4jIjbyQTecvKcWAnAkf20zFYoUrR3SlrSIwI3yTw4IGqFsg0waH23naw0vvpNw96dwtiwpr
	l8F9SOaV9xjKSaE87z8RCEBtSu9yu2j6ad+1I+jwpgPcWMO0ksnXYr+YqUeEX+ZZ3HNv+LON3fG
	R72edIHUzE1nD6JVHLIVVr/D9EeLdWDe6akAHfgEbquEiJOgopYZbwKsSEwqPa8KLmcc86KMvDP
	SmwVnNKBxY75eSjVSZb6FWuOFix9Vxnf77+0JN8gkY3KrX12OWTdJx/JQRibirjrhLDqm+pFjeE
	FjgnmUt3wVfOC1e/JeZZne2YcuLnvbokRq8AuJzdgPIsPotig=
X-Received: by 2002:a05:7022:6894:b0:128:cf5c:5356 with SMTP id a92af1059eb24-12c34e68d6amr6026225c88.5.1776003935113;
        Sun, 12 Apr 2026 07:25:35 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d8dee27fccsm1501965eec.28.2026.04.12.07.25.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 07:25:34 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 12 Apr 2026 07:25:33 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org,
	Carsten =?iso-8859-1?Q?Spie=DF?= <mail@carsten-spiess.de>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v1 1/1] hwmon: (isl28022) Don't check for specific errors
 when parsing properties
Message-ID: <b2c92ca4-51d1-4253-a77b-17fc3f9e0894@roeck-us.net>
References: <20260219140532.2259235-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219140532.2259235-1-andriy.shevchenko@linux.intel.com>

On Thu, Feb 19, 2026 at 03:05:32PM +0100, Andy Shevchenko wrote:
> Instead of checking for the specific error codes (that can be considered
> a layering violation to some extent) check for the property existence first
> and then either parse it, or apply a default value.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied.

Thanks,
Guenter
