Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0485C7262A
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 13:53:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784469200; cv=none; b=UVmcud9A42+cKvuC4ViD5ezLudyPRt3NL8DwUwPSJCuLogAvMJzcnj8L/6iriO+AI+pbDlD2rOOJm8AplrCV19XaW38dy7zxs5HzWuzmcgK/t6dqJib9l/Xn8G8LcH28Mj8vAlzEleRgXbmlGbjqWDktra460vga4yTCJV2rjl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784469200; c=relaxed/simple;
	bh=K+P5R6wAclwOFM86ZUqkNFpSNByvTQ8SFaF2Kx/AkcA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQ47AV3tWaIV4sxpKdtWD/CaFRi70sYhpTS7uysH0p5rT+FsgaDhAR0C5TBYqU55QwPwCxpCEUKYc2tIhxJf+cTAY/k1O89PKOYuY8akYFkfOqBg5StgUi4YTQ2Gn9ZIoXsPsDcXSfYXxOEByF1Yz1ohrvgyheC09S4vIMYBpLI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=nxHtsd1i; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="nxHtsd1i"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2caf228a910so72520735ad.2
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 06:53:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784469198; x=1785073998; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=1nuOr72UPwe1KUQeAbUU34Et7h55j9VwtvONRGN6oj8=;
        b=nxHtsd1i1Lyu2/RmhPm5UqhFXLIyhTpd0jtIbFyOQPJCzMXCuuavktphQx/uXtv39I
         +cBOb/FVNRGiKn6Aml543rf4Dd00xleRkX1HPQirz57W/Ju8mTF3xOU+3DDy5/Aa9Y9U
         F/JpGszeEmDyGMk/zJx9cUSKlTYAI6YJv2TK3MTdTg+Xz5jYnEySPp8DY+PpIw1nza2l
         mJ70iLcWK98V1pVg7mrP9peLRydQ7SLBnkY0kmu4NPy8IrMOiFzPXq4K5bbsB5Q3gz86
         IMOfu+uZrH4OMwJPQoYfopAmKRRzHjoq2shPca3a+R1Gs54p5v/RUslkkxo6oEmcHtJN
         M/CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784469198; x=1785073998;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=1nuOr72UPwe1KUQeAbUU34Et7h55j9VwtvONRGN6oj8=;
        b=G6Tj60aqeQ3PNZA2nUVwBu1sQUvkbaUGFEOyZFNqlTJdVGfsieV1hbEDqm4tFwK+4s
         niuX1QGdDvsDh5raFq2Xl2lLwx4a6whv/wl2gWgFWIccYIf0W8soz7dj7TeX4n6zP2Ii
         RBQ+1lY9acSWi0uu0e2k0YnXpIrpn5+EoEera++OiGoReLYdF2pWxiiWww43DJrQ5pbj
         hPHcebTb4dSxQHlNaqVXJRqpoA0hrOS4VgBq2QoPZQZfEMLYmEJSHwSJ5aTRoU4aOn5C
         8K3FId20VooVTO/crSE+G+2s9MJOYT3f6tRvrQ6TQpKPJF5+Yc+h+OA+wuL/kxue/afD
         l7OA==
X-Forwarded-Encrypted: i=1; AHgh+RokL6SHTgQxcoOOf7KZPHoLt5DRXMvoIF3u/yosTBgRnHGi6bK0V6rGKf0Y1qpkGlhvId33hy2kgWH9pg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzFYcfTaknLpcSYOGRQakQbwPpzyrJHn8QuTAM7E5kykcYrlPb9
	9mZdyQD8Ds2RW9a4KcurzfuoLHU37Nzhg1tVC32inOQ2Nbk1m0XVmWRn7glMfw==
X-Gm-Gg: AfdE7cmZrP95P1XUWjhx6LHvJCO6jQVaOJ2v8t/l7XWHnbnvC/6OjR6jGYdtculGTnY
	Pjt5pLx6s6M/IFYdZk29sJgdiHLYB2iIg0qtU4vNS6n/YJ7/jU6nM00CVelvfxft1LKu1tw39Kh
	QnkLrvg8j35CWVeG4X3Do6ykmhD5HG4kwYQD5n7q02+pHHWPzfxdH/XkVVl3Bh1YO/SPxEYqUmo
	alJwGT94+Qqg8rJDngOSuo+Sc1Eu9OclNNqVhVbi5M3k67uVCkbAWPgCiFquPCnf+FfFXWbVCIX
	2mr9iYJnw2InhOzF/husO32NLJswIwAm7OueDMNtVMUExT3lMltwq/9L2vP5ro2Co0lQo3L5xwr
	iGpwLHpByhHsd1gy2zwVo2CDPGqKTn/UMAXqdqemOHnqGKv+7enOh0wl6Ze+a+zg2IwCK8Heieo
	273oSkVe8wnqCotLU=
X-Received: by 2002:a17:903:b8b:b0:2c9:cf5d:d9b8 with SMTP id d9443c01a7336-2cf349a4e71mr120661285ad.33.1784469198194;
        Sun, 19 Jul 2026 06:53:18 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf344cf96bsm41125915ad.28.2026.07.19.06.53.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 06:53:17 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 06:53:16 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Cc: Kun Yi <kunyi@google.com>,
	Nuno =?iso-8859-1?Q?S=E1?= <nuno.sa@analog.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/3] hwmon: (pmbus/max34440): block unsupported VIN and
 IIN limit registers
Message-ID: <aec1b7d5-2416-4ef1-a25a-946226f5c2cc@roeck-us.net>
References: <20260716-max34451_fixes-v1-0-a941b27eaecb@analog.com>
 <20260716-max34451_fixes-v1-1-a941b27eaecb@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260716-max34451_fixes-v1-1-a941b27eaecb@analog.com>

On Thu, Jul 16, 2026 at 04:25:11PM +0800, Alexis Czezar Torreno wrote:
> MAX34451 and ADPM chips do not support standard PMBus VIN/IIN limit
> registers, manufacturer specific min/max registers, or undercurrent
> or undertemperature fault limits. STATUS_BYTE and STATUS_OTHER are also
> not available. Accessing these non-existent registers during driver
> initialization triggers a CML error and asserts ALERT. Handled by
> blocking these functions during read/write.
> 
> Fixes: 7a001dbab4ad ("hwmon: (pmbus/max34440) Add support for MAX34451.")
> Fixes: 629cf8f6c23a ("hwmon: (pmbus/max34440) Add support for ADPM12160")
> Fixes: 2e0b52f1ae88 ("hwmon: (pmbus/max34440): add support adpm12200")
> Fixes: 479bfeba2eb6 ("hwmon: (pmbus/max34440): add support adpm12250")
> Tested-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

That is implied. Please only use Tested-by: tags if someone else tested
the patch.

> Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

Applied.

Thanks,
Guenter
