Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A8F73F2107
	for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 17:03:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773939797; cv=none; b=mbpfkz0HUPfNqY3U8Al5rizbA/KC6aWMfd2en3AvPobUyJd3zg9dO0XL57le+/UF8CTdQI5CvQBfz5yCC1HaCXdbWmp1cvoYrzK33ceEbNGLZvKip4HH9PX6fimDQoEFPDfb6AaLttyppxY26KYgut1FbfwclLsbYeZk/SitJ5o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773939797; c=relaxed/simple;
	bh=4aO8tqhKF2jkSuCny1eOF9M5ytqdAvJRGahmxX91lz8=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:Cc:References:
	 In-Reply-To:Content-Type; b=scM/7stotHY014cOWH+jIQfmg5ltqaqRJdDKCCEf6v6ujFNwxi8sUBmLLAswft4FpMndBmBWBJVxpsNFx6lVZGZrkdbgU1bnVB6CIVHopXEd+hH6VO8cFXqL4qezJbMXozo1D4iH6O7JUpcVHfc2Cgp6O2fxCuR3kxbxJD7+oNI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QLiF6E0j; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QLiF6E0j"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-2c0ea57fea7so927530eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 19 Mar 2026 10:03:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773939794; x=1774544594; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=8QRs1JUnj1CzqP879x0gx21vAr6VwbWLeh3iHTqqzhg=;
        b=QLiF6E0jUEZAFHYK9WFm5mna74oZ8vYd0WbFZM36BRoFWpszwMst94Lrd4VSDLEGdm
         6VRrc+wKGz5pqvRdMKUjaw0hZzCEJT261W56EgRtVkGod9UzbwCN0h0avwYKfx8KqYLe
         JI5HBVdWqJ+uUSKPguu6LJIoBrX744TJic1Itq0GCs590I6OeqerNM/bFimlMyY10tgx
         Ac/uJRdFm4TYSMGU5OZexSOuU5yWOi1CpV8Oh7ftbN9QVJXF47WJy+n90Dza/4Xi0aQN
         KbA2PE2rQP39AVZWatVgJ/9cTT5HaAE8G8Vaf/kopHGjx7Bnu79bzF37SDsSEnUHyc6T
         tpcQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773939794; x=1774544594;
        h=content-transfer-encoding:in-reply-to:autocrypt:content-language
         :references:cc:to:from:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=8QRs1JUnj1CzqP879x0gx21vAr6VwbWLeh3iHTqqzhg=;
        b=AXFTgkCVVRwP3W257DIQlly2qEKl1fL/4KjbGy+ySVoPmVAty+ojK4S0OBWxQuS6Hj
         MiWIZavO0qCfTnX5CXLNWFrfTPY4Bs2b7qKEvAf89N7L1zFu18vYxe1avDKt1OZSN7WL
         /K8GYtOggeQFmec6SX9p+OqooEBz0mP5a5g26aXoK/NHNUmPx9fYKBDYov0aE+Pd1onL
         IFpC7VsRrkbFpR3k8sw95ZKDGdNyN7mwbUIe5gw2l+onFEZKd0MucQDIrUJ29akhIinu
         YJYUKA8fF4cuPvsT8GQ3SocDudjpLWeu5/jGwMjj5iDwA3kk52LdpIRWdt7GiZmdKosk
         NHbQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3rHvDstMB6oBhglHQqXJbdQr6y6EMvZ/gIWCixWb3Ax+kGZ0n+pKL/j+/6ibE33HT6u1vHwtxTWcWWA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz73HreFOpA08yAUbeQoDQkluaMi1JRZk6o8JcIfwH0nt4sfAD9
	DQoGWMHuMb2Mpv/rwEUUO+cJhGQgY9r/WubbREithKoqcoZ143kOen32
