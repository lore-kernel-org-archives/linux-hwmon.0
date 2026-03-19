Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84E1C3AD515
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 19:37:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773949042; cv=none; b=JXeRDGxFftepMe5oTwufVSSfGtHboFw4v0sq5+c9YoHPWfHXwhfEzsjBNfp7zGtymlDfrrMgzhPvA6rrAsfIri68YooUdZrvMzTKVcGJUuiZwa2+jWtPcuEZgp1GPFRG54emW+PaOc0R0i9XTQBZHpYl1du3v00/Fww9KecntHs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773949042; c=relaxed/simple;
	bh=Y84pXEaEjJLFSQQ5oyQfxMzIHXXhsvAOYNavwFOWNQw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qwYLCpn+sr72m/ag9UThvPN058pZm23lStWksKHijoBVTFhKiJJcG/rWGMhH1t/xYiapWt+YA8Rq1ooPWP2p6f6R55TpEi0NCVMI0ELm6c+NhWnpIi7NN38QOlTHkvpa71WT8EEDqIO0vHb2ebhRgLf9eZ0FGzao04RVqxYnXos=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HgRqPz/j; arc=none smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HgRqPz/j"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-829781b2b01so896880b3a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 12:37:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773949041; x=1774553841; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=wqJGP06w4l6NsMu1IFSqXfiKfbLkWRgdyG6TiEebJTU=;
        b=HgRqPz/jNGH/M9b+6ayny9FPA8seo120a0idv+D15988Iif4lUgb8eK/ds4S5dityi
         T1MzCKDywDAwE54yV/bJxEDeMq1I4dIMopjjdvN2SOPFL1ywHeY7E2fNcjX3T4OR+ni9
         ym0Alwr6bJivWCGLl6/1hEIkr57cjPrDXabbaKdotVraUbGP7a+wmBQbWSUhCTeZCkDr
         +UNhD4FK/V950KG34htlCgUeH0AspnreuE+eu4DUYFaAw2HLqlag7bmnUolMaiY/oTr0
         HIro5mQo0G4PQ5szCttCqMZ0CaibEgXtSLQGPBsfifWFsrRUi8LHNFrdEaB/8aL6ZPIi
         gHAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773949041; x=1774553841;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=wqJGP06w4l6NsMu1IFSqXfiKfbLkWRgdyG6TiEebJTU=;
        b=AzGsr0FPZmT505fEJsyqOmjebgh1Fi998bcURyy2MpAXFUH/Z4EYgP/jwEa5YTD00c
         E6SDwoI+RH1ljMB6WDQkk0IBfLHL1wAOcbzKFwk2paX/gn2zR+lK5zU1bgfY9hd1l5Hx
         E8kHt6bnLFUKmm/6n0q8lY+9fdfBqMv2EX3J4WjqlPOxFI8Nxavq2qag6CyBj5jyt66R
         01F8jDm9RmFNcYHn59QOOvuej12SwAZGU86zvQxD3ujrYIezR4ciBnOgD2fEy6wIhSdu
         WC/VKrN5z+IiWQVRDSKZ3oeUbxc6YqXK2ik+qAlH0aCOETnh1Z2Eaf9Iukio6PPdiMA/
         SB5w==
X-Forwarded-Encrypted: i=1; AJvYcCW04UjiqDL1rnyVGrfT5wmt+/GKQJ2+Ojbjw2GqPvK+TiCZ3KVfSM/AjgcY9C+mi3dp1DJn3Nq4hgyemw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+wlvh04wmIp6dDDTHcQ+idTUBsLCoHO2ivtje8xSlMhfRuTlU
	tCMV/K1/viBqEy97mfpRPyUWtRdS3+sEL5mQzvCilB3wdxPl7P5RggrV
