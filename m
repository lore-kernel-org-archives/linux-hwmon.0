Received: from mail-pg1-f169.google.com (mail-pg1-f169.google.com [209.85.215.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1B8F2EF653
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Aug 2026 01:19:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786324750; cv=none; b=FWzuGBjkYKzwjaTIK04XuFEvd0xunq7/SIyjkpBP5kHxn6EGMjkmT/eOVgVlTxMdK2Z2ifFH8O6y/7vd9WcVAAmyaXy0dDiJ1TFIGj18215tUkU0o14dsODr2YZxXM3NmJONahoJZVeb2zmRSdlLca5U2FJnJSiYjxEfyDu6UBA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786324750; c=relaxed/simple;
	bh=jgvdSKIw08xjc1SWcQSwaBGJjwuq0Fe03Kq7rHGQ9ik=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CL7pqR0c6O+VnzuuQhmpt3hoiq4iDtQTrxwjSZVVa9OGxs2lH/ilBo7IBSSGDfThc/xJrgLxz7LxToXUwCSMtYfFC9Lg6hALPRMPUcfN3k6gm/MhMuRgLUDPjJsnnJIlPvsPqvwn4Fvp1O3l/hbnNoRWQVTn9XRZNUOTJzfMCNA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HBOOGU5w; arc=none smtp.client-ip=209.85.215.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HBOOGU5w"
Received: by mail-pg1-f169.google.com with SMTP id 41be03b00d2f7-c9c26a5fb98so787171a12.0
        for <linux-hwmon@vger.kernel.org>; Sun, 09 Aug 2026 18:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786324748; x=1786929548; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=y7Bn7LdTvq3fwGsmnwdniSYse67M3XtYTf4AioSQkhA=;
        b=HBOOGU5wVPY3N6FNOR9LvBwyThgJpjeqkUBJYin6aKYgwFu/zk0XNWavAMzX9r47cq
         gpoTB3fBgrlO54itEAGsiFd51kerHcFgTbzaDWtHPJnw1KLBGZ490g1B8NHH9xYtX/uC
         XiPpLOYWZTYlLY0DmuUxrLzOW38EO6SmId132ie/WlQLvw8O9cFRA+YUohQM4cczwHe5
         TZVXKI7UDs0Qvwu/S1S+Je66pWpIBhKcH+ubUSoyXnxiWWWWd1K5o2lHluR65t2pUj1Q
         14Jub5dCCsBNrhv+awQciLsIdbOwxpXNUzLRtraM9XLWuf7OVe27nViAO7o3E0CnMQGv
         AFrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786324748; x=1786929548;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=y7Bn7LdTvq3fwGsmnwdniSYse67M3XtYTf4AioSQkhA=;
        b=Jg+Qfva/847WbigE1s0sZvDunBlBR6lZDODJWglMCy1f/QFXGp87i5bYvXT79A3F67
         wIYpgWmN0BwWiTZhOsxfstEGIfZKohhX46YqlaxkHZwmz8wHgAs23QQIzLOSRYBgv7Zx
         1C+aZ0kG1d3iwOsPSfTho0iQpTdab6ILcc3eF2WISVBKeEZSOzZbkuqCMNYAthhJ7c2f
         l3JgXSNiO1lUfu3rUukaPMvYP9BDlkLoMHBl/gQXdKiYuG7wCNoS4K1GFtkwGq+bCSCM
         EydZuCpqb9Ga15PNTKjwjpVzEwH73iL+++Y7w4Rl0XJc6888LxH4pvT07sjnH0Yao1e/
         n1fA==
X-Gm-Message-State: AOJu0YxrE73nyFBCwRJLSjL8WewzKjQN6pqTx3m4CDM9A5GZEOooXkTj
	cs5U5mVRa1BaeWDt1gRiow+Mdl0STglp1UIAPw1Q5PapJe3F4PYAtlNY+PoxdQ==
X-Gm-Gg: AR+sD114/ROyxtevhucpRL1nlkV24OQrdQKPHXAMVROZCYUNw/3zo4qA4vnOqArlGxV
	MViPQ0zDwDHyVx7tZIr03yjk9W3PpyjTNmX0l7LyPNnvyplddzAC8NhRVN6vgxFd4u58bKAcb7Z
	uhXHA10x/cQzI96Lqy5wugI16jTDwPpDjeuoapMCweD2hX6dAL8MlaNUgwbNsa/v3usw2eTZ3oq
	Tp9sHXZ2oSteW73Hp4Ys5ASjJpX7LcYzY87eBwgDE7sEKYnCIsDaXMAvAj3GTH6uk1QW5NYaM/d
	rYs+/sDSiNcgoGGgqtVXzYXo2872vhlFsG24qLMvbHMTP5rBJDRjE+CKdakjS4IeRHg4HPNS7Tq
	7p4n0M1vKBvM5VmW39mNK4vaG7apr8vncVH0eM7ahzcFCxzCZ4fbyFMVVZ6yU1oMrV9t/RbIOzL
	uLSfz0iY4tOMr+xRW+j62fmw6sKp8gB54JZXhZLDyi/uv9z+yokUVwAp//QzKyulhd7XvWkUdH+
	1pfcnjXVZg2pPEV4PxIKNDnfeLli0vMhvetHw==
X-Received: by 2002:a05:6a20:da17:b0:3ba:d7b0:fcac with SMTP id adf61e73a8af0-3cbd388aa24mr16817145637.5.1786324747820;
        Sun, 09 Aug 2026 18:19:07 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-315bec26a5dsm35879582eec.26.2026.08.09.18.19.06
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 18:19:06 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <d54a5f1f-b369-43d7-906b-43bf6189cb42@roeck-us.net>
Date: Sun, 9 Aug 2026 18:19:05 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: (asus_rog_ryujin) Add per-device configuration
To: Arimil <renari@arimil.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260807000107.1786892-1-renari@arimil.com>
 <20260807000107.1786892-2-renari@arimil.com>
 <20260807001412.B61901F000E9@smtp.kernel.org>
 <5a817284-a9f4-48b2-9f0f-802c5dc6963c@roeck-us.net>
 <CADBHdQ3x4bFe518q2PjZvGJ2=qP45+5Cmm8f99J9gRZCJun0aQ@mail.gmail.com>
 <d7bdb634-6fce-4bfe-a24f-864d20e46d92@roeck-us.net>
 <CADBHdQ3LhfunbnwCE2AYmWr5XwqSvJ8WGkQFW1G=GQv4dp=Ndw@mail.gmail.com>
 <28fd27da-ced5-4c2d-bbb8-0eda383bf767@roeck-us.net>
 <CADBHdQ1z5pp6FjdensAVYTEbJ+DqU55uP33LvFVCMh6cpQo9kg@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CADBHdQ1z5pp6FjdensAVYTEbJ+DqU55uP33LvFVCMh6cpQo9kg@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/9/26 18:08, Arimil wrote:
> This patch has already been submitted there for months, I'm now
> submitting this to be included in the kernel so it doesn't have to be
> compiled in via dkms. The patch I was talking about when saying I
> would create a new series was the null check asked by the bot.
> 

Please stop top-posting. Then why do you even mention the downstream driver ?
Its existence and/or status is completely irrelevant for the upstream kernel.

Guenter

> On Sun, Aug 9, 2026 at 6:54 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 8/9/26 15:03, Arimil wrote:
>>> The github mirror that hosts the same code here:
>>> https://github.com/aleksamagicka/asus_rog_ryujin-hwmon
>>>
>>
>> Sorry, you lost me. Why did you submit a patch series for inclusion
>> into the upstream Linux kernel if you want it to be applied to some
>> downstream driver on github ?
>>
>> Either case, sure, go ahead, and feel free to discuss with the maintainer
>> of that driver if and when to submit the patches for inclusion into the
>> upstream Linux kernel. Going forward, please do not submit patches for
>> inclusion into the upstream Linux kernel if that is not what you want.
>>
>> Thanks,
>> Guenter
>>

