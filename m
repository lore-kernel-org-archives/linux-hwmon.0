Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A5F8830C158
	for <linux-hwmon@vger.kernel.org>; Tue, 23 Jun 2026 17:45:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782236743; cv=none; b=r2gg93Ody7XkIpYkgo7blq6AS9yqAVeN2qIujXBkxPL9Yb39rd4+e/luXkIkP0UGJq2Va8bS33ClnsdT1fZIaOMDdp0gj2hiWupu6bdm1GWz/8hQQ8rhoNmrg/KrpJobrHh96SlN0Ezhm7HY6kHUHCcERubLRmQdtKJL0aRRgSA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782236743; c=relaxed/simple;
	bh=Y/TrHXqYhN6giqN4nIX4vTAAckNg4SJe7VnJ/4idkNk=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bWDfbc397ouKPset1OiSj7aeSABK/qqOrshF7bkXdXJrUxaBWNfCelazwRnPkLewXbW7kTHWYKzb1FEa0E8vzvUKLnmb6nDnSxXMNBI/ALaaAYUmZZegolAhv/loaZ2M8znZGJqHxciiUVAjCPSP5C9CzEl+ptYhWJJTorwvjRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=YabTfO8R; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="YabTfO8R"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4908b92904fso1998205e9.0
        for <linux-hwmon@vger.kernel.org>; Tue, 23 Jun 2026 10:45:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782236739; x=1782841539; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=whIEu6zBxCHV6H/RXHReQNaO8uDBn39hRq+aalCpQ+E=;
        b=YabTfO8RA2Ueo9yfU5O0SoOF4m+k5HyvEkGsPE2KhncK+nnkVj+l3FDRLVt++2nkPu
         Vgid4K4qbRFvr5vM2rjlacgC9lfhLEN5/v+uYnul72qua8o3jBGES9YW0W+PPbd6q+nf
         iol2KQ9+P+/88cMbvYrWWJbbwm1MKJcaCtYUuugvsp3YEeZqq2rG96L59miocRIlYJ+Q
         fy8kZGNv2Obv2keCx98YBRb3m/KcmbhEvauoMApiHKO7m9Wu6fP01VRkFjzUtiZgGddp
         Xg5kgdjkrbXomEkuuxTcgjuD5k39qoYwGsh5PTsgZc0hPv0wGcKO1o72THTHoAOFlELf
         ozYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782236739; x=1782841539;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=whIEu6zBxCHV6H/RXHReQNaO8uDBn39hRq+aalCpQ+E=;
        b=NAU6bsNG55Ccm8iqqpgqI9Q+t8emT5VCJcQImU4r/DCAEol+zsfrA6PRa6NbkY/o2N
         e95MuOWGno2iWCLNqPSNfJ74XcM5W55oJZ1GHxj0IjoUaMCPpv5+cDGzpYGUGX+k2N5u
         uiF7uzOdlVbE8XO2X++BXF7gspslkBhx7qk/1eohrN4xdgpRktPOhqOsJOxWzTVKshFM
         12oNV6tZF03bdlXRyfMpepXHfjXwzth2e+mA3Ev2tceVz1gfwJjLCAxOUAWQH6JrXpWB
         QcaGHZw188o791uBKIr6tysVXjcS9Jk3rDL4BJpmwzcJD6s55RiV/3gsDFpj1xxoXs5A
         YJow==
X-Forwarded-Encrypted: i=1; AFNElJ80Ap1dI3XY9CQvahi32S+St72QjDcvI+Se3i/9lOfnWGmGifpK+kmHI9Wp520uf1YNzQB6kXNj4h0RVg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyoF5I3H59zKL0PBB/wv8GsH4zO9Uzkobgn/Id461pnzIFDu9y
	/Bq96wSgebhgVQkX1OnupSGUwZId3UQE4j8CMo8yzksdSvjhS77XFp+h
