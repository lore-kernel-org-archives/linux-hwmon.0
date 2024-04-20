Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 051542E648
	for <linux-hwmon@vger.kernel.org>; Sat, 20 Apr 2024 21:20:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713648036; cv=none; b=mJCCZ6BwUn6IwPEnhFpdbePZE//qYXBzky3//hIWFLAooT7M4ml2Mc9Le8lj1EO6eNDxxuKRedpXLn8dvta/8yfnq96GuCMbAH7ZJJwQmTaHtwCrFL2R7GFlHcqxL5A1twpbqg6kLBrq8RG5gjEWzFjNG706KUtWZvLRyQwcoEQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713648036; c=relaxed/simple;
	bh=0UR8mMkzUsvSdHEdbtmh6NBOhmsMGNtHNPJD9vzGVN8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=q26TkYWwolvuY1SKG3dOi/1Cdserir2HsrZZ+WVIaV3QE+VUazBt9FoZQ3Cn6hF+FmBSuDBmKuJMSd4tJy2/7L9h1ihsLaehqn9ztz5RxSAxkNlriKBihg3VS73w7jEQFt7ISvj/LithExx7BdxdQQqRNVhvPKhMHQcDRu2qvKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=LVVmAtHe; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="LVVmAtHe"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-1e3ca546d40so27532665ad.3
        for <linux-hwmon@vger.kernel.org>; Sat, 20 Apr 2024 14:20:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1713648034; x=1714252834; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SVfUE9E4VfAdSRfQVq3lHPn+n3SdZx2O1LLAH1nxGOU=;
        b=LVVmAtHe5lwEC03eshw7SNPA83Gz5wpCsOKTR1Ga0ut4202DbnVscQUCTUYokIZSTQ
         trVZETxt7zvwdbTMSOW6ptf/PaxCPKLdBVjQsafZN401ba49XE3KYbrhH6jVLoY72Ep0
         inUZtwc4p+HCLVKvmnpqlkHIuvEJCLZ6lKXdjkCDyBf7IKOBDM2bntsmiDHaXP8XvZ0Y
         VN69yVQerr6YPMfEDxduAr4W12a1/sU7uo7R8H9QRR9c1tC8HMCEt1FgcZz1mWyWlolw
         HrbN2FHn0Kqr9YZMnGdjZ6X08cbgQanSAfnm35ntAS19IGWqStijxA6IbGkvyjkSq6KB
         luvg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713648034; x=1714252834;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SVfUE9E4VfAdSRfQVq3lHPn+n3SdZx2O1LLAH1nxGOU=;
        b=jJCwUhT3O+a7eBvG4/PpPoqw6+T0TQG7wpLGElA5PUkpE0cM56xIRSaSoOo+UtDPwh
         +Mh/ctYn42tSewnIG26hrdEG3V+7N22QiHEuC5XI+/Vs9v9PiKyhNvh3bA8bIiOYHDYA
         N2BO0oz6fjI9vlHs9xhRzPRBfwKF5OHY20qesjjZBVRmigVAekeqa/nlcrEvAZ1acbBk
         WZ1KK4gI5NiO6cBUjZYnqh/AE7M5GiyHqBem1CSwbKmM3M1/iRhYcf1s3lURXh8Ps0xy
         V3ASnkrmhaZOBw6n4Y/0CHbS6iLP7Y6ECDX6FpdYu1jXVBGmGlvgKUphuJbO4bunggGH
         RGbQ==
X-Forwarded-Encrypted: i=1; AJvYcCVSRjCYzzWaj975R1BDOPqJ2EuRNBnMHg5O/086dEsXHaf+2CdqSgKSAdQXo7M5dA8szbf0k1B7i4FRQI7NGBnfUNqippOZewJrY0c=
X-Gm-Message-State: AOJu0YwAbnSRaACCj75ccpQGFqrd6UmnQ7o3A0Lhc9nuqBDbsPd3w6GR
	2JJsnDYVcqAPM0jNZwaGNDHohauKygVcyPc+yRXz44E+evCudyD2
X-Google-Smtp-Source: AGHT+IF0Q5gfVEF8YTnkf5Jo06S3B3S3Qsk80eaLLrI1TV71OL/9QlFAdEaCRuiLlRIeeyrlsyZNrw==
X-Received: by 2002:a17:902:ce85:b0:1e2:3e7f:3b08 with SMTP id f5-20020a170902ce8500b001e23e7f3b08mr7296293plg.38.1713648034099;
        Sat, 20 Apr 2024 14:20:34 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q7-20020a170902a3c700b001e434b1c6a6sm5550220plb.58.2024.04.20.14.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Apr 2024 14:20:33 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 20 Apr 2024 14:20:31 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Aleksander Mazur <deweloper@wp.pl>
Cc: Matti Vaittinen <mazziesaccount@gmail.com>, linux-hwmon@vger.kernel.org
Subject: Re: Regression in lm90 driver regarding GMT g781
Message-ID: <04831e1c-9957-4750-b438-9d5395b8fa45@roeck-us.net>
References: <20240420183427.0d3fda27@mocarz>
 <abc624f1-e1cf-4933-b2e8-a6f3d46d38ef@roeck-us.net>
 <20240420223824.624e725b@mocarz>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20240420223824.624e725b@mocarz>

On Sat, Apr 20, 2024 at 10:38:24PM +0200, Aleksander Mazur wrote:
> Dnia 2024-04-20, o godz. 11:14:06
> Guenter Roeck <linux@roeck-us.net> napisał(a):
> 
> > On Sat, Apr 20, 2024 at 06:34:27PM +0200, Aleksander Mazur wrote:
> > > Hello,
> > > 
> > > I have a Wyse C00X thin client which is apparently equipped with GMT g781.
> > > It is (or used to be) supported by lm90 driver. (I have a log from 2020
> > > where it was simply working fine; it was kernel version 5.6.0 then.)
> > > Now, with 6.8.7, I get following error:
> > >   
> > > > lm90 0-004c: Failed to enable regulator: -ENODEV  
> > > 
> > > However, when I just turned this message into a warning and let the driver
> > > continue, it seems to work fine, providing temp1 and temp2 as previously.
> > > 
> > > Do you have an idea what could cause such a regression, and if this change
> > > (I mean: simply not returning error from devm_regulator_get_enable) is safe?
> > >   
> > 
> > Do you have CONFIG_REGULATOR enabled in your system ?
> > 
> > Guenter
> 
> No, it's disabled (and it was disabled in 5.6.0 as well).
> 
I thought so. It works in v6.1 and earlier kernels because
devm_regulator_get() returns NULL if CONFIG_REGULATOR=n.
The driver used that function prior to commit ad804a4d82fc
("hwmon: (lm90) simplify using devm_regulator_get_enable()").

> Shouldn't devm_regulator_get_enable*() stubs return success instead of -ENODEV?
> 

One might think so, but apparently the author thought otherwise. It looks
like the function can not be used for drivers which have to work with
CONFIG_REGULATOR=n.  The only option I can see is to revert commit
ad804a4d82fc because that commit doesn't just simplify the code but also
make regulator support mandatory. Matti, do you have a better idea ?
Other hwmon drivers are affected as well, so we'll need a common solution.

Aleksander, for your use case, you can just drop the offending code
until the fix (or revert) makes it upstream. Sorry for the trouble.

Thanks,
Guenter
