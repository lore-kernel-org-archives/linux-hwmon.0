Received: from mail-qv2-f12.google.com (mail-qv2-f12.google.com [74.125.230.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2B533947AE
	for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 14:34:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.140
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789569248; cv=pass; b=SRWRB+GqhIMiiAInNm5PmLDzIlXc1c3qmru1M1IDSlPozXD63UBdvXg8SOqdPe6UeGkNFJoyI58aNLW97RzYOpTvp3sGYpZWOahKMqqjmZm9eeEdDkxc1Yx0Q+GwAf4rDMayI6xqC3vlXBeS47Cvs0dmozFXmi/ESzBFWHW4yGw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789569248; c=relaxed/simple;
	bh=OwB/d5OxQu18uidgzkX2hP3f7HqNP/l7GdXuCXOPh30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W9ut8+3ziOpDyNhyU8Q0AX1ETLFDwnJWGYhnZC6Wmq5hvwYfMz5H9J2JAbxJI2mVO42tR5tPuSw0iLDkTecdIo9xlOzPSG5fykWAASIWf42jP3IHP8uM8tmDagin7TueghOKRBv66ssTIN8GzVVRAoPdjWNOZyg0CL+xnMugbho=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk; spf=pass smtp.mailfrom=thegoodpenguin.co.uk; dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b=Oll1lZy4; arc=pass smtp.client-ip=74.125.230.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=thegoodpenguin.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=thegoodpenguin-co-uk.20251104.gappssmtp.com header.i=@thegoodpenguin-co-uk.20251104.gappssmtp.com header.b="Oll1lZy4"
Received: by mail-qv2-f12.google.com with SMTP id 6a1803df08f44-9107051ba26so6650736d6.1
        for <linux-hwmon@vger.kernel.org>; Wed, 16 Sep 2026 07:34:06 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789569245; cv=none;
        d=google.com; s=arc-20260327;
        b=jwC7VqA7LE803omUWPSS4N3o7pARk9f0XklQUmJvQ9DiKb1dExy7Wlfwgh28AyFL53
         yNiwkTqaFf22DLCTDvpaeYrYctIHNx38sZMB/z7zljr23Mr1EQI8pjWzRmTfUIsxqWLq
         BbBd0EHDofB9MUAKVfCkrGYu4nuBtdIo/+kx92xjF/r31mIC1HgZ1CXlx0dd6NNQES41
         0xduPicAGlSQkxxUs9aZY90Xsv5CaB7jskkwkbYnn0vFHaDJ324DpDPf+FPFk0UyZMN0
         47p26SJKNLtflGSWDkiCGeQUx+0h4SAkf5isSh7DWbiOQSW0CMO6zo7C7t/1vqEHeIYp
         94Ew==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=OwB/d5OxQu18uidgzkX2hP3f7HqNP/l7GdXuCXOPh30=;
        fh=GfumxlPTR30jD8D05ps3LZj2dp0z/ovt9O7LXhFS/fo=;
        b=ocwTVUFUGX2/A6YE7SJry4yxo2I9CqoaLXpHyz/hJe2W+7b7qbCNQ63l0pziyE+aCp
         lJUTEbONJbxWYJsoVURTeavxve6XlqI8FLuECf2uD34QcYf9joGydI8cdsWjliqkgJVF
         /B8TKDk+ydOsW55BhIoiyBtBXGIBRpe7i3cY/LO984FT0/SzzcwnlXLR1/RedAnKgzL4
         42SyOdmd4E+99s0mCJNS1zzuSZCGeNceW4v/NOBysJxxHewaeShYoMkPrxPpTKD6VEzY
         3LXyL5q5jABZqu9uuuzlq327pjkjwKA78ZoHWdqdwYL/KPf2XbG4Gv6feNZlIi6ELGsa
         pfiw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=thegoodpenguin-co-uk.20251104.gappssmtp.com; s=20251104; t=1789569245; x=1790174045; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=OwB/d5OxQu18uidgzkX2hP3f7HqNP/l7GdXuCXOPh30=;
        b=Oll1lZy4gw6gjhCnHbEPsz8oAxrITzPHBEO+pTrlwesZHv77BjN8RHNzXwB6febAod
         0f/RTNZqryn5AhmR2Ea1DgkOit8YqEzJ1rT2gyYss708XuT6j33phXVMgXUKxMuXiqpl
         1reUpKK/mzHXX7sGAi4Y7to89yQ/Dy72ig7k19sSWYSBv1mDh6MZInu6xVPCLUOn5On0
         lrq2BwW2t2aLQJQEqPRNKUtn6r/8ostWb/EFTkXCBmvL0EA3+lRDIFnZ0fEtrSiV0Bjb
         ujCpbkkdj8TX0Ip2qEjlUx8Syx2mVxVNH+2LuOaiCymCk0dIfprnVortIQGf0HiSQVLT
         4kQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789569245; x=1790174045;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=OwB/d5OxQu18uidgzkX2hP3f7HqNP/l7GdXuCXOPh30=;
        b=zm2Q8TbhbwV7m7Za1sERoVx3fntqu3KBnaj9//w17/H80cM8YET2AjsP29suYWNcA4
         HWQfrUBRnwg7otugsKs9xekrmvD8AV/Exsu5QCYOHJBBE0uJjPZp5s7SMhJiDz5nmer9
         bJCYX4/SBwfIuearVrHQ2I0yweLnMTz/4Avd1C3yUau3TC0O25KGhQstIvomi1p4B1RT
         RmLP/8bqtB68bNJE65BhDXM2NHOXBQOf0Ew6csz+aQ/BCMgAJUfc8VyS2VCCn2ZVfYvn
         7BUpwbXhWj5818fWhqotui+kxxBDSxyWBo68hM2AtjZRl5dAN+cEvZ678ZavZcx9WpJA
         w3XQ==
X-Forwarded-Encrypted: i=1; AKwUvBz0Inozc4uAHRJ5oKjOrtkNt++GKYTacQej5bPdNunTV4sHjSd87vapl9UbCtkDg4A4O3xbfwydMqso6Q==@vger.kernel.org
X-Gm-Message-State: AFuF++lGTycFUgqlUjb+7Mb+CEZ52aVPMIEqwUie1JixiFLkvLDz8Grq
	1KzvuIxFtB4ncgSXusm7mTTlcWpoxfKDkR1lDsC0o61r125WyosaeT5m4n1KKAnQYvK/k3LNlct
	gzcKQoPl7A+pNr/L+M1xD6HcIGKNrOmMVetUd2hfFcA==
X-Gm-Gg: AYBFou2DKke2aH5h2S4O/UMMTH4HaAk/x6FW2Lmw2Iiufp4A4gGxzOVVPncMrTwOj5H
	0y2MTl0NLVrTsFKyBr7X7s4JtYZK+9jY8E2cf8mM3vKKyO1L0BbWmEVBvBr21vu9Xq51tYVPro/
	fvmPtWhfZFcITY9SQHGr2Ii8q9Npu4taVDkzzbKuhHdZ2b7mSk6Ry4J289j9OqSlt4K8y8z9cLM
	qsNoNoA85jTx5nwb+OWBadYg9vvVCJFLv3r5yrCtAhvA+9omkSzZTblVKfuRWOXx2HJA0nSm6Dm
	T2dcbyWW9pTFDqLgZ3XujEsrRt8j/70H9xpYFPM+cmnzV2WtjQzlMf+0G9N+TkYVjt1NCFWpBQa
	o16p8CfXXzj4E
X-Received: by 2002:a05:6214:2307:b0:90e:9dea:82f0 with SMTP id
 6a1803df08f44-9123d72e492mr50551696d6.15.1789569245319; Wed, 16 Sep 2026
 07:34:05 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260915-acpi-hwmon-v2-1-39d17c748eb6@thegoodpenguin.co.uk> <70746c77-e113-4bc6-93b6-7ac6027c86a4@roeck-us.net>
In-Reply-To: <70746c77-e113-4bc6-93b6-7ac6027c86a4@roeck-us.net>
From: Pawel Zalewski <pzalewski@thegoodpenguin.co.uk>
Date: Wed, 16 Sep 2026 15:33:54 +0100
X-Gm-Features: AcwNN1XL40ERZH8e0Yhs7auCFY005nLn5S0ImA1LSDoKwV3HLcPsYK0Xe6yniGo
Message-ID: <CAA6zWZ+8KUSzah7y4TXrkvOnChDyEur=HCXgukcFke2dEjgQ2g@mail.gmail.com>
Subject: Re: [PATCH v2] hwmon: use named initializers for acpi_device_id
To: Guenter Roeck <linux@roeck-us.net>
Cc: Luca Tettamanti <kronos.it@gmail.com>, Cosmo Chou <cosmo.chou@quantatw.com>, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

> It also replaces pointers to empty strings with NULL pointers,
> which is a functional change and still neither documented nor explained.

Please note that the 'id' here is an __u8[] array, not a const char *
and that the generated .o objects are equal pre/post the patch as both
methods just initialize the array to 0s. So I think the commit message
explains what the patch is doing, perhaps it might be worth mentioning
that the 'id' field is a byte array in the message.
