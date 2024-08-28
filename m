Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BEA71A76D0
	for <linux-hwmon@vger.kernel.org>; Wed, 28 Aug 2024 20:34:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724877254; cv=none; b=R+9fOX6PW/NcNOak0NgL3XhNV1XOE40Oy0GSSMSaS3U9mB4hd4b8G0ALo1PRtlf3YCeW4qXjLE54sEFJAqCHp0gwxYalmyKDRXmsHRgqoG3/w0d8oatGIkupHi9ahSiTbUeKntEYSikK26KuO5Mmy6rQD0kSLGu+Q9f0HWgSJPo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724877254; c=relaxed/simple;
	bh=JZ2riNqTl7Im6EDpW0puM397XtZZ53OmyfF4pY6tqS0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=WXX8SEt/hZIAW53UcjbRTsNDATA1rMn3SXwgeIfpAq30QakhBSm76OEW0j6wVba68VSsjHaugSqZSZfWICH8809bJdACH/UtxzhSXuaex0Ijdd4ypTHJWa0z9sAWJE1nsUh/XP8UqfbzOT6rRVicq/JZ94UXOYBIqNW6Vu33OqI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=NyGME7up; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NyGME7up"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2020e83eca1so70806135ad.2
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Aug 2024 13:34:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1724877252; x=1725482052; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gzTKUOg3azr22HOUBTsFoppQyjnouGcevvydwEbSCn4=;
        b=NyGME7upuT1cgi3plQSTe0w/kRK4/3XCsK/5YkBkb7F6nYhCXMe4/3FR2oS3tvtvy6
         SR9xIrkq6Aqjt4hqFgsXp164LeYbwVfc3zmnaVF0Egkivi2HRUbX37BVPCLN93nOJXy3
         X4m+rFnuIM1pIB6LT4JOu1HzXBmhRz24Uf0hvbiqQKo5kXbcK/+WKNrn6TdSDukQ4K2m
         jEP0edccU2I+XTDWvux8ROhwB8Iipg1Kt07J8XU9BF9TAyd+WS3qlxVx3ys7XAMOOHV/
         hNE/oe/V34rGQT77ZfsZ7RlrjLzq9V9vgPwd5bMcTdiurPXF4pyOjle/UnhBK3fUrOIc
         G70g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1724877252; x=1725482052;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gzTKUOg3azr22HOUBTsFoppQyjnouGcevvydwEbSCn4=;
        b=iI9YEHdoGdCDbZVuQGLm2bgMCZ0Xhb4RLw0zKwrmtxPKVsDtI+ml+h2v/jvEPgQ7kf
         DFDd8CmM/hq7hXqWJNn+wYX7lYGgYsoF4tJ6BmJ2NbQy8fPpHXf5h6Zx5yciG+moXECQ
         opv1f9ZgeLMZHNtsRF31rpmYsqZCuZBieKyPvl4vM3dxz2sFcbDKWQk1eCFifk1v9RkN
         iIF6lJ9uJDokqGrOsJTTrCvBAkabhRzURaG97+skQAmq89xlLz6/imYMfFRteu3p8eh4
         jeXE+YE79oevZMS9d0czAcysFeJSiYWt6wuyP4BGUfmoUJGYbNm8J5sQ45TL5aNZyKOf
         2axw==
X-Forwarded-Encrypted: i=1; AJvYcCX6Fwel/OXcU6G5BeCTVWfJ7uz3RjmxFdxQk9KARysHijH89T1kKTK8+rhUGu+MhRyhnQLgcbsExf57xg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz6MUbPXrllo15tvR1vwdkEqa2qu0N+Tjthffs0iY3SPMVBkTZB
	ArYb23dBNmLyiX6iGG/tzhYtUgmc0ItnOtJ/+eYh7V4lImXe/Mso
X-Google-Smtp-Source: AGHT+IFNWbaPBVbpv6Pnjcl+M1U4r/8rXyDIr6EI/x4iMd3S6m08MielGrEyCJF8gv3rjGAB0SLs5g==
X-Received: by 2002:a17:90a:d152:b0:2c9:9f50:3f9d with SMTP id 98e67ed59e1d1-2d856170cecmr515453a91.5.1724877252247;
        Wed, 28 Aug 2024 13:34:12 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2d8446c5a4fsm2362772a91.39.2024.08.28.13.34.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2024 13:34:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 28 Aug 2024 13:34:10 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Derek John Clark <derekjohn.clark@gmail.com>,
	=?iso-8859-1?Q?Joaqu=EDn_Ignacio_Aramend=EDa?= <samsagax@gmail.com>,
	Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org,
	llvm@lists.linux.dev, patches@lists.linux.dev
Subject: Re: [PATCH] hwmon: (oxp-sensors) Add missing breaks to fix
 -Wimplicit-fallthrough with clang
Message-ID: <dcdc5fd0-dd6c-4631-ab28-2cb169ff174d@roeck-us.net>
References: <20240828-hwmon-oxp-sensors-fix-clang-implicit-fallthrough-v1-1-dc48496ac67a@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240828-hwmon-oxp-sensors-fix-clang-implicit-fallthrough-v1-1-dc48496ac67a@kernel.org>

On Wed, Aug 28, 2024 at 11:05:35AM -0700, Nathan Chancellor wrote:
> clang warns (or errors due to CONFIG_WERROR):
> 
>   drivers/hwmon/oxp-sensors.c:481:3: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
>   drivers/hwmon/oxp-sensors.c:553:3: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
>   drivers/hwmon/oxp-sensors.c:556:2: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
>   drivers/hwmon/oxp-sensors.c:607:3: error: unannotated fall-through between switch labels [-Werror,-Wimplicit-fallthrough]
> 
> Clang is a little more pedantic than GCC, which does not warn when
> falling through to a case that is just break or return. Clang's version
> is more in line with the kernel's own stance in deprecated.rst, which
> states that all switch/case blocks must end in either break,
> fallthrough, continue, goto, or return. Add the missing breaks to
> silence the warnings.
> 
> Fixes: b82b38a49926 ("hwmon: (oxp-sensors) Add support for multiple new devices.")
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>

Applied.

Thanks,
Guenter
