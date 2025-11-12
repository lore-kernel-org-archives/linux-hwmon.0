Received: from mail-pf1-f169.google.com (mail-pf1-f169.google.com [209.85.210.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6131227F163
	for <linux-hwmon@vger.kernel.org>; Wed, 12 Nov 2025 20:08:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762978132; cv=none; b=jgRO1qon8XnCIuapIwt9btB50Rl3bTD3MrYoCGEVpkgpv3vSOPyZNnKTeV6Lh/E1ErHN9FAWCS6Bkkseu0H4sikFGLugKrP8eq2osM7s4/VdTh7bo8Un0/lbh7bx0Ywx4Yix1GnWz1aFN4FvNPgFJpMAmR0VTp40hqLAmHvb98o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762978132; c=relaxed/simple;
	bh=0B2xRy3DtiRYJVW5uqqFoE1hZORZpikyOoZj3dabAHE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MPbfM2u5LzpTbHqdF8RH+ja8H6ihS6ZEr0GBYQVTK5EO5iogG+rNBX9TjD14D/oOitJme7Wco24uA9Gemtb5SD7U5Mwrh1GLQvt30KO/nCGm4jf/PmpGiqWfTcXpCp0VRZqu038VqpBgWqv70FI2BuHbS82/HZfS1SXRlCiC/yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Qtu3eSCZ; arc=none smtp.client-ip=209.85.210.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Qtu3eSCZ"
Received: by mail-pf1-f169.google.com with SMTP id d2e1a72fcca58-7b7828bf7bcso13624b3a.2
        for <linux-hwmon@vger.kernel.org>; Wed, 12 Nov 2025 12:08:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762978131; x=1763582931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arO3innaom8XEOzV6JBZdbg+gJkC7Ox3enKZEFIeZyE=;
        b=Qtu3eSCZFvMZUPvjYh13A8XhukWrwkl7R3hac9VkdsG4kawSlPYlcnBfSDD+cvDUdY
         8V1Gk0akSAFa1yV5OOP4TpTX8Ycmk4BgKVYzn3tEr9iq7fpCQXdOGJOiH2EP8qkrIgOw
         bgaJ4Q6XD6A6epeFBaZiWL2qSXeNjf+jtUdk4JEpUEOYk3+F3nBOP153kRl+QraXGT1X
         L7mMvVv9F+mRHqbPHNXIHi5uEjQOPqwbXQphprcXM/I+GdzYCdqCpTEO5MbDpL3CXVua
         SmOAMYQpq4uwW21jKs0uurTmvJfMp58knfaZRan1A6Zb8MIk+DJhdeen1TitCwfE0q/4
         O8lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762978131; x=1763582931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=arO3innaom8XEOzV6JBZdbg+gJkC7Ox3enKZEFIeZyE=;
        b=DmVOxNb7eVk2SUT7wCpK9eeOgOJvyDbiY4BwiR9+tzgZTemBlFAb8tfvNbOEcwDJFP
         ujTKRTUdfaUBkwOfd+q1hUSf/+el4MXEOLFq+8p0LR3EiBmtZGwWEOi8UugrrD4oJONB
         IOTscdDD1y9hjOlZqKx27k5R5p1+Ikxqev29JGVJ1WO7irGiAf8UwpGZ6lRyoc3CxQ6R
         ix6XxpAiEI5Ia8r+euLk5peGGcPtI3i8g3na7dSMc6drTjh65gI2J6cLXKO0bHqL88d1
         pW3tfXBHtxqWd7nJf4oD044XZAASOYCcYhnoTp7+D+6U5y9i5WB72L/cGTRYJGdvVmJH
         5GrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWFdDE3NJ6mtJRg3RCN7656hFD6o5yxqHm8awDw8VLLJtbJOzgh2wCgECaB+B6LT3BVKyVxHEJrMkOatw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy2IkCIh5AhEM45qLKpPdCjTmPnLVeu9zlM5H/6Cl8+88xFwGU7
	EQkvKC+bXYw9Hnx+j57fssUee0MZoq8jaT+74RisfujO/5y7B4Jaumdu
X-Gm-Gg: ASbGnctF1zRrRoFpx/WZqhfxYMkxM9Wmv5HAYTOrcFTECWK6a1pEgiiLOVqaWL11oxb
	hBfo5z8R72Pi4m83kMMmwUCar29JykmkC/MvPSo6gbs4FZKAA/xHTu3u3XFH774i3MKYxMnhoAE
	AOa7rL5+bGiUGW7FacvgGxuonmfKC5M3V+m57RwyQhZSVVUv0s2LkIftxPIDoG6q7Yi6rRjXNT6
	pObcQo9PWzEgBRS6kDoo1fWH8fDTCI5RocVd+zhD+yvUhyhUfQ05TSdS9iIRJSH+2WPSN5Vz2vg
	zmPba3V/n9H5ZFjgXwRTwT8XgzuQ6U3jns+ih8c0uPx06iClyRRSwNABMoD8xljO8tu2xTmcbbn
	hrlI2Htct44bv9SaLm87iLS0EZLYq4lxdBPGSUCizbkpZTcpcyEx8gOo+7w6ETruvAEiP6PHgBg
	5ZNxqv1AFXFe0f
X-Google-Smtp-Source: AGHT+IHXkVLeQmU+R1RNhYpyxag5ZVsaYVozFw1cdOfqrqm8uZqqgBlwBnx8aFYxTtDQsPwukjdAfQ==
X-Received: by 2002:a05:6a20:7288:b0:34a:f63:59dd with SMTP id adf61e73a8af0-3590b826447mr6333583637.51.1762978130558;
        Wed, 12 Nov 2025 12:08:50 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bc326f3e8d6sm115288a12.25.2025.11.12.12.08.49
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 12:08:49 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 12 Nov 2025 12:08:49 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Igor Reznichenko <igor@reznichenko.net>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: ST TSC1641 power monitor
Message-ID: <1dae4ff3-1b51-4e30-b874-83cb9289efad@roeck-us.net>
References: <20251105201406.1210856-1-igor@reznichenko.net>
 <20251105201406.1210856-2-igor@reznichenko.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251105201406.1210856-2-igor@reznichenko.net>

On Wed, Nov 05, 2025 at 12:14:05PM -0800, Igor Reznichenko wrote:
> Add binding for the TSC1641 I2C power monitor.
> 
> Signed-off-by: Igor Reznichenko <igor@reznichenko.net>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Applied.

Thanks,
Guenter
