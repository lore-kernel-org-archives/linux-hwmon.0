Received: from mail-pg1-f175.google.com (mail-pg1-f175.google.com [209.85.215.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CC2348C75
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 14:28:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783693690; cv=none; b=I0fpcj7BHw5PNuKQQ2TfLNeKV6ApiizA6BmanY8LfLo639PJU7wKBsW9DpZJ7IZXjFh41UW07i+slQg47WnKIBsCYscPz02Y1+sKEFzyRpYzYvlCC21aM0w0+3husIEDHD263XiG+I0EUMRYmK4j6Y/XZMusovsp2iDJzS5Dt24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783693690; c=relaxed/simple;
	bh=4vNyyYqBdl2NS2b6If93lcgDZtieVrol1YUppvUf91w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=mGv7W6+oDOh2Ha4Vp5I9+eQVdkUyPVFj808+hJqoVrwkwOK6KAXtr9m+gv9lxBEA4/DfAON9irNkeFmPOGZeKD9xcQyD6ZR36ycW24mDdo9kvNlMJCSxuacYYP8cGWE++BBws0RrLQpZ6QZy0V6ZQVzrNMnU1fblqMsE6lL13wY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=aFy6Wlz1; arc=none smtp.client-ip=209.85.215.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="aFy6Wlz1"
Received: by mail-pg1-f175.google.com with SMTP id 41be03b00d2f7-c9cf07d2df6so715218a12.2
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 07:28:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783693689; x=1784298489; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mFer8lglxO7P4momV1AruLuokc2gD02WMxAu5dzuaXk=;
        b=aFy6Wlz1/+3+J6Z4esShDHqHrFebuQ9NHNUTnpk5//S9qbi2xHNJirsSGDVkKbosl9
         DCmqv8JV84RJZciWISVto3wnXWkFTkKcAASKNFvyL+6XAh+Rfm+LVHmpz92m+ANUR84Y
         t0tJOsUkgX5RH4dAEUdgJet4vptRABvbMiUjfyZDOJD4VtnLNSMxN04z73q2jZjlOZQ0
         lKZCvfiydw9oG/kNXPN7ax0NxQ1EvE85jvImfbrIKlXZQUZkhzY3Jxei2CiLJobOX8r9
         9396C5+PWDJ6C7TJzpFNbmkq/p5O1j7NxtyMVU3hcjy0/2/Th9Ti21e4tRiBABooA9p+
         iYGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783693689; x=1784298489;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=mFer8lglxO7P4momV1AruLuokc2gD02WMxAu5dzuaXk=;
        b=sQHLwzKEm8vpno6/15NteiUCn6Fnxzv8YRyS4sCZdaGjxqImFbjeQ08KZ/9WGjG2dL
         s8ojrI5o2OEZFqZ3IpAaOBoY6/6rzoysMsV1h4tF5jZ/opKqMQaPrpheotlrwASw7/YO
         AkjvJIykL3MBysEZNAUcb0Xn/Nl1YnzRFKXVNq/ys7LRvWhi2yYaBS4PCEAmNUH272r4
         Bx/Ekoy9CPFOK1ilSSxc1wogp+Vz6mPr9h3eHtg+AWzm4IRPxQ1KAi1Gr4GY2p+yvI3u
         kO9Zevhx69ZqD8S8HPGrZGfQTd85AkYdWNhtyfI10XL6DBnE8CIAiM4Q/8k5PdhljWbw
         CSvw==
X-Forwarded-Encrypted: i=1; AHgh+Rr+cARaDl5Su/SxGBIj271uf2IpD0xXTBcG4CCF17yz/62BlKLCHJe80uYntFMfW10e0/xayGDMb0+O0w==@vger.kernel.org
X-Gm-Message-State: AOJu0YwUl3lrkg1Bcq0+NzVWfx6rFWke3Zkz3CTBu3igRWJNANOAHuHv
	qHrIRxf/AXG6SSK9ptgT64D152N2M66g2PNFKeRsAevI59OboLbyT3P8
X-Gm-Gg: AfdE7cmQArr1RHWBJwKb+8YdVyylDjCLGrD/77/KYSWGyH2NVbf0o3QArJI6p/4lGQO
	fywDQHjcN/8VIKQKjijVTM/6hzSBpvcUaGqQ0kg04kXHX8jMEXVB6qjGAqJZd1d+dgyI0G1ub4F
	E4W2m2eLqWrQkR7p51er96eueQIQl3YW/ipyS00uE9RT30d7Io5BeKLLNED/pt1K2+FIgQ6Op/Z
	E8CgwovBE0W4HOg5QevTZoqZdivdUyu95B3DdPAj7EjHKJkq0Gw5bozU3F/5QPVooJYIDcRnjnX
	L5+W7zCDtJCwFI7WrL9c3hQDt1z6s0s8pjQQU5h+T+9wRe+Z0P48sPdKozXl1bK7yWukVx4p6tG
	QLxEjBRkR2aRCoVUotALdQ1nMNTTRB/++59KsDPW+vdx7XLngcadLtRxp5WRUcR2qai/hGtFOkl
	gbq3osL+iKd0tGZIe5mZieCriFOXFjXANeSzw3G8COAZdFLvYP/llsdwzsvqELEA==
X-Received: by 2002:a05:6a20:a105:b0:3c0:9c18:d5a3 with SMTP id adf61e73a8af0-3c0bd1a1e1amr14692586637.64.1783693688575;
        Fri, 10 Jul 2026 07:28:08 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ca5b3b251eesm4980917a12.31.2026.07.10.07.28.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 10 Jul 2026 07:28:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ffe8f1ef-0429-4ee5-b9f9-17d08c96534d@roeck-us.net>
Date: Fri, 10 Jul 2026 07:28:05 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/8] hwmon/misc: amd-sbi: Move sbtsi register transfer
 to core abstraction
To: Akshay Gupta <Akshay.Gupta@amd.com>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org
Cc: corbet@lwn.net, skhan@linuxfoundation.org, arnd@arndb.de,
 gregkh@linuxfoundation.org, NaveenKrishna.Chatradhi@amd.com,
 Anand.Umarji@amd.com, Prathima.Lk@amd.com
References: <20260710111642.850022-1-Akshay.Gupta@amd.com>
 <20260710111642.850022-4-Akshay.Gupta@amd.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260710111642.850022-4-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/10/26 04:16, Akshay Gupta wrote:
> From: Prathima <Prathima.Lk@amd.com>
> 
> Move the I2C read/write byte operations from the sbtsi hwmon driver into
> a common sbtsi_xfer() function in tsi-core.c.
> This decouples the hwmon sensor driver from the underlying bus transport,
> preparing for I3C support in a subsequent patch.
> This patch does not introduce any functional changes. The updates are
> limited to code organization/cleanup and should not affect the runtime
> behavior of the driver
> 
> Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
> Signed-off-by: Prathima <Prathima.Lk@amd.com>

Acked-by: Guenter Roeck <linux@roeck-us.net>

