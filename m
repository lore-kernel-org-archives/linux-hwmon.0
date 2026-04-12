Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A81A535957
	for <linux-hwmon@vger.kernel.org>; Sun, 12 Apr 2026 14:26:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776003980; cv=none; b=ocwMs5vVEGrIV36ZjvrWKAYY5cTaW/dTQMIyH+6OnLXiTSC5VwH2o5rX8arGD5VWliDcBPPoL7QTm1BoYcuWyjv7B6XOTm/ftwvg/doqQVu8AUzdMOe1MNE0sFfo/WypXd8TsP9Ly9b3ddh3ZznoC6oeK3fJaZ5xjA0tj4x36EI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776003980; c=relaxed/simple;
	bh=6jKgAUZPsLv5v+x8Z4Vem5x9Sssm6lpWvbZIsvK5XAQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=k6/iBn1frn0AxMreVB/EoEIhcM1MzOTXA+1QKSnKNQOLohttRW8EYnIr8daPkajBoea20qxeqPPJWVqKISvUEzXAya98YNZCt/pGJ1fUdJ97rxqe5hmUJ0OqfTWiU7axaXiE+bq4jeEHjVs1C36H1E2IeKvO52z0SbWRADgyj4M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=EpEY1qjT; arc=none smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="EpEY1qjT"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2d891442388so672489eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 12 Apr 2026 07:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776003979; x=1776608779; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=uhLvukBRNM2qXn4z3k2cluIj3cbPR3ryZjsLagKtXlQ=;
        b=EpEY1qjTeZj9eqZdYoMTCV/30YkYZ1Q2GLbGb01ouBUa192zFcUo+epVjn0GCPHSL6
         RAqDMrnMu5XBLyL3qz/LZwkE8/k+DDLHZRqSigdZ38s5gnZQ2yJCa9i1ncMVvJ8+LSP1
         zEVdSdpxira+JoN1bkA4RX6/M5zEdTWpP6u92Fje6Hy6QhvfgNToXbzE2hTWrLX1aaJV
         OTYxezM3FPM3rm5GxY+788sJolpX7Fc71tERFv9E8BOliGuqfXZ8ZtJDgabO2Q0zv7Hk
         BTqzUBMHDMh0xy1Fc0L3D4K6mbDcYF7r7UTtdNefqUJWgD3FjC1tN3Q9sAElA9PDRoWu
         ZwlA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776003979; x=1776608779;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uhLvukBRNM2qXn4z3k2cluIj3cbPR3ryZjsLagKtXlQ=;
        b=j8ZGoTvK7zdWoWob3vA45cVHCxu5anVij373nIRWTPGska5yBhvNcFdbxbT+C9ifm6
         8bzmZeRPR0Rzwkn7AFStSTNYJwnCQEgukFmc/EDF65kbswOwSpuOD8ar36Y8TpcQhTYn
         5Bu1PjAPkLnCQ+Ksuhp/KRyxl7MfZ9n8ZbrIcViokaChrM3Pi0H1/lXr/IClMHumV5lB
         BbpzaHrhsGSAcsKNDlhKdU3VSpIt+nOZXRXBntJe/yIy3C4mmUSFsA06/vibkfMosAis
         2ueyNI/4p4sEjpYN8z57R+ZGeRagmPuLHrfDuF1rVSgwjji6wlRjdhhxBCKBubIJ8sTb
         zlJg==
X-Forwarded-Encrypted: i=1; AFNElJ+LW8JPmOGc8xpxAf9C45fevcfcy7j61R/+Xt0HZcza35VSVN+SaJuT6Dhy9R8cZfbEYP3xROn30Hqszw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxzR1CRYqRV3H6qXpLZ0MXmfoI3b02zDe+sT16cpyaWKcsjji/a
	hfY0iuw1uiG6oks7KXhXgQoXw3OsNl2xqwdq5zyuEf+cBSqo2hN8uTHn
X-Gm-Gg: AeBDietNZNWkxz8IZXxwqsh1EETdzSnM1jYCCtOae5nnEAOjzxYSYF+M7nlO0Hue3bz
	y6lMuUXvEMPvFLfkATXa0ypqHkQNkfVdIFOaC88ZYTpyyE5JPGL+6XsF4GbQjqfpAlaBe1I2s+z
	MDoO7rtY6agmiY6th0Lk09fpCdmlMTsyKJrQZyyg5hekKzapkDIyX37sWgOiI5ndv3NNksPsjkH
	VBBoB0HH4YcJRHx4vKmSnzNZK5w7snbZiuj4/xdNzfOmff78uU08m3j0X4UOlPDDXRIGka3QQ7H
	yftRDXx8IzPohU1bc8VdIXgaWdaZFLfgM00epw6rRoZQE95NnRXbpVFB4rPtclXXPbgZvK2Rddq
	8swudEDoOuiKMsPmci0K7516Hpj3BLwCkp17dQPxlVFppsnbPSylzMYY/9TOBnZD57ZOqGF1vD+
	taZuM6Aw6+0NnvTbpF1fn7keT/5WhfU/6Ycayo
X-Received: by 2002:a05:7300:b913:b0:2d9:6373:ad1d with SMTP id 5a478bee46e88-2d96373b180mr41428eec.20.1776003978754;
        Sun, 12 Apr 2026 07:26:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2d55faab010sm12976799eec.12.2026.04.12.07.26.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 12 Apr 2026 07:26:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 12 Apr 2026 07:26:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc: Leo Yang <leo.yang.sy0@gmail.com>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 1/1] hwmon: (ina233) Don't check for specific errors
 when parsing properties
Message-ID: <5673361f-8b94-4616-8355-a24a201e1ecc@roeck-us.net>
References: <20260219141532.2259642-1-andriy.shevchenko@linux.intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260219141532.2259642-1-andriy.shevchenko@linux.intel.com>

On Thu, Feb 19, 2026 at 03:15:32PM +0100, Andy Shevchenko wrote:
> Instead of checking for the specific error codes (that can be considered
> a layering violation to some extent) check for the property existence first
> and then either parse it, or apply a default value.
> 
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>

Applied.

Thanks,
Guenter
