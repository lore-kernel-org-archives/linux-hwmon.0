Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ACF883A6B77
	for <linux-hwmon@vger.kernel.org>; Fri,  7 Aug 2026 05:37:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786081024; cv=none; b=asJHnyrEJ8hwEEd6at/MH5sLPN59gkgOHy1o7T+gmgMW7AACiAFpFB3esVWERPTCqATSi7z4o4Z+FgIkuBSX/1buzjFk5MeP6pTXvFt1yJr2bfLPjQ1qsvW1RZhA+tv5xs3/LY8Lp3HJ4AcYjthjXF3YS0n5Lo6sQBkfrc4+nT4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786081024; c=relaxed/simple;
	bh=er7QkZWxWseiRLpoNlGIvWxl9Vymmksg5YZYw9EtIN8=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=E+l8IF9DIXvXD0Sx6ZsysplMLXnsU7fXGB4OA8dFwbNRLDHKpvVEYZAnJH5D5vg0PbJXKSOwiPENQDvvLn/9hrF2zRexSpZqlK1cImWIdHVOYU2XZQYLSYlmW2SidzxtbQVEe65areArsVD7BIwhKFw0JUdNQCwt55nby59Dhy4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Z1UWLNYJ; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Z1UWLNYJ"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3900e39d935so2828507a91.0
        for <linux-hwmon@vger.kernel.org>; Thu, 06 Aug 2026 22:37:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786081022; x=1786685822; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7d2hbX6w6cwyN7Fz3jBpQln0fQNKRxpyoZZ6afm1gUI=;
        b=Z1UWLNYJG2Y1uq81gPooQ34dcZ20s7p9NpxEmMeQWAl+p86UMG3VW2s228WyuPJPj6
         c5EBAb5LDR1yb5DCAoyg06aqsIcde9d6K+RTycYmYIDEC3+L9I6CyM3AkLQsdFvbWhq6
         ptNszuS/UNtXqL+9Kpe1JkENkIy93nM/lKqRilPzNreAYly8wqjCLD9QbKeOfGa4pPCa
         iAwJ8XlKsvpnFsN7X8gPK7vg06oYzI3SvI90lOcS2ChsLjdiMSvaMbHZPvpE/6Uwl8kj
         vcH6nuIijd7kRpS6lWtvHjL+PQkbutk5x8VMwJ45ggnEf7ps+z7nAVn2SFa56edJm9vu
         wDMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786081022; x=1786685822;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=7d2hbX6w6cwyN7Fz3jBpQln0fQNKRxpyoZZ6afm1gUI=;
        b=mRr4SEDeUb9rgRK8GZ0hFdXlIPOahN31TSNJkAgdev5rJcsOBvoDPSCQ2v9IyYxhJQ
         9rTSdVkIZEyXD+uRVPEnQSm9jKiVA04ob5H/4CJcQsvSyaTDehDpWBiiMfUSHll0cT/n
         lUApglxzEW8EcgP6Y3CKFs9lT7qFziVJUK2lRJx6VOy8XMXg7Tn3P0cu6kq72BmH0OVd
         /IH0gF/YsUVMKfIemTDte6lr1peWbsXrrItDsc1c70/Ur10NLcRjOgT2q6gGYJwsMU9L
         yQjOi0Mm91L1EEtCVpfXacZWgi51wdM9RdcF3VJHBejz4+8xAT87knFVGBYZ8Cbm/pW8
         D8mw==
X-Gm-Message-State: AOJu0YwWuTPHkVTH1m14Gd+kbSPkvl0ZwlMUxMnFccO6cMLewBPnbTjJ
	N4Ie1GMVjptWnn50vjT1XxmUol/7wPn/ik/iRYPTmmJ3fHvHfSkMgNA5
X-Gm-Gg: AR+sD13TvQGjCXLJtb537sN3TJjzvOKkB9wEfn8uzYWjMENOzFSUywpTORChWP6uhTj
	62FiSJsVjj/6Lq6BAIfMnGMu0FEkykSw/xdE8Vo4iPZATHHIgZw7h55+kIU/RZu1QNQ1+4LNT5j
	TWiruw0Lj6yqFoUKaQV/rRMPTIhVN+m18ZG1CXGd6JfxT9DUcf3mncX8MvkjBgE+RjXm8VgQmEJ
	6jIpIOANu0x5QWGTeXtrhs0jzJeqopjsP7nLjQFRmuJkVxn5IcCNa+XtnKPFrAbNQauPFpi1YLR
	kU7rnj+kfF1qrJqTUVtT/VT2v1CaFqrg1TtUlaFX+BoMe6Gx/f0TmDAEKdytJXkZDY5xipQGZ9G
	hT3bFnEdQbOUInXjVeTZh93DQRVIMdp0QyDZ2NnSjfl+9oX1GJXyZoQvvci6dEiRKzn2clARNTq
	MNaJYvFsPW1hRtkyj4vBA7/VUr4AsuEn3YhZgZ/LZ44N1/IRuCJO2NEMvkxe15FeiZapJxF6gZ4
	axZqpdYmAgCnOuOEonLMGp9HvLoC4u9wcQYXw==
X-Received: by 2002:a17:90b:274d:b0:38e:fea2:df53 with SMTP id 98e67ed59e1d1-3903c534d46mr23235013a91.4.1786081021900;
        Thu, 06 Aug 2026 22:37:01 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-390b3579ccfsm478672a91.4.2026.08.06.22.37.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 06 Aug 2026 22:37:01 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <a2fa77e3-f1c3-47e8-ba73-7ecc4fe7df90@roeck-us.net>
Date: Thu, 6 Aug 2026 22:36:59 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: (corsair-psu) Fix linear11 calculation
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>,
 Sashiko <sashiko-bot@kernel.org>
References: <20260804034811.2385506-1-linux@roeck-us.net>
 <20260807062627.3cb50d82@posteo.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260807062627.3cb50d82@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/6/26 21:26, Wilken Gottwalt wrote:
...
> Don't see any anomalies here, so the change is fine. Though, my test is limited,
> I can not simulate negative temperatures to fully test this. But that should not
> matter, because the allowed continuous operating temperature is 0°C - 50°C anyway.
> 
> Tested-by: Wilken Gottwalt <wilken.gottwalt@posteo.net>
> 

Thanks a lot!

Guenter

