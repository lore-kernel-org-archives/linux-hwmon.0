Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.215.169
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792591281;
	b=vBHGjClUXBCUX38KMfZhnRYbm8ImDvIs1+OkYcaPClEF+PTFmJ5AfA5vvUadqDcqQThx
	 Qgtx1Xb+T+kO2YRYWnHCY0vjtbAMdt5u98KP+klmfMLuJjwgi/Xn1HLdUcstj+AJQ1fhi
	 uc6HueKXLWnyEWiemzIQsiRiGN2z17sFabDoLu+ADGT8mF98p8DWgnPN4aZK4g247k8vJ
	 tdSnKdVPnxTkHFEIzdLkwiQFmO/gavzjKd/3HeoTICj4pmBJYY3972a+Em3K3KtdE5PaB
	 h4k+JLBpVho+ML5+grxukqXDSloVg4b7VmfedU5gMxmj9u7fHWAX41MYJ8g299Eoesg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792591281;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Sender:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:Autocrypt:In-Reply-To:Content-Type:Content-Transfer-Encoding;
	bh=DWiQMc0yS3XQq0TvbZM+Yred0vSvNUmYKHsb0aPbvUI=;
	b=NX8sDDxQPaD9czVpHAlRNY9VUwzoITsQ7q/KMIRADQ40W+rXQmnCj2YaaTDo3YdJ67CH
	 bOj42RGGbHK4OFlihAhfu6PEPoCoZdi7L/Du7pDLNJ60BcslIkRDIeqnZ5UzZhkKaBbLc
	 HPd70C4QoiGYqVKfpl6iy3cQVTMdgFqfPlI5Vgc1QEJpuw9pi6M4T4k7LsvK4FO9i5jV9
	 UuYvadIQKmGV8gQyi0dAcnTUgjkv/DnxAX2x6ragz0hB3eT5rsxqOcsIAOUWLMpWbKRk4
	 Z+dRtc9AiJdZl3KWP4VZEA5XNKWH1B9y6FXgQ9rYzcMFBa6oIOXiGyhmDb7YQ3b0/GA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NshcGPsL;
	arc=none smtp.remote-ip=209.85.215.169
Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 359BA606A319
	for <linux-hwmon@vger.kernel.org>; Wed, 21 Oct 2026 14:01:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 359BA606A319
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=NshcGPsL
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-cd5e2d696e0so396182a12.1
        for <linux-hwmon@vger.kernel.org>; Wed, 21 Oct 2026 07:01:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792591280; x=1793196080; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=DWiQMc0yS3XQq0TvbZM+Yred0vSvNUmYKHsb0aPbvUI=;
        b=NshcGPsLQpHkQJPBseBKZ7zPWrtA4Olj1652AoNpZgt9B1kmPpjAEOlgOEa8P7Wdrt
         yuYbiH0dY25mNt+iPZGTBA4A2QvNA2aAM1tPNVIcgQkx9CS+9xo4T23BlkEOxLCr14DJ
         kqlneNUYr1bemcloYSqb8jjoC/5/rwremHKUNebclu9b0cF0QIClThp6UaG3IUdstjax
         NUYQpVMLu6u3GFyLYIkpr5mL6D5Iyw3TEvHm8WSc2l/H5C1SP/h6JlhDASzj0qsC0GNK
         eRMP0vrHULHF7mysmaEwQudXObXx9sOeWH+JPKt66fj9C+20/8ulXDtStFGp9NDpqDvv
         ymiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792591280; x=1793196080;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=DWiQMc0yS3XQq0TvbZM+Yred0vSvNUmYKHsb0aPbvUI=;
        b=nE6CknJKHLZTlfTqDaTegrsP9Go6EtVi4DFTqfDxUvz23RWxYV520NDAIdbvN4MxjQ
         ysHdeUAWmbioS2Z4b372iGrjrWJbpyZuTsqMvPjCn02JpSvLr4Tf/pQcQzMz6ogU8xUP
         aEXiLyrOcmBKjmn/2K/sate34TPKPTcOBQ/yPYWwZ8rJFrEPKp0JwOnJlCilOWI+YCLy
         Mh66TEDeAXiUuwtL+IkkDA3Rr1FeQAcEUvYxSQParHUHR7PTuaY/HVGl3zcV/uDEmRgl
         vMesEziKsaxBY1NoZ/ckLlqlERhTxLXmMyA6RSnKWGIRlNhtZFFc06rRdzKov3NvXvgd
         dkqA==
