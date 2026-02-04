Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9D88D38B7B8
	for <linux-hwmon@vger.kernel.org>; Wed,  4 Feb 2026 22:40:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770244853; cv=none; b=sBg1hKx1cUCXLqwMr8A3kJopEbzCkysbTCF2xTbLYsX4wyZXwXgzRqTzj4Pq7waqZQigk/rOdaMM0EDCCuWw6Kn0Nd5ncms8x9711ctHLw/RuThFReKOXUSbU2dpWvHG7LCZ4xLM/lz+HUgQUZprbcNM90L2d4JJyUXodoYmcRA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770244853; c=relaxed/simple;
	bh=aKlMqwEQJ3jks5AA4OQ5btVLS4Z+Z9QEYeFqHkViPt4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=sJBLCpfQqE9bGduZr935j3x1GhjYmKqJuVWMf7XJshgqsOnTsRdO+jvSt4AR3VlT3B6qYDTnrnwnChoPN8gsgu6+nrAMnltIf+WPeBi0wF8W0hvZmo9MYhI5LzZUFsP9xZi3dU8LXZ+/cij1l2a04HI0lt9WSfd0HTD7qiE57BE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eEMG0j6s; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eEMG0j6s"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-2a91215c158so2794835ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Feb 2026 14:40:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1770244853; x=1770849653; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cZTFSzKr1QksD60QBdMBeOJEwbsVPi5Fom0holWdLCE=;
        b=eEMG0j6sSqFClg2znRfTy9q1kJm3l9BgnvBrzEhdeXy00N2tPSFwNgec5A6zbugySV
         tPsV2mAA21sk0/8DKXkQGZBdMskHOKps1sJ2GobhxstLHB5oYaC5dYbkw6TjKRqM2YeD
         03MwxGs2kX1vN6EYnfccXyKzPe7RteqyXUrlqeGAlJzkF3Qr4x1slcMQvfSaU9DpLtbw
         Y7a+oKso0gPITWB+HeYjUpDrRIxg3Gva+adCcrdOZ7EOCRHPLwCCfN5dg87YayS34daK
         QFr7/90M4LMQZBfJYRIkX5kNtlSuIzeZWQTC/WqfHBfQDKP7fZHjO7q2NhKu1Ne3tlIJ
         ST8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770244853; x=1770849653;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=cZTFSzKr1QksD60QBdMBeOJEwbsVPi5Fom0holWdLCE=;
        b=L4k7iJ8X7M8fkJSsbp5fKLSXQwHPhGZVCAUXRg4OioYYc3/YlYNrAR8yW/vPOKZAIK
         O+EwFYbw0DSpE8bNuSMaDr9TNe9SLzpyu/JR3J69N6cHsSKys/cehB4IUnrcgrZy9w+F
         xCgvRApdD2ZzUDlg8BPqKD9cXwyJ8lT7mt075LrFJ0K0hgYTvT/Q8C6scBgmJgiNRA31
         0SBo56ljHOJZ0CP+riPp8iXyHIUWdLrXe44GyxLOQcuEIY9A25yQKJKmxR2hYOofhbKW
         MBBc8VrgNuiwlst01nO5boEz3/hVXlWcMr+gvHgysgenQrdJ7s7Hb62DJkVJljP+40by
         KnIA==
X-Forwarded-Encrypted: i=1; AJvYcCU/bnXdh+Sn41rOaHdBxnwCbNxym9J4GQ9IQk9bikH21pex0n2oDfEq/n75Ag8RUCxHJ6FmsvrCiCcpfQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yykj0i4Tk966SsfxNxJWnRpPeYyQdKOyLV201CadnCOtHBQ5heB
	mfuOPW5qZztjuLOY5sTgnky3YXYg4KsqJtCiw/FwCaHHRhjwE9tZJAbU
X-Gm-Gg: AZuq6aJbNnHGvvhFisn+khzPlbcKCGJ34y1g5fiQTltOuSoGzhbBVVrK+aiO9EaJkVK
	9/UbNfVnGycxf7feYKoMl5356hkLmEXGmhusQHKZ2GtFgoUOt0w6ocT5zsk2Vtw3po1Cbixsf0j
	8FwCMfKJ0JvXo5nezbwiSAprL+dljG/NBCCvWUow3yYSLv1JYIZVqTb9B3p9fe77E7IJ7WjqkXk
	qpI65sEUtd3uJ8qHfViaOSJY5Ov+vbm+qBv1l/xLrutoe7t6wkTu02E7a1eskGHW4f9ZCPd8RYW
	85fdcz3qRYw6mV2XbktebbxM0tPWhE9Ot6RxwAmBGtsUrZQeYHowcOKG+n1tdtzcLCtGqyy+C4c
	1SKZ1KEAvUBqxBJzOt6pa6HYYAmkJhiWKvhE9GGJkpJ8fTTjFqdiyMNj79vQjyEED2SYnTjUHrl
	WgJItFlsuSos5RxO660O63uaKd
X-Received: by 2002:a17:902:dad0:b0:2a3:bf5f:926b with SMTP id d9443c01a7336-2a933ff4cc0mr52106465ad.47.1770244852866;
        Wed, 04 Feb 2026 14:40:52 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a93394e92fsm35735525ad.53.2026.02.04.14.40.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Feb 2026 14:40:52 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 4 Feb 2026 14:40:51 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (occ) Mark occ_init_attribute() as __printf
Message-ID: <ad405e7a-6797-4b5c-9cd0-76bd9a1a8121@roeck-us.net>
References: <20260203163440.2674340-1-arnd@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260203163440.2674340-1-arnd@kernel.org>

On Tue, Feb 03, 2026 at 05:34:36PM +0100, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> This is a printf-style function, which gcc -Werror=suggest-attribute=format
> correctly points out:
> 
> drivers/hwmon/occ/common.c: In function 'occ_init_attribute':
> drivers/hwmon/occ/common.c:761:9: error: function 'occ_init_attribute' might be a candidate for 'gnu_printf' format attribute [-Werror=suggest-attribute=format]
> 
> Add the attribute to avoid this warning and ensure any incorrect
> format strings are detected here.
> 
> Fixes: 744c2fe950e9 ("hwmon: (occ) Rework attribute registration for stack usage")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>

Applied.

Thanks,
Guenter
