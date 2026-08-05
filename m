Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764168632B
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 09:25:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785921947; cv=none; b=Cn5G4rI7C81TeGSD4m9R2xlFPesoYD+dxaQiMzkI5m6izkWAAppSl0rDkvoBL0IKMkKHqVlFATe9D8ZNBmRsLEc1rcSSosebKq9IA9X9qbgx5WDz+e6CydSWGTu5Wf0DICNfqKF3R3yTp0oVTF67BiWXT0H5w6BbGTTUA5ruIZE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785921947; c=relaxed/simple;
	bh=8SDk4AZFqr4bvE7j9qZin0msYPFyFjjLWyMcw+BGGo8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OJP5cTet9Exh/npOi04jHgs18kjT2XmW8nc06tTyXZiKQmkBozRbIKIAHc+MzPv/bBpzbk1BdrWe98zK3xC5Uv/2Mt7NKyDc98dM7nzS8hP4R3piveoSE5ElEmrtrktlXcUGyEZ+iu5aeetGEBs3IL4lRMd2DZUgqSlNdI2FlN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ECoswws0; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ECoswws0"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4921eed3fa2so5871675e9.0
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Aug 2026 02:25:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785921944; x=1786526744; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=xSgtHJ5ezyn3IKfrYTZ3HqkxVqTu7EDx5YAFUMUUBo8=;
        b=ECoswws0u+zBPXaWvOs8s3Qvd2+gSCPRQcd9wMFyK+kw3poCIWOG3uwPHFclX386+6
         owJiCKOaji9lksbjP7ic1Cn7UuTCY6VZkeMkPXqYB66+pb6tFBoyCAqlSa/pNm7tB99D
         R9JHNuk0DcZC0VqdccSQtJg8SvysJEBzI5JgL9Ng79OBOFgUTDcZjt2U2JTtJ1Wk3P8o
         WktBzVox8tFVhjC1ta3d5kb7aVGuE8HonyNwNASmrDXREboYm8qh2nbzIWH1IW67DpAV
         FzGx8as8jR9huSA+FtdjZUZDPJeZPxSiV+qv9DXf1G9UMlBg4rbajtKDcJytQjSqqPqi
         3gUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785921944; x=1786526744;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=xSgtHJ5ezyn3IKfrYTZ3HqkxVqTu7EDx5YAFUMUUBo8=;
        b=MI1GM7rRiK4Z5XKS7AVXmETBtf/rbxeNdavThUkF6j2Ta3aT5Zm5LlYXlCdjBsCiPe
         CMPO/9576qHNw+L7c3nJAsDtg/1HkYFiqn8A7yJhxMIossrw30m0of45XwbX63CDq842
         PhFdBWJpOuxaJnaUKii9GYv5ESnNEJDxdj9T4OTc082FtGUYcIUu1xt9kSohbiu9HLRV
         qlvPizXDeerfqX2FQL4mWMqwhapB8HmsTGFtLJbQmwLtGv9MbdBQbr88SF8eCC62LFMI
         O8HN081PCb0A/HU9bgyz6uQbLl/WTc0l0tFyjwZTsxSaxdhpE4CseJKcCqo+XJLx/MPd
         k5Rg==
X-Gm-Message-State: AOJu0YwX2v2YmEAcVHdPepYPfTvDfYTYUNavVhIgee8PMqbDkUMXpsI1
	KSAC7TmpHTwZCryDIm3j56uIftB9ogA3eN6DyzzO58JucAiiy+f1EVD/6iXI1zTC
X-Gm-Gg: AR+sD11QrtBoKCP7MxX4Br8Yg/R3OnTnzDMbmlx8oVmHPr6cEvzqpshls441g69hMKB
	WbtaTAW/nK82pPQhRbb7xdM1SDuXmt0RCTfZgMD+m/RTbti5RbRVdpHMFhfZiRvsFC+8FgR/7UV
	M9XUsDZiP1EhxUWxDWuZRKvUbhwu+EcYaIus4vYxUyoCLzCRJIo3i2tU4NFocL+gwbkLjumdbQX
	O9KNq5cFPnycFHfmjh5fSBMs4l0ZILfHEWUK2pENpfZTedD156kTnHt8RKJc2VOayqz6t+4GHM5
	MgVzFnCRVyV2iEI/ws3d9tJ5Z8Pl7pEQDs9YbGOz9B9qWktH5yvPHMTTenPn8RGHWHTueQJ9wUY
	aRhdbQyI+Pvn2x5GYEmpco1T3HcB7lQwCqfh5LfgbAHxsQi6yo/WoeBaZAz9Zr7gKvwOd0ujA4m
	6RDfb2ZorhiLqxk59p2O9E+rKDOQU5HYiH+SefmAROyDJIUqb21Mrikm72bOpqhek=
X-Received: by 2002:a05:600c:8b35:b0:493:c634:952 with SMTP id 5b1f17b1804b1-4994e79e668mr56915185e9.7.1785921944311;
        Wed, 05 Aug 2026 02:25:44 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fec23299esm7237242f8f.21.2026.08.05.02.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 02:25:44 -0700 (PDT)
Date: Wed, 5 Aug 2026 10:26:54 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>, 
	Nuno Sa <nuno.sa@analog.com>
Subject: Re: [PATCH 0/3] hwmon: (ltc4282) Fix issues reported by Sashiko
Message-ID: <anMA34nFCvAQUk6V@nsa>
References: <20260805005721.1566034-1-linux@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260805005721.1566034-1-linux@roeck-us.net>

On Tue, Aug 04, 2026 at 05:57:18PM -0700, Guenter Roeck wrote:
> This series started with a patch fixing a potential overflow issue in
> maximum poer calculations. Sashiko then reported a similar problem when
> setting current limits, and finally found a problem when evaluating
> adi,current-limit-sense-microvolt.
> 
> This series fixes all those problems.
> 
> Note that Sashiko reports more issues in this driver. Leave those
> to be fixed later.
> 
> ----------------------------------------------------------------
> Guenter Roeck (3):
>       hwmon: (ltc4282) Avoid overflow in maximum power calculation
>       hwmon: (ltc4282) Clamp negative current limits
>       hwmon: (ltc4282) Fix parsing adi,current-limit-sense-microvolt
> 
>  drivers/hwmon/ltc4282.c | 20 ++++++++++++--------
>  1 file changed, 12 insertions(+), 8 deletions(-)

Hi Guenter,

During ltc4283 sashiko's review was clear to me that this one also needed some
attention but no time for it so far. So thanks for this.

Also, the clk_init_data remark is very much an issue. Not sure if you
can fit that in this series. Or I can also send a quick patch for it.

Regarding the series, just one suggestion from me. With that:

Reviewed-by: Nuno Sá <nuno.sa@analog.com>

