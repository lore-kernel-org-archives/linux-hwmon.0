Received: from mail-pg1-f170.google.com (mail-pg1-f170.google.com [209.85.215.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEC19237180
	for <linux-hwmon@vger.kernel.org>; Sun, 28 Dec 2025 19:33:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766950419; cv=none; b=ZIuHLUjxxTqoOJJBCKSysppY4aO1ZMrgvQAVl8jE5M59QRt9uwXz4csL6Rg+gDaI5SxY9EWIIhYX4qvgNH3JzgaK6TvwhzNpuP1dGyFM+14OwgWhj2gLUprgpm1y222jLsoo58+MKwBpaH1l+eF7M6XPjgUP4kwygohwV/GYBz8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766950419; c=relaxed/simple;
	bh=8Z8s0zRyas5k9dtSO+jDURCTZSx/HY+KYbkik4ExQEM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=mdvyXYp20B+MaPERanfRNXyK8bs6dRlTjWaEVV+2Ua8rcZF9FNfUz3yAKozdL/yRMCfeKutqqzZVsbCQgXWK93FK/YD/ybzJOh1xX8NLyjDkLchjmjqJ3zVjcwsBqYHAECXDus/otR7i79L6am5MPcKCVG7AbejNGiMK0HUTm/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWYMzAr9; arc=none smtp.client-ip=209.85.215.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWYMzAr9"
Received: by mail-pg1-f170.google.com with SMTP id 41be03b00d2f7-bd1b0e2c1eeso6375236a12.0
        for <linux-hwmon@vger.kernel.org>; Sun, 28 Dec 2025 11:33:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766950417; x=1767555217; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pt1wRtyavu9sA30904MjPlQcAr/7ezicdWvxAOjfGH0=;
        b=QWYMzAr9k5incljRySfHSEdwBjOXkrHW50C/QdlvGPaXebI3uxBpBbn3puouyyz7sE
         FQfBaUobGreo/kpJjbZlwLAvnguJ/caQS+s+uVg3mTYs2M3464I0+wyLtsrjFEvR58WS
         UcDwmbV/Play6KX5AYG1z1oUgLe91NKxZaMhXAm6EdtT4OnxuhWuehuZp0tvVg8BrAqi
         Z0nRZb81VjbFA0TzG9mTIzcY2pm+3nJNvZVShv0Ug4DAJPXpK/fHtwmLFWoTAU6b8ktT
         xZa+psXpgsGrCaKaO+18q6vs3lBOLFFz8o6iHSY9BGR6yxeNI94QoAVhBRw+piCdQ9ed
         FB2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766950417; x=1767555217;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=Pt1wRtyavu9sA30904MjPlQcAr/7ezicdWvxAOjfGH0=;
        b=RgKWA5pG/X3bl/Fbeq5MFZxFL+8LcCl8HkC5XauLkzRFJU/iRKyun9DoZnoZ6dJjJh
         NrXd8KGr4pNE0QPM4TuDv7PmHj1ghwBDx+qjuxkpUy09v0sxzvFcoMPKLVaPYldzgoAA
         n5FOJ7vWgLvYqQzK+m0EKvJGMQjRs4c2cTJzl630KWqyOOuO/Y0QOz/RjFdcrAejBMUB
         ESTWSWrIGidFPlXPXXxANWs0ha314nv3SDl2W+HNFVe4Vf89jJ4dUVzVE9twT8lyMtSx
         ni3nFh4vdj8gCmlNVXdBv7pNAmbZ0uJXnF4Cuua0svL3N5VwRouY6H+cffLIeX1Mrfat
         RksQ==
X-Forwarded-Encrypted: i=1; AJvYcCWvTaliKsGOWoW6itx4pg2OegSLYNiaJNQ30cl/ltzfxmfjfo6+Tt0OzNuI2mDfpD+2xAvLCnNSDTYDFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyz99vWC2aAztDD7RO/Ijy6NkuooHxtn1IaWu01GvtQMmBCSgMP
	FmTcfXX13abPNaXhGNxAgjfjf/SbDcqnOBuArTdLyet03AaA5io9R9qb
X-Gm-Gg: AY/fxX5OCgPEvZ+caMbavvpxnAS/B0xuwb3JDo6SrNj4ooUOPb4vBuMWm0z2BpA1/bh
	+8wDMM0H8gqcgsjde1xDzEtCLkgoyHIpp46KDZDucXPYFEppZoPARg+xU4y9aGWawdBsYawu3k/
	nUMfJwnbxG73qWocJYmMFvbAXwMahCLSeKJ7JG3x99CTrtnG6sLsBQBCy6wYQHsIvH5uYx1c2s/
	aVC21G2SA0R5xVxuW6roZ/YZAR1yEeEaDe7nT/fUy5LHr5IxLybuQuGp3FgS29AlleDEVIizgyZ
	YzMJMtKA6LJU0HQNw38rwIw/RDtwQJJ3qDCAjDgtpA1OPMK9BdC70OOfJFH6sD5Sb3DyiGDl5yu
	xwLjc5FSOK54pQ2/oRstpVeNMQzrIpZRmFlygvO/ysNIhPOH0bnPKCQYLHDtu+72FhFtpuWkp9N
	djDzfYXVLQY5qoGC2gElFoOioa
X-Google-Smtp-Source: AGHT+IHCgDLi9uPw5k7v6seyMpUdm0iZonJTC18mDewR1GCAvCzdGMj2B7utkoTWUeq/VHqVQ0xDWg==
X-Received: by 2002:a05:701b:2213:b0:119:e569:f610 with SMTP id a92af1059eb24-121721acb0bmr18414471c88.9.1766950416909;
        Sun, 28 Dec 2025 11:33:36 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-121725548b5sm110647454c88.17.2025.12.28.11.33.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Dec 2025 11:33:36 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 28 Dec 2025 11:33:35 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Benoit Masson <yahoo@perenite.com>
Cc: jdelvare@suse.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: it87: describe per-chip temperature resources
Message-ID: <cf3a84de-9223-48e2-b6e2-c97e348b4c0b@roeck-us.net>
References: <20251226203021.27244-1-yahoo@perenite.com>
 <CAGHj7OJaSvSsr0z43phjs1YvL17xfJWesJFj0iQpdvi8=VXZhA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAGHj7OJaSvSsr0z43phjs1YvL17xfJWesJFj0iQpdvi8=VXZhA@mail.gmail.com>

On Fri, Dec 26, 2025 at 09:54:44PM +0100, Benoit Masson wrote:
> This patch is intended to be part of a series to help with support of
> newer IT chipp which have new more dynamic options, and make the
> review easier.
> 

Then why don't you send it as series with this as patch 0 of the series ?
You are saying this would be to make reviews easier, but in reality you
are making it more difficult.

Guenter
