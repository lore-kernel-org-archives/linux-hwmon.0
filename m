Received: from mail-qv1-f44.google.com (mail-qv1-f44.google.com [209.85.219.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709E15D908
	for <linux-hwmon@vger.kernel.org>; Sat,  3 Feb 2024 12:53:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706964788; cv=none; b=uFFpPSwjmkLFj4Mcx8wVgyL5jP208zbOI16mXxBzb1KZ/p61+qVgied0RYzZJbkS0ozZzkelfQJLBIR+rlEj5rOakgJl8s3UgUajb+unSBmSe+fnBR+Ed79cEKYmaNzY+l3vkBPwHc0dWF16rmSBwmda6IP8hfviY9gR4C2sVsE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706964788; c=relaxed/simple;
	bh=JZdY8IOfuTQjiuwWDIjJDwKQKcZfUrSJEPA8jdSgfJA=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=R15QOubxDuUdkMC74qlfMFNFMWTn4xygmEaDBYLPiHqpS9sjLHwRqU6eLr4XshS+iTmKd0bDWcrOFw0MCuDPGxCg/ZcmINEOETNaeNHn04hyPTy+0aN6b2jPb4KNQFxwwZNsIpS0QlbWrgQwqZcIWNl0KrTlqyer6j3U7RC/DCs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net; spf=pass smtp.mailfrom=iwanders.net; dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b=M3smY3j3; arc=none smtp.client-ip=209.85.219.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=iwanders.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iwanders.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=iwanders.net header.i=@iwanders.net header.b="M3smY3j3"
Received: by mail-qv1-f44.google.com with SMTP id 6a1803df08f44-68873473ce6so14725556d6.0
        for <linux-hwmon@vger.kernel.org>; Sat, 03 Feb 2024 04:53:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=iwanders.net; s=google; t=1706964785; x=1707569585; darn=vger.kernel.org;
        h=references:in-reply-to:message-id:date:subject:cc:to:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=+ReDNDkHB2lAopRt5GQbKMosWgLU1ti2OpSA2nlGY+M=;
        b=M3smY3j3m/DdDfr0WAG3JTiFwNG1hW//TAXam8EVADSN8tpJgJEA6HBZTSQfEg8KsD
         GWzg5c1yc6sS4iSWBqa0iH85y7JGVnbIrqJieq3gbIG6FPYhxbrhIRTT3hvOzNlAaFQI
         lKGtQjXJLQjmv4ceGr47Y/XM6a8gtJfcbD+qM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706964785; x=1707569585;
        h=references:in-reply-to:message-id:date:subject:cc:to:from
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=+ReDNDkHB2lAopRt5GQbKMosWgLU1ti2OpSA2nlGY+M=;
        b=botM8ikc2rA4qDe3dM/FcrtUzHhhpRDYoYasGLeUXg8Vj9w0+/Bt0QGon1k+329s75
         0HFhPEVhqY8ZQkHVKI5OX3jbQRHbCrB2z9TxvWuNWJvk26uNg+t1Kk+w/+5xjABFG5Yj
         Gfkm1AQuW+gFhfNrCkLpps0FNLuN90e2Pn2f5fQX2MKwC5nRPrJF5LPwK+oF04WJAeeX
         Z8U5ODAwFq2lWnzbuSc8eliVQ21VfHxJTWznh/zFpEs/lp6+Z0yJB/ndbbvtUzmyWnKB
         sBd4FUZQRFFbRoWkdaaTLJIq5/ZGVrlnKfZLBGEkxxzk5hkPaZXfBDG2zsmYR5q4+V+E
         pxag==
X-Gm-Message-State: AOJu0YwVVnBeWgKHUz5oSj1YwkyHkX77l6odcGoJG8bljiSpXssgeuNc
	2E71wNbr8jbicTBCnioWlxhI29c8MqScoLMfnazPcmBU9MLfJw8+sWXE2XG5o7k=
X-Google-Smtp-Source: AGHT+IGSNEYV1+50wnJSgTLibulqA+wAqzNkHFYfrxgDJxTAFJ+fCWNm0uUAU+Il6OPPR08eKRRm3A==
X-Received: by 2002:ad4:5dcf:0:b0:68c:96d2:5a53 with SMTP id m15-20020ad45dcf000000b0068c96d25a53mr578142qvh.32.1706964785163;
        Sat, 03 Feb 2024 04:53:05 -0800 (PST)
X-Forwarded-Encrypted: i=0; AJvYcCUk+Wan+YyV7M3bfYVH/NApTQwDBveB7LHlcgNn+CFnzt+LOadrsfXSsRHgoYViiYG3ej+6ltaJz8iEFoUEZqnzMwMqP8IqaYPL/9RzzVz9q3mD8Ve2abUyRZNgRbYbdTyXa8rUN0boqY3cWWjX7vSSzRfsvt5rEkhZ1BPlxYdHiMd5lWX3DFPgNIlk+x4vkqw4DpGj6JDopXxjmbhwd87kOrMXupi6hhgpiA==
Received: from eagle.lan (24-246-30-234.cable.teksavvy.com. [24.246.30.234])
        by smtp.gmail.com with ESMTPSA id mc6-20020a056214554600b0068c6e366a64sm1778370qvb.47.2024.02.03.04.53.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 03 Feb 2024 04:53:04 -0800 (PST)
From: Ivor Wanders <ivor@iwanders.net>
To: lkp@intel.com
Cc: W_Armin@gmx.de,
	ivor@iwanders.net,
	linux-hwmon@vger.kernel.org,
	linux@roeck-us.net,
	luzmaximilian@gmail.com,
	oe-kbuild-all@lists.linux.dev
Subject: Re: [groeck-staging:hwmon-next 13/34] drivers/hwmon/surface_fan.c:22:9: warning: no previous prototype for 'surface_fan_hwmon_is_visible'
Date: Sat,  3 Feb 2024 07:52:17 -0500
Message-Id: <20240203125217.4702-1-ivor@iwanders.net>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <202402031253.JPVKEF5X-lkp@intel.com>
References: <202402031253.JPVKEF5X-lkp@intel.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> >> drivers/hwmon/surface_fan.c:22:9: warning: no previous prototype for 'surface_fan_hwmon_is_visible' [-Wmissing-prototypes]
>      22 | umode_t surface_fan_hwmon_is_visible(const void *drvdata,

I tried reproducing this, but I think this issue is already fixed in the
most recent hwmon-next?
The function should've been marked `static`. It wasn't in the original v5
patch, but the current commit in the tree (216d66aa89f9fc882) already marks
the function static, resolving the issue.

~Ivor