X-Gm-Gg: ATEYQzyLOSXVTsfWo5qZyO0vSRtasxPYv/UFUQ93r9+GdAw0ejffTlF9V3+2CiX2po9
	hmbD4oDyqaEMnif9vl12Y78alBSJE7wA+SGL4HF6s6P4tk9GBjQLYa4lgg9hMOyX9I94Ke3923I
	XXQBg5nL5BMN08RLf1j90EOSabgx3yVDLYO0AMooI0B9+jjapebvV5auu/YCbLT/VyrIdp87bg1
	PyBJVHlzbxvC/sJuoFaBtRNPcugMDWqC9w+7sNY3u6qQgc9fSUSd52BlqI30D4NMPagK5Twj6Zq
	DHr0f+SxgAu26G1mwCYrd8VM4uEooR7ac/284VCjWmWpmvLyw16a8eZJR//jgK8XnJbC1O8yhr8
	JH1Hah4t0YCHc+1MY0pOpSapQ4ETnKUp9FZIXjUje82v8NZqddBSfv4d6J2hKAemkuO7hcNfWlZ
	STNQESpsanVF27GD5b3R7BCBo1i5DKAc3vezk/rl6D+A/F7pvkDss2lVvyr7m6HDGnF2SrN9lN
X-Received: by 2002:a05:6a00:2d0e:b0:822:6830:5900 with SMTP id d2e1a72fcca58-82a8c234e19mr366214b3a.6.1773949040836;
        Thu, 19 Mar 2026 12:37:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03bbebb2sm27212b3a.14.2026.03.19.12.37.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 12:37:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <eaf96a25-4aab-4f8b-adc3-4862ea5ad773@roeck-us.net>
Date: Thu, 19 Mar 2026 12:37:19 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/1]
To: Sergio Melas <sergiomelas@gmail.com>, linux-hwmon@vger.kernel.org,
 groeck@gmail.com
Cc: platform-driver-x86@vger.kernel.org, jdelvare@suse.com
References: <20260319132920.275755-1-sergiomelas@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260319132920.275755-1-sergiomelas@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/19/26 06:29, Sergio Melas wrote:
> This patch introduces a new driver for Lenovo Yoga, Legion, and IdeaPad
> laptops that report fan speeds via ACPI.
> 
> The driver addresses the "jumpy" and low-resolution RPM data common in
> Lenovo Embedded Controllers by implementing a passive First-Order Lag
> filter with slew-rate limiting (RLLag).
> 
> Technical Validation:
> - Verified via physical tachometer and FOPTD (First-Order Plus Time Delay)
>    identification to ensure the filter constant (TAU_MS) matches hardware inertia.
> - Stress-tested through multiple S3 (Suspend) and S4 (Hibernate) cycles.
> - Verified 0.0% memory drift over 4+ hours of active monitoring.
> - Compatible with KDE Plasma 6 System Monitor and standard hwmon tools.
> 
> The implementation is "passive," calculating filter state transitions
> only upon userspace read requests. This ensures physical model consistency
> without the power overhead of background kernel threads.
> 
> Changes since v1:
> - Updated MODULE_LICENSE to "GPL".
> - Removed background worker/kthread; implemented a passive update strategy.
> - Added Documentation/hwmon/yoga_fan.rst.
> - Added universal ACPI path probing for up to 8 fans (FANS, FA2S, FAN0).
> 
> Sergio Melas (1):
>    hwmon: (yogafan) Add universal Lenovo Yoga/Legion fan driver
> 
>   Documentation/hwmon/yoga_fan.rst    |  36 +++++
>   auto_compile_rust_lenovo_drivers.sh | 196 -----------------------
>   drivers/hwmon/Kconfig               |  14 ++
>   drivers/hwmon/Makefile              |   1 +
>   drivers/hwmon/yoga_fan.c            | 237 ++++++++++++++++++++++++++++
>   5 files changed, 288 insertions(+), 196 deletions(-)
>   create mode 100644 Documentation/hwmon/yoga_fan.rst
>   delete mode 100755 auto_compile_rust_lenovo_drivers.sh
>   create mode 100644 drivers/hwmon/yoga_fan.c
> 

Some additional useful AI review feedback here:

https://sashiko.dev/#/patchset/20260319132920.275755-1-sergiomelas%40gmail.com

Thanks,
Guenter

