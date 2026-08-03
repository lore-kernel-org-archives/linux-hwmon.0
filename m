Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DA0B02836E
	for <linux-hwmon@vger.kernel.org>; Mon,  3 Aug 2026 23:20:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785799202; cv=none; b=KiIGJGOWFcRIkJcY8ZWzUKdxexdyJnjiAIpHLhU1ADIN1yrk8gKGorKut7Z4fWe19b8ebkmBodVs+ArTn5WO/bQv5krKgGvocnvCV2pCPx7WC8D7Xs1hfR/hRu2T/jgHHDHXWPiHJdHny4UZjjcENUa81QCawd3DVldEp8DrZIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785799202; c=relaxed/simple;
	bh=dVg9PSZoogg7zojFLnm0mJP6/UDQO47/jBVRQ8bItxI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=t09tDjRMOlUVpg/yrJPuTrrCvuJ5QUFa+XSbjtF0ydL7RahOP3Po95LoxduEWHJH67oWpCgQ5doA+631Ajmh2bUqX+wfqg36TRrdILwAYKu6uuu1QpsZSzmkGHVU7sSdWgRqODaicd4WM3aU66zb6imrWLmkIIoo9ugm8A3VCoM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=f+5C/i1H; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="f+5C/i1H"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2cc61541f8cso4824605ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Aug 2026 16:20:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785799200; x=1786404000; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=oHsdPtbG9rpTxl1x+xFJagcPaBhdZcGygM+R8BhoAcE=;
        b=f+5C/i1HHUh5t8LAdaYFEwHCrtC6w2XopTQbVcAP4k97dETOv+sWPiaKNCr1YSZnYg
         3XCGOUNFz37pTmtHWIW2FkjnAKPeMI99HrJ7M/XIJUzIo2yiAq9iyHEdlVlcw8IbiUMm
         9Apwx1AN6JIEeSNtIFvlzCk71xVJ+tq8sEl5qM4gq5KYbomoXQWO5KYtXVRUHtmD4VK6
         t4KUOyw/g0dTg1LG4I5EU9ETfFJzUzaist/5tEGRhawLOtoRlsqTqXdH7pC/Ymev94p5
         yqjOaSw60K2LYCXd5F8lkiR8CvZewrvC/pNCYuVEBU33sYYWEf3a3UdWDFxoeVr1zVKE
         M/2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785799200; x=1786404000;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=oHsdPtbG9rpTxl1x+xFJagcPaBhdZcGygM+R8BhoAcE=;
        b=LgT7s8LBJsQK2Esr84I0Fg/r0ZSNg3Iv/EXCrZM8QRqGFnQffICT4Q5IwwyHlpk3Nc
         AWadRxKZx/+sD1561duxLjLSBkhmjn7t6u/hWaAvZqOXRe/5LA0TSjZVv1FGoynGRgUq
         KkpCEKMe/lWT7WuAS0xBJhUc68Zj+OFTxOWpGuwaEj3JNPtNI4+OpypalQWCZsCUHDRd
         +8G2tZJ4q1PXimARn/STpOnkgOV+OfFQXaAimsyW7gPvinIa0hBdQKoKkNjN5/7r+ubZ
         Ekt2dhH1DAQvEKcS5flVQ5+DvopUQt/faUDJ51749SVVdwuRB7crGQL0YgritWQ4OeCf
         T1QA==
X-Gm-Message-State: AOJu0YyBTthy4hx7ZpDJALvwwuf6fc3N8qiINo3NyBU+ZmlXRvggBmds
	Zfq+CTBYBDN+5/7fbaGv90DGtkH9Ro9dMSqg2XRzTTQouOt2abFKoV6a
X-Gm-Gg: AR+sD11Q6MMe8YoWSwhToqu67iYTWJKA9draXmfQQqjEXfjaXD/VjGEuvPKPQqjsb4q
	vPgpXCx9NLEsQlCG4a4gGAlHKvQofbsP9FeEOPU9mCLYcfNKr9rI8xyzDjWSYeX5/yF5B2zUNlE
	Bz7eGOKnyZSDIDiyw2eqSz8f3QjvHv42bNzRCUN6P0nTO/w1WFxMxF4qhQdRh7kxht1Y9ZdjOFa
	MOqnXoMXEJywYp7Mp1x0QxjjHMGIy9g6EIYvPUM4od5KY0+OwtLu0NHpotOgiixLmVch0byI/+2
	3NVT07x0E2MnxlkLBpj+4hYjkWPhUg/XUV9ZMMtTVmMN+GeSGCJFynR0yxXQqZJhO6mf6eb/u6c
	KH0QOxwrZTi7ZkjWqQfFocH/1JOmGt2rO9VILr+IEtsZmtkuews27ZeSvxFt36MyyzIzk53JJzM
	bS9MglM5mT+a7f/RejGGpTYPEAUJiYxNZD4L168qJyAJLmA+mxyEsVdSOwQuVvB2boUDs0g4ZjT
	tUkKmf8dgw1bL9uOBLNIzBnn/3jPRjYgb9uOA==
