Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792974927;
	b=bMI2zY7IQ5SE7StXa0gr37ZOW1kiqsgcbnqNCfQ1483x+BUoYIHwZr3EKl/sb9oKIy0c
	 HHUFZOcO2ibHIPVBuawdRjNFnY1WdcivoAE2kUT8EOKcihwwgWc7Ro4+0iHgcB+d1lMHc
	 7id+mPyuqPM8WMEZc+IThLn4ovB2ebasFEF4xcMGEYqHFkiWX7JW1n1xBjMDTkUpKZ4FZ
	 MFDOhIui2lqDXdixZekVTNlc1FayTyLLVGc8jhx+lHdcht9+vwzh4msLIyGLCrP0CzSqO
	 d1IIq9wiHYXjFTyvN1qAYDTArgW+0ik4AfDejdP4nOOcEgMe1NQuS/YGAsJm8IJDdtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792974927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=biikjnXgtnu7sMIPqSuPM5THtJpQ0Ac/8rE+B20J8oQ=;
	b=0auHqLDSq7tYNIgO43bCaCuNQjzDU7wSBkwO/obOpfRi6r6pu+HPvLLKThtyXo79y1hQ
	 SVPEo756f3Pn9Zunn1Fr0nX9ezw9/1bH7uXqEis8wtVjUjqEiHgmpmEAHh4V8KAodH73r
	 FdXYzH75w+cLgCGb7b0IuRkp4brjMlWNUlEmkgeIYzFxYxhS2zHD+UVTl3oBicgFp4tBn
	 O763xhaWwJOWBgS3s1TM3QsdWDJpjQBl/+8RxqXPnK7qq3zBk8STQtIwvxhG/2DMCl6E2
	 nHMCJr0xp4Yx/4uq0irxagqooSW47yD3Gp6q6i07PeZ3C7tYILu2vUNiJp1Ga8yusaA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a2exN1Fd;
	arc=none smtp.remote-ip=209.85.216.54
