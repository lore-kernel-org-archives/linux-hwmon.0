Received: from mail-pg1-f180.google.com (mail-pg1-f180.google.com [209.85.215.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8AD192EEE7E
	for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 23:35:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787096138; cv=none; b=EzSg6v+2lsFPAgOAgVHY2lvGDQh9vOp+zIPfJBpsyU7VkXkLEpMevZnEcr8MqTrJ7qcPK2vbp3On6tQEE6883xuQSunpipn7uee3fPJWM7kUn55zPb3lomi+so97/+UxWbQJOvfTgdbsY9jWFN8ThXk3UEbNfRS2HcDbWQPZXyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787096138; c=relaxed/simple;
	bh=Lo5Ern/y80gahHtbvftl6+RO/JxxG2MKaw94H8fl0qc=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=elgpYJcAvXEvKQKtpvpQ+vh1dpcrrQ7TdkNM+7aExtEshHssVbEHY6Kjj370Pn/okjsc1XrFW7HmHkwIzYh/CcK9nThsYfcZQIc0AgE6diqNfD3qTzOYUXSZ7ezKMiO9KDGPD3G5VYXV+yxfgK+H7oD5hmMS6x+Z2fUSRW5o+nU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=H+i5auv8; arc=none smtp.client-ip=209.85.215.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="H+i5auv8"
Received: by mail-pg1-f180.google.com with SMTP id 41be03b00d2f7-ca12086c06eso273773a12.0
        for <linux-hwmon@vger.kernel.org>; Tue, 18 Aug 2026 16:35:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787096137; x=1787700937; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=hOd73QypYG/lDkiROZtsSJXo64G6ueTd+G4+cxdnqr4=;
        b=H+i5auv8ZTJQ8cDBqQsTBTwvwbWyxw0a7VRqoIY8hmOlQikoLd2EKmZ63fbrBOJE6S
         nmwlqllaC42P5I1N3ltvbm5almafuxTHBKC4mnILpRVJ7YuA4x3Bwm+JUKC4JMxdJLXW
         hXTMC7/N3287rEx5H7c+GZYSEurrbsSaAFHKqRXs8kwpQT/DSHj75Hv5BL8nBb93wecI
         /o+7Y6QjFk61R+MJ1xOmw0kP0nKDlHxyVEJL2FL/BHD3e86PZZAIqhnyx5Lrukf0Fsjz
         k+7KXQNWRf5hB6mxQ8n6tKX0jBUuGGPm6wGvGLXw+Znr5fQPHq7utHdO8HSX9OF9bxV9
         V/gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787096137; x=1787700937;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hOd73QypYG/lDkiROZtsSJXo64G6ueTd+G4+cxdnqr4=;
        b=dm1NQcNa1chdGd4rFgxZFB6cDBGoF6zG1WXQq4pZOZb0gP+/gNjC7/S43MUeIlGFY9
         R5mrP80WJqpaqYvt/UDBBAqKNiNRGccB5fQta00UZ4sVZnvCA6KoTgnvHEyqKw49Gp4W
         NhJMv/xNmTl+w1fyM58YKsYJPX6C/m2lHQQ/elheHCOZPMBlpMcAPPYVkdW+E+9ZM7wU
         TiBMhpdvRfrxTM9HQIrQ+UMMLYCBU0r8CeabQkkhgxkMUM3Kes3fiY/maDf9QvJ9bwH3
         I2QajxxuHMyPEIdT7VtL0dSoXSiFaymHAbczFY/oyLjtKpbmaOcJJPyI1ErVMw8U7yGU
         EehA==
X-Gm-Message-State: AOJu0YzDLVmW50D65Q23nulSZvcf3/2c3otQPq6CTi933eZUVCuSSlZJ
	e962UDPnEM9MrCT8UEFe7pj0iW5TD6X3OXFn2rpGd94XhVe16usvoGIaVMopXA==
X-Gm-Gg: AR+sD13YWEARnLVYHs8XHsTVV+V39r7Wdq9/AZRGuSC5pNaJpqxB84SBAZSL4vJfcFf
	4jIxGOpk2ombcFLLTwAV7FdjOvu6Wh3l9OZEaQRzw5NED4pRvtSCrO5a+rYEFwEbMLZpo6N+bCD
	X7iRv3VVLN8AUlVcRCNFRMys87qEksqMZvaffxh4r0bs/ydBPBFdQt/U8AX8zcwUR7XygWeREeP
	hrk1DOWQA5GMZJJDs8k18lEubdrLRCu0+nHMwjNuZMeSvWdCnMaBiXkauH/kLXo1jvEGwWIq41o
	BqiQJtQQSUcg0gyLyVtUlHEprunejl993t3Y+OnxjglwZ37hugJAs0r/p4buYox+i6R2gQYnAVY
	bUSIjGZiS/lojRAkdkHwd0+qYMYUlITn2rhw01YN8aNZ6gQm0gOwX5I2iHTpKKuaaTy89Zu8b33
	IAH7acKNMNMOPblT9t9zaBUZjbkJU3bY93EndB1E50vrIvepJzA+4D5KnscGLmmfi8OI/Ylnl/z
	4e2+waCEtQm
X-Received: by 2002:a17:90b:5903:b0:38e:659b:f366 with SMTP id 98e67ed59e1d1-395804b57e0mr1049850a91.0.1787096136658;
        Tue, 18 Aug 2026 16:35:36 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327bef79243sm568221eec.11.2026.08.18.16.35.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 18 Aug 2026 16:35:35 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Tue, 18 Aug 2026 16:35:35 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: rahlquist <rahlquist@gmail.com>
Cc: linux-hwmon@vger.kernel.org, sergiomelas@gmail.com
Subject: Re: [PATCH] hwmon: yogafan: add Lenovo Yoga Pro 9 16IMH9
Message-ID: <bbaf17c2-6224-44ff-9a2b-af1656214379@roeck-us.net>
References: <68b8866c-72d5-4ae7-9a41-ba8985d672a2@roeck-us.net>
 <20260813164746.105154-1-rahlquist@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260813164746.105154-1-rahlquist@gmail.com>

On Thu, Aug 13, 2026 at 12:47:46PM -0400, rahlquist wrote:
> The Lenovo Yoga Pro 9 16IMH9 (83DN) exposes its fan tachometers at
> ACPI paths different from the generic Yoga configuration. Add a
> model-specific two-fan configuration for the PC00.LPCB.EC0 namespace
> and document the corrected mapping.
> 
> Tested on a Lenovo Yoga Pro 9 16IMH9 (83DN) with BIOS NKCN35WW: the
> patched module registers fan1_input and fan2_input, both reporting 1800
> RPM at idle.
> 
> Signed-off-by: Richard Ahlquist <rahlquist@gmail.com>

Queued for 7.4.

Thanks,
Guenter
