Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AF05AFC11
	for <linux-hwmon@vger.kernel.org>; Sun, 14 Jul 2024 18:48:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720982883; cv=none; b=aJ7l4lY2lk0OTbXv0m++PEDGaeRjX3Hr473KXylJRWAIDI0jKLT4SqqnMDmkq4RtJVMSV+bTEAbKGrVRSZZkAF2jd7nBbCyzH9GC1G1rGLjt+QQZvhR8t7iq/eby8t0HC20yc3ckNAt6XntRJZIa0kEi2MoZ4HSaF1OUX8PP9xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720982883; c=relaxed/simple;
	bh=JhjOKHVbr97JhO0eBZnrUjlJUoVhQOljr4e3OafmVvA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=OqtA4I+/nFGzqWsjtS0edLzTDh6hCDmrlQKDbAm51X4t7tBAOAYHxRAxCLGUoPFRJnt7kZsv5K4sVUQnbNYxRpzJmRrXBTo7ROt1nBg7diqgHQ7QoiY7mYliHc7D1zaSg0NcYz76UoobdDXgRGUpWKztzTZz1cWl+KWX++78iR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QD7O1GaB; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QD7O1GaB"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-1fb8781ef1bso26612335ad.3
        for <linux-hwmon@vger.kernel.org>; Sun, 14 Jul 2024 11:48:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1720982881; x=1721587681; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=cuiR4cOfXPC+ZY1T5B/hKdwRta8+c3WArroOWXvCNHg=;
        b=QD7O1GaBCXzxEvV/zFxT/E14XxcpnUb0QN6IIjJ+FwU1dXqiHXvlmiNB1VFzGjbBSC
         CGIcq2CQl9JraOnxf1+ss5E9XgamQXqyU5JEzSnNchYAFVZig5aANiNJ0pVUIMisfktC
         0AAUCpaDiSjIQM4Oewaki2w5KCvFaTY165vK31U8w5LZakAEImZ1R9fVvLtP1YyQgnrz
         vN0xc/qNeQQWhSrgKsjSKnUOi+YGpiFXJ0Ihl9KKujNwEmhvvYNm+Fj+BplLXU8rzSow
         B5SZT6HKneRGvVUo5q/Lu9pZ0UstsbXyqvI1sCTg4DRd9LpiF/uXVb+XvSoBR1IiqFWK
         bwsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1720982881; x=1721587681;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=cuiR4cOfXPC+ZY1T5B/hKdwRta8+c3WArroOWXvCNHg=;
        b=YRcbopGF+PvHZWTEE1GQ+pKfVK6eIXKB6ymBwiX7PMZl3AnwUOGM/EP/UJlS/en8+g
         Ps/q6UJtHUmPi6dh9lRkTF/oK24ckA/csRNR54wSQAUpbrZp5vfXjH0PALsY8YAAcpgB
         4jdBiwmtj/zC4TcBq6F6kON/ac60mntV+Q5pTmndoRPDB4U0yTqfoOdOsospG63+Py7h
         F9Lx61Zt9TMwKxkTyiaccEYNNs6u1N9mU+vmVypNSgx+c82KUDOQ0eCSVC1bWnkw7bAf
         j7ILWh93oMcDU8HURXfq0ZKv2el4eJ8Ak8XaMA77xeEKcHUf2D+bK8R+87rdHPUWJpoH
         dI7g==
X-Gm-Message-State: AOJu0YxQDHQVRHOpjUQMZB5T2RCqnVlpYen51qjew+CkwjlI1ac7n4r2
	FrU9C0jCqZOWYgiaGvzAfFVL3eXiZyKA1/vqTqFr5Zl92d8EKzSogT0xHw==
X-Google-Smtp-Source: AGHT+IHihCo9S9HgEcnlph6S70ZNxIGNHmfaPOdaJehaC6dRN9loqqW35//B2H9Ox7R7eby6iukv6A==
X-Received: by 2002:a17:902:e743:b0:1fb:5c3d:b8ea with SMTP id d9443c01a7336-1fbb6cdac4fmr123275045ad.13.1720982880985;
        Sun, 14 Jul 2024 11:48:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bba949bsm26575085ad.69.2024.07.14.11.48.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 14 Jul 2024 11:48:00 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4190de32-d0e1-4884-8823-e993bc4d054e@roeck-us.net>
Date: Sun, 14 Jul 2024 11:47:59 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] hwmon: (max6697) Fix swapped temp{1,8} critical
 alarms
To: Tzung-Bi Shih <tzungbi@kernel.org>
Cc: linux-hwmon@vger.kernel.org
References: <20240713213402.1085599-1-linux@roeck-us.net>
 <ZpN5A1SzNkw1xUDK@tzungbi-laptop>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <ZpN5A1SzNkw1xUDK@tzungbi-laptop>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/14/24 00:06, Tzung-Bi Shih wrote:
> On Sat, Jul 13, 2024 at 02:34:01PM -0700, Guenter Roeck wrote:
>> The critical alarm bit for the local temperature sensor (temp1) is in
>> bit 7 of register 0x45 (not bit 6), and the critical alarm bit for remote
>> temperature sensor 7 (temp8) is in bit 6 (not bit 7).
>>
>> This only affects MAX6581 since all other chips supported by this driver
>> do not support those critical alarms.
>>
>> Fixes: 5372d2d71c46 ("hwmon: Driver for Maxim MAX6697 and compatibles")
>> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> Double checked with the datasheet[1],

I checked this several times because I couldn't believe that I got it wrong
when I wrote the driver. Thanks a lot for the reviews and for cross-checking !

Guenter

> Reviewed-by: Tzung-Bi Shih <tzungbi@kernel.org>
> 
> [1]: https://www.analog.com/media/en/technical-documentation/data-sheets/max6581.pdf
> 

