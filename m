Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B1F42D59E8
	for <linux-hwmon@vger.kernel.org>; Mon, 24 Aug 2026 21:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787605252; cv=none; b=cAPIyYh+WjuOvMGIXe0hiInWKuQ3usSZg/qzfu43z4J19p52L8SdMaphuGrT3GKwn86UyoWRbWW8Dr2l0xSQoKpD1djbSiIHWvRyPDU32sTTrkYlqpmmg0JQX8JNbnnyLQslKE95VpASItJtOjt65xEzAnPjgpDeIUZ6+YMf1uc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787605252; c=relaxed/simple;
	bh=5TtqUimRI5YFYPWscqq1gFazDADP4dm7xU2AZ4mlrhQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=jZvjACrj2sA0m4PgV3JLu7gXGJiViEpxBewyLaNdj1gvUlOpnJAlFjzUnKOkqi7Tdbs4ScYIkpYw7RIVJsRnL4cpzwbt0vKe3P6TvwJtQgPgO4uIVUEKY8r8c6hoQLXhyx1+sSPXexJRA5Rw4H4cdyyLvSlm9MsAMnLtrfXHmg0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=L9D9LutS; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="L9D9LutS"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d6af66ca14so15492205ad.1
        for <linux-hwmon@vger.kernel.org>; Mon, 24 Aug 2026 14:00:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787605251; x=1788210051; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=iGpY9Ret7i2fYsNLZTwb8rG3TlI1ODLoHhIJzbRQ/Fw=;
        b=L9D9LutS81x1503A/ZemfJqrGKJoo1zJp9sOXkJ2h0dBXVjgK3YyPvppF1icQJVPxl
         vezjx5vAw6v9RYe4Ppua6YkWFGhvCD57m5V6de2GnaZ6xT8i/wWkR4KIcgu5ql3VZax6
         2j1b1EQSCMgZvv7bw5vX5oKBoAvzWo4NpYPZODPukzGZsXaIrfDs4CjriLfiFvsAIbOr
         oxUJf8zeY1TwAEmfgJsgS/IyMR2LSD6UogU8KRBfsMD5m/6bMgFrMSUZ1Hp/1Kdiae9g
         kOOhSoJ1Dbjm9VNhRuCalQy4Gpn/u5zvfHWlt/YZOkrPfB/wGHUrcgW8PQOFNRDDeDet
         cbQQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787605251; x=1788210051;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=iGpY9Ret7i2fYsNLZTwb8rG3TlI1ODLoHhIJzbRQ/Fw=;
        b=IOOm50xI/mm2njfknZk6cQo3jEKoahjkU/TYN5YqLM3TMxJuKfFKalUbFD2py7gUg5
         kaV0t9d8wVuAfeIwZmkllFIh0/Wv3rtMPYC8JEJBfJt+7010nHtMsFv5GjNC13qHnBaG
         0sdZuM4w6l/ldV/1Nr8Da/9yXSW8OKO9Qw0X70B66yhqccJtl6IPeAMuRy/9vBZkQukE
         Y7H4dMZSt0omcIsMz/1AC5SWxclwK2N1qOCk3rWfOLz2Fxv2Mlz5seWLqJ6rITnDhlV7
         2EVta+GRzO7c+g8uWAdzalcda/Y4//mN0JVB/kMinWZpXctndh7KWzP7MrjXLxmwoCAF
         olCQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrzxq8nxusUq+EiYGiEZnc/ZCyICDqDjMVJ/deDtBC7fWdcbiPTvIdBI+RpnPCyKbM8eaSQxEEMDNJxjw==@vger.kernel.org
X-Gm-Message-State: AFuF++kIjZfrmSazw/L/KpQ6EaNTGEHavO79RspIlvV8rv6XMED96ci8
	0WoV6eqGhiNEEXf9aaL5poSLpZw9h9aIa7KqAtKdlfMbO1cup7KtvhNMIXB3sQ==
X-Gm-Gg: AR+sD122kYFBMitcrh61zd5L1kqJ6h1cWCtsc/KVXwSICSh9IETECP0A7nCWRr3l73K
	syc0N8eLTfq88AwTCE8/QY5L+CbCcVuTmy+MqQ2WXTaz8dGv7bsqnYJXoYysU7qXQ8e0dOMdH/E
	b2lqQhJ7wI/DlBWiqcLaEqFVRt+KPNTTcwxzeC3K9IBR3qRi72akQQ32V1ev4sP0naYU8V3A1n8
	iKOA+2DAWbYfHam0cDC4Ew0QTB9vZ+OL78MALDP/LdYyNs3sxx22BqmzXxp71ouKrr0vYM208X8
	q9miumDwvnqSiNJRSOJZgCMWZMniy96mqNWboJqChNKaQBC/Lkw+OTGztMJSTGJbS1GOyXI+Dq6
	2It0CjwhbXCd4QnaxBvWz0ZkZIQFAd22UGgrqosu1oQGYJ50Ve/gFBD6u1KyyDqBi6X5yODvmgu
	AWbW9cN0I1G2Se1S0zQGCmhe/G+zHj69YQilUVeAC0dE0OyKzSoRoUsVImf+yAdnelCb9uhNp64
	sGJKABMgB86GP+3nzJYqFiCPwlZBu/7BNdEwg==
X-Received: by 2002:a17:903:22c6:b0:2d3:89fb:35fb with SMTP id d9443c01a7336-2d6706a6be5mr364103755ad.0.1787605250578;
        Mon, 24 Aug 2026 14:00:50 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-327f90cb8e3sm43743355eec.12.2026.08.24.14.00.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 24 Aug 2026 14:00:47 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <8ab90280-6eea-4e4d-b698-e6c050cd7ca0@roeck-us.net>
Date: Mon, 24 Aug 2026 14:00:45 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] hwmon: Add support for currX_emergency and
 inX_[l]emergency attributes
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
 Hardware Monitoring <linux-hwmon@vger.kernel.org>
References: <20260813211433.879638-1-linux@roeck-us.net>
 <293f09a2-a9ac-4e35-bb5b-e1008533c318@oss.qualcomm.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <293f09a2-a9ac-4e35-bb5b-e1008533c318@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/24/26 12:42, Manaf Meethalavalappu Pallikunhi wrote:
> Hi Guenter,
> 
> 
> On 8/14/2026 2:44 AM, Guenter Roeck wrote:
>> Some hardware monitoring chips support three alarm levels for current and voltage high limits, and three alarm levels for voltage low limits. Add support for currX_emergency, inX_emergency, and inX_lemergency attributes together with the appropriate alarm attributes to support such chips. Cc: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> 
> Thanks for the patch.
> 
> The change looks good to me. I applied the patch and validated the
> emergency limit alarm for voltage and current sensors with my Qualcomm
> BCL series applied on top of it, on the Qualcomm Glymur CRD platform.
> 
> Tested-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

Thanks!

Guenter

