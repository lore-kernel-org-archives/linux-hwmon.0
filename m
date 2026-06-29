Received: from mail-wr1-f42.google.com (mail-wr1-f42.google.com [209.85.221.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA4F33E639E
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 19:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.42
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782761182; cv=pass; b=Kfny5VOuVEiaRhrDmQhyacbjbgStlK7puTvnSKj+NyuEDaHLyfoPxnmwoG3xrP+Wyv2IHx9aal05BOzDeWE6tLfoMSXZ2h7KqaRa8gInE4dClaL7jtb+r7ktqyiyTLEeA5yBF9fah0tvujsiz03m3qCe2OcxdIZitHwMC6R+dGo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782761182; c=relaxed/simple;
	bh=hqeITJcmzESdb8H22X37VmV0f9rGwZrzNOxw/dDpThg=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=IDgaUyBEJBUkVOxQsLltbjX/5JUGJ3c0IOONDPb4+OiTvRHCbUfFdnFZprV+XisB8Vs8kw8gtLr4yKeJqHr6EzOUwDXE/4Rf1iaT0ETHxdrNN3H2Y7WMV1rcwMhw8jG/1b0/kKHr/jICqjVcZCwwo8+dpH45rr4YxhHjEcBWimw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HJhwnM+s; arc=pass smtp.client-ip=209.85.221.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HJhwnM+s"
Received: by mail-wr1-f42.google.com with SMTP id ffacd0b85a97d-4720d22c94aso1679730f8f.1
        for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 12:26:20 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1782761177; cv=none;
        d=google.com; s=arc-20260327;
        b=iWH3em/H9+O7ApAdDkIhX1jioelY/UXqqwFD3/EwlsqS5cRaHbnQ19nd56/Ip7Hj5c
         bdt6hnnqvpoUVWVUBks2qjEWV7+pcXCfMc+2sZg9E/mSxVGJ06WWfJANuB1EpBlJ6Sx4
         oeyMeX6rGHUijL7pcgxUoFjms0tyjK9TgJZmqvDNw6Js9mHQsCKPDcXW6ivEztRG2or0
         Jw3ELFgNEThwQLEYFNdGwifki30dMyalcSHbNbXVUcF9573+urOlvWnAWW1kO5q0r3J1
         0yzjHSxjAW6LPOGTwgE0qs6JbuRFnpMlcpHQyAJr9/L2bWOMz0VMEypGzmzjlQn3CYdt
         S7mA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=ikcNibTeUf+UPMUiFV8fQCysHoWKcq3FilBwnxi5AHA=;
        fh=EYZyMVpywMhrJaESXaGMhTTmyxumX3NVtGwPhwDaCJM=;
        b=EbENEJB/wPGm9kQi56gQYBw44YRWZAjdMAgwl2AytNINUDjVGTfvzhyaNfmTGi0t+O
         eobEkRNeP7N7hw1Ydz9NoBCiNyRri2/Cv9g8PMQs8qp8eUbJdQIonpOiLXGa+rZZF6q4
         AWFtZKNaT5xtM7zaTZVDpWNYZH8i15Hc8pISym5Bxw2s9rF7IZdFZFaKIJ5bjiCVB1Ld
         O5x1j/BIYl9bYMrGzKv69gche1aec7LZZwuviHyjiG4c64bau9mNR7OTcjaKh7B5WaT6
         Qg9SojqxNyOs1UACtOycXD9dKmrpqRVR33+2T1+e8RcIigVdQ1Pvx5o431RNzfgDbeFy
         hL2w==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782761177; x=1783365977; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=ikcNibTeUf+UPMUiFV8fQCysHoWKcq3FilBwnxi5AHA=;
        b=HJhwnM+staapGFHwqM808eeWNnUJZe5blKYBHytAshQ0R4cD0s/2bIoY7UPdFNHzWN
         8Lzhz40YD/asdAi/2VM1/lpYEkIGW82FSK1CepGND16DwoImx9o2vaeBU/7MazJl+2hW
         9enHuZY1BYbPqDDbYvYcM9K6Vu+yEZoOFi3YmMiiw1JchXIhHC4tjOWFwf+VUVNZarAr
         gSyHzfMozR6b08+MS8JH647bbcGooDHe1Y6QGk2AoBBjZMHFh+Q703hU4khl4WjOCmGA
         nwu4zPNKSN99x6VUtk/b93lZpMI7QfSJPLRmgm2XKds6De2peb2dXQfpwLr/iTF7U3cv
         xI5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782761177; x=1783365977;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ikcNibTeUf+UPMUiFV8fQCysHoWKcq3FilBwnxi5AHA=;
        b=KuzuLoTdNhYAQGqJOsw3hRjmQj8I+DYxQezBHRHuvv0bP0rPDdRpOmvve6vHk/hiRH
         cYWoFoK8irheHtptMkXri4ngsmcm3/XGW5tuaTEjGtXqm+xlLgMrIn8GHrclVncNf7/X
         lksLW3jHYVaaV3aBAYdbo71YeFt9SysNe9GXfjz4ah2q4rEBXHWHxVqFUOe96LNSd/ei
         afthun7XnRwb8QrLSePxpNPJNgH0IXtT+P3WxZK4kkYiUeKWn8nlXhcmSobTdhBZIb03
         s0cysThONBvPPYpZPFeTo2BzTyyiPGotxLrsFOBhO5NLrw6n9mekXLR+U9RMh6MxWy8f
         h47Q==
X-Gm-Message-State: AOJu0YzXOUPI0n2A/AJmEvGKPYvEeDXDkUJpUNqqORQKJZs6dNeKaM+b
	xCCKcIQqD+EeNeZCHV26pRBZErqQGzrqvOzeuYWO0LDxiIwxMG73591Y9Ei6ZixpjooNyP63fqm
	Af0NTpTJreDNfS0fCNP7Ivk7tUJOnJCo=
X-Gm-Gg: AfdE7clg3wRuDvVXrQ825BZnpBCbcqE2nV+83wXjdfpGHnfHBJKXlH8NEoIjP8TiKbC
	RDUfiNIuwfZAgknKTT/s4A8LdvOGPxvjQwaYy074YAH+4zM3oGO4Kpj8op/V41Q2EDeML8xsouM
	Xxf+Vz67BGVvqQSIjehdXSKXhBUlf2u4YWDOjO67adaCg+xscNrN6kylXntXASV9eRBTjdHWKvB
	fpqPxg9Ir0o5J/1taBA+tIF2GDjRVJuZQHI4kDMLkWweHiNKOIUZ3s4A6JW/2t+qRHCH5ccFueC
	D+jV5GQ9m+v5Dbf/dz37Wosp09OiDxMS8WGqmgAs5EWs+yjPjzSQv3d4DVW2iIxVtVDioPE/jN3
	q3NkuQ1MDGQ6y5XXsXTyOIDSb5miwrwMaEp+VCoDc23PmSVcw7nuaZpX9z3qdx+oWMk0Kuk01XD
	dw3Pe186Gg
X-Received: by 2002:a05:6000:1889:b0:473:1ccc:15be with SMTP id
 ffacd0b85a97d-47553028b4bmr602442f8f.39.1782761177156; Mon, 29 Jun 2026
 12:26:17 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260629-add-kconfig-deps-v1-0-8104df929b1a@gmail.com> <20260629-add-kconfig-deps-v1-3-8104df929b1a@gmail.com>
In-Reply-To: <20260629-add-kconfig-deps-v1-3-8104df929b1a@gmail.com>
From: Joshua Crofts <joshua.crofts1@gmail.com>
Date: Mon, 29 Jun 2026 21:26:05 +0200
X-Gm-Features: AVVi8CfEl_y46MafrE7csTYiPyLlcXEigCUk7Ai-r1lwTXi99wRl7GGWu2NrwYs
Message-ID: <CALoEA-yewRwGCVKUS02m3WqPsVF5amF83HZTsk0H+QW=8fKKvw@mail.gmail.com>
Subject: Re: [PATCH 3/3] hwmon: (max6679) add missing 'select REGMAP_I2C' to Kconfig
To: Guenter Roeck <linux@roeck-us.net>, Tzung-Bi Shih <tzungbi@kernel.org>, 
	Alexandru Tachici <alexandru.tachici@analog.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, 29 Jun 2026 at 21:17, Joshua Crofts <joshua.crofts1@gmail.com> wrote:
>
> The Kconfig entry for the MAX6679 sensor doesn't contain a
> `select REGMAP_I2C` parameter, causing build failures if regmap
> isn't selected previously during the build process.

Oops, typo in the commit message, it should be 6697 in the title and
body. Shall I send
a new version or can it be tweaked when applying?

-- 
Kind regards

CJD
