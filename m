Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C15A725B085
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 00:58:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785200305; cv=none; b=YUG7mSskON0ZOAR/tSkLP2ZI6TNE/BHEIV+GrO1ud4lrx1fW5JuaRATUbN43QbHirW2s2D5Yp7b9/RC/YwVWfxEo87EMV70+Mf6O93m+8ZuVRU1Vk7cguAJELeVWW3+IkxShLY1WIKp1DMZt2sFf375sFihkgRC42eNKJJu6hUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785200305; c=relaxed/simple;
	bh=ySST0LFP9OmyKdUqLB9//iIJdkpY+v3safJgVKKKvmU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cTfS3qQ2lTm7qjoOFQSU1j9Rcotur9BwBagEfMVlpPLJgLsDAR1sU6KLqEUJqartgWW1SoHdbvXR48ydVSEO5SqdZy6gzxP7PAwkURwPjAkWaZgRExf+b9m9Vfj2O/NR6NrH1brd4OBSV/SoY4lQP6o/iXFMZk1kj9NQuBEwv7o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CJQxR75v; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CJQxR75v"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2ccf2360620so30996605ad.3
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 17:58:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785200299; x=1785805099; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kwEJ2f1JQkB6IYpr0QmT7jf33LN9NwJsoehc54p20MA=;
        b=CJQxR75vxfgJuV44Ry4ciAWPndL8obByIDHA5I6U9c1SrWg5p0s7EvsQOqpcr/mAF1
         uxgamb+rL5edFyPgs4FhCHQpSeQMRElwY7JR5D93qOoIhugFkOsgSiJV0DpCzbGHnAIY
         e+ALuItWxpNKLQhQHE+b/9cMcoYjnO80ZcgAKSya2eY8qDKIv1TTkgUGfkKH6LASpFHu
         JnkOn5DGgH6ZlE6wzBE9jl8+UsDmFJRV778kWKfI6jLdYLd3kkww54KEZQ3nTHgxJjZF
         NEfiyILZgdSutOGSgVMx5a9Hi4mukklKxFeZi2prLyun3EazQ/r408N/zTaMv9R2Z3If
         LngQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785200299; x=1785805099;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kwEJ2f1JQkB6IYpr0QmT7jf33LN9NwJsoehc54p20MA=;
        b=BHyVnrKY7r7MA3ir3YSZfHC2WuVKFfQevgT+gvqeEeXMxXzuQLM6LxByrnxSiay3AP
         ij275cBF+h0iC4Zv83YgwQcvZAs8jNNQJ/GCjStd+1t7UyZSfrfatQaWP0N4I8OUl7ZO
         cAM1vO6D8DKXZPbCs8NGvVNqCEGOC/a2Vdt5Cr/drbSkstE/UZ7DkNWIQh3jvBEHPVoq
         g0dTq4OAqq7mHsd+C9JpEw94Izfz8TLEHX2eK7xgbNL3Vwep+l3wNsJxZoU9OxRbmjnm
         LJAeZWbpaifnoVDFjk9kFLaPcY0XTfMgP/fq3WIVa0XptoKRFhtjR/kV3HpZUZ8OCbGf
         JlKg==
X-Forwarded-Encrypted: i=1; AHgh+RoiprzMfw0M361IaIamIRMkpFQGZFsHJ6bTZgyrkhoZ21MhaJFKMjvDcpUHc1l8Opkly+HxJXwct1z/JA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzEp1LEd+NCNt37V2zxgXXzmhlV+Fl5FSzsWMhjIdGUf5+RE/5P
	3czeRfJZCQfj39BF96BBc6BsRsNZxgSIV9KJH1+bx+ADHNz9r5nVzfXk
X-Gm-Gg: AR+sD12YgHk3dmAUrkXqW0szTVLNJa2S0TLOVDHtk/Z20fTyt3rvMTTUUvZvaifCMmS
	tyOSgEA2Auh29E4rtv1OeOPOWNloCBqQkJhCLjVeq8awE/1zNmWUOeju9x21OX6Md30aTsQQs6u
	1DtLh1P3LAh5b1DZ4PXF02JmhVmxgi7zet1BgN2IK+N666H+AVnckWKNZVTXJsCUUVSJ8P0tjhQ
	8C9a09/WDPeOQOmxpIP06JPddyCniqjmGfP8swX4vhWZJorUV19oCUB9nbvipmfY1CK6jElRRkO
	rEaVgcvvMqwXyLW4pXxtzXVhsl+ONzpmEqSUQKKMjf+MCJHylOjKHSoHhkVHNUvL3Vm1k7WCIAa
	tIhbrwlEJnMdB+zE155kkLPWUtY0YkGrdSjEEfsp/dxILGJFXlsRcHbpYldP/dpAaHsauT7RpWC
	MKyJh7qoqOuTrtmvo=
X-Received: by 2002:a17:903:1ac6:b0:2ca:281:27f9 with SMTP id d9443c01a7336-2d015c88577mr2059685ad.27.1785200298918;
        Mon, 27 Jul 2026 17:58:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bc502sm41887235ad.54.2026.07.27.17.58.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Jul 2026 17:58:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 27 Jul 2026 17:58:17 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
	Andrew Morton <akpm@linux-foundation.org>,
	"Darrick J. Wong" <djwong@us.ibm.com>,
	"Mark M. Hoffman" <mhoffman@lightlink.com>,
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	sashiko-bot@kernel.org
Subject: Re: [hwmon PATCH v2 7/8] hwmon: (adt7470) Fix divide-by-zero TOCTOU
 crash in fan speed read
Message-ID: <0ca13015-87f4-41c5-bc01-1ae66d8af721@roeck-us.net>
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
 <20260727-adt7470_fixes-v2-7-598e38a46ba6@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260727-adt7470_fixes-v2-7-598e38a46ba6@gmail.com>

On Mon, Jul 27, 2026 at 09:22:23PM -0300, Luiz Angelo Daros de Luca wrote:
> If the fan data becomes 0 between the FAN_DATA_VALID() check and the
> FAN_PERIOD_TO_RPM() conversion, it will result in a divide-by-zero crash
> due to a race with a concurrent update of the cached fan value.
> 
> Fix a TOCTOU issue by reading fan data once.
> 
> Reported-by: sashiko-bot@kernel.org
> Closes: https://lore.kernel.org/r/20260727034929.E29B71F000E9@smtp.kernel.org/
> Fixes: fc958a61ff6d ("hwmon: (adt7470) Convert to devm_hwmon_device_register_with_info API")
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Applied.

Thanks,
Guenter
