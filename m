Received: from mail-pj1-f45.google.com (mail-pj1-f45.google.com [209.85.216.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F11523F86EF
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Aug 2026 02:54:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.45
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785812093; cv=none; b=VptQo+sgJ2mxl/8+JOkCTVjLOurEakJLCg0NcnXv0qubb026b8V9wmWJ5Z4YTso0D1E9wlRGSMzM+vHaQu8/mVIfyJI6O/7O4Dk66KSmD7re1YRAxaY22hBw/paH8a9x6Iu7UFsOkxPrA/6HZcGnEuI7oU/sWDcvQj2Q0Hy4S2o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785812093; c=relaxed/simple;
	bh=XA2V3QT8Z5BO7L3SgsW17K/FUvA0eHiq/rOOyPOvAXw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Sscx9OhlVzSqWo/zbZdvZgr5uRULBNhpSnusrfvW2/69yUJsq+d18ygigj3tjDqXKZfnBa2TMD82mqCag11K4NUF7qGYNjw1huVsGkcPXVbG3DG8VSU+xORcSOYDjXa5h1zXBzThg0fxbPsoczQmflUjQUeItE8CeenyKUn41mo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=q6/CPeZB; arc=none smtp.client-ip=209.85.216.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="q6/CPeZB"
Received: by mail-pj1-f45.google.com with SMTP id 98e67ed59e1d1-38deea72eebso3890578a91.1
        for <linux-hwmon@vger.kernel.org>; Mon, 03 Aug 2026 19:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785812091; x=1786416891; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YtGQyZEVAcdT9jol8u/AdmzlC0FV2PMqslV4RfkVW3c=;
        b=q6/CPeZBbOpfc+r3F57ruDKVzhgK7UU/HW6IDt5W2i6wY18bN1txHdJ+JFsnIKF6MX
         BzCozP/iQsY7J+aqO64BAzk8RSF/ww7wzXwaV6pY9tl3eqdGNvFtXXo2dNChPCHY3pmH
         YsfOjVP9BN9QoM+0eT8mFQ1vSfl9pyknxz52ctcKQE1X1PhZVNvyP/xkbxEWLc4Q3HPL
         9FMMaVc9m1+MtcGSR/co6SYb1wxrrI3MBaStzetM8m145hTXwMo/oJTh7KLURa1aVVmk
         RVYwjqimx6V1gMuytChZGaimfWWmPBdcs1NsHYYa4qzhJrHu7boNb5csVxzrVp1Jmqik
         6HAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785812091; x=1786416891;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YtGQyZEVAcdT9jol8u/AdmzlC0FV2PMqslV4RfkVW3c=;
        b=dgc41GeZhfY9Kj7YETwbEMKVXpA1lbEYGgFy3PtN4kqvVCCPF7y4DrJWHxVuIsFg1g
         0n6r0I7EDUqvxg4O7nvCffJuGaDgxFXC3ta7C+Yws/EjtbVeSiWIhjUXdfETTwsUvsYK
         Ky+OSOjtk5QmuUVRpXrwTDn+OiKUqc+UCH5/aiEVWNcCRSb0K4SemhTk2ayEN5EuHxxK
         3yFS8eZz+S9wgX1h8PHQscvsm0QMIDx9IwsshV00AQNphCQauZKcvnJ+K033cIFInU9v
         qQRLHgAJsIRyIA3yhaiqgEV/CW9rAotbQmGdhT038eAQa+cLnjLJ9839nDnZuAQXLFbb
         j1Lg==
X-Gm-Message-State: AOJu0YxnQ2aaTaiwDcKIS5BxDjLA64fHl72VvtqQ90dYW18yRXGj/OwG
	LkX72fIGybvtkU8eu0ptGsKGGq3sYYy7qX1ll6aRHmZyr0T7pwckTTAJ
X-Gm-Gg: AR+sD128B86Jv9VlGErJDUXQ85cVrF8ifiozpKxGj119k931a07FZVhcBRomgztZRC9
	UpAdrCUElt61ejtk2ao0l1yLMtiqOW33/gLTTv/nw6XEgwPvySFTHQRiMWJNhFe6gQbNb0x09F/
	3jJ0bthvZPBU8TWvjsizQj+qV1/xEHfuhFHhkPewpvcozwwyPUuWFtCCfooJvWKDX3K0is0wKxp
	Q7WUR/lI9TBpYmEF6cvOQS3p8VBH4oLYVGafpjGpxUsIA9Bz+hSu5GDgEOd9Duzt1XchzwYb4Ma
	fFDD6TSAWTEo9LuTrrsnDXd+9tz8yJGnaWEwoRzJxqD8HpZYiPMMOKMVpv49LnsbOSvonip6SKu
	uoAhRD+kqsV2kxeiVIZbxgIu8oh9V8ZSuyeQfNdj3uwoxz8TfDiXWRVVRmgKliPmzbp9cyyfnfL
	nqsYbdpSeSn8Bik4Ki+RfAputsYWhKGD7BThpU2VJyzi8ts3c/etDX7X+J12oHIp2M9l/fOgsDj
	pJtcSf+kxKzZFqiOzpFscgwqS+R1d8V975Cww==
X-Received: by 2002:a17:90b:584e:b0:38e:76f8:fcbe with SMTP id 98e67ed59e1d1-38fbc561b48mr11261366a91.29.1785812091309;
        Mon, 03 Aug 2026 19:54:51 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-13fab4e44bcsm51814164c88.12.2026.08.03.19.54.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 03 Aug 2026 19:54:50 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <ec30f5bb-48bc-485a-a7a6-953af65a66f5@roeck-us.net>
Date: Mon, 3 Aug 2026 19:54:49 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (corsair-psu) serialize debugfs access against
 hwmon
To: Ali Ahmet Memis <ali@iusegentoo.com>,
 Wilken Gottwalt <wilken.gottwalt@posteo.net>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260802123653.19532-1-ali@iusegentoo.com>
 <20260802145745.6f444fc2@posteo.net>
 <85f8ccd7-0d2a-43db-8690-cf220bd76e32@roeck-us.net>
 <20260804001347.164873-1-ali@iusegentoo.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260804001347.164873-1-ali@iusegentoo.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/3/26 16:56, Ali Ahmet Memis wrote:
> On Mon, 3 Aug 2026 16:19:57 -0700 Guenter Roeck wrote:
>> Anyway, I (and Sashiko) think the patch is incomplete. It does not protect
>> cmd_buffer when handling raw events (while executing corsairpsu_raw_event).
>> That is a pre-existing issue, though. Not sure if that should be fixed in a
>> separate patch or with this one. Thoughts ?
> 
> Separate, I think, and not really by choice: it cannot use the same lock.
> corsairpsu_raw_event() is reached from the URB completion handler,
> hid_irq_in() -> hid_safe_input_report() -> hdrv->raw_event(), and
> Documentation/driver-api/usb/URB.rst is blunt about that path ("NEVER SLEEP
> IN A COMPLETION HANDLER"). So whatever protects cmd_buffer there cannot be
> the hwmon mutex this patch relies on, and has to be its own mechanism rather
> than an extension of this one.
> 
> The window I see is the timeout. corsairpsu_usb_cmd() gives up with
> -ETIMEDOUT, but the device can still deliver that reply afterwards. The next
> command calls reinit_completion(), which makes completion_done() false again,
> so the guard at the top of raw_event no longer rejects the late reply: it
> memcpys into cmd_buffer and completes the new waiter with the previous
> command's data. The echo check only catches that when the two commands
> differ. For two reads of the same command on different rails it does not,
> which is the same wrong-rail symptom this patch is about, reached the other
> way round.
> 
> The two also blame differently, for whatever that is worth: this patch is
> 4207069edbf0, while the raw_event side goes back to d115b51e0e56 ("hwmon:
> add Corsair PSU HID controller driver").
> 
> Nobody has written the raw_event one as far as I know, so tell me which way
> you want it: I can send it, or leave it to you. Same for this patch, if you
> would rather use the version you already had sitting around.
> 

For this patch, I'd rather take yours. I am inclined to take it as-is even
if Wilken doesn't have time to test it. After all, it won't make the situation
worse. Wilken, WDYT ?

Gemini tells me that fixing the raw event problem will require a spinlock to
protect the completion and a separate receive buffer. No idea if it is correct,
but other drivers do the same, so it may have a point. Either case, this is a
bit too much to do without hardware to test, and I'd rather prefer to leave this
up to Wilken.

Thanks,
Guenter

