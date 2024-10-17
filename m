Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CD08918133F
	for <linux-hwmon@vger.kernel.org>; Thu, 17 Oct 2024 21:31:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729200696; cv=none; b=nOy1jwD/uHhowMGnyt+OlBmHDvm0Xo9EwQ4x4OmYIlXnQ369xfrNzteBh7Hh4FYUbIyRr6BV44PAcwKJCRGOeDIPG0KeVeeakc1pGvIggu9ZYO3bsjaUZ1ws4zKxCJaL5w7bo3xblU5vfbLNTrf1U8AFWKXG3oeULTrbsUNueq8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729200696; c=relaxed/simple;
	bh=kOsj4Y1xqrfgTqFzQhXxdTKJteeguT2YZON6PiaVjC0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MQFslQbxkRGraSob5Kt1JRxULRvzi7td20QUGSH520Yet1Vwbc7f324ZpW+n4m7GqikQo3ikVkLkUlHwJQTp2UGIenFb3l4HiEguLwWGXNOYG/+Lb5Xsq+cBWxIEpgvg0rQRY25Ks5Ar+iX4iekhsgyJLbMPD8h5eeo85L7fW1M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D6la53d5; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D6la53d5"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-2e30db524c2so1100019a91.1
        for <linux-hwmon@vger.kernel.org>; Thu, 17 Oct 2024 14:31:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1729200690; x=1729805490; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=R1QXiv6FZ+fSePM23I6aMAbo6xSeOz1TjqcSNVgymn0=;
        b=D6la53d56Z6nyqL9OtyRv2P/gcgz2N6o+T7FAy7Ig2GTWnvKNkt8wRjvEFQ3OKTtq/
         1Vgm/xRw/OzizbN8ehHwrbdg1x0KdotmpE4nEWR+9MZbP1jLcHJtxno2P7uUi6MuK1s9
         bFB+zK0JYFicH/6cs12Kd7wvCzwhVn4NuMqCDIZ6YLiAkww+jSjFrXLNSf6gVUZXvi0N
         +ztgkMyRWcJl0F2y1W5JfrNkf3ZBInDxvMREe7G7PsSddkMipxXpCCxZfgC5ean1pVTT
         XVBf943nMir3Yo1iA9u4YB+Nk4iF23iWnR/5VJScyBhfjLnfyI+g3/4mTLET4Me8eKHz
         rgyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729200690; x=1729805490;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=R1QXiv6FZ+fSePM23I6aMAbo6xSeOz1TjqcSNVgymn0=;
        b=DLHM5t4sKIZTaQ+PGe/zmDo2X04h2jkrT1ue+Ww5nGd7eVqEUFq43CS586WGwMu7M0
         Rvu/LoL5XgCdsXJy6BY+TKAwM4Ms4EmoXCF6JvcmttEFFOUPuaoc4258nVZUU5CSLVWd
         kj6rrCe6UfaXCZnkCGqJzZWXv+9fsWiMbnUawZx3kcQEYzpJ8mluCRUnZcAWMSHTSy+f
         2nPx2IizKiAZjZEmaHLlmy6y6NhAutnSHWBsQe5fdg6xmC2MS75CZ89Uyq/TnQHoErTB
         FKI3492e/FPyL1+6OqV08VoKOUnCs88Gk6+O4vSGSeJtsRLF+fO8oMNpoVpBKfm0dxgX
         i8LA==
X-Forwarded-Encrypted: i=1; AJvYcCUKWXIqLrO+jSovuyiG4UJ1fu4A2FZxndNzo646cGsV43WYUDcVI0vyrP330VBbaru+hTeDuH4riaWoow==@vger.kernel.org
X-Gm-Message-State: AOJu0YwD6IImISc3pEiveQru1SSqIPRUJMUPJvjhaEWjQK3wOyC7ifzV
	loVNEshXM0yptjDWV4JhXZFxq+DoVJZffFCPlf4UObZxPRihaht4
X-Google-Smtp-Source: AGHT+IE7AyuHvPREfIK+1ttZ1OZy9btjNQKWfc7ViW25z+GR7CIUwIs3/BdfEaKsz0ycEaDJQ+ueVg==
X-Received: by 2002:a17:90b:e0b:b0:2e2:cf63:224c with SMTP id 98e67ed59e1d1-2e561a01152mr424376a91.35.1729200690128;
        Thu, 17 Oct 2024 14:31:30 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e5612de78asm192014a91.57.2024.10.17.14.31.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Oct 2024 14:31:29 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 17 Oct 2024 14:31:27 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@baylibre.com>
Cc: Jean Delvare <jdelvare@suse.com>, linux-hwmon@vger.kernel.org
Subject: Re: [PATCH] hwmon: Switch back to struct platform_driver::remove()
Message-ID: <00c17803-4548-4573-9ef3-b2b9e2251249@roeck-us.net>
References: <20241017155900.137357-2-u.kleine-koenig@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20241017155900.137357-2-u.kleine-koenig@baylibre.com>

On Thu, Oct 17, 2024 at 05:59:01PM +0200, Uwe Kleine-König wrote:
> After commit 0edb555a65d1 ("platform: Make platform_driver::remove()
> return void") .remove() is (again) the right callback to implement for
> platform drivers.
> 
> Convert all platform drivers below drivers/hwmonto use .remove(), with
> the eventual goal to drop struct platform_driver::remove_new(). As
> .remove() and .remove_new() have the same prototypes, conversion is done
> by just changing the structure member name in the driver initializer.
> 
> While touching these files, make indention of the struct initializer
> consistent in several files.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@baylibre.com>
> ---
> Hello,
> 
> given the simplicity of the individual changes I do this all in a single
> patch. I you don't agree, please tell and I will happily split it.
> 

It is ok.

Applied to hwmon-next.

Thanks,
Guenter
