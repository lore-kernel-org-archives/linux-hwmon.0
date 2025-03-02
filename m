Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 764C4111AD
	for <linux-hwmon@vger.kernel.org>; Sun,  2 Mar 2025 16:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740933956; cv=none; b=UGF+Be1qBHL1hTInQH6zvgtPOc3NfBns+wL7E9KN+gXkI5s6LjUpSDbbadSlEaHTKQMqzPfHiW8wMPZIZLxF1qRKKGtb6LqqDK8mqqo4x4QNT28NJW+JyBt+ANZv2yO/4xq9sPWMvKgUEoVqvFj5dxPfWv8DNKR26Ru7JRVKyZ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740933956; c=relaxed/simple;
	bh=K2Sjlwt9jdVoHje29XwqXu38TqGwhtT9gS2Oworq+Wg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=bn6p+WnH2cHPLejBy+qWMrMOvS7M38Vhf5OttGLijPcYNbo19hvOuhR58pK3ZcOLuRgk6YvXQVsewLBwn/E7UqjV0qRBmIbFXsV83ddH73wQsRMqjUzQ9EBVRsjujW8OTM8I3FwTd8P/0CIbvd8QZR7iOIcgGGJN/kVEsNOhVsM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IWL48Hhl; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IWL48Hhl"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-22398e09e39so10695455ad.3
        for <linux-hwmon@vger.kernel.org>; Sun, 02 Mar 2025 08:45:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1740933954; x=1741538754; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=/f2T6fKkvvYPqeruWN21Y5lSw3SBSszoXt5HXjDFLGE=;
        b=IWL48HhlyUYbG6Wxm0mYwSLIJha+uOz2di3iG0xm3seQ1I9ugRZlZk+BQu0iNf/8s+
         /F4ZRTGx6m9KXLI9CURjWQ12nfXdBsZwKN4YBSDmKnv0RWBSfZw9koqer8xA3tYeL05s
         msG3rJo0090EtuUw8K6Cry/G5Jr2pxbQ4rWQ0d9YLVW8zjfhFro9G6HtUfTaDI2jwB00
         MT+gUp9/MyW43U5p4HfWjWvMuA94NHWUrq99NdR4J+JgUWTV+4EYaLK0/hWGLcDVszMP
         OiIfMG45PQyU5UedDTH6OXaqt0E/IsZO1OdxNEOok73Yw5UxU+FEBha6EIHB9AV41xLo
         Y+6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740933954; x=1741538754;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=/f2T6fKkvvYPqeruWN21Y5lSw3SBSszoXt5HXjDFLGE=;
        b=RsuY0hOf6kPbFKIkdTh1K17Kihfxshc3etVG6SlkvJP0Jjb6879WG5yIUelEHJWoD1
         TB+OKA3Xsf4ITFKZM1wtQ1qQYzmf3ujMNt4NSPA/kdLiG3FB9pUqSUO+a7n6m8DESL0O
         VY7OGzKnq4wAIeajkIHD/CqOkpQ9trXgqv0AXoRk7mpPG2JrQ5ooo/Di3gsKkjNAg+1T
         +5AOGOtY5skgNxYIm+BwM49qFMCXei9Blirqiq3yc4HsyvYEaKNExt0n48+uZrb0Bj+o
         ORoWq3eE7OykztE4g5w3bL4mGWiaNbVYIIucZ2nLTbAN4KOVHEgbzFWyedY7Y+GxOVEd
         HMcg==
X-Gm-Message-State: AOJu0Yz9n+HCcmWSBvQM8TA58XZPhL+Aa+x3DZNZUKovePAshQWhbsGs
	m0AR1937ZU8WUg68urSrtm45iLPW2idAtTqft85VdUqghFbLznTL
