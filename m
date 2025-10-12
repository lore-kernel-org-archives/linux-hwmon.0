Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C419A2ECE87
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 17:58:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760291911; cv=none; b=gF3v98RbFeDF3UBuIf5MQxhNVzC+wMTU/u8DRHdqS71w8gQBk3yMx6tCkCIQDJCV0UvCA024K6ug762X8guDMEyWNygQGLlQVhv7DTv4zAx0u1t2iv7qgIIoOapXrhPIfiwHPs+r3e5/eF2kM8JRcvuQmk/7ySFdRpODTjlgFcI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760291911; c=relaxed/simple;
	bh=4s+gF/J790Cn9pggWv1hmT2wDXmwcmgRyJfiSqUlECI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jYCaWBEJETG8VqhWA7l883ZcHi7FvD24iHGehUly6omKG0LrOijMhfxCk+xVavAtoFkH2nkixssg6yVFv4e8d8Rucd+J7Qi0WE1WgZk515qw4iZPrVhmmd07g6cGZWYJMl6AX+xjjTq4lnWXklCblxH/Le1MB5+oRP+6JZa8vQU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=m3uv7OS8; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="m3uv7OS8"
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-77f5d497692so4394738b3a.1
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Oct 2025 10:58:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760291909; x=1760896709; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=64F5r2tOG3BpkRMdKwJdv92rwanay9eWarkctmegkS8=;
        b=m3uv7OS8tyvmcio1IQhE6HcbyqDd82AHvFcQ2y87b59LVvf556zgrnJ0QquQjw/f2B
         E+04CMUPLw8bf5OXMyDb4C70ChEhRwQiM9lwAaUs80b+kSJgUUqhaDli1MUh0w2R7n8H
         J7QNKlqiHzpiawBvSJ7qs0tojcmE1D1Y3nXEafdNnfuFe+yTygXgQeMujn2wLFICEjaM
         s+RUiOZbx9QMCc9zVhsr929WlbV8b0T7d795D66F47XCOxAQ9A+m2jfc18SCHvnXtWo7
         rAc5y0ESHSRS2NhfTSdjBKz3sR4I8ftj8FsX1E8NDiMNqBGpQnV/ZiGMVtg5XMreo+YS
         DcGQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760291909; x=1760896709;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=64F5r2tOG3BpkRMdKwJdv92rwanay9eWarkctmegkS8=;
        b=tkqoeLGJjHPAe1nkwIy4GIuSrbfK2I7E0L3TWzRH123cgOoTEpFOjKZVW+7zH8QhpT
         JChU7Hhtzl4nMoRPzGh9vYxUL7+38oL92FVIYHw8DHAbZnmhKl9quuLspqsx6658V/BC
         av5XnocZ94zwMx9qYyv6cEevSwmt9JHEDf4OETfEwMJENBdntwNWauez0kQfjAMKAh/P
         rNEAIEA3yCxpyi7S6L9iXGPZVhnsK//FhdZwR0Lbyd7+NRyN3kPGB1s7Ely8M0n0o+mP
         aLpMD6JKLUQZmo0Bj6K14MkNkNdU4cctpVqTx++NZqXO9AqQYHCZOd36WKDo0NH+rwmc
         XR1g==
X-Forwarded-Encrypted: i=1; AJvYcCWsVuB7hSF+k0lK3NfFCdny03FPW+Ok4FXPlDNE+b6lJ7t3htaKbm3ZQ05YhzjmMVNr/rWrF5dYgfGibw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzHPu4XA6am2WjDgyKtJ+1bLHAEEaoVRejN9Ey9+45THB3xUrIA
	w2wYoQvWkOBrsxBo+6Aa+Fl1jrnIBhJOn6NBdJehKHdFtJ+w7Qn57t4f
X-Gm-Gg: ASbGncszK3bDyswrIhR2MDC0p5ohz+N8Wr9QYLZO5HEyiJsoV9LuDGJvIJKNsuyViI3
	uwR6M/C6zyGVq0zwZ8CiMWrz3JyMouBvuthz18moEVMOpt2q9S6DY4VJ3tSGGMq/8taSfHnNK35
	SuLmeopwSigUUeAZMqJuFZGIxYDjFD/cqZbypw71BeIfnDazXXqxf2fOgtkbbsgXXR6E4pvLj9Q
	Q++yaLK2ML0L4WxblI9wa9BJNUkulxNvp/x9z4cd9LX3m2T0KQL1Rmmye4z5/XAoP7MrBH5AugZ
	xhb2i0pWxQFrlNzYJftG6bYFC6z3Kg0ERqKlP2HonRz12w97dM1iK/ppZYFTYc3EU61iWP6y5X3
	MdSDfAf4zbqKOfcHyliVlu0VNKg2tbjpVdBO9NYjrJe/97Cm6B5zOf9woqCWS6iaYUHioODHCMI
	A=
X-Google-Smtp-Source: AGHT+IG8nnQxDxsBVYzafksaEJPul0aKzanbkeJ7dpfTmGPVKK73tgD+8/uxJvZAtfTfdi4C6RIOcA==
X-Received: by 2002:a05:6a00:1954:b0:772:2e09:bfcc with SMTP id d2e1a72fcca58-79387c191e4mr21395603b3a.30.1760291909038;
        Sun, 12 Oct 2025 10:58:29 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7992d0e2c6csm8959672b3a.57.2025.10.12.10.58.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Oct 2025 10:58:28 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 12 Oct 2025 10:58:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
Cc: Cryolitia PukNgae <cryolitia@uniontech.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	dan.carpenter@linaro.org, kernel-janitors@vger.kernel.org,
	error27@gmail.com
Subject: Re: [PATCH] hwmon: gpd-fan: Fix error handling in gpd_fan_probe()
Message-ID: <f66fc8e9-1564-4c65-ad27-a7525a081aa3@roeck-us.net>
References: <20251010204447.94343-1-harshit.m.mogalapalli@oracle.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251010204447.94343-1-harshit.m.mogalapalli@oracle.com>

On Fri, Oct 10, 2025 at 01:44:46PM -0700, Harshit Mogalapalli wrote:
> When devm_request_region(0 fails to get a region regrion would be NULL
> and devm_hwmon_device_register_with_info() fails, best to propagate
> the hwmon dev to PTR_ERR() as opposed to region.
> 
> Fixes: 0ab88e239439 ("hwmon: add GPD devices sensor driver")
> Signed-off-by: Harshit Mogalapalli <harshit.m.mogalapalli@oracle.com>
> Reviewed-by: Cryolitia PukNgae <cryolitia@uniontech.com>
> ---

Appied after updating the subject.

Thanks,
Guenter
