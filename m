Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C094363095
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Jul 2026 02:52:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782874351; cv=none; b=cV9v+XWtt4S9RVWrRgVqZcycX6eg0K4CG+rWTOcM0ERBgYLTGmK3w3MQHt7XqvmVF8Aqxdnp4T45KjQkRnvyZlNCFjmGJO1BFNs0RwSTe0wQDEWQPeEJsOT/jm5eYgkXtm7wJyvsB+O2D/Fhkq4S/KknielM3rHQzhWmXOUTAxQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782874351; c=relaxed/simple;
	bh=44fzqAqAQmZd82SGPw6u9V6YlwHz0Bp/+M2HOF6SWEw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pkELf16m9KXap7bzvb37uaS3gAUdIAXk9yrCW32PqSud09vBgMJT7PxiNbkhTLNx3I8zs7mwOpheSgLr8pvxPDwdv8Z0e5WEtvwAzauGzUWsqJTpRluMumiA9k2BO9JlDigbzfW9h4CSdT8EqdSiIWNP9X7KOvzB8705/kCJlaY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G7fkYCtB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G7fkYCtB"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-2c9d87b1f9eso1096165ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 30 Jun 2026 19:52:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782874350; x=1783479150; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=JeV9JaadQ+vcl6bqJUQYCDM0J8gadbyefPmolbV0kvs=;
        b=G7fkYCtBmsyFfbrh4Lf3JgEuZwHnLXrNgrjI9rOFlRAiU72l3bTNytFfL1JkZZSs3l
         mpmU+ErGzHzCVTYkrvWBiCC+SReFyF+WY6VB6RUYML3YWBtI2TwLbVjKGEQRYEtf3ex6
         G9aHM7uZP+WyqOuOlHMxSrMMyNDSUYccYif1QIO/InPMbGVx8xAlH5aAjFzJhKod+uIV
         o7kusXCuth5su7NRATn957eA4hFYRn/jjFGi2zvVxC5pscQZ8AfziKRCd/0Eqw1iePv6
         iHi5WWK0RfeRoq3F4H1IwE6/hehdmzcBpM2c1+IXtyOeHa4bEcNr6foz0Q+mNGlnrQtD
         gm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782874350; x=1783479150;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=JeV9JaadQ+vcl6bqJUQYCDM0J8gadbyefPmolbV0kvs=;
        b=YGjVub/yCaMKWUqhLkAei3QVXGeiv7S1TE8GaXcCQP0LY7lUYPRi30+QN+uG29Z1Ds
         8+2iZI+chdMmHbqGF6giAs56UAobem28gOjxodszDI+TJnBC9xsJBsVq3OChFx2JPR+f
         rWbQspFdu3KyagTQnPtoOqLl11z3yCZfBCXbXTOZUub9bT/ZRnaQlJY0IQtv+tTbytrR
         277XxtmRIAkGli5jt7hTI34fBtElKo75rTmFkLDDfJ+rsCUipuMAvGaIijzZ86FZaUrN
         KXJWWQvpue4L1YNWVG2q1K/W9rUMn4rOX3tohVJop7MWP8O5nE78SvkihHMwopcABK73
         EmRw==
X-Forwarded-Encrypted: i=1; AFNElJ8RFbWDwpAWhWhOdA9dn6Lk0xTIsUSeuDWBrbFFPg7sWmGd9YXgpPwiy+0jSX1Yd1aD39uKxWj96QfWZw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzbVaQV/FkAqC2ek8zreSCKUfRrde+PaMbU8w4jskw4dGBw9w4L
	JPdBQCkbnTylO9aRiFNjdbKJ+MSXqME+NxBvLuO4zz/WpwEbdWrr9wNZ
X-Gm-Gg: AfdE7ckyXtpvMbr0+w4XOEczPjg9G9AkG43+fbq6re7WxPEWUscklC+pEF9d7McFfZu
	7M3dfR9jcsoNvCtsOaZnLsTh9d7fi09ka2IzexNVK8rca8paSTCWsiMlIwhmJ6bd9TD1PCKyebC
	IdIh8IrfwM/WrWDbBujiGPuysPo9gBRGBKfW5iXkvaI/1ZCsnQHaWrvCAwCDWdRtsxNXcLY6DL4
	R227kem5eLQS4vicKRM1ezFhy0LP/Kit9+j71nSR3yLxL7ymZxIgVNNkkgEbkkW/ISKwOZexu8m
	Y5QFaqlKsAAXXe0RV7csz/K2bHcAi4Azq5AEaF0pXwILwGjalTUA1nwv7oD/l9xn+PVL1k87/h5
	o+Yokx2xMpMTaodaKfSh/B2aLSa9Qzv2IsZVmAbfHEHMkAcc+MvPTlcqXAU4Knc0/hRc8jKEbpd
	YGLXxvvAeWloeObwwZkNLwOFJk6w==
X-Received: by 2002:a17:903:1c1:b0:2c9:97a7:328c with SMTP id d9443c01a7336-2ca2ee8e0d5mr49499495ad.46.1782874349751;
        Tue, 30 Jun 2026 19:52:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ca382abefdsm24200385ad.59.2026.06.30.19.52.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 30 Jun 2026 19:52:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 30 Jun 2026 19:52:28 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: dongxuyang@eswincomputing.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, p.zabel@pengutronix.de,
	ningyu@eswincomputing.com, linmin@eswincomputing.com,
	pinkesh.vaghela@einfochips.com, luyulin@eswincomputing.com,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v9 1/2] dt-bindings: hwmon: Add Eswin EIC7700 PVT sensor
Message-ID: <1c055984-0ed3-4cd7-bd70-a333f7a9e353@roeck-us.net>
References: <20260630091040.1407-1-dongxuyang@eswincomputing.com>
 <20260630091122.1462-1-dongxuyang@eswincomputing.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260630091122.1462-1-dongxuyang@eswincomputing.com>

On Tue, Jun 30, 2026 at 05:11:22PM +0800, dongxuyang@eswincomputing.com wrote:
> From: Huan He <hehuan1@eswincomputing.com>
> 
> Add device tree binding documentation for ESWIN EIC7700 Voltage and
> Temperature sensor.
> 
> The EIC7700 SoC integrates two PVT instances for monitoring SoC and DDR
> power domains respectively.
> 
> Signed-off-by: Yulin Lu <luyulin@eswincomputing.com>
> Signed-off-by: Huan He <hehuan1@eswincomputing.com>
> Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Xuyang Dong <dongxuyang@eswincomputing.com>

Applied.

Thanks,
Guenter
