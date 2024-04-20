Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD9A9249F7
	for <linux-hwmon@vger.kernel.org>; Sat, 20 Apr 2024 18:14:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713636851; cv=none; b=VAgpAXMxg4nGKivc4fr7/NGkYqMtXtFnzRWyfuWPO8llyMIhdQfoOaIeUBJi9kFBTuGDFw5N8bb9UbEnJLX1Wuix4RNdObZjE14/OQeBi/XGoPf7m8KXEpNVxu2KFP8tp6acL+aNWhuDXq/RejqJ76FqhMtOQ8mONEn9V5WsH4w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713636851; c=relaxed/simple;
	bh=lMMDQtiiSw8E9Q58ysyszT4y+zD5uoUx/bUP0jVJpxI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=qDEs0o5IXWBCaX6wF/iszsbPV1deoq4/P+aV+pp12Necy3PIG43cADHp+xDvpTsuWhEPiNx4g2XpLd9yzGkbmhu3M05u6wT9oYMT1l42EH6PQLgX/1ZvVKQrOJ1X3iaugoQlbrqhvlSZcMEIo5kZEgcPV2mMfulcyaEsjwGRQi8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acsS37jt; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acsS37jt"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-6f0aeee172dso1480208b3a.1
        for <linux-hwmon@vger.kernel.org>; Sat, 20 Apr 2024 11:14:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713636849; x=1714241649; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CYl4EGzn1PWo5jsRNKYCdQ2KYu54krBOFHchrUfMsO0=;
        b=acsS37jtAnHtqkTO5wsqW8STZeMQRND0OhOKMiQVhBoH2St2IMoHYH1jhFxnVL4npT
         n8LLBDG56X2LmlcXOfVnL7MgS8J12Lg6rY/dXjWrwrnkR+fRGD3VI5RQEx8a12ZSGGlo
         tdXOTpVosvMspiGYeXlY+Mj4UffZty5fMqdHaD4ykACy163yrBUQEouOxq5fnvXRfVEh
         nEiX22q/81eQZGuug7Wl/0O2DAqUgGrUHnyYwn1L3LZYtR78n7y8VCJSDLg5XNZFopOI
         9tql9ckT591msN6AY8cjgXtLVaWDMTZXaKtPO/v59pWanqq9F7gDXQCvxBtKunV1zyLy
         BAZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713636849; x=1714241649;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=CYl4EGzn1PWo5jsRNKYCdQ2KYu54krBOFHchrUfMsO0=;
        b=sN/aUfUxpsKXKV3urbTdui87p9USycN6Ikvd5qxIupcp5qnqPaksfzLxcyo2AbRQlo
         tTdouf7VJi/3HXA6KU4hT+bdA7fkJ//N9XeMXPl12xbl+Ovy+1t0Wadho7L93Q0HZ6OF
         JGJa59Nq3HK02blHfOS9vA9slYy7YCUrj/WCWA6OQx4eYQMdG5RDchzX9LTZWK22tr7W
         f0E/PHAMK33sMCud/L2zJ/s5IXNHn+TEXXMoXgjjVQa9ElMRzzlIi4wnFy0a0QAv8JTP
         MfZRCW6bahQvOVOrr/WjgpIQ5Y8Grl/koCwZVZB7ZVKxkC8q9+tFuDiaOTdXIU8mzotk
         GYfg==
X-Gm-Message-State: AOJu0Yy16mu8AfyHt+AaUlUNAB9CKZUzui/QV+YDOZcFBiuBRe3GfStD
	iAeZVkAIPUD2C/ZX7zV7Yw1KZfibhICnlyKldBc47GYUojQIalpDCbJ+xQ==
X-Google-Smtp-Source: AGHT+IH9MvOTFfoiYO0aEooufFULE1hKOfEU1aj/6GkeNRDBnma0ZwUdRTJU8MG8CJl4DO4yXW09yA==
X-Received: by 2002:a05:6a20:2589:b0:1a9:793c:59ec with SMTP id k9-20020a056a20258900b001a9793c59ecmr7098083pzd.13.1713636848724;
        Sat, 20 Apr 2024 11:14:08 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a20-20020a056a0011d400b006ecec1f4b08sm5142450pfu.118.2024.04.20.11.14.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 11:14:07 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 20 Apr 2024 11:14:06 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aleksander Mazur <deweloper@wp.pl>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: Regression in lm90 driver regarding GMT g781
Message-ID: <abc624f1-e1cf-4933-b2e8-a6f3d46d38ef@roeck-us.net>
References: <20240420183427.0d3fda27@mocarz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240420183427.0d3fda27@mocarz>

On Sat, Apr 20, 2024 at 06:34:27PM +0200, Aleksander Mazur wrote:
> Hello,
> 
> I have a Wyse C00X thin client which is apparently equipped with GMT g781.
> It is (or used to be) supported by lm90 driver. (I have a log from 2020 where
> it was simply working fine; it was kernel version 5.6.0 then.)
> Now, with 6.8.7, I get following error:
> 
> > lm90 0-004c: Failed to enable regulator: -ENODEV
> 
> However, when I just turned this message into a warning and let the driver
> continue, it seems to work fine, providing temp1 and temp2 as previously.
> 
> Do you have an idea what could cause such a regression, and if this change (I
> mean: simply not returning error from devm_regulator_get_enable) is safe?
> 

Do you have CONFIG_REGULATOR enabled in your system ?

Guenter