X-Gm-Gg: AfdE7ck6WB11c7S2OgHrjzdfZrAl8gHTx1GpWs+xqHqDjQHfUibQhD4lHNHkS1Dp2NE
	HP2HnVsxFl43DdXsQO4CbYNZvxE6ZUMBIDZK300LJI4P9RtHA0+GO2jPhOSixhptuCJt6ld37I5
	4v0e4Fat7TnKfwhqYbc50t0S7gDzos7G4rDH02W/oOcb5W/N7Llx+H2V106d2LXtT+ewqTvNagN
	wAgSxmFjyEO5PlgbOpq89GkFTVu/fyOt7AjYzH+Qv9WU+vlTdkgeGPlGHETcyFrJkDAYyHiN6xm
	9jjN9GgBvNXTcwWh/iSU0IifvGST/QWdZWxC9Vwkay9/jbeNiLM7YZoOd5jXMRYsvD7rol589ik
	tCitzuBco76Uo8FVIM/N+iSPEy7/nBPejJ5Kdg7P1B7jkPG2ht96RNvHd4NUApspOHbqWTsP6qN
	ZManCcuebrnngCjqj6uXQ7T9InKyi/goifeIGwJ68nLC2PMXzGt6gMWVwV8Ik56obny9lioZ0r9
	n2X6Z7e
X-Received: by 2002:a05:600c:6207:b0:492:523f:a3df with SMTP id 5b1f17b1804b1-4925b34a37fmr62017935e9.5.1782236739046;
        Tue, 23 Jun 2026 10:45:39 -0700 (PDT)
Received: from [10.128.11.131] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4923fe7b9e5sm377581445e9.10.2026.06.23.10.45.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 23 Jun 2026 10:45:38 -0700 (PDT)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <458e0f2f-9997-42b5-8f43-68799ff9d4e7@gmail.com>
Date: Tue, 23 Jun 2026 18:45:37 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/8] hwmon/misc: amd-sbi: Move core sbtsi support from
 hwmon to misc
To: Akshay Gupta <Akshay.Gupta@amd.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, linux@roeck-us.net,
 arnd@arndb.de, gregkh@linuxfoundation.org, NaveenKrishna.Chatradhi@amd.com,
 Anand.Umarji@amd.com, Prathima.Lk@amd.com
References: <20260622135821.2190260-1-Akshay.Gupta@amd.com>
 <20260622135821.2190260-2-Akshay.Gupta@amd.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20260622135821.2190260-2-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

Hi Akshay,

On 6/22/26 14:58, Akshay Gupta wrote:

> diff --git a/drivers/hwmon/Kconfig b/drivers/hwmon/Kconfig
> index e4c4f2b09732..8f204cf49b6e 100644
> --- a/drivers/hwmon/Kconfig
> +++ b/drivers/hwmon/Kconfig
> @@ -1963,7 +1963,7 @@ config SENSORS_SL28CPLD
>  
>  config SENSORS_SBTSI
>  	tristate "Emulated SB-TSI temperature sensor"
> -	depends on I2C
> +	select AMD_SBTSI
>  	help
>  	  If you say yes here you get support for emulated temperature
>  	  sensors on AMD SoCs with SB-TSI interface connected to a BMC device.

> diff --git a/drivers/misc/amd-sbi/Kconfig b/drivers/misc/amd-sbi/Kconfig
> index 30e7fad7356c..512251690e0e 100644
> --- a/drivers/misc/amd-sbi/Kconfig
> +++ b/drivers/misc/amd-sbi/Kconfig
> @@ -20,3 +20,16 @@ config AMD_SBRMI_HWMON
>  	  This provides support for RMI device hardware monitoring. If enabled,
>  	  a hardware monitoring device will be created for each socket in
>  	  the system.
> +
> +config AMD_SBTSI
> +	tristate "AMD side band TSI support"
> +	depends on I2C
> +	depends on ARM || ARM64 || COMPILE_TEST
> +	select AUXILIARY_BUS
> +	help
> +	  Enables support for the AMD SB-TSI (Side Band Temperature Sensor
> +	  Interface) driver, which provides access to emulated CPU temperature
> +	  sensors on AMD SoCs via an I2C connected BMC device.
> +
> +	  This driver can also be built as a module. If so, the module will
> +	  be called sbtsi.

Your kconfig changes introduce an unmet dependency bug. When I enable
SENSORS_SBTSI without enabling COMPILE_TEST on x86, I get this:

WARNING: unmet direct dependencies detected for AMD_SBTSI
  Depends on [n]: I2C [=y] && (ARM || ARM64 || COMPILE_TEST [=n])
  Selected by [y]:
  - SENSORS_SBTSI [=y] && HWMON [=y]

- Julian Braha

