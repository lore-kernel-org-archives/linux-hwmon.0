Received: from mail-dy1-f178.google.com (mail-dy1-f178.google.com [74.125.82.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65ED51F4C8E
	for <linux-hwmon@vger.kernel.org>; Sun,  1 Mar 2026 23:52:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772409165; cv=none; b=Ce0ZTfo1YeUliX4LRLzZmhjJjdf96eyleag7dUBGph06/7erXO5olDMLl5xhjJID3e0Osg6jXZu7AEIRfUpYA+x0IwpC47o7pfYZIdcZ2XQzVt2EwWvH1aRJORDPp/+AJLKRokcjy9eiHHq1WtlinEZMtrdoUTA/n2R4SCqdYsM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772409165; c=relaxed/simple;
	bh=EiOaD919/Ki9hwuytZuFNkKMYcH2NPBKSuybFjO5HE0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=X3AEvDVoouoluXh6FTINeiW7YCwRfPRYDaoj3zYRvj9aJ2jIZyXZIAxSVhqS5/Hh2kYVuqCSO+bMInXRK34RsChrmlkqot6J/PB2RBW2LIWPAX/pPZXFShLeLiS5VbKHJvNEFwL5gjE7XbL+klsF2SP/Vxguuc0+5g8e8EiAjFQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G34/d7FP; arc=none smtp.client-ip=74.125.82.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G34/d7FP"
Received: by mail-dy1-f178.google.com with SMTP id 5a478bee46e88-2bdc47747e2so2865826eec.0
        for <linux-hwmon@vger.kernel.org>; Sun, 01 Mar 2026 15:52:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772409163; x=1773013963; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=guE+l9uR0OWbERsCagbK6n6r7rQeTJbRR5tO4b3XCrI=;
        b=G34/d7FPD03RuYlzbQdzrChaMLwlkeRJMFNbY1gSF4mKgZIk/OsYsXVWRsJeoIDzBD
         cAdyXkml789aOIzPYieYEXgGfEBqgiy2Vux066gF6BUQVD4ELmUV0/4JsUmdUQSmPhd1
         3BS4SBxkQ8afIEsr84yuk+4uZWMsoENszku5KAIXONDsbfG4OGBVI5pB0J0YB92S5P0o
         yjLj0pHV/p9XnzA4A0s+OCLlhl+PYgrhMDmev8AJ7YJ9WV2T/+NApskQQBp/ST42N0Q3
         T0Pfy+PZAUKDW4qetWa9z2lvIKGFAOP5FmsU3A+3uFD4KIRcB7CmT8lKYpCzhdKbleam
         ZVXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772409163; x=1773013963;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=guE+l9uR0OWbERsCagbK6n6r7rQeTJbRR5tO4b3XCrI=;
        b=DJwX6T5OV9NaC7OWtQyDt0WDio1kKhJQElt6CJKZTD8gDRxQAauZnMVVdNF/U5sFdk
         37V6ooUgPrPcey2ddWmGkSrrvdfEW1h3JWn16ZTFrH/Jva10weDt5Wt5Ppc7gfW5R+DI
         y5ZrCvnolK4Q+Rmwt9cT0nsuvwNLSa3ai/igeQwP7LxkTqgDAkBVSOrYkIGMzCY7MRlu
         TngZurqHlQvpgDeVGX5WWOuSw6i5aFuEippxpthkDlADTrgZrvwdNariw+7s6zdnI0Iv
         9U39d9V2Nu223k1qAjwVhnEAKjbL1MMjfS1hOI+4sCzuHU+VoV585DGvTgLIUpi8C6+h
         rK8Q==
X-Gm-Message-State: AOJu0YwMIDYKOTEee3AW1C/+0PxdY9UDx4+S6EIa8CAc/Bgg6clfgIne
	NZJTLRg86tc1pWl5mPTWqwZ9Pjt7ilmqv63L+mEZzmxMZRkmKFqy3zfV
X-Gm-Gg: ATEYQzyBe4gfVeIwSl8p+vQh2ZGBW1ChBPM6IDclWXdEbRb4h7hCgJIgdlXTgnMbPrq
	AO6iaCWxI0hk7da2XFKKxyTBqR5SfO8kpRmIdKjhlvGgxlzdyuWBHZXfzX0EBy8bX0Vl890FLZj
	/ncxo72LNehvHc3AjcSpcGt1AYa5yrFXjEMNiTA3MPbj8iUK03m+bmOW1y22bozR1E2+LtWPKke
	7I/oO0s4yWfhkXMYZS5MQXQWHTclhyEwBqpXrLi81hN4EoXaR42e6J7EWJRjxFqUtskOfCF5mBU
	vQzWKXsNDQ9oP1H0PZRQoMiZ6KWUIaxvRtUXO4zdZEJDPqI3mtLwXaDABM2l0a9dJGZEEDb/UfP
	IFQf2lcmmcayU9VKxwnDgQauiQLpTGuXS/9Vgjxj5okVXSLNmPkFN/WuACsHyP8PeWHm0ygrJ/A
	uS4hUBxd05pbg+PGSDbSDU615Fo2HcHiBz2O2C
X-Received: by 2002:a05:7300:d4ce:b0:2ba:7863:f0a8 with SMTP id 5a478bee46e88-2bde1e8434emr4036316eec.36.1772409163423;
        Sun, 01 Mar 2026 15:52:43 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2be09bc9ec4sm2421751eec.24.2026.03.01.15.52.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Mar 2026 15:52:42 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 1 Mar 2026 15:52:42 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Flaviu Nistor <flaviu.nistor@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2] hwmon: tmp102: Add support for TMP110 and TMP113
 devices
Message-ID: <04c0e2ca-6af0-4e25-a2e5-815be9926bc5@roeck-us.net>
References: <20260225095132.29954-1-flaviu.nistor@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260225095132.29954-1-flaviu.nistor@gmail.com>

On Wed, Feb 25, 2026 at 11:51:32AM +0200, Flaviu Nistor wrote:
> TMP110 and TMP113 temperature sensors are software compatible
> with TMP102 sensor but have different accuracy (maximum error).
> 
> Signed-off-by: Flaviu Nistor <flaviu.nistor@gmail.com>

Applied.

Thanks,
Guenter
