Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11B683B47DC
	for <linux-hwmon@vger.kernel.org>; Fri, 24 Jul 2026 21:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784928383; cv=none; b=PQpb+rSdE190pXlSPsiQ/uwHqzaow6H4y+vKXNVOzHJWSGAr/6nEDyfly4wp+pcfL714WRzSvecD2mp0kk9uK2L9iUDUzNNv7wvihMkDRY3DRwFfNq0r2lYZ0ROcoIwfh0TUjh66MSzVGIMOx1yZifngUGZg5wfmjnmHtyxE45Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784928383; c=relaxed/simple;
	bh=Pn6EvwAnKyjOYLOgT2cdfgXdiVfsnsS+1/LG8t9hp5w=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=e5mD5JWrI8Z1NTI6Gv3SLbZLPlxoW2Dfe6+zhiYJ+mtAYuJt/22TDdPEw8aNu4nULmRGWVb5E5y+ZbhcS9iBktIRQ/vBDLnKIyOiZvUB/0BjgXSqYNApyMx/1J9oRJH4itJagCaQwIluk9ptoKxAYOmK8Y1d1w4nxUwvtKAApDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=btuP0Sl8; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="btuP0Sl8"
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-8453427d3f4so998789b3a.3
        for <linux-hwmon@vger.kernel.org>; Fri, 24 Jul 2026 14:26:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784928381; x=1785533181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kmyLUNu300WyBDZkVHiaWG5FLKRt0pyiRWuoSzAW/Ks=;
        b=btuP0Sl8CmwX8C5YPSe7Rjv61jyFZgj7mEbXtT18vv9dDLjcv5/27vLM1TDUeA6tAm
         C1KTtZonlHv9zZs85lfPVgQgxGOWfDQgPYjjEI+arcYm9BKMm38jVUpc3piodH5ncICi
         EsXPIB0eGMQHEhm8ONCxaTQoeEGTUR/r8qohxEE2PqAgRpOS/hgitmCyiaxW3BBJAGdj
         ryNMYerw7DdWezzx9lA+b5TNN/7a8zk91VbeR0f5k4imtKAFLBOJoGhQjT3YG+biJYTx
         loBtrTu3zHqvHzbFsc0etYSTjcWWe91zamk1YI0Qa1rTjUslWJ3F0sgwaIex2FwOKMgS
         QAMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784928381; x=1785533181;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=kmyLUNu300WyBDZkVHiaWG5FLKRt0pyiRWuoSzAW/Ks=;
        b=TUZ7oXnx3faJlm3zkjniGHsAuibK5JdU6tJynz2L6ygrKUDkOF1KbWohUFPFzXZJqH
         y+etz8HT0w8wPqu3uLdyVxbacPZcpDGbIIH5S6l6WObMvk1jONlsB7RYQXicFEhVn0oQ
         udy0tT/EJKZtwEldIWwVus6z14p3c6gARKBQSHYiBBOokQOAtUSaPeEeU6barukbP6bo
         IA0bAqLY0PsQHefoKjSQj8Bx3rVlYwHxalZyhjjg3ABcOicS3SnJxW1qCWRbqHHnyWQq
         kTQ55JdEtjXs+vEHs6x+0NdFKhDQM4CEVGL+/oZqcVXBHsMkBdPZfFPfUFaIpy1WN3hS
         Ia3w==
X-Gm-Message-State: AOJu0Ywtarrw4aWOYtydQVMAQmUxYUAiZyJpRWe8waVU3DFB5hs0g4OK
	AfrNQpa4555d9N/Szu9+O4cPvpYL9OUa4FYyUdduBi+4JLPjwlbLEUlZHfjCSg==
X-Gm-Gg: AR+sD11JK3Ky4qF2VfqX8q4WlzAH8RD7AQ2wO8PZ281nHvA9mA59LSPsi41mr38iUeL
	wtNorKtRyZxN4MyvVSHrWjbxLUJCPuNy3Qwiv3I5uKxcfBGyhELdidSNu67CBx9Zs3W/ObaByPJ
	c5JJvideAQELFfEr+pQcQK5ze4poslT9+2nzNKgxIf6N+GrSz6mfmVrU/Mnf9dxnFnaNsFzepsQ
	dQddWG9T76NSXk62j8xs8OHg0Ebc72h0Pt80/Qzi4Ox2CZfEVaa1eL9Me9CwYidyHH2PxrYBfFW
	aHjP+adLiY7D8lLVJURVoQnQuYCbaH5n4ZwyVxSrNcT4JUARyWilk9WeSAD5E4xw1+8iPRh+D2V
	MBUpii4FSRUJ+UfiTsXdyZCyk2zKucZrTJd/adCuRkltNUd5kkjdhyeAnJkC9jfW+93c3tkoIU7
	OjVypOxLx4QkwKdT85Cy3UIn2bK5PAgkKYSQyJ0060kl08eCFJPnk=
X-Received: by 2002:a05:6a21:496:b0:3bf:e24e:3afe with SMTP id adf61e73a8af0-3c67e060010mr34505637.43.1784928381390;
        Fri, 24 Jul 2026 14:26:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc3e878esm2608777eec.3.2026.07.24.14.26.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jul 2026 14:26:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <bff175c3-f29a-42eb-a857-c06f66483897@roeck-us.net>
Date: Fri, 24 Jul 2026 14:26:19 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] hwmon: (pmbus/vt7505) Add driver for Analog
 Devices MAX16545/MAX16550 and Volterra VT7505
To: "Pradhan, Sanman" <sanman.pradhan@hpe.com>
Cc: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>,
 "robh@kernel.org" <robh@kernel.org>, "krzk+dt@kernel.org"
 <krzk+dt@kernel.org>, "krzk@kernel.org" <krzk@kernel.org>,
 "conor+dt@kernel.org" <conor+dt@kernel.org>, "corbet@lwn.net"
 <corbet@lwn.net>, "skhan@linuxfoundation.org" <skhan@linuxfoundation.org>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 Sanman Pradhan <psanman@juniper.net>, Debjit Ghosh <dghosh@juniper.net>,
 Jawahar Balaji Thirumalaisamy <jawaharb@juniper.net>,
 Santhanakrishnan Balraj <sbalraj@juniper.net>, Brian Mak <makb@juniper.net>
References: <20260724164919.247162-1-sanman.pradhan@hpe.com>
 <20260724164919.247162-3-sanman.pradhan@hpe.com>
 <acd92cd2-ec1d-447e-9e80-35ec5289fd0f@roeck-us.net>
 <20260724195912.262226-1-sanman.pradhan@hpe.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260724195912.262226-1-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/24/26 12:59, Pradhan, Sanman wrote:
> From: Sanman Pradhan <psanman@juniper.net>
> 
> I think my ordering on the trailer in v4 should be changed,
> I'll restructure the sign-off chain so that co-developers are
> attributed before the primary author, rather than after, which
> should better reflect the development history rather than the
> transport path:
> 
>      Co-developed-by: <co-developer>
>      Signed-off-by: <co-developer>
>      ...            (one pair per co-developer)
>      Signed-off-by: Georgi Vlaev        (primary author)
>      Signed-off-by: Sanman Pradhan      (submitter)
> 
> Please let me know if you'd prefer a different arrangement.
> 

Signed-off-by: is inappropriate for co-developers.

Thanks,
Guenter

