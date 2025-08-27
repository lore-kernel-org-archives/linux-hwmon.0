Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00F09273816
	for <linux-hwmon@vger.kernel.org>; Wed, 27 Aug 2025 15:53:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756310020; cv=none; b=C366OZUlwmawgCh8SqBSgFA9CKDhOcNzBJQM2KpP/Dhz5zkt9clSKSRGtJcmh4/puuFjWzvZCDuXG/QHjATz4xvWL+L2SpE0xE+Y0HZFMt7bRBbB5DLn0/rIz4jT73GuaDVGNwoAFTcjrhPC8YpW8h1L3dvTk1B7nQ607MQ2+7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756310020; c=relaxed/simple;
	bh=Asj4lSLCqDQqnrElN5lhJOs68oNBFwbaHdgSziZh0CE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=loHp5xcd3S17DqGqfSGgVJMZ/rdl1pxDrHm/j6k2OAEk4hUCUzZ8JOTHEsXe4JOUsezr4tYvGEIWeog5SyZWLK+yTnc/YKZNKj+/yIuCYXYGlXR0qOaxs8W2w456LUo/+5dbA0M7pv6aiv/0k3g+b1/qbbTs/wW7QYpoIAr251g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O/ZCWtNi; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O/ZCWtNi"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-32326e202e0so3920a91.2
        for <linux-hwmon@vger.kernel.org>; Wed, 27 Aug 2025 08:53:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756310018; x=1756914818; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j0jTEqr2Iwx3tIJIxmH5BMcsAUIkFFFFRmSaJuPTg54=;
        b=O/ZCWtNi8UdQfXZe3AfDsxnlfKTAK/6O/xp9dMLVvYl2r/KTXxAC+Vifd6RZb0Lhrf
         GcjAEInzHNZs+sXJLDpFuIqEEvFwrW5POMBOTBmbQv21y9d+swFOlarO237s/iExNebU
         +iGLSYnA4UthSzRMdUJR549JZgYqgA0WhvfOK/s/+7HJFHPVZP6edJ3ZVpRgv7JxLhmS
         y6dEtRnwP/TVnHpsfAiCKhN0DnCnb1lRS6u54FI5zxO3D6HGPNJ15gQpLJwwiJVLIXVi
         aFN59KcN9T+NcADwXL0W+aeRJyXqNT3DokaPU2zAxQCdk3res/tJvpRXULbCKLC8/4VW
         1F/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756310018; x=1756914818;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=j0jTEqr2Iwx3tIJIxmH5BMcsAUIkFFFFRmSaJuPTg54=;
        b=JMwLBvSkMmve1/IyJtPSF0Iy3AzkKSimoamgEVJ3X6M23wnMDEgrS7GdbsJ0tG6A/W
         CjYAwHFfvla+OZKQ9ECRrIcFi4N4UaT36WBSDlTlnO33n0uQfrkzzFBIDvxYqs8IKVWR
         B3uBL/iDqTTdOA+h3d1LxaZHNSLjpcoUmprCJsG6gbKddD9QgmelFJfuOJNYEycNfQKg
         KALzOWsgfGz9SF2irzl12cHhQlRs7gTgNJBSf5pRDGHAtABUpTxSMku+SLtA9XvwRXd9
         dwXdmNBRB3utKJUuOJcxT3QhCWNtK9lGY+BPbkOYrkn9ZhOhqOiWBElU+o/Efr/tMBux
         /sQQ==
X-Gm-Message-State: AOJu0YyhcmburY195kjJNImwk0rm5VurXTaP4aS+Ii+EB3wXpl2+ikmo
	y9VWSWUB+cOO+fDmUMq8HRNBJou/4UHUGrLJpuxF9EOA1WdyKDIJJWYNaBRdeA==
X-Gm-Gg: ASbGncswlD1h8QmpUfYdDCbrXeYVlVCED8IyMyWBxcczunX17/xQeG6rHCZTrxQBtew
	hXd5Da9Evm2CC+gYiI/PNKS0pNol6fON2LmYyKFfhh6kydMWbdsA4emHnnmhnTAd+FlRJyjrAZv
	0VjjmopX0D2++Z2Oso7zmW7BWifnoEG4z3zLO6M5Jovw1p7aY6N3XU5xz+DUrrDquxTRsAiTK9K
	Xxkq6SUt74Wa6AzzQ+UMGrYyRDP7fTK7MfTkiv2kqZpug4JJwsNNo7wkwrDy5r+GEEuGp38lSkt
	yFFVbwB2qpiq3nNVh9ZQqcRtD28Ypg89a7+bll/x83ebNvht23U8H0RBjcdRHYeSXnEj0YZ1hwo
	DCg50d+nwNnMxm5+OhGd+CObJ8Uv7ym6U+Jg=
X-Google-Smtp-Source: AGHT+IF9fyiWpOtQ5dyBKAWQmrdB6brBarEwHxL1uesxZGWBIn88kWnGf3PhfiaB09vbE8rO6hLOdg==
X-Received: by 2002:a17:90b:48ca:b0:321:b7ed:75f2 with SMTP id 98e67ed59e1d1-32517747907mr23697572a91.32.1756310018034;
        Wed, 27 Aug 2025 08:53:38 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3276fcd336dsm2375614a91.18.2025.08.27.08.53.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 Aug 2025 08:53:37 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Wed, 27 Aug 2025 08:53:36 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Jean Delvare <jdelvare@suse.de>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: Remove Jean Delvare from maintainers
Message-ID: <dd035a49-e9fc-4854-a402-c377efe2da7c@roeck-us.net>
References: <20250827111344.0debba2a@endymion>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250827111344.0debba2a@endymion>

On Wed, Aug 27, 2025 at 11:13:44AM +0200, Jean Delvare wrote:
> I haven't been active in maintaining the hwmon subsystem in the last
> decade, so I think it's about time to admit that I do not have the
> time for this duty and update the MAINTAINERS file to reflect that.
> 
> I would like to thank Guenter Roeck for taking over and doing an
> excellent work for so many years.
> 
> Signed-off-by: Jean Delvare <jdelvare@suse.de>

Applied, and thanks a lot for your help and guidance for all those years.

Guenter
