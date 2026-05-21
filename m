Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6A9863D79E1
	for <linux-hwmon@vger.kernel.org>; Thu, 21 May 2026 13:45:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779371120; cv=none; b=P0A24T8+K4/qtrJKuzZWoDo7qdV7oc5+O9nIq/gtsYsPh+tlHw/SGxJqbzWvhgGZhKJhWSxJUs8dlCPMdlgX6BoXKrL/V48wRHneA4Bs8jhnZVIJra1pBWFt2OB07/r9Pu5iLiyceX+dYAQI1GbCEEAdZBUCuaTXABFPKEXNBLk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779371120; c=relaxed/simple;
	bh=/DEflrKuXkSN6SXy9TR71fPfn8N/sM3Ar9dVtZ92DNw=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YNGdOfsOOBRXGjGh7ipvnAYNYvX9aTNJtZLX8t+vSqD3VXVulfLU0DIe+xqFeVkLd+qpcW6Jx2El1shhdRfIzRmq+EcaMbUQWid+pMiGyw6z/fnY9OdZERjgxQf7UM77pTCBqY24cN7gUURfp/nshiOacqskSwWpnu2vS0okv34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ahO7fwAK; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ahO7fwAK"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82faf871346so4770015b3a.0
        for <linux-hwmon@vger.kernel.org>; Thu, 21 May 2026 06:45:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779371119; x=1779975919; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ASnpw6D1CgJehkqtVhHFBNRmAKXhCA0vpBuLCSePIkg=;
        b=ahO7fwAK/oZgDDg3Z9akIctLxSWmsGb201qgq0pSfkf6TMBaTNgTmHbkZftOGSQYRd
         6t1uLPRTW0YSVrO5TM5Uq2pKfQmE4qKGnaGMhhXSxg7IgTVvEYYv8fTjvYdO4ioNeLMG
         oZPG7xJyECdjlCVMT/RIYiKHVm3KLp2Zf10XH80Vffe/Saq9tPZEMId3hG0C6wbDYM1m
         0sIyMqWVLalyInBGKnugZy0eANBkcc1Wewqk+aHzCGtjqHx3lGTPEKyKGygBKHasm6LY
         tV4lOLBWfcplrZsmv2ebvrpBDS2STZRk07nHCoSptyjLJ65pLGwCKfSvL8hbcyn41BdW
         peUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779371119; x=1779975919;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=ASnpw6D1CgJehkqtVhHFBNRmAKXhCA0vpBuLCSePIkg=;
        b=U/J3nL5X9foUCKuVUcMGJtKGXvCsbmLUjQUW00qigRmL7dxQ+TAOXms4uv45t5oFmv
         /oXC+Ja7BrJia1EtOXyySUnIIxW5e798MwCskexNl0W/vNzDEdisIuNBxYLVHsqUrpTv
         MBEZsTyG4D0gXXbzQgptR+xv0zuNObe2qGolMFPjfUpa+YDHzqkpqNkB9SLl8QlNFjcp
         59CKczUZWPERyBx5zKN0zGB79Anm1GMlzfbZqVKqbqSC2sRL9FQvtDBcJTYmrin11o2l
         c6lP8uXe6oAQa6HtY65Dy3iZF6CMJJw65VBTpkwrZk05ZmxXgIlTJY6x5uyFzpwYcCnU
         u47w==
X-Forwarded-Encrypted: i=1; AFNElJ/g5aGGBmfv3W6qjOfP7Bt2/QrsL0JQaXgWoTxrhCRnfMo1MQf2cVbWs4SQKGfKTc3o8fBUF/wwSXfHkA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwBIJptHdlmmvKadITaHrB07VG99DzPtA/2MIRwzYbX65Pbmyya
	raImD1JmIxTcKog+VqvN4Ypc2IpG85hekthIYtQCMgRKHYXakWOTyn2k
X-Gm-Gg: Acq92OExPXHulfMMu1f7xBuMXwp6e2z14SUsMEuym5MeKdd42XWna6CHeV33cgTDbsP
	895eroirvVqshjNxWsrLZRRgBSzofUjfd2WC8E8b93sFORXHgBH9dVIUKg9AspC2ewA4LIYI47a
	R54otChMuCdp8RNoSYVsdNGODSE74XJupSeHjXpBFUsmEWYAUi3SsTUz/9teJsLyTaye3r8M+sD
	QpKc2k4Mo+QwLD/OKiWGUa6O02CZzefSesEHDZNF5wG950MTU5QEzk/a06FtI5H8FEZDvlpXZnA
	e0Xh5mMbwTAukhHkV/1L++cVV44M31w10+97swlutnujFRqUJEbptJHh8Zlr7pziIuxloIx5kz4
	ocwzUXSXkvHY2V7+/E+FO8qIbECb6QlpwoVnx3aYtLq9tZSqWMC+KlPlaJKtg/+l1AF18BRRbBg
	hxGquoLsYfEAYhbyoMcG5agTQBwi/7XZl3YBmlqR/yh/r0gP0=
X-Received: by 2002:a05:6a00:419b:b0:82f:1369:7268 with SMTP id d2e1a72fcca58-8414adf69admr3300026b3a.30.1779371118605;
        Thu, 21 May 2026 06:45:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-84154a000cdsm1232585b3a.17.2026.05.21.06.45.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 May 2026 06:45:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 21 May 2026 06:45:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Kean Ren <rh_king@163.com>
Cc: Mark Pearson <mpearson-lenovo@squebb.ca>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/2] hwmon: (lenovo-ec-sensors): Convert to
 devm_request_region()
Message-ID: <69ebb33a-25f3-4106-95b4-bf70476c9b84@roeck-us.net>
References: <20260514011411.4167069-1-rh_king@163.com>
 <20260521035228.533317-1-rh_king@163.com>
 <20260521035228.533317-2-rh_king@163.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260521035228.533317-2-rh_king@163.com>

On Thu, May 21, 2026 at 11:52:27AM +0800, Kean Ren wrote:
> Replace manual request_region()/release_region() with
> devm_request_region().  This lets the device-managed framework
> handle I/O region lifetime automatically and fixes:
> 
> - A double release_region() when probe fails after acquiring the
>   I/O region: the probe error path releases it, and then
>   lenovo_ec_init() releases it again on the same error path.
> 
> - A release-after-use window in lenovo_ec_exit() where
>   release_region() was called before platform_device_unregister(),
>   leaving the hwmon device active with a released I/O region.
> 
> - Missing release_region() in lenovo_ec_probe() if
>   devm_hwmon_device_register_with_info() fails.
> 
> Remove all four manual release_region() calls that are now handled
> automatically and replace request_region with
> devm_request_region, use dev_err replace pr_err.
> 
> Also remove the now-unnecessary braces around the single-statement
> if body.
> 
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Kean Ren <rh_king@163.com>

Applied.

Thanks,
Guenter
