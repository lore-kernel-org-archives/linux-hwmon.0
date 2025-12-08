Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 991BB266B67
	for <linux-hwmon@vger.kernel.org>; Mon,  8 Dec 2025 07:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765179629; cv=none; b=SY9EdTKjYcN2vqe6Ty2QTc1+7uaPaNVGPbTx0Aeoq4vg33KDwR4mEHJYAMMDmxwMsacGnVwiC83naEsDpwyu26k87MEUPJm+uVtU+I61e5qBY0FT1fGiCLfUYnZ6gjXge18I93i18f7oig1A8qf3UPXxA7QjV86LhRTLvVfI/WU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765179629; c=relaxed/simple;
	bh=CJV2YY/Bxfi/CzjyDJEXLrRI4l2A2dqf7ZBfir1/+aE=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=bt5Xzf4jbLtgYjjgurkMMq6iUx6pf495cyjnFw4cJ2Xvyf+JSXQ6250G8ExOMvC86YWGwcvZMJ5e1g+/CpYfO3yzdFdcKX1OJitFp5o67I7TKIykeAftTppTftPxNaQsmkYsxzlJ/DB+5Yhjnt5DUbVhrD1Qy4UewJUH+7wSWv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RPIEp48b; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RPIEp48b"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-bd1b0e2c1eeso3281940a12.0
        for <linux-hwmon@vger.kernel.org>; Sun, 07 Dec 2025 23:40:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765179627; x=1765784427; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=eKdwd/KR5bnb9wX3N8/V35/o7UnRLEl4Xu9deacC5pc=;
        b=RPIEp48bqZf7xf57zZff7MKVAUowczuVUDfbgkJPDSppfpKWeGaP5S+MDKjaoIQXwR
         5JYNqHwm/zz4UiEBHcAZDaGftUpe/QdfuSjkCnAQdETzbYbhkImwqnUlNtAWUaMm8llm
         WuivCmcV5ColuHy/LVqylK6YSuN/bxTQCtVX00aNhdwq6jy63zHR7yddfr4DydtOjR3q
         pkFtIGcbPuSN2dqIgb+8kR6rFtIbnxLV/9KpU0fG/PgnAA4g5CG/h+rDg/8Tm7w1MmvO
         cPo7ETUeuvs3IGUk6SWGd4io2mPuoYjwS8hFb24BSzrqqhM5Ddp01hciCYznHFYTm/8T
         MhIw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765179627; x=1765784427;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eKdwd/KR5bnb9wX3N8/V35/o7UnRLEl4Xu9deacC5pc=;
        b=G3kO3CWugYbqHPGHQ9C3R3EnXU3Y4xuoO7ZUDc8FIJ4IFwVtMD1WEd3P6CC/riCEOq
         EUdx6G/UkKFeVGa5Z7Bi9AivVwmlfAtgataMVNZSpDlbhIABcOstp7tRysryaX2keYiv
         zhWZ+/BA5O3Ssf/+gMTzOaA0YHDRLGSgbxyV6D9ho/IsaPq+rD1HXIzNy7uEvX998bka
         Aiq51H/1+AMJ28BSXxPYxl6D9mYROeeDrjyzPwpQRAuqQQlLIwynTYrxKfi6ArWezjGP
         5iy+6O9VptoQngZGpZwwSC5H9RaXLLCGQ/mSIWT+XWK2KbS7rQiNsbvHy7CO9uULJZAU
         9W4w==
X-Gm-Message-State: AOJu0YwLpTAwuiU5SvwRNl4s7Zvv8s0fkxorNtRSWJeFz4UVLyzt/bFJ
	ZuSdwHgOs8CO07g18+WquZA23cy2FK5X8n+jcgZIpDa3OTiMKhFl2I2l
X-Gm-Gg: ASbGncspF5CBVnbbCaCOxF3BeEjaPABETY/lDpn20u9uiO3/VUi4R1h9rixaQqToc7U
	7c1wsQB5qR+R4REYzeYR7jLnJu+u5lcYtuYCKkVmy9lH13tSvBMS2SahMDu215XJ58BNnGdsqU0
	PTwaPOJ/RwcBMflCb25oRVEg9mdLS6LfhuRd6CXuudorG4wvZPWtgFoJe9x1KMip4JbwIbUlBDe
	9rYtDBBThHLAM2hIwgezvT17svvGYcLPSaiZXkphHjZagkqqK8LTkMrAOdIUYErTOpAMhSLNYGQ
	jtp4oWBc5ZlW7zgfPFmDJ3To4DoXHqnHrrDBMjXdGbfuIImbNpPdbtS53bT+xKy0LGxYA+CJ+9P
	ZCmFTmMg3TPIb6nfxyXjWLMCpDcgfTwrMDuoUwgncRhcsRc2vKz7Zs3gi3zGcW7cE/XCzb1kX0O
	5VVCkd6J2XtOvZPMO9NAJM8ZfHrzGk6tL6S1CyC/d2vn5GLcuItCI12/czZ0A=
X-Google-Smtp-Source: AGHT+IHyV47dw0/i0DBXUAhZKcF3aDHj1i2N/ZIBxXcFtJsWedaSJNdXnm3NvzD25PXjKusGyRsGtw==
X-Received: by 2002:a05:7300:3253:b0:2a4:3593:c7d8 with SMTP id 5a478bee46e88-2abc71cf162mr5670627eec.24.1765179626641;
        Sun, 07 Dec 2025 23:40:26 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2aba87d7b9dsm44916816eec.4.2025.12.07.23.40.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 07 Dec 2025 23:40:25 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <934326a2-562a-430a-84cd-7b64f1eb2e25@roeck-us.net>
Date: Sun, 7 Dec 2025 23:40:23 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] Documentation: hwmon: g762: update DT binding reference
To: Shubham Sharma <slopixelz@gmail.com>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20251207202712.71787-1-slopixelz@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20251207202712.71787-1-slopixelz@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 12/7/25 12:27, Shubham Sharma wrote:
> Update the device tree binding reference to show the change
> from .txt to YAML. Binding was converted in commit
> 3d8e25372417 ("dt-bindings: hwmon: g762: Convert to yaml schema")
> and moved to Documentation/devicetree/bindings/hwmon/gmt,g762.yaml.
> 
> Signed-off-by: Shubham Sharma <slopixelz@gmail.com>

I already have two patches with this change, and one of them is queued
in the hwmon branch.

Guenter

