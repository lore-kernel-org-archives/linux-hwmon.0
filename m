Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 416C73B2A0
	for <linux-hwmon@vger.kernel.org>; Tue, 25 Nov 2025 04:08:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764043745; cv=none; b=EzygZlfBF8UpZp7jhjmKJxU07aHjUNTjYxqQ6mwpv1w2Yd/CzHbHS/S6VW6K/8k38jJA6FRearX5hxejYKW/wOyqDvcZTe3oFLASGiEkM6ejcLTdqfIArCdfz7IhM90SCCAC1xXbtD8yzKRY5TZxu3K8ntFR8kF9zZVV7NSoXGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764043745; c=relaxed/simple;
	bh=fcbrMuL95S1yys9ljkGRsiBzrKO9Dp+SVZfYFA+vwJo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pziZmj0KDgQx8oh2FouyHYaU0B/J0GBVK2EAdot6jVifjw5i0QQYvpNNY56Ogv2Vp/hdXRtvHl8dEq4hJ75vvH0Qgk5NDkn+HLZ2Ec3pGoYHW+42s+FDA21i3aFQZRnO6d/JtKpMAGnP0yNnhMPXzqclKK7jJPWMtT/45Ak5l0A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bduIZIWB; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bduIZIWB"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2953e415b27so60219525ad.2
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Nov 2025 20:08:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764043737; x=1764648537; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=D5hV0+X/JrO8V0rahvUrmxynvO/c7QiCno7DSZoXlTw=;
        b=bduIZIWBBMZdJQTqZ/rB/Vv7333spglnbmth8JHoFiSTDaIyXc6sqiaQxucyG4zrDS
         FC2iuP1BWsORdKbdOv9Ryae3DcIB6ncvf05WSdS3YTrQAqFPyIhDnGHYpm7+T7aEt/4G
         KYfRMJJXyNyjueT2IAAUHzWgK+3QqDfiQM1WpJpni+N0YHCvGrKqPIgM0zSVvMZMqqlu
         07Xz2gnqPjvkR82byDEqHaqTgmAI6cUYygBIUS1GBNHuIDPDpTeovBN37aLUhyQEktqb
         nrKG8Rf662jbMWwlWKFG56GSKWdZax99jvog9kGhAiSeqn6oZRWxvBbUORL0zDnfGWiY
         I55g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764043737; x=1764648537;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=D5hV0+X/JrO8V0rahvUrmxynvO/c7QiCno7DSZoXlTw=;
        b=aIsylij2i2s4qTEX0ft+LMJLs6c39giyLGh5K5an+sXxCcHmc9DxwmQg8qS9FZaFQD
         7ztCvaWOAMmL5K6CV2inxJSZ+RaQi3A92PB+JIVRvNcaId1JAOBHbizdLPq6KPhS+u0b
         aDA0OhJoj8AOTAy0V+TNdv8TMCSjxwsyT9Gz/dMN5glmhwzqZuIHynI+bp9rB5EpV2qO
         xCsyh8zYq1yoMPQXgiNphVd3Qol6UaCTlEzHuV283aiTyMCeu/q5qCar+9/yhftsB8nW
         xh8GuUEb6ae9xgSJ9DKL/yzhJHeFPGura0ClpI9wuJTD1SWok+H64gBuILXXGAFI+G6l
         B+qw==
X-Forwarded-Encrypted: i=1; AJvYcCWW7RpEi2cv/9r4X1DZh8qr23nNlzItq5PGVUmJvH0yy/0qJAtAePmZEW7C22uLWLv97mDFCnHz4iXsQA==@vger.kernel.org
X-Gm-Message-State: AOJu0YzTw4wGy10nR8+XnMbiae1at/Z2c7HmeeMkMV36Zx6KxQwlV9T0
	UpDYZrpOXXv1L9eY5Ip6k3KNA0ct7yZ2ZNQfbdyL8lhFxSQz/0/S2wf1
X-Gm-Gg: ASbGncsUF3ps1d2fDrZSVsHQUgOMpl7F3XQLGSq/9FEjtGoYz4HxYiVNOplj5/ujyzJ
	sDxkTBG+yX8t34LUQVFyInCJfRT0o/IC22xIUZomjO9k0ht1z5DQqJQbXl2PSEQB6oNL4SZL7xA
	G57FTuNaLYWTHPbs4BvGDHsNr9+dAIJ92L5yJl0AupNdXjRcpp+PdemI+jmavwcwL8knDAi3Z6Z
	0CGx8CbTd9hflT7A0P3a+53qAqKDCacEOxs6nYixAkjlkkWJTUfbcpjZrujTnWK9jASUJC/O5eX
	uzzTl5N44lJKL+Wwei03L28iGCyR1XF3GJZNz7ka22XRqpzbKAPzK3pPvbeMrfK3vTSmCZun/kL
	JArJSol6LOurMFal5Ksb1AI7wAQHquHg5Bl05fzm7Sn1V6pIAKqrKZ2FbEkLcqBzurjgDKipsXq
	yJaSteOXj0sWjFBnXVS/1UHE8=
X-Google-Smtp-Source: AGHT+IFxOQT+zjM8q+t1qH2t4Sv7Yn9rLRxjVCM040l7MqUkimPeSNHTDQ6SsNgRKTpkzjK0lgkK9g==
X-Received: by 2002:a05:7022:b81:b0:119:e56b:c74d with SMTP id a92af1059eb24-11cb3ed28camr1435614c88.18.1764043737357;
        Mon, 24 Nov 2025 20:08:57 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11c93e5674csm77123773c88.8.2025.11.24.20.08.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 24 Nov 2025 20:08:56 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Mon, 24 Nov 2025 20:08:55 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: =?utf-8?B?5bCP5aSq?= <nospam@kota.moe>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (asus-ec-sensors) correct Pro WS TRX50-SAGE WIFI
 entry
Message-ID: <39cafd83-89b8-4881-97b0-3c57b037dd59@roeck-us.net>
References: <20251125040140.277756-1-eugene.shalygin@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251125040140.277756-1-eugene.shalygin@gmail.com>

On Tue, Nov 25, 2025 at 05:01:26AM +0100, Eugene Shalygin wrote:
> From: 小太 <nospam@kota.moe>
> 
> Add missing temperature and fan sensors to Pro WS TRX50-SAGE WIFI
> 
> Also:
>  - Format VRM names to match the BIOS
>  - Fix swapped VRM_E and VRM_W entries
> 
> Signed-off-by: 小太 <nospam@kota.moe>
> Signed-off-by: Eugene Shalygin <eugene.shalygin@gmail.com>

Applied.

Thanks,
Guenter