X-Gm-Gg: ASbGncvAmjETH5/zOtgqulfSWJ+Uc6Rn8BVC+dU6JMbiXdruWfoh+xp7zor/sE/nORa
	WQCwK5iJg7QDHUZvm1Ojxk4wSoDYEtnxfb0OA5W9IxtUyRU07IFPAoMgRddfAxKSkB0z3HuPqE/
	OORkQvY0g6G3QzNdAgMDIGrc4MVXdLGlC1ytlXG57fqq+PDdLXlw/ecKo4NZAtHRI6tP9A0ZLgg
	wyqbXzGHmM+h06y7hnxeeEFoB2NT/9AlKBqo5bSpfeTTMbpfRUaYSoNprU5aSI+GfhyMYhiQvsq
	omh2MnpLI+Sm3O2QWmInxCUkXGVPiiq30XViPmAumN6WdfrJBRhksC29qw==
X-Google-Smtp-Source: AGHT+IHpdugGHHSEpv8DXUN0TYsAW04yFWf1BM64lAswI5XqZkAqfCyS/uTSnKtZp9AAUUMI41pelg==
X-Received: by 2002:a05:6a00:2d1d:b0:736:4abf:2967 with SMTP id d2e1a72fcca58-7364abf2b6fmr2718357b3a.16.1740933954590;
        Sun, 02 Mar 2025 08:45:54 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-734a003dd19sm7372476b3a.131.2025.03.02.08.45.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 02 Mar 2025 08:45:54 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 2 Mar 2025 08:45:53 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: ChiangBrian =?utf-8?B?5rGf5rOz57e7?= TAO <chiang.brian@inventec.com>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2] hwmon: (pmbus/isl68137) Add support for RAA229621
Message-ID: <55d595bc-325a-4985-846b-fccc6fea5124@roeck-us.net>
References: <CAJCfHmWJ9N1R8x6ikU02_RYq9ieq6yWY7CGdfvc4hRqHnX5szg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAJCfHmWJ9N1R8x6ikU02_RYq9ieq6yWY7CGdfvc4hRqHnX5szg@mail.gmail.com>

On Wed, Feb 12, 2025 at 04:21:05PM +0800, ChiangBrian 江泳緻 TAO wrote:
> The RAA229621 is a digital dual output multiphase
> (X+Y ≤ 8) PWM controller designed to be compliant
> with AMD SVI3 specifications, targeting
> VDDCR_CPU and VDDCR_SOC rails.
> Add support for it to the isl68137 driver.
> 
> Signed-off-by: Chiang Brian <chiang.brian@inventec.com>

It looks like this patch was sent as cut-and-paste. Consequently,
it is currupted and does not apply.

Guenter

> ---
>  drivers/hwmon/pmbus/isl68137.c | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/drivers/hwmon/pmbus/isl68137.c b/drivers/hwmon/pmbus/isl68137.c
> index 2af921039309..c52c55d2e7f4 100644
> --- a/drivers/hwmon/pmbus/isl68137.c
> +++ b/drivers/hwmon/pmbus/isl68137.c
> @@ -63,6 +63,7 @@ enum chips {
>     raa228228,
>     raa229001,
>     raa229004,
> +   raa229621,
>  };
> 
>  enum variants {
> @@ -465,6 +466,7 @@ static const struct i2c_device_id raa_dmpvr_id[] = {
>     {"raa228228", raa_dmpvr2_2rail_nontc},
>     {"raa229001", raa_dmpvr2_2rail},
>     {"raa229004", raa_dmpvr2_2rail},
> +   {"raa229621", raa_dmpvr2_2rail},
>     {}
>  };
> 
> @@ -512,6 +514,7 @@ static const struct of_device_id isl68137_of_match[] = {
>     { .compatible = "renesas,raa228228", .data = (void
> *)raa_dmpvr2_2rail_nontc },
>     { .compatible = "renesas,raa229001", .data = (void *)raa_dmpvr2_2rail },
>     { .compatible = "renesas,raa229004", .data = (void *)raa_dmpvr2_2rail },
> +   { .compatible = "renesas,raa229621", .data = (void *)raa_dmpvr2_2rail },
>     { },
>  };
