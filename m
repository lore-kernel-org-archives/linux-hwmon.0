Received: from mail-pz2-f42.google.com (mail-pz2-f42.google.com [74.125.228.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 862C830568F
	for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 16:48:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790268501; cv=none; b=n/S4W6hmKyQz0mt+2Yulpw2iH0O6Y5Z+zZVwoluIwdu6zdMGv+146vU5AIsRPtqS4X8k/gLpr0tCMgamcS7jflmZk97ssjW7DQQ32GwqF/weg9rreJhTwW8dXQH0drmizVKFGgLRmC9XJvpQQS2VtUJmH3ooauUofsKV7lw/qoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790268501; c=relaxed/simple;
	bh=09gWLrxV9B2YL08j33NGm5uI7VMhjtGXOM0U4bCV5Gs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jp3yOBtiAG0QvPY6n6GyKhjNZeoIxdeMrfOA9BRo4HCtPf19+52zGBn3JmCol6imO/15AMjTwENI2Inp4/qIRySe9UWhud2/JEfPeEQ8FFKRbUejSixcVPDGSYQ0Lm2Bc1o49TOSUaC+d9fJkZxoet0+OkQsvzBXr/jJGl++lAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Zit9VWog; arc=none smtp.client-ip=74.125.228.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Zit9VWog"
Received: by mail-pz2-f42.google.com with SMTP id 41be03b00d2f7-cc4c08393dfso1564116a12.3
        for <linux-hwmon@vger.kernel.org>; Thu, 24 Sep 2026 09:48:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790268500; x=1790873300; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=vcbua5mIvOolDP5npCwiYAbITQjIUK3wgIKLBNoELyk=;
        b=Zit9VWogUurDYmJnES1DV2o51mAVb4WfWQRO805+UtMdRTDq1OUmqDW9fl4LTHpLLJ
         5qP9o1NqZnWEIoo6n8BJe66bVhyHkQPvVmbEjk30uKBtGhxFPK4c/I8cKHeYJCrg1BmW
         ksLitFj1o59y0Y4t4ZAhA+0H12YTcotc+3lNyZFUtpNZUPdJ1vy9YBRhfMpKDo6QTJCu
         72NKJ+ZaB5sx+/FtZocryqrF+1UqEWq+syn7Cci0Yy5+nD0ZcBnkShISzzug3Hhsi9wP
         b/OXovt+uzsXFuV5c7pBc7Gd3KOyyUxpNJdXCfiXSweo6nHiY3s/LeUQvMb9wSMxmig8
         6cVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790268500; x=1790873300;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=vcbua5mIvOolDP5npCwiYAbITQjIUK3wgIKLBNoELyk=;
        b=VroOPnlj3gFlM9BSK//ycXEgFYdCR5YASx6xt0slLpmMct8HY5Zc55ucJd5bs177g1
         wjKfx9NZfogZNyFDL/pjOtQ4PHX89HWpjw0QdZ159CmgkP1BVSnNAoYiAMmauJVh/fcc
         w7glGb8tRuGWbNLmu7/gbFjmcLdjS52B5zYs1dv4yewvCGZ/+WXsrH/owTb3D/0EhT/A
         qXNMU45ww3hSRIO5MpJz62Ixa342I8VyGjHF2Oal4cL74mDOAMybV+PDuf+YfJJnele0
         cbqE2ArGxxFV1K6h7gesfPlczrlWd26dfeOIgOTzFdnQYHFF/uKO0sp759E5hqE+Nh8d
         uHGw==
X-Gm-Message-State: AFuF++nyERiT2wVRGwK4DWIrrfFcCulVFqgph4sJWnGPB2XLnCvtQGUT
	jwaFsC+yBwPlZ5qvkey6rkV4yAd81blzIKt4suPyFm5x35h4Kq8LO5Gu
X-Gm-Gg: AYBFou3RZf/eOY+Btddu6TuxQpSrQoQ19IGSWdislivNMJlkm6BJWSr1804tTiaV3E/
	DAQsyxl4InL0ZAX3oXn2R3tjk6Hc7cb0JbHZFUS0t3jTvXXq6EMhrLgEkdEp2OCoh5TtUszDHN6
	QBbqNEoKTN9UZeueI55FiR0KEszEv93Pge+dRiZD3vpfDPFH0RI0hv9iit3Mox1oHRmuaFspq5k
	dFHK+IqBe6H9NHx4p+gkhAf/XgJuOqoseZTb+vXcMhP+lDArGqOo+xt0EO/aoYFuqo0C9sCmgJb
	w15dWL8jlH7A4fllZA+KQ8gDVDeBSFY6RA+TFzsNTeRuymAgjCHnJjW1vPXH1NXTjAFco7LTu2a
	oa8dixgLMwLuRyNpx5ydgk7W9Ef1lvpmAIWDmgKbU6S8AnVX9jT9apg+U0Q57MpykMbisF9JN5f
	WwjX5kk4/H8jWOYkt6nlHybq3suKa90RhRUBRrziUdoCIg03MbcHjZVW6Ex7Y4tVSzGTQTVnHps
	+Oz4dOcd03J
X-Received: by 2002:a17:90a:1108:b0:3a0:9ed5:5420 with SMTP id 98e67ed59e1d1-3a09ed559a0mr1484080a91.44.1790268499752;
        Thu, 24 Sep 2026 09:48:19 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a09733f48fsm5863409a91.11.2026.09.24.09.48.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Sep 2026 09:48:19 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 24 Sep 2026 09:48:18 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Ridham Khurana <khurana.ridham222@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	Shuah Khan <shuah@kernel.org>, Jori Koolstra <jkoolstra@xs4all.nl>,
	Brigham Campbell <me@brighamcampbell.com>,
	linux-kernel-mentees@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] hwmon: (lm95245) Fix negative temperature conversion
Message-ID: <0d7f2c30-a775-43ce-a74b-a2019558e5a6@roeck-us.net>
References: <20260923172551.1593798-1-khurana.ridham222@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923172551.1593798-1-khurana.ridham222@gmail.com>

On Wed, Sep 23, 2026 at 05:25:48PM +0000, Ridham Khurana wrote:
> temp_from_reg_signed() uses only the high byte when the sign bit is set
> and drops the fractional bits in the low byte. Writing -500 to
> temp2_offset stores 0xff80 (-0.5 degrees C) in the offset registers,
> but reading temp2_offset back returns -1000.
> 
> Negative temp1_input and temp2_input values are rounded down to the
> next whole degree the same way. The chip reports -0.125 degrees C as
> 0xffe0, which the driver returns as -1000.
> 
> Treat the register pair as a single 16-bit two's complement value.
> lm95241 had the same conversion fixed in commit 0c2a40e2fe4f
> ("hwmon: (lm95241) Fix negative temperature results").
> 
> Fixes: fffd80ccc1e6 ("hwmon: LM95245 driver")
> Cc: stable@vger.kernel.org
> Signed-off-by: Ridham Khurana <khurana.ridham222@gmail.com>

Applied.

Thanks,
Guenter
