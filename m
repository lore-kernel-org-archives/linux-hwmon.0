Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D3821E1E10
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Apr 2025 08:35:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744274136; cv=none; b=AlZTSPABLBnd1q1pwlD7gbilJbEbqYpwGJuqGHT9fRvtHrwbpw19PK7/h1ch8La8/kMrJExt/y+S1j09A/xZwpmBeeJJdJHclh50N/cEepDQwjuYmiaQW9QWR5AYuazsXAvA2oTYSsKm3CcnDlHMKl2RN6nSnJGTntUKkrA9PlM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744274136; c=relaxed/simple;
	bh=JdYcK6fAGQtlodFRUy0bhtgD36qMwbdQO7D7iUkLixc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ctqsA8nk0Vh928OP7ucNaed51KLBMezPIjadY37heicnx1IVITki6Wo/esOKncdMm+3Nlju9En2MjS7GvawaaA8t2ll8qrWI+mkWYusw11zt0b78QjOS/sBCX+dR/3dFVsQzsFudxlygdoQZV4OQSGXYw4J0aPxxMRwoiQJ2Dcw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=gXH9uAiO; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="gXH9uAiO"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-39727fe912cso184253f8f.3
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Apr 2025 01:35:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1744274131; x=1744878931; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Z1+ytBosE9KKYfsxuSA5vHZYEINNgxVHBZaHGuzR0zM=;
        b=gXH9uAiODbXDp+qnUSXfNyCE4ntmL9WYdUFd+WPm45iC08wg5wsX1NKmuoQn1tKp/1
         QI2tuwvA6uEF12QLS4Q+hnWYPP8fIRN5Xj5TNAIwoswW1IYD0YK03+SHfPN8grhV93EQ
         ViT6aznQTz7zAZ3UWfMEyzOyb8JpLKDZ8EVG9kj7EUi9Vv0hp2ZzcgzPQ6kRgTqZ/lxD
         pou3IZn3mKNVKe2NBHGQBr82MDt4XJP8qBP+r/lPsz6h2YydWHUTm0Y3OjuKecATTUWo
         rsbfAEvuFt09ZFyW39qZEXTAQIcX1ADiHExy3u2CalGnnIe+rmDcxV0b57/8WS4R5WCs
         Dh7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744274131; x=1744878931;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Z1+ytBosE9KKYfsxuSA5vHZYEINNgxVHBZaHGuzR0zM=;
        b=ApsOCJ9XLJgWygb54gE5KTUNPUYecaztPSmPUkPV8j25GgzcSLLyJCgEMbf5M9Ox+C
         Sr+OxWjEfBOOmWkcMjQq+UAVavI6llbXsO9h4zhoRcXrFKOrOzpjduF9VG4uqFfutEEP
         RqOfDiPZFJ6Z+78Wf/5su2QyMEISA2JhcbBZNAYj44ZZQVqK1Oh+U6pqce/rX2y/LylX
         jGpAc34eBLPvAZtyIPF2+9y0IHKih7ccboQoDpWwA2goX/5ersRXzUmRXi2tdf+K2rG9
         m5yBgpP+4xV8QYzQTbwaqovJ2Udw+Z6or+QRgZu2BeQWagvxf/hevDDVD69CpkG+kBDY
         7/Jg==
X-Forwarded-Encrypted: i=1; AJvYcCVVeguf+mqxEOV+JOYerObB29WUNh4ubyGwNiQDdomeY1eq+p2gOQ+P/cG3wBVnN8hvMkiVFddRxbkeRA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxnOrLVOsrF7ydwXfemS5EIDXyS7HjO2Fa976+6R8nnzf1gSrCC
	9/rI2Qtw3ll22TM/fp14I9mKTnDuPqUf3JAzEZlXBLt6E7DT/f3EIxwztZ2HFwU=
X-Gm-Gg: ASbGncs6UziN28z8cNNJCseFghsyr9gkP16fairEi+d39d6ujc5JpWzZYLJKatKXUVY
	Oz50IqWxLc1EYAVK20C67wd5HpjNEUSbapo8LFA1eYJfLVfIMWPvLiZAgnz7fiEwkPWqOwSeXu9
	wcvl0elomNOAEO/ScwNhnVrfxkUgry8zT4xZ+Ock9c7I5Bl2kooy1aH+napIL9mLCvceEXunG4q
	GTBR8uWnuNKCzn0e38bEMD8ba1xiQzd03NHmq0MfpAxfT7eaXB9NoPu1z8x9/RLvgIRaBUAwqmf
	iAOZw4z/4EbCihpW51ryrMToNgRgcuIslmsKiikcoNOexA==
X-Google-Smtp-Source: AGHT+IG4hFp0SZ/GX5y1K3OD+w9YXQH3jCqLKyFID+cibmYCTQbSECvA/Q29TPvpdqbyjEyE/E8lrw==
X-Received: by 2002:a05:6000:4203:b0:39c:1f02:449f with SMTP id ffacd0b85a97d-39d8f272aa3mr1264796f8f.2.1744274131466;
        Thu, 10 Apr 2025 01:35:31 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id ffacd0b85a97d-39d893fe28fsm4078162f8f.96.2025.04.10.01.35.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Apr 2025 01:35:31 -0700 (PDT)
Date: Thu, 10 Apr 2025 11:35:28 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Alexander Stein <alexander.stein@ew.tq-group.com>,
	kernel test robot <lkp@intel.com>,
	Guenter Roeck <linux@roeck-us.net>, llvm@lists.linux.dev,
	oe-kbuild-all@lists.linux.dev, linux-hwmon@vger.kernel.org
Subject: Re: [groeck-staging:hwmon-next 13/13]
 drivers/hwmon/gpio-fan.c:250:6: warning: variable 'ret' is used
 uninitialized whenever 'if' condition is false
Message-ID: <d80689a3-6055-449d-9475-5e8e4f1ddabf@stanley.mountain>
References: <202504091047.biuX8Kl2-lkp@intel.com>
 <82d98804-e9b6-458e-bb39-3a48c10e9f70@roeck-us.net>
 <2368483.ElGaqSPkdT@steina-w>
 <20250409160250.GB1506425@ax162>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250409160250.GB1506425@ax162>

Another option is Smatch.

https://github.com/error27/smatch

:! ~/progs/smatch/release/smatch_scripts/kchecker drivers/hwmon/gpio-fan.c
  CHECK   scripts/mod/empty.c
  CALL    scripts/checksyscalls.sh
  DESCEND objtool
  INSTALL libsubcmd_headers
  CC      drivers/hwmon/gpio-fan.o
  CHECK   drivers/hwmon/gpio-fan.c
drivers/hwmon/gpio-fan.c:145 set_fan_speed() warn: potential spectre issue 'fan_data->speed' [w] (local cap)
drivers/hwmon/gpio-fan.c:255 pwm1_enable_store() error: uninitialized symbol 'ret'.

I don't think the spectre v1 issue is real but I don't know very much
about spectre.

regards,
dan carpenter

