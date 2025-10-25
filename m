Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99DA135B12C
	for <linux-hwmon@vger.kernel.org>; Sat, 25 Oct 2025 08:19:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761380399; cv=none; b=rGg2jxoX7UziOkvIwHzvDYWhHzqyoNYPPzEoqSI3LK0Bu2K+ZxEQ5QI1e5w7I/LVB/z9r0pcgnpdGUwLAR6/p7ElA3Bd3DwrlT4be3NvFnf3qedmvlTF7XWdaoXUekvTmCY+reCUV4vl7iP9eK82KoqfBTjxOeF77v7Q6uMFlRc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761380399; c=relaxed/simple;
	bh=AzfeVbbRV3eREjYjS3QXyjhA7RuXufKczC6qDZJG4R8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=G3JbianevAQFKbrv6mlw3A688H0kbWGrrGOuTwrWryZU0kCab7DyQAt2WvmxZffibQ6Ci0+G0ejEVN8681mM5EIe/o1WMUdMk2pMKKr3DgPLMiozz8bi4wNcrVcpsOjXvJuNiwh3aHvfgVkcX6Wp5Np03bOxzQeS9kHxJjGm1QM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=M8QyQ8lJ; arc=none smtp.client-ip=209.85.216.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="M8QyQ8lJ"
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-33d896debe5so3357731a91.0
        for <linux-hwmon@vger.kernel.org>; Sat, 25 Oct 2025 01:19:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761380397; x=1761985197; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=W0P1qCP4uZ3AAQgH9R2rp1FNOw4ZXslRjRKDSpwrrHA=;
        b=M8QyQ8lJBaQ80dl5sSR5pL5bDSaJIMAihZigDv3Nw88lcs1Xfib1c6y99/mZO/So3W
         EnjohnJsPaiqgSaCGY5A/n+Ckf9NIMWPbnW415BeH6p3lhohoMqgAgepa8hsgmSZDQyq
         fyyuQ2QytLN22VpW58mm3xXkf2ZYBliLlxHFlDc9+uBpSY4JOmpE/o7MEdmQO+3X69ng
         CaNMu23dUZrablAwuqNzElo1p/FZNQBWv/9vKuZUwdpZycPY1tnUBW4yZLHJ4OPUfS6i
         9R4P/FNDM1ynL0B3tiZcZY0yMggQDy9+ra4Pw0n8o9KHSADhSA4IZxsqHLxk/B0X6Xe8
         xQgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761380397; x=1761985197;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=W0P1qCP4uZ3AAQgH9R2rp1FNOw4ZXslRjRKDSpwrrHA=;
        b=r+knb7T4EVsl4LJfTn112dXtsZ8qlKBLhuvU/Cy3lzwu4vZlAX4NzXNQSXweekXxgX
         x9ymHnNZUV6O8VBBTeANwROvVfzMeVpwHIK0Bg5EEMv0JE/BT1EHccYSmCYB22aZ4H/I
         ZUkMnIxef4t+hXjIxRHlS6ouppa2W6KNMDRGtdSBTpfFgGUimbn1NFhVGOzptBI66C9d
         iGTMIQb4zLq9q/RaHtsaNpyCKx/KmA1CvQIHaa40U73II2C8J4abknPIU7Gt+dQ4iYX6
         hxD4QrpBiscCrp0bZoS+V/UzvKFE+ux9ZXQlMctGz9BOfQDZhnRIZK3ORlEdZf1Mh06D
         AD3A==
X-Forwarded-Encrypted: i=1; AJvYcCWzSf1mM4M4mFs8vjbt4ThFFOyT4+tvPt5Im+cCh6ep7K2TvBMDhT97F4gPr8e6+R66HOE6pRwu1qPYdw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzoJCoU2IdIShPLPwAI5VV+h2VmPIUUGsSOH3o3RsSGjRqBuIQq
	Ywz9o5+wckIywEDkmid0dPz4tCAwkfIXX0VWWbOlOMV8KlzNWZJ0fgRt
X-Gm-Gg: ASbGncs/gq36/2njpScnIdEEz8d0ToPvtN87X5xftfRIVRsZ5FsF07QlH2Yxzo1yEXr
	SLh7S22OamOMeBX/tW7uDtKR1JihDGEi/qyWOj1rfQPgXGRtsgk1fmzjKncFYUYcUlpkL7Dl2XX
	9+FXV58wR2gWDDmkmB8tukH8b6jv0DTVG09EyDGo8nhwd2pXYx2wyr1azF4OshRCbLS5bAPFQt6
	yBHVAt19w2kjHk8PRCwJTrlGbBfSFAcJ+go4haBNFpjgX0NN5ujUEILioWJmmImOyoN8mX52Lzm
	7//Vg4MsVr3fYOniHtgQW2o/VfjXXkUsqAPv0iCm+Ihv0yVlUQV06mHX6V4DksjEqDlhTnfU89N
	QOb36q1+BNLkgCCibG9z22hMq3yobox0a4W93RbFPdzqO7pZlT+q/1pw/dirkRq7lNuugRw2crk
	rRlmufM+GjBijRqNeOnRhEdZo=
X-Google-Smtp-Source: AGHT+IHGTk9mHrG98F2le4aB1w/t0kcsoJBN6xOXR8de0Ny/hqGEZAIH8AH8oW3GDzOVT5iOt4o7jg==
X-Received: by 2002:a17:90b:530f:b0:330:6c5a:4af4 with SMTP id 98e67ed59e1d1-33fd662e554mr6574117a91.35.1761380396715;
        Sat, 25 Oct 2025 01:19:56 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33fed81aa87sm1511375a91.20.2025.10.25.01.19.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 25 Oct 2025 01:19:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sat, 25 Oct 2025 01:19:54 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Gopi Krishna Menon <krishnagopi487@gmail.com>
Cc: cryolitia@uniontech.com, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, skhan@linuxfoundation.org,
	david.hunter.linux@gmail.com, khalid@kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH] hwmon: (gpd-fan) Fix compilation error in non-ACPI builds
Message-ID: <6a1e1503-0529-41f6-806d-0ecf0f8e77fe@roeck-us.net>
References: <20251024202042.752160-1-krishnagopi487@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251024202042.752160-1-krishnagopi487@gmail.com>

On Sat, Oct 25, 2025 at 01:50:40AM +0530, Gopi Krishna Menon wrote:
> Building gpd-fan driver without CONFIG_ACPI results in the following
> build errors:
> 
> drivers/hwmon/gpd-fan.c: In function ‘gpd_ecram_read’:
> drivers/hwmon/gpd-fan.c:228:9: error: implicit declaration of function ‘outb’ [-Werror=implicit-function-declaration]
>   228 |         outb(0x2E, addr_port);
>       |         ^~~~
> drivers/hwmon/gpd-fan.c:241:16: error: implicit declaration of function ‘inb’ [-Werror=implicit-function-declaration]
>   241 |         *val = inb(data_port);
> 
> The definitions for inb() and outb() come from <linux/io.h>
> (specifically through <asm/io.h>), which is implicitly included via
> <acpi_io.h>. When CONFIG_ACPI is not set, <acpi_io.h> is not included
> resulting in <linux/io.h> to be omitted as well.
> 
> Since the driver does not depend on ACPI, remove <linux/acpi.h> and add
> <linux/io.h> directly to fix the compilation errors.
> 
> Signed-off-by: Gopi Krishna Menon <krishnagopi487@gmail.com>

Applied.

Thanks,
Guenter
