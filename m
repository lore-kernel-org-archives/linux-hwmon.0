Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D8A751547DC
	for <linux-hwmon@vger.kernel.org>; Wed, 18 Dec 2024 17:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734544394; cv=none; b=C2Y64mJgrhokaFyS1AFWdJvMU3L8rhEyWGB2X2tH7D1PQvyFSNK1bkm1Eo1ljpCs3wKmOlkas+7mGbbwm/Q5hj9/+5321XN0IgG4kwBcJFzttYcW4Dtyyd9xlaPo4nMZ8cKfczd0JhCjSViHLDLPb8/nIBYMgDTzZMxO8xwXzPA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734544394; c=relaxed/simple;
	bh=d5RWiC6zCNZOZdUJ1Wvr1lKFys6SkCWF29KV8S75gus=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=aCTQppPin4Wt7gqCDt/GAgh46VWhVOPZhUk69jx4tV+QMW84D9Y4E8AK32dTTBhrovqwxYcML1l6oyH9wbqRxL62zC8GJjaZCmu/aFfeZm6O+e3YzpOByhxmE3NLbUcob6OijOrBu+pt8Ns5BgGPqcUbTCQOzaceL8jDy355zEg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=O9rvICeF; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="O9rvICeF"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-216426b0865so60501095ad.0
        for <linux-hwmon@vger.kernel.org>; Wed, 18 Dec 2024 09:53:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1734544392; x=1735149192; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=f3zaWeyKHbtNBM9qSqpIfLxzrgnC6S+XnR4OA2Wv9sI=;
        b=O9rvICeFNaPElo6JK50DRmXkhcxu23E3VhRBqFlwbVyPOh1soJgBik6zDSjFml5J6Q
         h18+PlJH0yyurkIL3VtvHq00M98e0gtcwACwmVjQD6wluWaWVdcu5tnN7RkMFVEtkgmI
         uCIX8y4EM175W7+LjVHWgraRztPkLdRSaqg06ttb3Po+Vj9Sa9lpmenFYgKvufNZvbs+
         /wA6pWv+56vYxDfnFxSc3WLbBuK56MIpYYv72zbL2U9hPJqZuI9j7LhFOfkj11nJa6Di
         3zjkEsv4OywZ/18mcIc5+phNsydugi1hkK3m5AJ7218+SIvv1nedmyKMxIvHAsX2rfSA
         H0Nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734544392; x=1735149192;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=f3zaWeyKHbtNBM9qSqpIfLxzrgnC6S+XnR4OA2Wv9sI=;
        b=cw4R75bnn99SEgi1b4j8B5AkeiBDdSr+JNtC3Cjiyd+SJvAovPvdJbo79fcMpTzz7Q
         SmBxg+Lkr9RsCs1G4FbB/ee5fMRyyqYwfHQFWe0jbEuSTgvStnwrZrnBDXbIaoNyU650
         j+50t0NkTfNIlTiZToI3oB+YZEG7z1YFcQkevcJbMw2zUhGtovgzX5LoREOlwLhwfdNv
         afIIrufG2m5dzWPHxnrqF9FKSVrbUFYWdrAge+sNG3yQNVsdhBNNie/aTKpwTXr+5hCz
         QZaZ7XxnOnLfmd4HDhmDOXwEn/XQCNLlNQyvDw4kF4Le4D37DNjxShZfFP/T9gyFXX8R
         pDbw==
X-Forwarded-Encrypted: i=1; AJvYcCUEfG1q1vZ/R1a5pUZxXtsguYLfl7vDujcgPUu/3QX1dccJ9URsUNABSPYI8wF0XPOJ801I5LbkEbI2PQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx0XF5npL8PoIdEiD+BxfubOkazTh4bm+xIm7H8b6H30Hm9/OTd
	oOi/vWOHFjGZm0u/jOqYznMgIkgf/1lfBgFUUiNp3lBtJHlAQPo0b46MKA==
X-Gm-Gg: ASbGncudzkGeQHVzomexcAvtaSqgrDZgW/bV07CXgG9lonvtpzQxNYkh3L4KWmDNOCB
	MwSgnIvFmBBg7OHHn865gZ/82oh9cL3s2G0b7CJE7Zg+je37ecIcNRCMt2hGXFo59CjRuLE+Am5
	hjcOHv3OORtvRCV2NcoJvIztoP3PIYhXdhAW+aN6jbWuEQ+h6g1QIHj9PqEUGfaL/tvRO+5cbFE
	IJMyXZD0ZzCc+e3FJjNwKS5dHAZLjBeiIU2XbFxEe0D9/HlSjnxySyecYp73kxhNpRDvlT8KDHV
	RYOgPg/gvZzr57Wqz3cipuPvvtxKCw==
X-Google-Smtp-Source: AGHT+IEA1GxPykYS9gJWBJCzSnxbEe3sLxHeeQkJ3p4114tovGcwciLdBQ2WMAvqs+0bNJqxJewA9w==
X-Received: by 2002:a17:903:320b:b0:215:8270:77e2 with SMTP id d9443c01a7336-219d954f95dmr10001935ad.0.1734544392109;
        Wed, 18 Dec 2024 09:53:12 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-218a1e510b7sm78937885ad.161.2024.12.18.09.53.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 18 Dec 2024 09:53:11 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <18c9ada9-8f48-4e39-a5ca-829b3e5e2850@roeck-us.net>
Date: Wed, 18 Dec 2024 09:53:10 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC/RFT PATCH v2] hwmon: (lm75) Hide register size differences
 in regmap access functions
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20241218150404.2713377-1-linux@roeck-us.net>
 <Z2LzPeqyxqJz06dZ@ninjato>
 <bfb3ba78-206d-4f28-a57d-c25e7d90361d@roeck-us.net>
 <Z2L3dhneuMi9ckUe@ninjato>
 <5b9f29b9-8163-4fab-9ccb-718b672083f2@roeck-us.net>
 <Z2MIx8nKdSr5sONi@shikoro>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <Z2MIx8nKdSr5sONi@shikoro>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/18/24 09:39, Wolfram Sang wrote:
> 
>> All that makes me wonder: Do you by any chance have a means to test I3C support
>> on SPD5118 chips ? I have a patch series for that, but I can't test it so I
>> did not bother submitting it.
> 
> Sadly not. Despite Renesas being big with SPD5118, I don't have any
> here and I don't see that I'll get one.
> 

Renesas did send me a samples, actually, and I can build a test board with it,
but I don't have an I3C controller to connect them to. The ones I found are
either out of reach financially, or I'd have to find and program a microcontroller
myself.

> I do see, though, that Jarkko Nikula from Intel is active on the I3C
> list these days. I could imagine he has some I3C controllers connected
> to DDR5 modules?
> 

Good idea. I'll ask on the I3C list.

Thanks,
Guenter

