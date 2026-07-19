Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B782396B9D
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 14:17:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784470647; cv=none; b=NLX6UAVQzIKl79AkaXLN+O6qlcANM0gOFM2vdiRvge2EK4l4vWskaE17r7PSWtxmFtMvDVEXEIbENUJqg4TcO3cp6yMIuMK4nNXAjSo/FrzyxE9JYe5cJZyHvfgoqh+0w8pDpjGzScaKnahUYa78jNzbQ2ApBsyG6Pq/AaqiMF0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784470647; c=relaxed/simple;
	bh=/akf6O4r6B+pjYqtGmLHi+i5Tex5jnNCYF9S1biaXt8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S2y4ZRkvPM15B7/JQ9G/g55EcBglOH830Ldffk37EFNjpIavIR+4oBlBDy7t07syuhAqGD4BYqvfHei2gv+KG7DmorXPv4ZLcG/1/zA9DmYp1wiyKCEzxCPzmAq0nqgOE82vN1bOhByq2n2DxWX6AGaNhSNczuD5pfGDI7Y2Exo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fvMfAgG5; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fvMfAgG5"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ce87c7e3bbso103564425ad.1
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 07:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784470643; x=1785075443; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=D6BhvuCaJxLeCOCt8FTry4ejtKQiQZ1HVnQoy4r2/7k=;
        b=fvMfAgG50eJYGT8xhWcfki9reph32zpIVH//+C0EKaucERy6Sd1QtHz9m7C+QC2l33
         ZKGwOBLoFAjsT5A6NT48Br+RHb2eAetztcvgEQkak3Rda5gUaMZIT6HJJJZNDCW73MyW
         G4cORiKKBYO1hL1LZRjt40ItiaTfxLubBypjyuw9S8DjMYsJ+Tkfy7xheDOTAGbBesSl
         HcfA64zbW+4wmBIr9P8hO+kGm3OLwnTpFY++c/CqlXymSV3oS4TJd3FuCW5OGxF5fQe5
         zpMUiH6Ltdo5PtVx2ULUnIXYJXD4qYinVOoy3e/9CtYPf6rJa2+rYRIm2ZuaSK+hu8/Q
         27vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784470643; x=1785075443;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=D6BhvuCaJxLeCOCt8FTry4ejtKQiQZ1HVnQoy4r2/7k=;
        b=B6ijY0uJr7WTwMmHTaMcod26chZZnUYzRcUygtf3IpqA5h2GbLRFJuAO79yHb0rMun
         GvrPz0eMz5cMDCiUKdVCZVkScl0r+CTPveBxAjCAYIIq/G8Y+5A5GMYBIoDhd6GE80aF
         eRjDQNfDdUZNAIgoj6StkAaO6nzVaUbPVitiOPumFzctgKZ2XTovO/k318MQGTZ0foi+
         eYlN6D09ICgmqU2CKjQNBbwwEiQg4YbKciO/IG+ohpoDsVHFq3MCWyiZf/lgx1uFb4k0
         QGMCu477Iq58ONKa5Ff5Db2BPXBtg+gJvX84q9CjP+lWBmNBjyvOv9qzc53oNy+0ylqv
         qfsw==
X-Forwarded-Encrypted: i=1; AHgh+RrwO3GIfz2HKR37uohxd4uRNLDI0CftEo9rSK08fOjpS/Vrj1FvbN5YPxOPQu7uNGrIGsMMXiR50Wt4Xw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwW6Ww2Z9fse2iBR50UUAn205Id9PPLn6WaVSmzyFQNLF/IXULU
	rUVPuUzxrDO4nKINvob7VxNDqQRzbIDqesiFRHxPeEB7Bb7Rs7JLI6WT
X-Gm-Gg: AfdE7cmLCtP0YUZ1nSkwD5zdumepgCcrDCTX/mwHF7N5yKOTQN8tAHeu/aO44kO3uvD
	HqpFGyDh50mEMEEIMg/DQ2tHRF50eoIR+TXCyHamx9l37j1Q1pnA1LB/pJVctTVSnIcNcF1a49d
	g2Do2YLytC1PkUuz7FoU7y5q+Gn+iQPe5dJ7oylhxXhrGQla+YCd6fQFkRVwEjEFKQgJbZXJd6c
	+Rb11mJT/DZbYmD3g4b8GvEQDigFZ3avoZT2qjRehhZqITX/JgUB9ZqWNo3dJsThj9F1/TiJoMj
	BNZ5Q6S8+EFXnWbYHn5KXGNtFfPwndLGSxOCtF8MpYxMexElwJiTHUzmLFPKEUTzq579Gxyam5x
	G7tYWofznMsNocWmGoYf3OL70xfF8bYoLAW6hm1SnfxQyDJwZ2KqwcGP+N7Y0fxzL/cBrQRb0vP
	R5QndAgU15+/89vW4=
X-Received: by 2002:a17:903:2ec5:b0:2ca:d91e:bfb4 with SMTP id d9443c01a7336-2cf349609admr124159515ad.24.1784470643477;
        Sun, 19 Jul 2026 07:17:23 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf3471513bsm40475355ad.57.2026.07.19.07.17.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:17:22 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:17:21 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v7 2/4] dt-bindings: hwmon: Add Sensirion SHT30 series
Message-ID: <6c8460d2-ef2b-403f-b80a-2afcc07a2051@roeck-us.net>
References: <20260713074559.12196-1-zaixiang.xu.dev@gmail.com>
 <20260713074559.12196-3-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260713074559.12196-3-zaixiang.xu.dev@gmail.com>

On Mon, Jul 13, 2026 at 03:45:57PM +0800, Zaixiang Xu wrote:
> Add a YAML devicetree binding for the Sensirion SHT3x/STS3x sensor
> family and the compatible GXCAS GXHT30, with the ALERT interrupt,
> nRESET GPIO and VDD supply as optional properties.
> 
> The SHT30, SHT31, SHT35 and SHT85 measure humidity and temperature
> and differ only in accuracy and packaging, while the STS30, STS31,
> STS32 and STS35 are temperature-only parts. Within each group the
> parts share the same software interface, so model them with a
> fallback to the base part of their group: "sensirion,sht30" for the
> SHT parts and "sensirion,sts30" for the STS parts.
> 
> The GXCAS GXHT30 is a drop-in replacement for the SHT30 and uses it
> as fallback as well.
> 
> Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Applied.

Thanks,
Guenter
