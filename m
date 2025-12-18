Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B67F22DF6E9
	for <linux-hwmon@vger.kernel.org>; Thu, 18 Dec 2025 22:35:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766097341; cv=none; b=B+zDFCFsk/1jIBje0/H7LLo4t0+eamX4jR71rdaIewy+agV4CI6tYIfq2RnCb2Oks1QIiXZzfZ9MQPwIyX1Lf4D06hXvfKLMcC9UUBkaqZrECpA/T4Mkm7GmFluev43sLl36hs7EUJc7hopMbiGEJHQo0GXfrI3zSu01qWxO+zw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766097341; c=relaxed/simple;
	bh=1rEz2SpieKvFFlhRTKIDaL9wL2Xxn/072e5AuChwSHQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=qMvm7LcsKD7aOAQKMGQzs/Vr+bkFZYyZeLmIaS6mzRA2ZsGLqXRE0ZhRoQOhXhnkun0c/O5aDx0Zir/t/Yaf2ZEBxyRFafgYaDd0iYuTIwznab1T+MMpjqTUJ1QddaWo/LUwXprpdiccWsSvGhqAOpBtY7NFwQQUBsXkUaQkdY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ieSugPGU; arc=none smtp.client-ip=209.85.214.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ieSugPGU"
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-2a0c20ee83dso14476495ad.2
        for <linux-hwmon@vger.kernel.org>; Thu, 18 Dec 2025 14:35:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766097339; x=1766702139; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=SGSB8tFcgzkyljD9wGESd303bCg+1DFy0fRL6Ry6PQQ=;
        b=ieSugPGUyr6cJv46jgTk+xPoebH7lCD5xALsAdyW2A1Af/WcG9E/f4NbIGWZXNVnjd
         5WWld6FeS6YcSi3wrCRCqpdt1qVYbGEyD7vvpJ9nq0NG0Poz+fWOguc3mu5t/K//aDwz
         2tL7q2cc9rkXaLDQIsUa/BtItvpSZy+MwAn/a2Nfy1/X1x6Xpb2y+Wstq/hHjUa83FG7
         OyTj93JgWYaI4WsVBVuh4Jf2wj2riOPTL7DI1XcRjPEJDNJaoZdGe2ksLuzTfXjTP6LK
         ifqexmKXD0Q2dzjbNCJrWmuVY6dnwyOwmJ2M3GmITPF2OCGbqjygXkLqeqhilnpd08nk
         rdOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766097339; x=1766702139;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SGSB8tFcgzkyljD9wGESd303bCg+1DFy0fRL6Ry6PQQ=;
        b=axHJ+eyNgJnFzfSTizq85qgqOX/lKY8yEwdJAvTktPrtFiWjifWCEKmUdoS/zSEkUl
         JJn21ampp8O+nkLlEU19z79gYfjeXTPgPiT36g/Ea+6792EX6PedTJicIZOT6VIM6CpF
         Um3Uz0u8PxJDjj6Z0eaWIgIIaHRa2Qd7Xx+1c1qRMgk4gvICel6cYwuPtwrNR4I8bqLL
         tLXU/XNFzv3e8i2T/nFwTcnbgrGCChfm1SyObS10au9yCQx/bBRJoGtzchV4mT8iYFoa
         6unpheaArN2Q4ijtuSLYSqcqqzBc/W9cuwwCE3cT3gWwwP+P19ny3uP6s6d8UbtLOpIO
         jGSw==
X-Gm-Message-State: AOJu0YztTvM/Nl0Pp+0vY5c08sOYDzfW80sb4RNNkBbavtNZodNZvxxZ
	ubXJ/P3k21Q5xwAX9nEVVIwgL0zD7stz5xhvjm/IqqTylBO1hfZM9F3j
