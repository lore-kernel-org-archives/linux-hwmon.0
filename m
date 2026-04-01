Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E7D52517AF
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Apr 2026 14:45:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775054751; cv=none; b=k2NwCY7+o3VSTyk4U6Uc3wwx7a+7+7CZyKm2Ej4Y/Xq+HrKQMSNkQ7geMOeawVZpNCIJo0DZC9j4tLNQSxvNGrxKeoXE1K+yBXDofMu4UF98FTs1syiYwdhDUXsRxidyD+MXwBWGeT9qCikhWV031bBtPHSZ5B8uxvREapYCiWw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775054751; c=relaxed/simple;
	bh=38co2cn+cUNZd0qmrzrzcOrY2pIHvWBQ1L9wcBlm0ys=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bdkuEtrR5J1+/vmRyPEGYBfHUGZzcDqP7Ufxf3HaO79qiZCKqVBo+ugs4c3DoP2sks56dbSO463PsjG7MVQ2WT2WDEzhsAABdbPc/l/3+k0ysJbLx1Rxo34Et1YGuqhqGQSPyttv5e+f9kzse6hzi83zjmrcH/kUA09KVMYJeck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QOpcJVAl; arc=none smtp.client-ip=74.125.82.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QOpcJVAl"
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-2ba895adfeaso7533211eec.0
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Apr 2026 07:45:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775054749; x=1775659549; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=3qffD9tOVa2bRYolQkVM4q1e7qHCfE+PGZL7OnfVyOM=;
        b=QOpcJVAldPGomvXQCX9idN3Nfvd3lvqMpa+DdUhUktMi6k1EX5Y8o6fF6AuoO/UGFR
         gyp1y4zILva6jDXshXqjBkzxGApLHX795WM16bbKiT6CtQAm+nJRqsOAVC5Xve02aHxn
         geL8Tcei59z4P+lPfx5MxALCq9zizhp1V8goVO1anDzcWp0N2+v10ztwKXdK9WhHavp6
         YntqTfP0isxJGe24MfxbEiX75Boj0IQpAVCWP+i/1T3KS5WyE1W3WB69i6q2/mEr+0xv
         b3g0kJ0lwYriI15CKVtXSyVaEzLtox7A4te7vrHo4QHl59nf6DrJQ7f9bhfg+S5x7nrJ
         PjeA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775054749; x=1775659549;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=3qffD9tOVa2bRYolQkVM4q1e7qHCfE+PGZL7OnfVyOM=;
        b=EHvm0Ahc/bYonnJ3TrZ/plM8Y2s5+eMRKlb3JEDNvXwffXDJ57yR/JfP7fpSAHjc9q
         mStZ1Z9SKojvNECExVqVeXNhlODbMuT2/m4XsZNJE3etuwzY8cBZpiYL2+P/x1wZsGQU
         LqabIXHXON7PfwN2vSjrJ+phI/GbMoIYz22W7l3rZm3tE4zeCXGKRUbQECbGqD9+aab6
         qXCOQni/THFs/tH6xuKy9LvQ2wIU17978H92bThR09V34B8aPpM/RfCCLm3rI/d8hWxh
         kR7/l4yABt2mZLWNLIJXraqZGtzfwcSoV+BWW5cE/JwyGg9Q8dSQVoZWz0rmazB79st8
         cJRw==
X-Forwarded-Encrypted: i=1; AJvYcCXEFuOuZXDMPQwfzLdeZ3PWMpmDMGvDoO5rBwyIOOTBbqLjjfoaXtjSAz6s8pfai4mChqIGLqsxqXkJuQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx3YpQ06GS32PLCnNscrB3fJgspGgjx9KK5eOsO0efX3DXYC/nG
	GyavdGcbLPrWxIdE1hiYmcwmC06ptcqo4RnCgcP0XiMnr/J7UCCneEl7agf7iA==
X-Gm-Gg: ATEYQzwn93EaXXIuBNajl8ETwARB7O8X5a2L25HPiK5lTGdr2WSQTmOw1rYNNrSUaEl
	C6rkp6oRPdvTBFecI8xw1c+rovywCZriWpdO7j+OpDng/NfFlJZy5qHqIwftn4MA1rrbkBHXdGb
	z0hikoGVjMacSVbY3+8TSpjTBkQRZIO58B41OlV6wJOBzCZrRACftet8zgyQF+nXC6jiX+LNI3k
	qaFq7yUGB1oKUW1c4daeyOepRTlqFOG5BK9vXknhYxFvOMPqCZYkszK5ljEETgkwm2cGygHYlzf
	faKPCRicGQ7FDAhCNOey/lpwyk/2jFb/6IIZAxuOavJjyf1pYShxpfNoPKXyw0XlYqmzxmZ9/S4
	ubppa5CNGgKL7T6VnzgvdEW4h07A2sX7gMUv1kRnUX1Zyv8dvoqeGL7iCbtOHUj7gPBIuo3c2eV
	vnwLp0zrR3EHUdQadILdSx8LmNOM+Rpbrt6zwqG+Ii1lDnAfwYnCUJa0lrZyWlCVfmKiax+KzM
X-Received: by 2002:a05:7300:80cb:b0:2c7:2c0b:f33f with SMTP id 5a478bee46e88-2c9325b0162mr2284185eec.21.1775054748560;
        Wed, 01 Apr 2026 07:45:48 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2c3c79722e0sm13834154eec.31.2026.04.01.07.45.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 01 Apr 2026 07:45:48 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <38703f7c-c082-40fb-8ca8-f70e8b8c7d25@roeck-us.net>
Date: Wed, 1 Apr 2026 07:45:46 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4] hwmon: (asus-ec-sensors) fix T_Sensor for PRIME
 X670E-PRO WIFI
To: Eugene Shalygin <eugene.shalygin@gmail.com>
Cc: Corey Hickey <bugfood-ml@fatooh.org>, linux-hwmon@vger.kernel.org
References: <20260331215414.368785-1-bugfood-ml@fatooh.org>
 <6f1e43e0-14c0-40d7-ba43-95ece77d7176@roeck-us.net>
 <CAB95QAS2-K4VADCveRfNCziYiBMJb-P7McQ3EFVznHqHBDx_MQ@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAB95QAS2-K4VADCveRfNCziYiBMJb-P7McQ3EFVznHqHBDx_MQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 3/31/26 22:56, Eugene Shalygin wrote:
> On Wed, 1 Apr 2026 at 06:35, Guenter Roeck <linux@roeck-us.net> wrote:
>>
>>> Fixes: f7ac3020036b ("hwmon: (asus-ec-sensors) add ROG Crosshair X670E Gene.")
>>> Signed-off-by: Corey Hickey <bugfood-c@fatooh.org>
> 
> Should be:
> Fixes: e0444758dd1b ("hwmon: (asus-ec-sensors) add PRIME X670E-PRO WIFI")
> 
>> Applied.
> 
> Maybe it is still possible to amend, please?
> 
Yes, I'll do that.

Thanks for the clarification.

Guenter

