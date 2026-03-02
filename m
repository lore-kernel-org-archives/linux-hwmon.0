Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2687939A046
	for <linux-hwmon@vger.kernel.org>; Mon,  2 Mar 2026 20:55:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772484914; cv=none; b=cUuNWYvk9bacpClZIjC8L4nc3gfgS2QttMLRzFDWfKUsNwMIMob8PEl3mVGG1k8JW25j+uGQL5/1OZmDV40sNMYUFAn1BDwX39BsIwtHT6d4Uu+12Lk7cJ81g4Y/7Nz9Y9Wd9cLb4SDCG5S3Q1TYZPBzVoHECmdFp7G94ucbE0M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772484914; c=relaxed/simple;
	bh=1H08dPbrV9MRuGByvJZqnHwG0SSDNOZtpUN6A2JhHKI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=IJDt9OZMgPZnCFbt/NL34H0G+lXnw461vwZDZLhV3dDO8X2YJi0RgtyTKM/kK3iyqxSyymJUIsvNtRK1QQqJ9L4ECV3cW4VNZtT4SaRl1CyJAJ5MsNa/Ay674MswcAIqmyE2VHPlpY4RXNQW/jLqhbJs+g9puAJGWJF5kSy3K/I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ClN+2c7H; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ClN+2c7H"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2ad617d5b80so31296585ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 02 Mar 2026 12:55:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772484912; x=1773089712; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=mAwDRdoHwE+BSgZv+5N1GMI+c/EActrCOoFM3AVs2OU=;
        b=ClN+2c7H4fdUvpM45L14xrs496HFOQqCz9kUBcdZqOWgGUM4O3x2eq/ha1w/BUJ2ZG
         Krf5gOqT7Pycwq3rosP/4knY24JZnEFYlH6s+e2g9kde97DBBPvHuOzTSqMzyEC2/bTn
         6Alz6cvzoUY9sOa6bfocTYkkNGgvoZzeyTVwcEVc1lpRY3FCOap51KSaMgHCIr+Eba0w
         ItVqy8hhKDOiuY+k6X5mTbdSyB1BzJqPnVkKC5COOGOROFo1g9uGykBMrj11pBdpbRkJ
         9bffbzUkHIQQXNGR9Se7fVd+cXISOh2SeR9yjbX/zY9vCIJ3SlIImuUhTWuGAUN7LK/Q
         bbMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772484912; x=1773089712;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=mAwDRdoHwE+BSgZv+5N1GMI+c/EActrCOoFM3AVs2OU=;
        b=AAo5G5Z5NSUn8N4aXs9n8ROyuJtnnOQiTkD248W+YtZm0+jenXB8rOAEv299Q/gqGD
         657HkqEWlVSPNdteWS6Kov+AkxNHByA29Pau8S9QvF52JH8g1pEx/qKvvI7IWONRrVCG
         Yd5FVQurxqShcit0CLnpYim+OqtcRBVZursVfNh0VRR3ZQr+33tS3s1KfkOgGNNW2Yp7
         nvQS0e3UXwLkPiBtNzGyfW4JtIycVVb11LRju4uFwy93/lLBilSjd4HhNATjCJhMd+ZB
         /9xvNjWggjhOTMNr75FM69eWngoTtexPFFH0EVmL7MNRJ6mc2+VoiKK0f5nX519OuXqe
         dHnw==
X-Forwarded-Encrypted: i=1; AJvYcCXork2Dx8pe/sSpl+TUOIaWNm3lf9dGVlnl/hteDjZvggY89sRR9Vft6W97u/Y2/dz/0WCg5vZFQe6dAA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwyE4/5kn/h6DxAueiucv9+Kgsi5Fmw9u3OES4DZAByQJ8phwMJ
	YOqbY530ZSpppYK8Lcnmw+/gnbGy0kchAsjZgi9hq4lZqq6ek8b/LznJ
X-Gm-Gg: ATEYQzzqxuBW76L/Xe3WEsTF6B/VsNW/yKsATcx3dK+pfDuPVwo7dOGT15MESL9xtd1
	eofeCB7g+UIy1FcVo9uzZCuaRO00ZpIaAbW2EO6LgKmsqisQY8qUs/CBgiofcs3NSz3C2ko8j+t
	zt6hlsilPVhKk9MNWPHVyITFcvOTjN2aLmnEnnNYTytO726eCBD2SoX2g/qg0SHLiOZwkC6tjur
	ohxannzBmHj6fr68rJqWrvUNxRKzn2Cc0iYuxGul/ln5q6v7rOPAX1APbp9Hb9bJ1yJCJu+L+S+
	10r+fqBhDqpSSc3nRGFharvYiGwS8rLsG0Puvy40JG9th10dsmPEP3gEEl6+no23NXGHCIzcLxe
	FF8/PHOa7Ahk/lbUDD1O8gPkKWPL6Md6J4TkuOy0jIpWfyhk+gS9sQIbqsR7OmiJmMdEh+1yWrF
	+G6K/rRe77SPwcByFd/5/mSGSm2AKc+P1PilUEvM0ZKd4wE0uzDxYpkH1xG1JaNQdUXjwaGlui
X-Received: by 2002:a17:903:2c0d:b0:2ae:517d:5cf with SMTP id d9443c01a7336-2ae518c4e43mr36226155ad.54.1772484912491;
        Mon, 02 Mar 2026 12:55:12 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2adfb6d1ba9sm153161045ad.76.2026.03.02.12.55.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 02 Mar 2026 12:55:12 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <f5a30ac0-b364-444c-a44b-4b4e8d16baa9@roeck-us.net>
Date: Mon, 2 Mar 2026 12:55:11 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/5] hwmon: Replace sprintf() with sysfs_emit()
To: Amay Agarwal <tt@turingtested.xyz>, linux-hwmon@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
References: <20260302192813.10625-3-tt@turingtested.xyz>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260302192813.10625-3-tt@turingtested.xyz>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/2/26 11:28, Amay Agarwal wrote:
> This series of commits replaces sprintf() with sysfs_emit() in the code
> for several drivers (tc74, max31722, ads7828, max6659, emc1403) and
> helps avoid potential buffer overflows.
> 
> Amay Agarwal (5):
>    hwmon: tc74: use sysfs_emit() instead of sprintf()
>    hwmon: max31722: use sysfs_emit() instead of sprintf()
>    hwmon: ads7828: use sysfs_emit() instead of sprintf()
>    hwmon: max6650: use sysfs_emit() instead of sprintf()
>    hwmon: emc1403: use sysfs_emit() instead of sprintf()
> 
>   drivers/hwmon/ads7828.c  | 2 +-
>   drivers/hwmon/emc1403.c  | 2 +-
>   drivers/hwmon/max31722.c | 3 ++-
>   drivers/hwmon/max6650.c  | 3 ++-
>   drivers/hwmon/tc74.c     | 2 +-
>   5 files changed, 7 insertions(+), 5 deletions(-)
> 
> Thank you,
> Amay
> 
I have not seen patches 3..5 yet, but I bet I am sure they have
the same problem as the first two patches, so I won't separately
comment on those.

Guenter

