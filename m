Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75FA83A8722
	for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 12:49:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774010955; cv=none; b=fvRbbd7kpLLivKGo4cP/jvZuk2WAidRQ8XdfzEZOukEo7d9Gy0Z2sTsHzygivIjW5aEMhLEaMI7hHFeTgi5KgXn75nC3VjgT/6nUxshtOfglx6qsUy+IS5tBCSZCej6GSzgRxaKNmcrjF4woFi3nF11u8WKzlP0wRXrScLkPW9Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774010955; c=relaxed/simple;
	bh=4WNfPB1oOVci+kDiTm4FMmLY9ISecVRBfgDS8DYveSo=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Jo0yFFlcYH57vsKjgrLhH8gfdex0JZQmB+50xUD5q4brLajyi7YegmlV1/bccA4g7N30kqHswKgyWpfnApgGUTic8FNmJil1X5Kk/+N9LPha5od6rg7mLWDNQkqJ+RgwzkjTBsFV5JuwK2gb6LTydXe9WIrYkYGc3FAlNyi7MYA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSFdDI+P; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSFdDI+P"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-827270d50d4so1850438b3a.3
        for <linux-hwmon@vger.kernel.org>; Fri, 20 Mar 2026 05:49:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1774010954; x=1774615754; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=PF/zN9HYX2sfMAO4a39ch3NifHykq9InyeMIQBNxxPM=;
        b=jSFdDI+PyMik//A2frlYckmAzMGbS31h7PzRkvTLd5X3QO8ohpkVs1+c0ErujoV/BB
         24+Hz0sCXSqm/oNQuZfgBoU3GHsFZYCDTP7QtTE1IgKptfNIn+VwKDVtdvLn68zFJumw
         jCoqKfScFHXzd+9uzncjdWJ+vfvLrLyvbZ2QTQnAwycFXoYjuTO1VgK3MHcbcHEeuPUG
         lepOW8f2bPO0pOna38B2LulsBkhqhvUfBuEYUlcM+iFY+oJieCooJBNQG/kVoDbPsSbB
         gYhZCgboob+tKT8YvWlSu6lYq/GZuPbGJPuRnFnb03P1e2l5uLvKZUvP8OI9+/YX4Fub
         Tnwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774010954; x=1774615754;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PF/zN9HYX2sfMAO4a39ch3NifHykq9InyeMIQBNxxPM=;
        b=j35EdJHTbQIMdCXyiNqs5yI7yHlU8STTSAYout3Zomxva8zZmrwxmVUMgLopJCtz4Y
         P6g3b2yg6jbEORJOwP1d4wEz9UfCryDtUfO21fLvg9EnX7Y78Gn9xmWvE9RVO1z2arD0
         wkMAUe9ge5Vpar4aVnXoeE3apKznDFjVYRoJDmme7rOK7YKir9H6e3Chhz6hiZxXa40H
         FW0kHpUZGwwC3D4M/P6Pc179n1AAsjtRS/PAqCyxWjgwfTUwaHhuABoPr1W+gjmOiU/y
         DMcW318lOZK7lQc2RoBfYfyhPia/i/fPz36Pu1n/UkBQU2C3UK51Icn1k8V/PAmvAo3a
         lVcg==
X-Forwarded-Encrypted: i=1; AJvYcCWRb3bHA+ugBtlZaW2hKoANUe8fgHkU4ImHVYuOK97zkP3QR1Uq+FBAu110BsC+7f5yhlGx7bH3j+q48w==@vger.kernel.org
X-Gm-Message-State: AOJu0YzVLXDVYw07kEUz4w6dMwxQbar81mZDEfKQgRrEydI5bRec48bY
	6JEw0Fwx46I1IrpmDdzyKoojJTKeANcXxRKriBSTb38q6zsGSuxe3P9M
X-Gm-Gg: ATEYQzw7Evxte8f6VFjdQ/rRMj3XSxbrHzry9uzDqMhw1SY1ExGcxOBHl0NZgYM0dwe
	62mtNWpQwsNyt1AW6bT7k3w7pOa7V13SHRCMfnd67h0pPHDpPRCuhuRSgFlV4aRji5kj9eQ8UJA
	pQoukUJikdp0u4B8qfwTj4221pLvrszahcIhpFi6CgNuRH+cAZdvwqasxpx6Np0JSCJMUGBaa7D
	7N2b7byvp/rd2ycQ9EIVS8hjvBa1jFoaL+h4+Mz0ABao/dh4CSfxOXKj9Fki0AT+wfQ7Ysb5ZV2
	rebEg7cq/z2bRP2aOQFXx0AZfKb7nh2U3yzIRQuolLabx0nV9Y/CapzNF/tUCEKRcvO4aYG2FPN
	Y+nbaEmTjlKpII3x8bY+yVTX5UxUIQ1EaxyHk6mdRS0Shb78J410NWY9XB6ifPl5UQvKQm5hes6
	7eSwyfYLg+x6lt7P7BEdYID9lDTdi2h2LA7gx2shXq/6tQZtTNBhNSbux3PW1nUUaWYqCGdQsU
X-Received: by 2002:a05:6a00:8510:b0:82c:20ee:452d with SMTP id d2e1a72fcca58-82c20ee5580mr512605b3a.40.1774010953749;
        Fri, 20 Mar 2026 05:49:13 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82b03aa79c6sm2127289b3a.10.2026.03.20.05.49.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 20 Mar 2026 05:49:13 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9f1263f8-d242-487a-a266-41ce7a9cb1b6@roeck-us.net>
Date: Fri, 20 Mar 2026 05:49:12 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] hwmon: (pmbus) add spinlock to protect 64-bit
 timestamp
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>,
 "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Cc: "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>
References: <20260319234945.151487-1-sanman.pradhan@hpe.com>
 <20260319234945.151487-2-sanman.pradhan@hpe.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260319234945.151487-2-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/19/26 16:50, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> The next_access_backoff variable is a 64-bit ktime_t. On 32-bit
> architectures, accesses to 64-bit variables are not atomic, which can
> result in "torn" reads or writes if accessed concurrently from
> different subsystems (e.g., hwmon sysfs reads vs. regulator updates).
> 
> Introduce a spinlock in struct pmbus_data to protect accesses to
> next_access_backoff and prevent torn reads/writes on 32-bit systems.
> This change addresses atomicity of the timestamp field itself as the
> timing helpers become callable from more paths, including PMBus chip
> drivers using the exported helpers.
> 
> This does not attempt to serialize the full wait/transfer/update
> sequence across concurrent callers; it only protects the timestamp
> field from torn access.
> 
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>
> ---
> v4:
> - New patch in the series. Introduces a spinlock to protect the 64-bit
>    next_access_backoff timestamp from torn reads/writes on 32-bit
>    architectures.

Unfortunately that makes timestamp handling very expensive, even for
architectures not needing it.

We'll have to make sure that all accesses (sysfs, thermal, and regulator)
are serialized instead. I just browsed through the core code. Most of
the accesses are already serialized, but I think the locking is missing
in the regulator operations. We'll need to add the missing locks there.

Thanks,
Guenter