X-Gm-Gg: ATEYQzynBi2hQaj/87o8t3tvpoJ07/aORbTNhf3FuoGQoDW1Hcf6KoogMd/I0wTj1NH
	qs5BQwaG7spnADa7J7uzizGISwAWKluUW/XTYzBuj4hqq5HhpFweFnZAw2QI0dTSxFL2U6fxbe2
	FdrUBsU/BUEDvTUKdDtwUH0E8VOmN0Rl/nKhSByT8sGHQYU+yt1gW2WqHn7JyE+YftrJoGWhXmQ
	K8MBNk3mrMc23OA2qBnLcPOzKQALop+jqdzpv0wo+BCC+U/qSwX30l8QL4H2HmWevHku4p8zpHg
	LmYR2P+pLvcLgGxKvsWd5ICjSZJME313/Gd40TRA7zWzLEyK3YOZ/ZB+xFaewLxUFyFhCSMeVIP
	NM9RXe1uxirCZDH2NpK9dt/8XM19ajhC0hNlCr8Bmyp1Bxnm5N3m4u+nnwMOGSFkzN+SmXWwv8l
	YRpgS5WeoD26V1tvpYY+MeWt65nDmLZDRIkTzSHiHJaQu+uaVRW0uWJ7AStBl4Hp0y8Ocse43M
X-Received: by 2002:a05:7301:1292:b0:2be:9e34:fd24 with SMTP id 5a478bee46e88-2c10980bca7mr42291eec.34.1773939792465;
        Thu, 19 Mar 2026 10:03:12 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c0e56062e4sm8998619eec.30.2026.03.19.10.03.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Mar 2026 10:03:11 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c9c003cd-4452-4ed3-9abe-3458d432a4cb@roeck-us.net>
Date: Thu, 19 Mar 2026 10:03:09 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/1] hwmon: (yogafan) Add universal Lenovo Yoga/Legion fan
 driver
From: Guenter Roeck <linux@roeck-us.net>
To: Sergio Melas <sergiomelas@gmail.com>, linux-hwmon@vger.kernel.org,
 groeck@gmail.com
Cc: platform-driver-x86@vger.kernel.org, jdelvare@suse.com
References: <20260319132920.275755-1-sergiomelas@gmail.com>
 <20260319132920.275755-2-sergiomelas@gmail.com>
 <221ba4ba-73ac-44b7-8663-60889ebe8e9e@roeck-us.net>
Content-Language: en-US
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <221ba4ba-73ac-44b7-8663-60889ebe8e9e@roeck-us.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 3/19/26 08:59, Guenter Roeck wrote:
> Hi,
> 
> On 3/19/26 06:29, Sergio Melas wrote:
>> - Support universal ACPI fan monitoring for up to 8 fans.
>> - Support various ACPI path naming conventions (FANS, FA2S, FANX).
>> - Implement a passive RLLag (Rate Limited Lag) filter for jumpy EC data.
>> - Use dt-based scaling for physical consistency across read intervals.
>> - Filter parameters verified via tachometer and FOPTD identification.
>> - Use 10-bit fixed-point integer math to avoid floating-point registers.
>> - Support KDE 6 Plasma Sensor compatibility and stable S3 sleep cycles.
>>
> 
> Thanks for your patch. Unfortunately, that is just as wrong as before.
> Most of what should be here is in your patch 0/1 which 1) does not have
> a subject and 2) is unnecessary for single patches.
> 
>> Signed-off-by: Sergio Melas <sergiomelas@gmail.com>
>> ---
>>   Documentation/hwmon/yoga_fan.rst    |  36 +++++
> 
> Add to index.rst
> 
>>   auto_compile_rust_lenovo_drivers.sh | 196 -----------------------
> 
> ???? This doesn't look like the patch originates from an upstream
> repository/branch.
> 
> I didn't look into the actual code. AI code review will be available at
> 
> https://sashiko.dev/#/patchset/20260319132920.275755-2-sergiomelas%40gmail.com
> 
> once completed.

The AI says "Failed to apply", which isn't surprising. Please submit a patch
which can be applied to the upstream kernel.

Thanks,
Guenter

