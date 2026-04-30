Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com [209.85.210.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 421F33822BB
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 20:20:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777580405; cv=none; b=XYcuhBT/wKUHe3B6RcbRoq1Bda0cn12Ez7lMrXMDpCdEDONMldf7ktzpgWUoVSsAjFP40Z/bGHiP6XB+MmdVbdSDen98heF6oRa4K4KGNZxqoLZCJbx1+1rDJEkcJ/Q1zy45ujfk099tl3I8PUduvyGcBM2nK3YrSPi+WnNwQd0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777580405; c=relaxed/simple;
	bh=5xDdPHwOPg1/+xEc48LhJjGaJZxT2Wy/Kj8wbOXVP5Q=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=jSl3aTHOCDK5f3K5RWSLj4defxWLcm6NRJx/T746nWyeIYtXAaUvQuARJBEj2jtP+Iw+icwgBJMARY7xFDw2kXzWpEfZye+Bp7kNlyLPfMgLQ3XYDoIQ0JGInZpftMgsTZctgenZaEoY7wMeOB7Vx9ZbWf5eYvTWzp7TRqK24i8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FtS+S6gG; arc=none smtp.client-ip=209.85.210.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FtS+S6gG"
Received: by mail-pf1-f173.google.com with SMTP id d2e1a72fcca58-82f69a286dbso958420b3a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Apr 2026 13:20:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777580403; x=1778185203; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vftSRvAvRX8nlWWNeiHY+Q4q7N388epoMGmpzJDaRr0=;
        b=FtS+S6gGw1JTZ/zHHlmYvDJEaEokyRuJQvdJ3zkkWlHX7R8DGL5S+ItMKRo6MVL48E
         94XoRl+3a6hqylUHg3SNwrnbPUvwj0NSI/o8EuK7eDYpAHq8j3oJFcLt8pyETNCSWDmS
         oqjyAa+s6Q+76pltFs9jgUtk8Fj7nuUWUjEUZLxOnedzsEhRUfMfW0vn2ArQlIaM3jv7
         nXLF6zXJIkA11lQlNu6czCEP2ueKsrVvbicLJjdpmHKS+B5GAk6mRnhau/qYivvb5cun
         zafpsVe6a44kPYwDKO3zVXzFACsEKJhLGuIpeB+0XVzXQPyqWxM91E8ZVBPxPZnZZWU/
         A3CA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777580403; x=1778185203;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vftSRvAvRX8nlWWNeiHY+Q4q7N388epoMGmpzJDaRr0=;
        b=RnxwFG9f2+FFh/5I5IAlvkaEHVoQYXY0yjmHJ2GyILuJdIv5RjMaBJgRZjlpPZ7QMW
         KwbIuM5XoY6TZIJGSaD2TdI1nOTHSOnzs8xG7S+H8SW9PCM28VW9HJmQI5dPP+itsOfE
         FRq+p68lz2ywhe/rypAi1unOjNh2925bGaYuYvW3Cjs0rBrEwMuZTMDo9Q44JdPCvrzO
         vUzRCH5bfpxFzuRiczhirTp5GHQi23NSlnpgEHAFdGdL6vS/VERF0u+pLfSzB2SxeXX5
         FC8tplI/faQUKk8a6hBm3aAqYp+uI2auoyyBO24lkr4hKxLCrxMp47EWZIKIEYkr2nYm
         Ccyg==
X-Gm-Message-State: AOJu0Yzgwupq71QMOABIGj8Qbfw0CVpXHkdpFksWYM0J+0AnbnMI+bXm
	lLr0PqrqpQUI6UaRf67SkjOUz4cOgv9TnNQt0iqhig64S6MwGYdFOh42SznfSw==
X-Gm-Gg: AeBDieuae/XWhTC/84dKUyKl2VjjFVGrOAXvO83fuOmbD062p8g92KSMsWGL/m+iwXZ
	NuxuSvH+LKxQwa2IdkZid4cYH2HkR2zyv+glhAumlwlKJDXZvbnHgM6JbtWpl2dZJNX7CgeFuGQ
	Vc/7w4JgiyG7eDaiFi8foAAdGydegi4EOaMNYJdGLrbLBu8VMIHdEtJaOp4pH8q+KiXvll0DftE
	jAk61bX7BsBU+2N0JMKYRt3Zgj9HvVcAbHgFLOQJOtpnk9wy61+XTyWQ54CswOJOAqnnNC1LLyY
	p0I6jvw+He0mK8M+/UxyFdwBqeZZOhs6wWx6wfAbMZ6qfCtrhCz0i5z3xxbrxYzStEBpjDu6RqA
	HcgiW0cQsI/2GxGATdNcso84Z5wK5hX9S4YuqsJFXjqCtRATjiWw41CHLahVmiIWsfD80sEJFiD
	XLT3BlgshuMY8RN80g/7T8r0Fx2p9qJ1RMDnWnmsw0n6ODA9g4Xex2PvldySNieLvjDUqMbKPED
	5+HVvwNXBM=
X-Received: by 2002:a05:6a00:a586:b0:82f:4628:4198 with SMTP id d2e1a72fcca58-834fdbd3e88mr5451384b3a.31.1777580403523;
        Thu, 30 Apr 2026 13:20:03 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-83515b8500dsm521749b3a.58.2026.04.30.13.20.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 30 Apr 2026 13:20:03 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <3ca6fa91-e338-48bf-9262-e5dc9e22d228@roeck-us.net>
Date: Thu, 30 Apr 2026 13:20:02 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/3] dt-bindings: hwmon: pmbus: add Delta E50SN12051
 binding
To: sashiko@lists.linux.dev,
 Colin Huang via B4 Relay <devnull+u8813345.gmail.com@kernel.org>
Cc: linux-hwmon@vger.kernel.org
References: <20260430-add-e50sn12051-v3-1-f6d4e043ec7c@gmail.com>
 <20260430065909.981EAC4AF09@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260430065909.981EAC4AF09@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/29/26 23:59, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [Low] The binding description violates Devicetree principles by describing software instead of hardware. It explicitly states 'The driver supports...', which is an OS-specific software description.
> - [Low] The Devicetree example uses the Linux-specific subsystem name 'hwmon@40' for the node name instead of a generic functional name.
> --
> 
> commit 8f686eaa80cf8986d09fe9ea7dca7debf1c51cb1
> Author: Colin Huang <u8813345@gmail.com>
> 
> dt-bindings: hwmon: pmbus: add Delta E50SN12051 binding
> 
> This commit introduces the devicetree binding schema for the Delta E50SN12051
> PMBus-compliant sensor.
> 
>> diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.yaml
>> --- /dev/null
>> +++ b/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.yaml
> [ ... ]
>> +description: |
>> +  This binding describes the Delta E50SN12051 PMBus sensor.
>> +  The driver supports reading voltage, current, and temperature
>> +  using the PMBus interface.
> 
> This isn't a bug, but should the description focus purely on the hardware
> rather than mentioning what the driver supports? Devicetree bindings are
> generally expected to be OS-agnostic hardware descriptions.

I am not a devicetree maintainer, but I agree.

Guenter

> 
> [ ... ]
>> +examples:
>> +  - |
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        hwmon@40 {
> 
> Is hwmon@40 the most appropriate node name here? The devicetree specification
> usually recommends using generic names that reflect the function of the
> hardware, such as sensor@40, rather than OS-specific subsystem names like
> hwmon.
> 
>> +            compatible = "delta,e50sn12051";
>> +            reg = <0x40>;
>> +        };
>> +    };
> 