X-Gm-Gg: AY/fxX7tC57vUUxWgEfXTIKUBdUnBiZD78JkBYOgXj1iKR5C54kNYf/eCPJetdnCudb
	n4QqQx8BEl6cDbb+pCVkZYUTgwmtrJfijbRfPaJ1X/C4X3TchQTVE36TOu1stHoNiXVmVmQilrO
	nvN7f6EpL4n1yS/xJ5K7o00UZvPiHIOemc1ZWDCyGQjvOvE+Y/sN50NEDOIYtn3jU2yYJ4MT48N
	474GAUYD4d+NHRLuW2Jq/anvix/fYjgWuSXUphyjs+D655bvmjzY5yrawNAIrbzi+VblnO0N9du
	ovXHxG3jTHekf8ltG0aUxhHiAHiz4Za/+EHp/zs83IJeFR0l/VH1uNynYKdOTt4FMXGex+aGjEc
	hBHC14wv5oAeHSEZCNfJe+XkGJbxIWQtiz9Fc8ZIs+0nLZbn/Ftf088BYibNzxK9S/xvCZxmeLZ
	R84DTXKAHuaxs9OBj2Xb99ai/XAsrRNhvSmZQzA1p5iJFK2iUhrRfb5fU69v9g
X-Google-Smtp-Source: AGHT+IGmkFRNyvzcHV6uQ/GIj5H0PGPsWpQdM2HeY9Fv9vQn//BR+z5tXQWqOamwxMRwsghJRPj2cQ==
X-Received: by 2002:a05:7022:e04:b0:11b:d211:3a64 with SMTP id a92af1059eb24-1217213fb1fmr1199123c88.0.1766097338698;
        Thu, 18 Dec 2025 14:35:38 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1217253c0c6sm1967151c88.12.2025.12.18.14.35.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 18 Dec 2025 14:35:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <978d7a38-787a-4b84-be58-d2784ebfcf6f@roeck-us.net>
Date: Thu, 18 Dec 2025 14:35:36 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] hwmon: temperature: add support for EMC1812
To: Marius Cristea <marius.cristea@microchip.com>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
References: <20251218-hw_mon-emc1812-v3-0-a123ada7b859@microchip.com>
 <20251218-hw_mon-emc1812-v3-2-a123ada7b859@microchip.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251218-hw_mon-emc1812-v3-2-a123ada7b859@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/18/25 05:48, Marius Cristea wrote:
> This is the devicetree schema for Microchip EMC1812/13/14/15/33
> Multichannel Low-Voltage Remote Diode Sensor Family.
> 
> EMC1812 has one external remote temperature monitoring channel.
> EMC1813 has two external remote temperature monitoring channels.
> EMC1814 has three external remote temperature monitoring channels and
> channels 2 and 3 supports anti parallel diode.
> EMC1815 has four external remote temperature monitoring channels and
> channels 1/2  and 3/4 supports anti parallel diode.
> EMC1833 has two external remote temperature monitoring channels and
> channels 1 and 2 supports anti parallel diode.
> 
> Signed-off-by: Marius Cristea <marius.cristea@microchip.com>

A quick module test run shows:

temp1_crit_alarm: bad permissions: -rw-r--r--, expected -r--r--r--
temp1_input: bad permissions: -rw-r--r--, expected -r--r--r--
temp1_max_alarm: bad permissions: -rw-r--r--, expected -r--r--r--
temp1_max_hyst: bad permissions: -rw-r--r--, expected -r--r--r--
temp1_min_alarm: bad permissions: -rw-r--r--, expected -r--r--r--
temp1_min_hyst: bad permissions: -rw-r--r--, expected -r--r--r--

for all alarms and temperature readings. Indeed, the driver
sets that. Please fix.

Also, I get

temp1_crit: Deviation out of range [max 500, seen 800 (val=-64000) with -63200]
temp1_crit_hyst: Deviation out of range [max 500, seen 800 (val=-64000) with -63200]
temp1_min: Deviation out of range [max 500, seen 800 (val=-64000) with -63200]
temp1_max: Deviation out of range [max 500, seen 800 (val=-64000) with -63200]
temp2_crit: Deviation out of range [max 500, seen 800 (val=-64000) with -63200]
temp2_crit_hyst: Suspected underflow: [min=-74000, read -64000, written -2147483648]
temp3_crit: Deviation out of range [max 500, seen 800 (val=-64000) with -63200]
temp3_crit_hyst: min [-64000] is equal to max [-64000]

I'll need to track that down unless you find the probem before I do.

Thanks,
Guenter

