Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F36B30BB90;
	Tue,  2 Sep 2025 13:48:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1756820906; cv=none; b=iKOMv2WYXiUC+Yw+fpykoBXOLZXeW/HiE8U7vgdPFq8a5vXXGTAnN+lcavzxoNkHTi+j5JMYB5sksVUvgg/7RNmv6L+8GaJ4+k+8ZTrQekGPq1URx2zEcxv7JGA+5FLKresHLI8NTAu4x+XmLUm3d6DEJ3WwWbzrS00KWKSOXeo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1756820906; c=relaxed/simple;
	bh=KvKxUrG1n0cy4XbruJlSv4j7yqa/hXkmNJZl5gRrxRY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bIyt2A5DEIttGjMY1awVkob/vJANVpm4M6oDRLjwyA3HT6Lm6fuYEgDiYgjn0ilJO5bh94ltHy4wAKtKZ0sa9em8fQez2NrvwNzktJF7hKCbWQE5e7RYT/e97eHS5y68o6deLRANVt0qT2RIIK+2NvOWHnGOmTaTdKgNMQxM5Cc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QzdAOAFO; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QzdAOAFO"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-24884d9e54bso53720255ad.0;
        Tue, 02 Sep 2025 06:48:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1756820904; x=1757425704; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=tRrKRWwTJM47Js3hXSjgx0GTFrPjM8DZLan12V8oDXU=;
        b=QzdAOAFOMmxKhgsQxAOYGtulVzBttgIiT1sCNQHU8B5/O1Omqs/ublVZKxws1ZJZ7L
         AWbmjHbbHN65Z3fwHmjPC8ErbMpBSZxto0370ilzSgT8DD4Fyy08i0bWqT0hsObdF/6t
         70HBdA1/JVKAF6VWhu6vhRsAERwIFkfJQI01xCdOT6zFY/Ce4otFUbpML7HSbtGEFhH1
         U8+aR1F+cll0z+h354Mw3NOohoXNdVcDAjna3BD4SQfu6tKWWMqYlxqQv+3Kt2Rv4sAn
         XKAtXinweXPjYNsrsvmFuJi0Wx9wfQi5xMOOVR5sHcgKAa1YVuCxuZ/u7NjaUe+G2ct0
         pDqQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1756820904; x=1757425704;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tRrKRWwTJM47Js3hXSjgx0GTFrPjM8DZLan12V8oDXU=;
        b=tIvw+gBfVJGDhEqkemb4xFTHAgcuLvhZ/GC93h8QaUyW5nnGST199p+c1AvZ6LMgAF
         gNUy+eVGCk0WloMv97FcpPuvFGAyY3e9UZZLvO7Lxlbc7d2Ek7OClElrlYcxkE2rLbHf
         f7aFs0dTdR2+Sl+VchJj/XUl1fmjfRGxjGke3U4TfPwom6gfa3Y8Kw7B223tVIsGVuW2
         /IkV1GH2gb8n90ls/eDaCwgg7YeRCeBdA0PXFNjun4avxRnNbUWxp+YbZqnC2kez5cBX
         5REfQzg9yDx/8UqFQYEGpgZxx2sH6pFU8WlCJVpXxdTLkYmh//j7mmONtRkp0ej9V06d
         80ug==
X-Forwarded-Encrypted: i=1; AJvYcCVxZTnTfZtT3lA3f05ISZ4D2S4dBR1kYXQavRGRoa8tCK5hqOE3x+aXcf0QPRxyk07b3lqhinvQxqIgYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyGdv18/FLFeyVKzBOkCLnoX7Xt+08J/gakQa3Npnsxz/WfI5s0
	p7IHx9bOKhL2yQsiA7CSbW2dZLJCkV6vGpat3U7xRdbAKkMadmnKGpGA
X-Gm-Gg: ASbGncvoZ1PR8vFb4oJcxzZ3qO2VCvzXJw6k/uHXJ2RpQlpxWOYur2JvQSFkjdYsuUd
	9kPCReOAmgiZLrr9t4C9zB8E2IGVw0gsR7ctZQrwJYx9ysv8kKMVQ9h+BPU2bPbsCfLIbeULuz4
	NrjH3YjLpritlWGzX/yllAL1W/80/d2dpDRpahjMgCnY3yvRidammbm035Iu9sedlEdzIhSHj+G
	4DjSH+mGEaS0YN32d962EQ2EIjp60ywk20szBJhJEXcngXejOyxp/ziMfJFN+qMnX2OXg3uXe9o
	u8BAQSkW5RssjeRHBGZ6JTmiSAMK0vFoOlDegIkbmSCn1o2RlBggqGNvRkadpOrkzFG/hVX1RGu
	cDrZ3HuZADkw30uYsa/4czz2uxZDlp2j5Xqpvm+zu5PiZxk3bj+DhIaRrIJZHn4tLQ10gMLPENT
	tCHP5gJRZnN7Ndeuuc
X-Google-Smtp-Source: AGHT+IGvhdv6S5YRaFgE0VRShgw9eBPlMfW3h8Pr+Ylr9K6kMbQdmMeQLhczz+6MUn2s2fmLoNw1cQ==
X-Received: by 2002:a17:903:230c:b0:248:ea98:3d12 with SMTP id d9443c01a7336-24944acc7d6mr159468665ad.40.1756820904282;
        Tue, 02 Sep 2025 06:48:24 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-24905da3c43sm133821285ad.80.2025.09.02.06.48.22
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 02 Sep 2025 06:48:23 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c37bf116-9250-46fa-9a6c-24cb9b3af661@roeck-us.net>
Date: Tue, 2 Sep 2025 06:48:21 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: hwmon: ti,ina2xx: Add INA700
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org,
 Christian Kahr <christian.kahr@sie.at>
References: <20250901215648.2696843-1-linux@roeck-us.net>
 <20250902-purring-lively-aardwolf-dca3e4@kuoka>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20250902-purring-lively-aardwolf-dca3e4@kuoka>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/2/25 01:39, Krzysztof Kozlowski wrote:
> On Mon, Sep 01, 2025 at 02:56:48PM -0700, Guenter Roeck wrote:
>> Add a compatible string for INA700. The chip is register compatible with
>> INA780 but implements different ADC ranges and thus needs a separate
>> compatible entry.
>>
>> Cc: Christian Kahr <christian.kahr@sie.at>
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> Please mention in commit msg where is any user of that.
> 

You lost me a bit on that one. Christian had submitted a driver, but missed
the devicetree documentation. That is what this patch is for. I frankly don't
know how to mention a user as requested; I don't easily find an example
in other devicetree patches. Typically the commit message is just "add <chip>
to <bindings>". Please give me an example of what you are looking for.

Thanks,
Guenter

> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> Best regards,
> Krzysztof
> 

