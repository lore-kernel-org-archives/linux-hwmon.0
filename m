Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A87E3D410B
	for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 12:48:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778935721; cv=none; b=I0xgqkRMDJ5CNYr/o6Kk5IEfiMHQ1vjJdhbKo32BJGkP9XiSrzpDapBUC+ZRcln4QEDvZMUrfsJwAjKTQ9zTk1LVktubfxPkmBgPuHUCIDNJ8s6C7WQRn+txZF8GIjG/wVJpblx8wLe2bKNjMur7qlur9EPLGZPQfkkKsSwpHKY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778935721; c=relaxed/simple;
	bh=uYFarmzOnX//It0NgDrfK2Wz6mbkpHWNkS0Ru5VkplE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZpxWyddcazLErCAUyqnib2hO5GQvmXftPNBzlpN/xQgblPSRj29riOXjJ3UroBIifYcQZmbkUedtxtOQOP2YAZhGBEcFmEOlMXPLolB8+PAE7xKrNMBWpAaOS28unDpsw57BWnbkfmVN+iXd5XIGz70u60EmvTmpmUwwxcyaNUU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Urka1NKN; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Urka1NKN"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-83ea84df1d0so246826b3a.2
        for <linux-hwmon@vger.kernel.org>; Sat, 16 May 2026 05:48:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778935720; x=1779540520; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wnt40gfJYAoGpW2s+2TLExtwWB555+jNlfI+PAJo424=;
        b=Urka1NKNxRT1Q5/1kR8YVsurHZofYpi77nSw9OmGPYViYl4ayFqEmn8pw5UX1NmKab
         GAzXbCRMbclUvS1Cv2dmbNcEDDyLIMKogrpL6T5GjB2d4O80UZIua7+qhQflJhI/gJ67
         xXg+Lkqhu1TedLBIgPbrlpTn0IadTSI7rnvgcPjHiC6PX5YUaInpY3d9uvXXVjOle3NZ
         lNtX10JETFBCY31/ty0EK59eRW/ZiHd6qsJ7wZQx23dZbd7D5UOfcXefTZz2Zm2N523p
         tQgevoTMmfK54Cd+RdYaYNN5DlQoUJtGJq0MuxbLrY86S5gHuReQ+IYXtJj5Yc31MOG0
         1tiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778935720; x=1779540520;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=wnt40gfJYAoGpW2s+2TLExtwWB555+jNlfI+PAJo424=;
        b=sLBIewRfu39pTePynIm+mxfjOLQ/p3uCbrOehNQDFUKeFvrzwFSh5FHhQ7bz9fyTl4
         VJuEc9aHuVASS9S8/rUHRqXS5I0cmL0APiVTI50uld21uA0DAmCgwhYuNJe/4Qjp+3IE
         gD4mAddAXEtv/Gq3wuQQfygtxxNlAhvLf1NSrWns+MyGhMO8/cC8iGILt1WPJhO+xNDG
         E0KMQuEc69va5gKZINM6bJZ0UYlIEHBRGYEtjLw9NOwNm595AZuti8WDVd96NH+1MtuM
         GXU+9EXOVPMpuvTjul46mQRlNmMFxJkqiYeTCCsyHoCBBupcHYb48zpzlXKuqQStEJwj
         5y/A==
X-Gm-Message-State: AOJu0YxXL1UxYOpuYFCyrBxaHTIJ6T4BzVMMegslp/6uM1lWSc8izwLf
	B9omDSc3u1FXfhGVBaSwc2Lv6RgMdY9oFCAFx9QVDyNCLYu7spb4DYKY
X-Gm-Gg: Acq92OEHWcBtVTQtJhxei6Whq6qyOfBGLhI87SxbB8PYUEmRqv63goYM9e69d418Gos
	7ENr/G7xDi6bDAK9OxTCgBLNa3QBbohZdnyix34mcO/b3SSHtQglOwgB7llFmZYfpYHjUXjhnon
	aAgUoJLkd7f7B/ANIQ0tfKBTD2gKh1YGe+J7fVVvtXDw+uq7AV6FU2E2bJy8Ss73WbJAvzJZc7D
	XeTsdtKfMQZw12A8CRdSiGeFnlKPTUH9jFQuFz9lF1Lqo3NPaaogkyb2lZbRM1O3WdRZxnQb9tq
	oAUs9AAFlq9TY/Cz/isCshh98J/Kq7ksuVGlRJq1s9/340qdaTvPXFhx+DVDHZeMLaQl5bbJRGh
	WuSjoND3mQ6GQqiK3hnLjwHE/Qkd6OKTyZ4o3vX0NdDw5ARJvcYLoJEGdNRPqIcoIL35Gw/D/KQ
	WofUgEKDWjsu3+74dmQNnty8Ys/mSLZ5y50MtT1JyRdVmVmhE=
X-Received: by 2002:a05:6a00:a203:b0:834:df57:9d36 with SMTP id d2e1a72fcca58-83f33d9de2dmr8365049b3a.25.1778935719717;
        Sat, 16 May 2026 05:48:39 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83f19c5b71fsm8252824b3a.29.2026.05.16.05.48.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 May 2026 05:48:39 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 16 May 2026 05:48:38 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: bakshansky.lists@gmail.com
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/2] hwmon: (coretemp) replace hardcoded core count with
 dynamic value
Message-ID: <79000a7a-eff5-4175-b026-f7ea83594674@roeck-us.net>
References: <20260516114253.5466-1-bakshansky.lists@gmail.com>
 <20260516114253.5466-2-bakshansky.lists@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260516114253.5466-2-bakshansky.lists@gmail.com>

On Sat, May 16, 2026 at 02:42:52PM +0300, bakshansky.lists@gmail.com wrote:
> From: Roman Bakshansky <bakshansky.lists@gmail.com>
> 
> The hardcoded maximum of 512 cores per package was first defined by commit
> 34cf8c657cf0 ("hwmon: (coretemp) Enlarge per package core count limit")
> and later kept as a fallback with a TODO in commit 1a793caf6f69 ("hwmon:
> (coretemp) Use dynamic allocated memory for core temp_data") because the
> actual per-package core count was not reliably available at the time.
> 
> Now that topology_num_cores_per_package() is stable and suitable for use,
> it's time to complete the TODO and allocate only the needed amount of
> memory for core_data.
> 
> Signed-off-by: Roman Bakshansky <bakshansky.lists@gmail.com>

Applied.

Thanks,
Guenter
