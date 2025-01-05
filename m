Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCC9F8F6C;
	Sun,  5 Jan 2025 17:22:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736097730; cv=none; b=myLbvva3nv0woSJYYQFKPZ6auB7sVmwkG+JpRDvcN3pctQQ+vbViCKtEhaAxM/piwXBjCIpQJECW8Gw45HukpK5+4fqWqGgM0kmGdUdhaFDkzhjwjvbQLZuWQeK0zCysGFXbdOFp7BbsXTlhlY/UXBm7l/z24oRw6j8ym1qRqlQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736097730; c=relaxed/simple;
	bh=Isar8jIYus/lnAoOMqXxmVLuC8ln7ovpczQEfXrYjCU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=THsGU0EqVRpfliOi2XUyS/pJ4L61brwDKM8U6tM9yrU5A6UgWlGyy+tsm7g740D/z7DA6qAuDIVrf5hAcnK6EPa6/lJ27hqQcNUg/QzM/JZb9IxNiW2W97yzq2I4YmJGpTOeQH13XXif1BhdMPDH1rJusYQH9P6ci9fklueSzkM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DrPtQ2+1; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DrPtQ2+1"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-216728b1836so174209855ad.0;
        Sun, 05 Jan 2025 09:22:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736097728; x=1736702528; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=fkBaVhbl8Tp2G7vJC2FaLbfO6Tr53TGsw0ECXvvmc8E=;
        b=DrPtQ2+1Sj70zvHuAc6cy4lmt2B4m0MDyp4YwdGQdmuLDHOM71UgSJ0JDofjcek7cu
         z5DRVeU07vWq8fT2X6xpFi5imj03J0lFVKrxGn/C3l7ThRTrdHIB1xT3OTj2QDo5p0t+
         Q0U8ug37m4Hs84fhbyYoJ5GQ/ntMe3s8PG2qYOtWJGeYmyGj90ucRzkE79T82MosyAp9
         jK3Nn55d8UnXdjERGmGBPei+2ciKWrHwKYsn+vUpQhWrky6J/9zAm0OhbDPZZyAJSJnV
         B8t53+wxfl7euGrC26XYrA8ly2lFBA+t7MoMMOjF0hHJb4aERuTvp5vVaBxjhQH88sFB
         zsQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736097728; x=1736702528;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fkBaVhbl8Tp2G7vJC2FaLbfO6Tr53TGsw0ECXvvmc8E=;
        b=WFw9xxj6CARAUxeiBvvg4V37tpgfTe29EByqgl1AwE9gG3MAx32dkBe+WDgbuJh9pj
         QVawNcBdBVpt4jawOhjNAFLRez+X4fg46IbZ9OGsHgUtOVaYbTLZ0do5S0BD0oivOP5Z
         N7BBuou1EaTo+dy0mbfATxadpy0C1Rnboe939JYuQgzfi98BFjkR+EnHmAU7qdEbXJgf
         TybUUSmazAdQIPRIW8k00IZUrCBkQRnFODXXlxgGgWuFQ36YvUA4qxSzlL1W+avvoB6F
         +1j/WZqSTDjl3ik8V9LnUBN3AXhasVqKfgmwTtNuL9ZRBf4Gr79Rmt8LIoFWkRRPUUw8
         9tKQ==
X-Forwarded-Encrypted: i=1; AJvYcCUTT0Dt3VPX1cgYM2y/nH6hpe31rivqLQCwwro12bzQqCISoe2Sn+kD+OCMBA0E2I6IpW+OI9cSS1bzgQ==@vger.kernel.org, AJvYcCWKcPNUXgA1V5CI3sIMXpjXPzUveH9dB6afp56W7/2E9NCU+cNpQfp8PABBBNDBQb9ndbLtsSa/+/QhwTdl@vger.kernel.org
X-Gm-Message-State: AOJu0Yzcgc8DiFbNAcyr1i8SDCnLCjjCSj7K8G1DPCQiCA/zYEQdHOyf
	SxHlqmC/gwoJPzncUg5fL6S3R/EEc9VJlXd4x0uRv5YLubtrfq+1uBQ5hw==
X-Gm-Gg: ASbGncudy7X0p6Id6hDElcIZP/X5RvhrI6OuGO2ffv+VxpB7DeBRIBN6FVrBfYC6dfU
	mc9kAIeykZJbna8LKmb+B/lvwwPKYDg2w0mG2YskBRFN7bm9Nxy//5cjzhE6QAUd5GyOPiLHrOq
	nWQm8OkDKGdz6dbp8Z2GPSgi1ZH2/ZC1qrjgI+XgxqgS83c3cuFeM41OjiEJZ1OHlDEbp0MAVtq
	RBEEyLt8KjAyvkBoibt86z/LAuDP3YlMhEtkSjQnniQr8omLUoN4k12MFwC8fHggpXz7AiNSJom
	ClWTWuo16kybGT98hkFx5+RSIAAHpw==
X-Google-Smtp-Source: AGHT+IEfS/lBIF2r0xQ0kLcu4DbHsDjFzVNDLH7uO7w/IILn+n7YqlrJStFusZQRdINRr3DN3LrKPg==
X-Received: by 2002:a05:6a21:3989:b0:1dc:e8d:c8f0 with SMTP id adf61e73a8af0-1e5e07f884cmr83387054637.29.1736097728022;
        Sun, 05 Jan 2025 09:22:08 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-842e36caf84sm27368157a12.74.2025.01.05.09.22.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 05 Jan 2025 09:22:07 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <59991eb8-4052-47e3-b379-a49264093a9e@roeck-us.net>
Date: Sun, 5 Jan 2025 09:22:05 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pwm-fan: Document default-pwm
 property
To: Rob Herring <robh@kernel.org>, Peter Korsgaard <peter@korsgaard.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
 Jean Delvare <jdelvare@suse.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, open list <linux-kernel@vger.kernel.org>
References: <20250103101448.890946-1-peter@korsgaard.com>
 <20250103195810.GA2624225-robh@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250103195810.GA2624225-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/3/25 11:58, Rob Herring wrote:

> 
> But RPM is ultimately what you care about and is the fan parameter
> that's universal yet independent of the underlying control. RPM is what
> determines noise and power consumption.
> 

I forgot to add: I would argue that airflow restrictions play a substantial
role for both power consumption and noise, especially when trying to achieve
a specific fan speed. For power consumption, I don't even see how rpm would
play a substantial role in the first place since power consumption depends
on pwm, not on the resulting rpm (or airflow).

Guenter

