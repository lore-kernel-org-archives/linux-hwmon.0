Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A899346FAE
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 03:35:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785209757; cv=none; b=rhUvfW+FFcELUFxsBmY3HYhUbwaVU35dVtiCvQ/it1nypo5HmvjnWiMp/HM9+MFvvqE1XkcFL8JefNRVN5mGp8gb2/4EMPTu53c1wpcX6JfZWNJdlOWk0C9mt1Oq7QfpYPbkuj8hxRPYpG0xb2eG8lU94LICJOaVQ1M6YG6SGCQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785209757; c=relaxed/simple;
	bh=ReJga2tkoxNvNFuojJfVPGp5HOU9DGKi/b7ILQO0rZg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=c105xwKQReD9QTe0rPXQVwu0N0zp/OYFFymVBV9n0DG4NXCc5f0w1QiRZi2N8o8ijMvQoUNftAn0KmpQyKyHb/NQpMljBjgw5vgiOZ4qMkzVVs43eQuUcRLW/J6Vobb1FGknIa8+2bCe8f2RI8RLgjiI++qhuYoRxCaMJufqoS8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iXf/xyuK; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iXf/xyuK"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-c999f162c9aso2496014a12.3
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 20:35:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785209756; x=1785814556; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2oa5fJLbDt6T+hmIgfbXS/XlThyKlC6TSzK93hXh9FA=;
        b=iXf/xyuKwfEVWMUGBYLaeYWgPsDE3leibBPvUmwRbhw8FU4uY30uMsw4Uprmy7V+Z5
         ES/+EuLeRHdq8WKW9c8PxDM2DY6ehLyC4Q08uCgHfMmkm+hqbkWk5HdRJU1tW2kZIwUk
         hxPAYJ8ZEXKJuhsubCF80jY/JyxYydQmwNbgV98eKZ0nPdlsD9ibUVlDyT+cq3V9qDyT
         gma6MZeWJgpHOv0YIlDxbr7aaxgUcXY3O4Q334s/uQm957Fb5nlbaYfSMxw9MkuAMcPD
         1+H55yhOK/xYhCphxS2v4d+ThsvBK7whi4upPapCIgeJKjfaRffEIZZBaL2D394n9JK0
         UDUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785209756; x=1785814556;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2oa5fJLbDt6T+hmIgfbXS/XlThyKlC6TSzK93hXh9FA=;
        b=eUlX5eDD0cNqNi7syKaIWfVnL//UNNSX8/1NH6OVLB8KAq1NyjxgUladooJ8Qy30zR
         V9VvNNkWNMSFMiNig1CffzWiglmpQQIPQjlzg7dF2dcYzqFlLY/fS1/r44mjYej8PlNZ
         PnXcT/vsgxImcTZPWEl3R+BtDSN4q8n8aBFJXQXimGs4yG8T/bBYa2uVn/0L7fZwTqZW
         qtXldcl1c0b6sLxxy95Aq6qGppMX6kB7Be4Cf57qQ/xGTrB0+W5L4GCV2VSgffw0f5j+
         XF97kmDxw6GTFP/+Yx4vYrIoHaultaYIkY4SWfBRZmJzA7qZAA/kDlul9VKfWErs4pXx
         sGCg==
X-Forwarded-Encrypted: i=1; AHgh+RqGxzqRVWwcIG/lX82AfmO/+nMi/g5KehxuNrgfs7yCk+q82O1XLp0O7+VKtQyXdyderKBTZvI+ZFPMyQ==@vger.kernel.org
X-Gm-Message-State: AOJu0Ywq7cRjU4ZckluyJXAA99dbq4uI5q9WzI+vv3seQm+zgJbm/dRY
	GBUSqJBkBs4lPrZtZIJYElD7E3jrKJ0RMV/NSKduIeGuwL9RHavOo5cd
X-Gm-Gg: AR+sD10lH2VGj2kvyshRLo0igGneqS50asqcI/rFMKc/BeuLPo7jmXCsv6uaLrTMUp7
	JlVgNaEPq0iJWqGShjVn5BBcWYj4g/zApLcPHYD7N/5zwvQotqngaGf+h9YsqAWAAk/hx8Cb+J4
	hgbq3eVfrb7dpoeNP4qL2G7CvYUuQVnLVgEFArbSUKOZI1iRA6lXP+XaAwWMmy1xG5cXrWgFqdG
	kOhSaR69Bi2CSAeLc7ZG/s3AntzTd4jxNFIo4RstwsNfoxkiBGvk1GDT/N2EisyrTVadcdQgGU0
	vquH+TQbezbmvb732JunqKLFyknZ5p6N60Ode0AR8r1qTgVXlxqo9r+M4fd1o0eD3FHntsBFJt+
	V0zpwiR9qQ2sF/Yjyf7AuGEWZe8x/pPeXL6DzIqGiVQwQ3nWgqXEElEs50M2fZNZKiT16DBRZb6
	3AzxoQxBIAJe6sNLKpYRKlGITB1UmRSAt3dmZK5nU2/NkYfofihQI=
X-Received: by 2002:a05:6a21:7489:b0:3bf:b182:94e with SMTP id adf61e73a8af0-3c8aaf8058cmr865433637.5.1785209755849;
        Mon, 27 Jul 2026 20:35:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-314bc59e9fesm34284982eec.27.2026.07.27.20.35.54
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 20:35:55 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d9031acd-0a46-42f0-a571-c0c688873d41@roeck-us.net>
Date: Mon, 27 Jul 2026 20:35:53 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [hwmon PATCH v2 0/8] hwmon: (adt7470): Multiple fixes
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Cc: Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Darrick J. Wong" <djwong@us.ibm.com>,
 "Mark M. Hoffman" <mhoffman@lightlink.com>, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, sashiko-bot@kernel.org
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
 <418c14f2-2f89-4ebb-99ed-1f7326a811a8@roeck-us.net>
 <CAJq09z7ZPe668c0wh+0Y4yGPdrCccZNuqJ8Gf8WATK16SGen_g@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CAJq09z7ZPe668c0wh+0Y4yGPdrCccZNuqJ8Gf8WATK16SGen_g@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/27/26 18:08, Luiz Angelo Daros de Luca wrote:
>> On 7/27/26 17:22, Luiz Angelo Daros de Luca wrote:
>>> This series fixes several issues in the adt7470 driver:
>>>
>>> - Restore PWM configuration after I2C failures.
>>> - Avoid cache corruption after failed writes.
>>> - Prevent busy looping when auto_update_interval is zero.
>>> - Fix incorrect temperature alarm reporting.
>>> - Cache the PWM frequency and fix error propagation.
>>> - Correct unused PWM auto-mode mask definitions.
>>> - Fix TOCTOU issue when reading fan data.
>>> - Fix PWM auto temp state array corruption and missing bounds check in
>>>     sysfs read.
>>>
>>> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>
>>
>> Thanks a lot for all the fixes. I applied the series.
>> Please feel free to fix more bugs in the driver if you feel like it ...
> 
> Thanks Guenter,
> 
>> Note that Google decided (again) that my e-mails are spam, so you might not
>> receive this e-mail (and the others stating that I applied the patches) directly.
> 
> I'm safe. I created a filter to mark all messages to me that mention
> @vger.kernel.org as non-spam.
> 


That doesn't help. My e-mails are not just marked as spam. Gmail often
refuses to send them out, claiming that they are spam.

Guenter

