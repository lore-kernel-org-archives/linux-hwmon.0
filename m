Received: from mail-pf1-f181.google.com (mail-pf1-f181.google.com [209.85.210.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED54526F47C
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Apr 2026 06:57:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775804253; cv=none; b=N4RHo7jRWUq4uGFDB3GplIf6DDhK/ei8ulkS4nQbzPky+zgKs9oeShuNDAeMJAgI/SZmODnmxFNMHA+iIAKXUCpRRjpbK6sRbX0NMOVvDaPg7x/ClI0kqU3Vl0IAz4EePehnizI8Eo4q0ZJFJb5D2wDgiVR8s+HATBHX+8nMEvI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775804253; c=relaxed/simple;
	bh=1SiFCGbV2kSANqcY5Ya3zhnobQ3twjAd4bDGgitmxds=;
	h=Message-ID:Date:MIME-Version:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=Lsl7gSNSlVdMvJ0VosUW1DgsHBBrH7iohpZSksStC3zB5cv36KoKMmPDuw1FXZVRpmF5dO+IoUxprlY9kZAbDUUFrYqCDeakB2fsdasp/EV5TMQhs2+au5OHgeQAo5kHS2878uXqL1TmGBUR0CxBgJ50rpb/om2s/lp8Mb3JzeU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=dtXWb/5F; arc=none smtp.client-ip=209.85.210.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="dtXWb/5F"
Received: by mail-pf1-f181.google.com with SMTP id d2e1a72fcca58-82cebbdab08so1404181b3a.2
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Apr 2026 23:57:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775804251; x=1776409051; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=BCuVyAE//c6z8z5XxMRPVpCheDMz8TJGAL7Q7eoAANg=;
        b=dtXWb/5FYsoju2w1ix12rn/1e9mRe5STs3ydtusZeCUqt8Tb3mrzgH2MO6vGjfGemu
         IEtkgFsMfSgzb6vT5wbDQjstu2ueW23miNyeH95ChVAqI9L62wvxqFQQGMVGkp1uhK0K
         N6K5EabXoY6/VSoeqhf790MDEIgxrUCZIalwchaNpRNdaNCDTC0uMPf3GRvfniVyiwSW
         71kLZsDBaC9c0k8ZcOlhspeEzQ2pAdLJHYNnCE0FQrlQZI8ozIBRMBH09MY0ifLoNYfq
         57bhp0MrPRqR7M9DKQ4zI7Lz2UqWeAmQVRKk7AN8pQN/6E0V2JbJRBvYwxtEaTxvuBOI
         QgKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775804251; x=1776409051;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc:subject
         :date:message-id:reply-to;
        bh=BCuVyAE//c6z8z5XxMRPVpCheDMz8TJGAL7Q7eoAANg=;
        b=CEMgt7PYLDJOOFohdQOnqW9jD7izR0yjFyvVeYomD5Y3CYXKFKsuQ95kJcLiU869AI
         jcGb7lLe4IrSTeQKt0uWnu+B+RFGCKDMeVlStznEygR7ekWTY1PVab/q91p2klteKcjO
         j1iagGLGqRdRkEXNiSxF+ESH0JUbN2ih0gJh4GakiFKShzTfhiaWTIQJ74tlVrwzn6cs
         JYd/G9RyWKJvO6W2vQRJd9DJsrRkRkpgvixycUBue8LsUtaSV+lSD2/OcbvOyBHolyLX
         Zjb6zP16E6jMHAe89IC8Wr631QgoCUxX6XZIgg+UfAmlkaDicJrTnqTBnMdVXDriRr1t
         iqmA==
X-Forwarded-Encrypted: i=1; AJvYcCWz06SsHuLt7s+CNWdG6oqmf0ZTX+u7KgYdCgfohmtWGnBIDDu1mAGWSTBUA8q93312foWp42Vc/oi6Ow==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw3ENspkbtOQkr45fdb0fhUfat5dTs0nWVUcHiV2vth3PjN6xAt
	yUBl33x+ic0K5xzZgEyFIS0BHr5XxxIBEIs0I+fIuS52Vq/uTUOL2ZrK
X-Gm-Gg: AeBDievHufWV+10Dm81P9rM8ZEDqktZA70d1LEhSwm6RTLnq/v4vkWynqm5ZEFWj3Ha
	QK5vGy1MYZ8kv4SRICtg8zZc4L+vJDZ//hCKUjKXqWRQhs9/1eZpp/yjgc2NdM3VjDpsiRhEcc0
	GkHH+F8g6AEnhKrQiN+nFpF8WTW7yzVOamJHT+kyDpJf3oBm62gdsQEspRnFda/WSQnfFXdTbfH
	gxE2qQm6LOPtqWAeNASPt+EIjDv20z7OYKX4Mt52++UiIX8q14BaZxzAnIPGuWFZZ6y62r5sTv8
	UewJLy2+z2y3phOSkqOdYBIlIqUSibC+lwmxZZHYaZ7dnhiYNb+Q9pkV1hvPRjzJhndpUF/xY15
	6MowWIjuP9T/A49LBu8Kam1yr2V/n6yUYXZcaYatCoU41Og8FLzHjeAALoQhUBOO1Me7h1tN3OD
	PMPNIzgosCocqjoHyRaHAerKQfyzcwxeGqmzDYYm7ZpDL5nl9T+rcmMqhLnikhMI47PO2laAMI
X-Received: by 2002:a05:6a00:278b:b0:82c:9897:70d9 with SMTP id d2e1a72fcca58-82f0c2c8dcemr2350303b3a.38.1775804251348;
        Thu, 09 Apr 2026 23:57:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f0c30ee3fsm1801229b3a.12.2026.04.09.23.57.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Apr 2026 23:57:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0a943b31-ca52-4ed7-b455-87fbb98fbc23@roeck-us.net>
Date: Thu, 9 Apr 2026 23:57:29 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 13/13] arm64: defconfig: Enable I3C and SPD5118 hwmon
To: Krzysztof Kozlowski <krzk@kernel.org>, Akhil R <akhilrajeev@nvidia.com>,
 Alexandre Belloni <alexandre.belloni@bootlin.com>,
 Frank Li <Frank.Li@nxp.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, "Rafael J . Wysocki" <rafael@kernel.org>,
 Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Eric Biggers <ebiggers@kernel.org>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,
 Wolfram Sang <wsa+renesas@sang-engineering.com>,
 Miquel Raynal <miquel.raynal@bootlin.com>, linux-i3c@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev,
 linux-hwmon@vger.kernel.org
References: <20260409105747.48158-1-akhilrajeev@nvidia.com>
 <20260409105747.48158-14-akhilrajeev@nvidia.com>
 <6fd4bb71-90c5-4fe2-a520-97167fba049f@kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <6fd4bb71-90c5-4fe2-a520-97167fba049f@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 4/9/26 23:39, Krzysztof Kozlowski wrote:
> On 09/04/2026 12:57, Akhil R wrote:
>> Add I3C subsystem support, DesignWare I3C master controller, and
>> SPD5118 hwmon sensor as modules to the defconfig and therefore
>> enable the support for SPD5118 sensor on SOCAMM found in NVIDIA
>> Vera platforms.
> 
> git grep for "Vera" gave me zero results. Are you sure this is an
> upstream platform? Please point the DTS using this.
> 

I think this is an ACPI based system, or at least that is what Google search
tells me.

Guenter