X-Gm-Message-State: AFq9FYKT5aELFJG5vxCaHQo2qpc8iTrk7BV5kcf8cHQBgJ6vJU7FH4p2
	WjVJBPWIbGWRm1gNYC54EejbRtJnoPNetTWB8MBgcJTP88V/dXB381SPD2YD1Q==
X-Gm-Gg: AYBFou2JD7ZnHyqDb9xd0Df/IL8p4doz+v8y28Z3zMwHo3OCRVCOkJdcktebaxoSgjM
	y5b7BM6Duax//LQRBxnsvo1ZRukisraI911GaJzwJLP1I3v4i1NT6TX7IRkX8/xteWufhoUe+be
	6IOq5MpU0UE50/OhcTX4o0M1+pTlQQC1taAL45V5JDtplzol29yEBImVUbo9jxeJArUg3CPtYA+
	r5A4KeF+aV+4i8sdvD95rLtWJSZRkc0NuES+VKftvoOk8WEGkPfM7ZsoR2WsyqJv/H14TFY5Ug/
	kqteUs2bYyo/HqC6uH2xl5Lieaz9l2fhSKJu7BZJ+L9uKrqBaA4L07bcqKDg6n19OszT2MPoo86
	4UW7qNmyEHU+4wFW6w2njrXnI+Gl3zGlmZWlW1Wlv8PEPPlPchxR/q60EMthPPdeXwdUVEfwOLp
	ejEa2YzOyoCY0yp5F3sK+hokrt7SeVG/ze1QwOKnoSfNEwvEUC6VUGOdS/EirLPK+P50sTl8QTg
	iuPZJW+AFi8r/RsBs64oQKwn6zDtYlyDcqQIMO3/s9uQLPk8z2ins4MazDVxHCCH7zw6z77PuOy
	YFzkPjfnjxi6gWtIYNeVYCAZK3U0Ew==
X-Received: by 2002:a17:90b:5550:b0:3ac:450b:164c with SMTP id 98e67ed59e1d1-3ad87089230mr1937944a91.47.1792591280175;
        Wed, 21 Oct 2026 07:01:20 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3ad82e08f1esm2260065a91.0.2026.10.21.07.01.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Oct 2026 07:01:18 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <9ae11521-6c1e-4c0e-aa89-0a9c0a5a7346@roeck-us.net>
Date: Wed, 21 Oct 2026 07:01:16 -0700
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (coretemp) Retry failed sensor creation
To: Ximing Zhang <xzhangjr@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261020-coretemp-retry-sensor-creation-v1-1-7dd4851a34dc@gmail.com>
 <42ee0ffb-c0f0-4426-a568-28be267e4a93@roeck-us.net>
 <CALurWnHeNBKVdVbsrZ17OjZ09TM1bCseK=R6MDgjz4Sg0CiWYw@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CALurWnHeNBKVdVbsrZ17OjZ09TM1bCseK=R6MDgjz4Sg0CiWYw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 10/21/26 05:28, Ximing Zhang wrote:
>> Is that a theoretic or a real problem ? "Test-only fault injection" very
>> much suggests that it is a theoretic problem. Have you observed it on
>> a real system (without artificial fault injection) ?
> 
> It is theoretical. I have not observed the failure on an unmodified
> system. I found the unretried error path while auditing the driver and
> used fault injection to verify the existing behavior and the proposed
> recovery.
> 
> I agree that the fault-injection test establishes the behavior but not
> real-world impact. Please disregard this patch.
> 
Please refrain from submitting similar patches. As it is, I am already
overloaded with patches fixing real problems. Patches like this result
in me getting even further behind, and real problems are not getting
fixed.

Thanks,
Guenter

