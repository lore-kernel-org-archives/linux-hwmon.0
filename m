Received: from mail-pl1-f178.google.com (mail-pl1-f178.google.com [209.85.214.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D41638F9C;
	Sat, 25 Jan 2025 05:01:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737781301; cv=none; b=M8BzoyuT/6uGXn6I4yuQdCjwXDkeYWd40BN6hg+9WFDNPOZdpcmqkVlKjDpD9Fde5O5N8QxjF382FOXMcauwduj9t20w+qhUAaOowxzNrnJL4y0tURwVZiJutQcro2dfvyqjC0knqwTic3ZqcEyuN5O2wKehHZNfsejblwk0kl0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737781301; c=relaxed/simple;
	bh=JXPDtHeu/vrjKDzJ8BMnk39ANi4RLIZc7kPZ18iiKqU=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=TVksW4Lte9Ek/IA+7joibL8RsDk/5nzLsvKyPYOvnpzNUk1p46l2TlTzflvc3DSdtIQXG2sjCixYsGDtrBCmMhMOLVo4MxutlkWoF8KrM4wVPk5BzcuzlDX1/EzGKtKfrFV9IuLERyRrh6l7XBjYZ4f8Vwwb+9xi8nun7t84mv4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=FjpEhsLo; arc=none smtp.client-ip=209.85.214.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="FjpEhsLo"
Received: by mail-pl1-f178.google.com with SMTP id d9443c01a7336-21669fd5c7cso49609075ad.3;
        Fri, 24 Jan 2025 21:01:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1737781299; x=1738386099; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=y//wYBiypaNOIKfNrtjugiFiFRDewyQcK8IjmOnVSkY=;
        b=FjpEhsLo0T4V5AI6J4yilTdAhfe2T95rRwhaLGr/oa9vZToUprxqx1WPfYBgYmb8bb
         TzJC6vHrWFCYhXltbHtfEiafcBxp/WSSwqtT3IoqliqvmcBkT4cI4ln1+zXKDdoWKaWG
         yrKxsEOr59Obgaz8zD4Zv8ORf4FeQAP2PRU6PRnk7lYtTjWfZVk/XijG9olrLeRiXvYx
         DojVN/jNMSebKIzYwhO5oa+zn+V/IlTtymVJGd7YvhB+NPfUzttenfxbKtpxIKtgMwN7
         7nmZB+OfTi9oecMFwuDnWlTVgbSBNfWmlr87+vwM22DcH966UargJ5gmQkzY9qEAJ/AO
         XWmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1737781299; x=1738386099;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=y//wYBiypaNOIKfNrtjugiFiFRDewyQcK8IjmOnVSkY=;
        b=AfhAJwSzRlO8VrxYrjntEhQRSJV7FKScpBtv3LIg/oItPr181xxAcn7jK8hkOnG4cA
         TOLeIK6EFTYHzdJQRr6B6BlaAKrrOR/grNMvL5is3hvoFEfzzmf7a3vulimXex1JBfmu
         xegsEruiKC32gL34aMV9F655ymvlZDxnRoOCiNfqWUeksql+20n7i6kLoioroP+iZ+pB
         15QOxie9FNMMEcBqjAH0KVC3BR5j8ZJFgwy1qeAKGiYYn7hevCQqX6Cz4jRO/TPb81sF
         uo1WUehVdBTjGkc/ubUoiYYE5u5Sztwe/dk697MIrCJVK161WxTothkXQF3Xp8BtSwPY
         0Wyw==
X-Forwarded-Encrypted: i=1; AJvYcCUGnLB34aFOQmD7k716lT2h8uS6MOLJyxe5fSZ6PUOIgRd8Dfz3BvN+CiH6ESXQSzTMs4hyJuIBnq20WvnP@vger.kernel.org, AJvYcCUX6y0ciPlalM7Dt40CrQLLyVuvGmLMhkvL6ejfOHBz+yATItllmcj1MZ/aM19bMxCjI6iYalW32iwQLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyH2ar4J/wUUNRvq8m1KCEreGZRYXs9dhwAB75wAj/hnV5VFysi
	r3AzP8u/WvK9Z3Y5PFtP2TCKGMMh23l9QeDabZ8wU6//YGvnZyca
X-Gm-Gg: ASbGnctp0FXnczSHjTjFFEp32qeotTFE5Ij0yCa5ikOXF6N6NKscYUZnkjT365UYdmu
	1ax62MQ7A9Rh79sfBGfKJTqe98PoQ1DZW4cPuRWbCuk+4rtatmyp7zNiyHE2kjzFxQFuvOTyRGc
	7r/cSrZQNQqhBFcW3lsxTH69AIfgQ5l2EyO/5KMgFIvbeHZWKSHSRUmoqOuDXJIjDeZt0myxfE2
	IsVZOpQ5P7fRtULXXysWuADhldXAwAHMPY8h1JXuw49JvV/R3Vd53diYLT7pY7wXQY/IcoLpNNd
	cAGt97kinSHPkne2UO7qx51J5j97MwwqqhyYpolfPMIKhdXr3CPnKA==
X-Google-Smtp-Source: AGHT+IFUwqgKxxI8ICLEvCKkyfGh6biS8g4Om64IvyHUzIhMs7H1XXsTuiScN4Pxcrw1bmJD99gjcA==
X-Received: by 2002:a17:902:f54f:b0:215:b468:1a33 with SMTP id d9443c01a7336-21c351c67acmr485470675ad.4.1737781298642;
        Fri, 24 Jan 2025 21:01:38 -0800 (PST)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21da3ea0472sm24829885ad.76.2025.01.24.21.01.37
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 24 Jan 2025 21:01:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <c7c3d35a-e8a5-40ee-9b47-c22d87fa7f71@roeck-us.net>
Date: Fri, 24 Jan 2025 21:01:36 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 0/2] hwmon:(ina238)Add support for SQ52206
To: Wenliang Yan <wenliang202407@163.com>, christophe.jaillet@wanadoo.fr,
 jdelvare@suse.com
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, corbet@lwn.net,
 linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20250125030300.1230967-1-wenliang202407@163.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20250125030300.1230967-1-wenliang202407@163.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 1/24/25 19:02, Wenliang Yan wrote:
> Add support for Silergy i2c power monitor SQ52206 to the ina238
> driver as those two are similar.
> 
> Signed-off-by: Wenliang Yan <wenliang202407@163.com>
> ---
> 
> Add new chip SQ52206, the datasheet depends on
> https://us1.silergy.com/cloud/index/uniqid/676b659b4a503
> The password is fx6NEe.
> 
> Changes in v4:
> - addressed various review comments.
> - Link to v3: https://lore.kernel.org/linux-hwmon/20250117082017.688212-1-wenliang202407@163.com/
> 

Your "change logs" are equivalent to "made changes" and completely pointless.
As consequence, I'll only handle your patches if and when I have nothing else
to review since I'll have to figure out myself what you changed and if you
implemented the feedback. I don't really hve time for that, so please do not
expect that I'll apply this series anytime soon.

Guenter

> Changes in v3:
> - addressed various review comments.
> - Link to v2: https://lore.kernel.org/linux-hwmon/20250113035023.365697-1-wenliang202407@163.com/
> 
> Changes in v2:
> - Explain why sq52206 compatibility has been added to ina2xx.yaml.
> - addressed various review comments
> - Link to v1: https://lore.kernel.org/linux-hwmon/20241224063559.391061-1-wenliang202407@163.com/
> 
> Wenliang Yan (2):
>    dt-bindings:Add SQ52206 to ina2xx devicetree bindings
>    hwmon:(ina238)Add support for SQ52206
> 
>   .../devicetree/bindings/hwmon/ti,ina2xx.yaml  |   4 +
>   Documentation/hwmon/ina238.rst                |  15 ++
>   drivers/hwmon/ina238.c                        | 209 +++++++++++++++---
>   3 files changed, 195 insertions(+), 33 deletions(-)
> 

