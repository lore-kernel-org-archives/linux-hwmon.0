Received: from mail-pg1-f181.google.com (mail-pg1-f181.google.com [209.85.215.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24BB73BBFD2
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 15:01:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785942072; cv=none; b=e6+vBm9RibniXmIbn7jU5ifUiN6DAu+KMllFAsKRwGoNDIRWmxEQdOyEJ+xg6J4HyG1x3eMtCq1Q1n4Xkq6sBw0SaR/pxsnYa0e3rLl5rAp1FxBEVfJrb/ms/lgWW5f2W5gZ3OiURNfDuP8S/wEv5NYOScwoYcCePaAvefDZH1s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785942072; c=relaxed/simple;
	bh=rETe+kyKI7gO6eDhLmVRVB5BUJ5GhBZxLA9xY7N02eU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=edsImeqTUt2UaXNWuG8/NgSoykz0rDq2yO0DnmX+ngXAI0yGSFfIQLnDay0bRz9Ycdlsc7j7jCRruIE3ypeVXwol45Vx8k0FdGHSWWW/INi90DtItnBpRN/On9tYQApvTlbSEE3+VhBpxEEeyCSXQvatBFrXjq5G00ZX63i0wDs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nLbg52au; arc=none smtp.client-ip=209.85.215.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nLbg52au"
Received: by mail-pg1-f181.google.com with SMTP id 41be03b00d2f7-ca957432c7fso1027395a12.1
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Aug 2026 08:01:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785942069; x=1786546869; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=z5i0kcxttlog4h9p4Gll70N/vEostWekyPEjeEzGUkY=;
        b=nLbg52auKNxJqk5wIlBNoVRIe9V53cgyV96sf6NtcX3wGoPyP2VGAMlIHSH5rFtWts
         DipJxHnvgsqdvIsHVPU0CvaI7uc2y3XTV4zQkioNkTyhDacPRu7yIdmp1s89uhQKzGrE
         l+YoXtnf1n+K7IUUqIhvq3XgkOHb5ox71UVWaAjmshEPirhd8Nx3RUtoCuKcR7caji9A
         rrk37wsrE1NZo/Xs4pHRwinIU1RQya6H3iR/szN4ghEptAHvRvis9lJhPruAtUSukjSK
         kGqTMDKcSdi/I7DSCEYH3bL2fJcEZi9hO9Adb4HdqGDpnIAoyig35h6RAuXVAiAG8MFR
         r7Ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785942069; x=1786546869;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=z5i0kcxttlog4h9p4Gll70N/vEostWekyPEjeEzGUkY=;
        b=gHvvUG4TLR5gBy0enMDLfzYcryn4fhqzLWQetip0t5Cm14ppev1IYBwTtL1tG8xpn8
         a9AHT7C8I9/QcZEJk4Mf8WQHcoPWhtzaN5k2rikwrIXH1gOgaRAWGMsnS/M+IFWxiO17
         +m6FdxmL/7S51cMCXj9fO0QewqzAaNUgKGaeox9r8p9wSz8+qMRvXAUmCV/Oi/Ny4aI9
         r6EAhTHPpvQvqdBFjuFbI81+vbc387rtIAOfvzJrqaenXl57btZmCuS5ZZcedHi573CZ
         58DrlEmsVJhwMOelp8rmWMlAoPDHsLP94TWyzo28hgR0NzYOmB6xkj8uF4ZCPMBkUsDs
         r1Ag==
X-Forwarded-Encrypted: i=1; AHgh+RpcZR/KFN8I1RCcwUhArtzHefDg/RG53GeGOnRuXadwV2ExT2AAtDaQFSt3VX31chND3xLDj97J5+1irQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwLXz9tfXw+CxNgRVbiRKieqVmEmIg9a1zMu/uClesAL9osSPfD
	r7JUJsYHRhWy2a534AdvI98o+VW0tdOKiNVaX2ndeYWqJ4J7Q+9khLlU
X-Gm-Gg: AR+sD10ZFScCtTEVjvXSTyiJzrVT3IwePGSk/tyB/7m+gJvUzUgDrWcGts2FgDIXelX
	X+M4WXBLSaZAGrl2+9dtbv5SvmttiXgEkgwr2J8D6DZTblXnfIYocOg2+p+9a+XPI2lmzjbc0lQ
	7ur0wb3cWvcWnyWKluJZswNtVHShUR9QCfl7YhIsk4veU/TsHSRqk29JKS+hxBVn78pFfGtj8Qr
	KlUte6ctQFOIb8BpPOZA8j4c03bWkQJa1727NI3P9f/RhnZx8/YLtuc1uGYh6cUfOE6ZkisT8yC
	TV5figyxo449Ge+9SHC3NaoFXyuijzAkz4YVSw2LIqUlftbtRMOtPSzCJunQNqO9vQhetlxQKr5
	n4cHO58HzDOnd8Xt3H0zHTnd/ftL4pfkXnJvJgjeWx/YylBGl+Op61u3cMvAb+eTZPph7W9OZIG
	jW07Ah7tcULj3uDFgK6lfaAKDsvSYur30hIk80/c6N/elmuKgJ03f9iEeT44ghXtWSQp70HuHSI
	+Xh9ms027ha
X-Received: by 2002:a05:6a21:3a82:b0:3c3:791e:5e18 with SMTP id adf61e73a8af0-3cb85df09cbmr8984012637.7.1785942068906;
        Wed, 05 Aug 2026 08:01:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fca63ce12sm18114476c88.5.2026.08.05.08.01.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 08:01:08 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 5 Aug 2026 08:01:07 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Darrick J. Wong" <djwong@us.ibm.com>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Subject: Re: [hwmon-next PATCH v6 4/4] hwmon: (adt7470) Add thermal zone
 sensor support
Message-ID: <bd7b1dc9-239d-4d97-9593-1d1888fffacd@roeck-us.net>
References: <20260805-adt7470_thermalzone-v6-0-5605a5f95467@gmail.com>
 <20260805-adt7470_thermalzone-v6-4-5605a5f95467@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260805-adt7470_thermalzone-v6-4-5605a5f95467@gmail.com>

On Wed, Aug 05, 2026 at 10:15:20AM -0300, Luiz Angelo Daros de Luca wrote:
> Register the ADT7470 temperature channels as thermal zone sensors.
> 
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Applied.

Thanks,
Guenter
