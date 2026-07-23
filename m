Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C8F03EA976
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 21:35:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784842554; cv=none; b=jek+T+hRNspdarG3huhlI4aw55rZPf0waLwm3w4KkX3RWP1ExdvB/K+C3b2G0MeA6PKJ5HIcb8eIibHKEzliMQI1fvQrK8r9WsC7dDQ8vXbUeLMsslUmkI9mluC55rhLobjQuL2hiXPWR64zTqn422rAMAVqMWDa+Zbq5w3dJXY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784842554; c=relaxed/simple;
	bh=Y6l4pbrAjxGiwFAjAvD2g0C0Zqsuzaax/Q6bdHesUPs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=e1rhde9ij9dM3FTaN8EYrsY1Cfh6wVCBun9zEThZ1y6ShHhcJdlqg07x84pjOviHU+/8RRX8p0l4jbFt/nL4ZhhaxYFsuuLLPStwfaCh07hRpVywDtZjOOTJ6Sl1KRke8j4+/pl/WtPRRzhHisI6mF9AeTxRXWDREA+jWMvL70I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nM/eM/U3; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nM/eM/U3"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2cedda2ce6fso9383515ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 14:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784842552; x=1785447352; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=Hjft2xVsWjp4NjFVA+wBQKvwIiUgUOuWRwlVENc0+Gg=;
        b=nM/eM/U3dXvg384+7xUtcgb+7IRNORtwkbHK0S3Jr4HTeWjDt8z/bbMkSz3qhEZc8P
         2mge82+qBIrem2FaUnmHylx4lpcCxkJFu4fIrmjNR9WYDi/WTe3mpYlYoKbXn4XAohAq
         bKeqxHZ0FcX2Fk1z5iwCk99C7wH2vPs8B3Ktc5VbDIEAaTnU1jX2N4V59mF1QabVzb+f
         G9CoU8HSNOX8bhp1q8ZJC0DwFPOAxAGgEm9r9U58BObUpedPHXlRrJd9vjsIQNlVeK0l
         uxMg0AdTeYFsavMprQNu7+Pc8/i+DSy5XrmvGeqOb8DvGZdFXa5G0SVGKek3WBXBISTf
         jPCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784842552; x=1785447352;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Hjft2xVsWjp4NjFVA+wBQKvwIiUgUOuWRwlVENc0+Gg=;
        b=NYbHgPuF6X5pOXKIyqb7kztUfCFyoeOQ3IZ66fF4p4Z1cVJlBA01h74FeEZrz3GV9F
         1xq4Ii7mK5ajFkcnW/kec/my9SEohu1oT7RPmvvLsdRWDLXmdHo1MbUomTLizp/YT0RO
         HTYzYsi+VY6OjjaR1CpME14s5klHpVyeAhkTBa1wpjI7GGASTj6zf0/K+86U8v88Yp/I
         Rr7EBblwURCkkMDu58+FKyEN6UZ+9g41SjPgY0ESe5mJpJZj3TilyyrpmmEpD1SnAhs2
         W+955N4UuV5G3t2x8+PcUNLtdJAL2FNLeOKk6OJHAhMlE5ANr7ZVt07IrCXRCTL4dlqS
         IHzg==
X-Forwarded-Encrypted: i=1; AHgh+RryE18+JORprNoftGxZi3b6c20Z3Vf7GJv7+sU2PnLjdSorN01xy/ahMyM7KOfGy4j0MpOF/+PC0/JC3Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YycCn6jj84+kaUeRnbdsF1MYedtqN4qGzg0KlXCjSIBNQM6HzpF
	r41zxHRglHsFhxtZJpe/k8zqa5BH49cV7o4CeF94X4NOzvat2sk4lKnU
X-Gm-Gg: AR+sD112DGKKvgR0CEa1KEjGRxKc8bzbxo+ZRRASfhrvy0GQKglDifSl/CvN5hLIoNP
	Q2he0EhLzxtOWXPcO98NUi8CUy+OJEJgLX7n2gee+Sgh9ImKGZogNqwdQSYaV+Bxzd5nIVfB0EG
	i80xdqW+SCeUKHE6hcfMClHSoFvk7srvichp1HLHoOh/bFbNUxSN/+BWzLCGAbNAqGPaEUcgapM
	KZIt6m0v6jWLIwGjafLU8kqNQbUImmezz1IS4yfNITRPmZN8yNcTzcRjXjr+7ILHDTuOoayfO8r
	XSSgFqR7Hf9D01p6686jcIZZtMGMhKjv/W4AAHzztA05ZMJRc2+msJ1+/eUZw1L6GqaNu1i5e4x
	MR21OgsRThql62QiWn0RWqH4+yrZuRP7LEGVv973ks5fTufFR4vb/Fpbky95swcH60er3961HZE
	pI5IHqDWTiPTbRwuWgGW6oZeqF8Q==
X-Received: by 2002:a17:902:da4f:b0:2c6:8d95:fd6d with SMTP id d9443c01a7336-2cfa6ba9a4dmr54855175ad.21.1784842552177;
        Thu, 23 Jul 2026 14:35:52 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf8edea703sm40366485ad.0.2026.07.23.14.35.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Jul 2026 14:35:51 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 23 Jul 2026 14:35:50 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Kun Yi <kunyi@google.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH v2 2/3] hwmon: (pmbus/max34440): add support for newer
 version of max34451
Message-ID: <2d8da214-6a8b-4e47-bac1-4701b9cab35c@roeck-us.net>
References: <20260722-max34451_fixes-v2-0-bbddb18ec1d6@analog.com>
 <20260722-max34451_fixes-v2-2-bbddb18ec1d6@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260722-max34451_fixes-v2-2-bbddb18ec1d6@analog.com>

On Wed, Jul 22, 2026 at 09:29:30AM +0800, Alexis Czezar Torreno wrote:
> The MAX34451 released a newer version called max34451etna8+.
> This simply changes the direct format coefficients
> 
> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied.

Thanks,
Guenter