X-Received: by 2002:a17:90a:c2cd:b0:38f:cab0:9aa9 with SMTP id 98e67ed59e1d1-38fecd3893bmr1274486a91.13.1785799200116;
        Mon, 03 Aug 2026 16:20:00 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3153e18e107sm47472482eec.27.2026.08.03.16.19.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 16:19:59 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <85f8ccd7-0d2a-43db-8690-cf220bd76e32@roeck-us.net>
Date: Mon, 3 Aug 2026 16:19:57 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (corsair-psu) serialize debugfs access against
 hwmon
To: Wilken Gottwalt <wilken.gottwalt@posteo.net>,
 Ali Ahmet Memis <ali@iusegentoo.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260802123653.19532-1-ali@iusegentoo.com>
 <20260802145745.6f444fc2@posteo.net>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260802145745.6f444fc2@posteo.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/2/26 05:57, Wilken Gottwalt wrote:
> On Sun,  2 Aug 2026 12:36:53 +0000
> Ali Ahmet Memis <ali@iusegentoo.com> wrote:
> 
>> corsairpsu_request() sends a rail select command and then the actual
>> read as two separate transfers, both going through the single shared
>> cmd_buffer and wait_completion in corsairpsu_usb_cmd(). The hwmon core
>> serializes its own callers, but the debugfs files call
>> corsairpsu_get_value() directly and never take that lock, so a debugfs
>> read can land between another reader's rail select and its value read.
>>
>> The result is a value from the wrong rail reported as the right one,
>> because corsairpsu_usb_cmd() only checks the command echo and both
>> transfers echo the command it expects. It can also make a caller consume
>> the reply meant for the other one, since raw_event() writes into the
>> shared buffer and completes whoever happens to be waiting.
>>
>> Locking was dropped in commit 4207069edbf0 ("hwmon: (corsair-psu) Rely
>> on subsystem locking") on the grounds that the subsystem serializes for
>> us, which holds for sysfs but not for these files. Take
>> the same lock in the debugfs paths that issue commands, using the guard
>> added in commit d1e720c7328e ("hwmon: Support guard() and scoped_guard
>> for subsystem locks"), as suggested in [1].
>>
>> The lock cannot go into corsairpsu_request() itself: the hwmon core
>> already holds it across ->read, so every sysfs read would deadlock.
>> vendor_show() and product_show() only print strings cached during probe
>> and issue no command, and corsairpsu_get_criticals() and
>> corsairpsu_check_cmd_support() run before either interface is
>> registered, so none of them need it.
>>
>> [1] https://lore.kernel.org/all/5f0406fa-9692-49f0-bcfe-c013f5fc7b62@roeck-us.net/
>>
>> Fixes: 4207069edbf0 ("hwmon: (corsair-psu) Rely on subsystem locking")
>> Signed-off-by: Ali Ahmet Memis <ali@iusegentoo.com>
>> ---
>> This is the fix Guenter asked for in the May thread, written the way he
>> suggested there. Wilken's patch used a driver private mutex around
>> corsairpsu_request(); that thread stalled and the race is still present.
>>
>> Wilken, does this cover the chained command case you were worried about?
>> As far as I can tell it does: the whole select-rail plus read sequence
>> now runs under the same lock the hwmon core takes around ->read, so a
>> debugfs reader cannot land in the middle of one. If you had a case in
>> mind that this misses, I would rather hear it than guess.
> 
> Yes, I think that is what Guenter asked me to test. There is actually a
> way to get all values from the PSU at once. You can chain together all
> the commands and everything supported should even fit into a single USB
> HID frame (64bytes). That would make everything a bit easier. Though,
> sorry that I did not go on with that. About a day after this someone put
> basically all my open source projects through an AI agent and since then
> I get bombarded with AI slop. I currently have not much energy (and fun)
> left doing my projects.
> 
> I think I will test it in the next days.
> 
Turns out I had written pretty much exactly the same patch earlier this year.
I have no idea why I did not send it out.

Anyway, I (and Sashiko) think the patch is incomplete. It does not protect
cmd_buffer when handling raw events (while executing corsairpsu_raw_event).
That is a pre-existing issue, though. Not sure if that should be fixed in a
separate patch or with this one. Thoughts ?

I'll send a separate patch to fix the sign extension and the shifting of
negative values in corsairpsu_linear11_to_int().

Thanks,
Guenter

