Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C451038838E
	for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 13:11:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779541865; cv=none; b=oKFtTDyhP/S/xe8AsA67GYuEQil/RLV3qo3S1IgebrHZqWcQiVaYFJS7VR74cEZRrT6JhOoucXYcMHGC5ncy642MJJEz0BZG6q43rnbcHKc3bDFTE4rp8sYNdbbEGGsr/ZFX+nJNbO9c7l0Wr5Jt2+WSAinXVJr6ejCxlpM/U9c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779541865; c=relaxed/simple;
	bh=LvsYA0CCnlPuAYySq8D2KEr0XcfN7EGZ+If0+/WJmUA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=cxD8siEQuCh1SKs60iyL61BZX9Wur76xMjqWg3VgLpj/E0fbVg6jwR9mM4v2Iapv1juRb3/nZKw4cUj35vUN8xiWTFU7GPEE1nYP6LAkPKed8wD/rvSJ8pl93pvy018wjF01d25VuOa2WyKvr1tSkG9Y1mm8+HiykEap3+Cfi+M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=SQF8g8Pt; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SQF8g8Pt"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2ba17c8cfacso85001115ad.2
        for <linux-hwmon@vger.kernel.org>; Sat, 23 May 2026 06:11:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779541863; x=1780146663; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=yzyHT1CBV6SdGyl4lspqDckrFspESP8yAbrvbW352gI=;
        b=SQF8g8PtqL9fX/S2s1F0wX9ZrnfaAHzGIRn5EjFsxL+wKdmhNS28iJ8lR3OJ6VHC67
         aLeny2KV8L/ndxULOnj7leLrnI/XI6gYigs3/uLjTebzpbr9ybqKEWyS+nQyg7hVYBkb
         J8xLl8F9ugElzyv65rhIFR/o352IAH7uNAB8KAfU/SqWG3tHUsymsIi2y5bmDsDq2a6X
         XdBpu3i2bseeNWvrnvHG29yk8Yco/9Se8tyTTjClr5RQmFPTLz8E8hZC2Suzfu+HP4e8
         FIwhdN20jLcVM7LI5WVfxP6UNVzJtyk3ANnQYDjUXqoiOt/yo38+eAaCxBVKQY9dTrCp
         z4Gw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779541863; x=1780146663;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=yzyHT1CBV6SdGyl4lspqDckrFspESP8yAbrvbW352gI=;
        b=dwHca46OLl4TKl/yN9NIp1hTwxP5OZ3W4l/UkIy5HrDsLcbtdTuvqbiRLPAe1qO+Xq
         dCgATH02x1+5eyPIG7vFDHX+z/K5NypKmO+HqYMtzziBXm9LQZEqvQYyWAI05JL7U9jD
         xTCaJy6xWVNuU1xo2ShlVUdtK1745dgdfDlZcamxNUY4Q5yLxCwywlK+iDe6zdqkiGI1
         ucdJc+x9HAnXdkD/iuvRdSOq/g5nswGJQMn9FRO2c40H657jM/esu2PgCps5r5j8hQpu
         kvJy7CpmPkNI+V7vBJCsXoUM6Ua+o5Zchdhw/yO3KzFCu6VAxuui1T2eWQQrKGhr8uHa
         +09Q==
X-Gm-Message-State: AOJu0Yy7MNYRBJYowZ61HUVH4t7f4LGpd5CqlHZb2+/gNGIGb0PVGTL+
	NecM5+69cWiZcZuNLUNPSyjAtGCMJXCoZGcpr5Y0J7sYNEN4sKQK9HFR
X-Gm-Gg: Acq92OHux3nVasAPB4ralgkG2yG9+DFr5m2OlBTi8Rsotge5s1YQcVErINjSulWfWdV
	ExXSwKIohDLE1sIWhwctvq5hphRYTenW8mJqNHJBM12X0qhTTq3NXmVsx5cTuGHbJmetZ4r7anP
	FRuJBJcw4uhJVcOPCywqbgOVlNySBCpcyT4YuUqi+Jup3FEQ97JdXbVoIQPTTUgz98k6bLF3KaN
	87dmuPwVejQXZ/zfwvjjK8MB0H6dFFzPyK9lDo1ybZPzvZq61w/RN5tkpZ4XjAXDCPQYsH/U7lz
	QnIP3NkUMo61/t2DHa+v+z0NtQP3ykv/REJZHzRFDhgHK+jLtq7qYtPFa9quGT9acA++V829Z43
	SKnvpWje6/AyaFDcehP93w75vbFNNAQyy20206DLS+HVs++gNwFqc+SiASkQNRMJ0YXcBY+OJTY
	6BkP9wcnu7TtDRI5yLbB90grIF15Ll/a/Vbn8n8vZrtFiz5pm3cP+kcUkmZAHHgZZWcFBuhr3b
X-Received: by 2002:a17:903:1b6d:b0:2b2:3bb6:fbf8 with SMTP id d9443c01a7336-2beb03884aamr82887705ad.16.1779541862814;
        Sat, 23 May 2026 06:11:02 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2beb5695f5fsm46241145ad.8.2026.05.23.06.11.01
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 May 2026 06:11:02 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <580689d4-a969-4f4e-8d06-cfffe809500e@roeck-us.net>
Date: Sat, 23 May 2026 06:11:01 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (lm63) expose PWM frequency and LUT hysteresis
 as writable
To: Jan-Henrik Bruhn <hi@jhbruhn.de>, sashiko-reviews@lists.linux.dev,
 Jan-Henrik Bruhn <kernel@jhbruhn.de>
Cc: linux-hwmon@vger.kernel.org
References: <20260522202250.3184791-1-kernel@jhbruhn.de>
 <20260522205930.3E2EF1F000E9@smtp.kernel.org>
 <DIPYQFU4CSI6.23E8KAFNAQ859@jhbruhn.de>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <DIPYQFU4CSI6.23E8KAFNAQ859@jhbruhn.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 5/23/26 02:53, Jan-Henrik Bruhn wrote:
> Thanks, responses inline:
> 
>> Does lm63_update_device() release the update_lock before returning?
>>
>> If so, is there a race condition here? If another thread modifying these
>> variables in pwm1_freq_store() runs concurrently, could this code read the
>> new config_fan clock base but the old pwm1_freq divider, resulting in an
>> incorrect frequency calculation?
> 
> The new show function follows the same pattern as the existing show functions
> in this driver: lm63_update_device() refreshes the cache under update_lock
> and returns, and the caller then reads cached fields without holding the
> lock. Changing that would be a driver-wide change which I do not want
> to slip in here.
> 

You keep telling me that the existence of bugs in the driver warrants
introducing new bugs. Sorry, this is unacceptable. I won't expect you to fix
existing bugs, but I will not accept introducing new ones.

Guenter