Received: from mail-pj1-f54.google.com (mail-pj1-f54.google.com [209.85.216.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 44C59606A320
	for <linux-hwmon@vger.kernel.org>; Mon, 26 Oct 2026 00:35:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 44C59606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=a2exN1Fd
Received: by mail-pj1-f54.google.com with SMTP id 98e67ed59e1d1-3ab41538192so1800173a91.0
        for <linux-hwmon@vger.kernel.org>; Sun, 25 Oct 2026 17:35:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792974927; x=1793579727; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=biikjnXgtnu7sMIPqSuPM5THtJpQ0Ac/8rE+B20J8oQ=;
        b=a2exN1Fdzc78czdPG2ms4s5V/K0ylLS8UEFBS6T+IaKXvIeb6Nm1sjNkKzMPky9vSU
         WBB6cwB0Vb98upuwqeed4qhU9jwsBi1MJu83BVkAvGLGl5QZMPVqNd6bG5YI/4QCc0Un
         QywgUB94ycZAVhH0mABIsHkuUFZ3p86VE9tax8sR0KhWV9iykYLi2o1SseUEwYGxipv6
         Hqnj6LCUGaGjN/AMbqtybYKxBsA0HEd/nnFva5/j/HvzFdFAVBZOBqzpcO9GKajwa8rC
         bEzmAXpHXVGFODEsUS3yDYBR9lutGUw8cbe46yyb1uozgD2kLUFG12WtzLD+T7xNdScA
         QXmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792974927; x=1793579727;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=biikjnXgtnu7sMIPqSuPM5THtJpQ0Ac/8rE+B20J8oQ=;
        b=yo43u89xPR6YeHv5WWsIcs/yFgwCN1hgRfTPAfY+OxjuznUELUltIQpfW0WAhrWNAn
         RufUKGGuGrwg6OZSGiVOxtX5Ljl3SWhvKWe6GkRXziYAUFtlzqAOZ1+Ks8AhNeMvwRR6
         5NnJlmesao1xi70aEtUvaGjid/08bpTS65ZUGZZF1rPVeALF/5KHDb8iAR4ityrVksnL
         Nz9fg5A+Je/EcRVvaqugNxsrNYA9dSDEjxUgp5ESOJNGYwhXI44IqE9CXvcFpuwIzGwN
         qYLANmi4wAE7m2gUKSfnEwVMxvQB20Fm8x8oYpSisoDi3A1qv0fNzOyZPoCCKabYZe10
         WyEg==
X-Forwarded-Encrypted: i=1; AKwUvByKeNFjolMuEY4yq7x0h1Sk8FxH2TJ5omIXL1mITKL9z2Z5FT8xi1V1rrmtcd4uyO9Z8Rhd0JMF9XA1hw==@vger.kernel.org
X-Gm-Message-State: AFq9FYLDKVsXe64bfcSeuaLYU+joVcOQISB6apVrhmb/Cb0CWeZF6s2+
	xeWHJ0hMkeZlfQh8sDjdpMnIKewH3AGjS0egfnwLX0cNvOFnuHjg8hWR
X-Gm-Gg: AYBFou0yjBqvN7lIXikfjif1i9ftCXPqslyjxQDW7Ad5zZlSEc7orssLg3g5T11bLBK
	icgt1u7jeKAZnvJgBuIfK3Rr+i4RinZk7Q/v7U9STfyWqq+6mjyxzmOLGO09fWK7dORlLrst3Gr
	jdNDPvcy7ZyAuHWF+SoTliUMlmmcbkDtcwczoOWLBDuuNTe8plK2JP+6qlk9vU2q3JcNODw4snI
	f8CXx2WLjVDvfqNxZHWTM1Ja36PCIAR4ioNs0vnJ4w7VoGDODrrreT2iNUFsi3NhxHHv8NaUgA2
	661BNqS5NFSr+LauuLUX+SDbkpkWC90OPfFD8QsF05ndCCr/zvlIxv3MrA0eWZJErtHQRke2Inp
	UocdObs4/Sh5234k45djhlbhdQS50NiqVtcM87XwOLA5+O8ChMc+LNtSubn7XhPtSaM+i2t9tSq
	Lu3V0ULv0W6yljhFA3CqHB5UVtHd/nfZGU5mOl21Kkx4aFbzYtR7V3+pGbVmJzowkYtgl6W9BQ6
	fuNaNybvND7Lp9/HHBJWPBPxTWFryCb/Ynnkyeb0G20fqWG9L6FB7xe5b0A4KA5Umn4mZtOf8Vi
	BnXImzbcCnbpGM4=
X-Received: by 2002:a17:90a:e18c:b0:3ad:13fe:41ba with SMTP id 98e67ed59e1d1-3adeb11f8f5mr4322887a91.52.1792974926204;
        Sun, 25 Oct 2026 17:35:26 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebe8f0a7sm6187626a91.9.2026.10.25.17.35.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 25 Oct 2026 17:35:25 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 25 Oct 2026 17:35:24 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Lars Petter Mostad <lars.petter.mostad@appear.net>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v4 1/4] dt-bindings: vendor-prefixes: Add TDK Corporation
Message-ID: <083d8718-bcda-47d8-83f6-6090b40689b6@roeck-us.net>
References: <20261020-hwmon-pmbus-fs1412-v4-0-27ece4e43d04@nexthop.ai>
 <20261020-hwmon-pmbus-fs1412-v4-1-27ece4e43d04@nexthop.ai>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v4-1-27ece4e43d04@nexthop.ai>

On Tue, Oct 20, 2026 at 08:02:05PM -0700, Abdurrahman Hussain wrote:
> Add the vendor prefix for TDK Corporation, the maker of the FS1412
> point-of-load regulator.
> 
> Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Applied.

Thanks,
Guenter
