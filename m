Received: from mail-ot1-f47.google.com (mail-ot1-f47.google.com [209.85.210.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF0011E496
	for <linux-hwmon@vger.kernel.org>; Mon, 12 Feb 2024 16:48:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707756486; cv=none; b=spk1DJTD7tJRXwCMHm1hgTenhfTcZ+NPOKVWIRgv1Ibo56NK0vKtvnuLwtU1p2vLv5qlH3J7Vlwgrv77aPhPYex2mSN6MXm8gKAogkuafrj0qZF/Sn2kkTYS8wr+qm+bKsSX80rV4Mrn1Cw/0769ndIfx84vEN0N4Id29xtKQxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707756486; c=relaxed/simple;
	bh=lK6MdZ9McLPpswIgGEUcwQD4nxCS7HAnZtMWvvC93Pw=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=RpSF1LAJEHMwTwZhvXr4SNDp33ukLRVFX1Ome402Zj1TvipjlNGL/F/58cYZvPMuFC56L9/qwDD3jHjQhPVpXjrpC+nCBwP1tzOh7qLUK5SIZ+jIHugGFfmYG5JjOdgGZyfWlHjM/7Te9PPrwKPXMxPj2V/QYH1qyNolzcmt/NY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K6c2/C2Q; arc=none smtp.client-ip=209.85.210.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K6c2/C2Q"
Received: by mail-ot1-f47.google.com with SMTP id 46e09a7af769-6e2ebb3a1d1so391826a34.1
        for <linux-hwmon@vger.kernel.org>; Mon, 12 Feb 2024 08:48:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1707756484; x=1708361284; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date:message-id:reply-to;
        bh=vO9W+a25U5jUhF+HZvb04VhQrlKLeZOsVt6dU84gc1U=;
        b=K6c2/C2QfLhzvg2uFm+R4QmtGRF61p3RopWGbwg7VHI3lbp2hz+Ut+FbJG9lBiaf6r
         j9U8C1PLGY+WcG4kPh5XWkFn+u246pAHavAaPEqumlOVf8FI4n9w/P61oTk0BkTuR25W
         iah3r0t+Uqd1pyC+TabvBbbyGfa19KqzNiKQ4Epqzj92g14iA/iQ6xIjkGmfUamBfNX8
         GvJQQgUydgSeVL/TrFYszEKN9/W6VPMrQL32zAHRJnfoQvteqUnBkL8xDAagWyjaPVuR
         +YVIe3yO7hiYKlAG6ybXyepuQ/wLovbCt6+kLl+ZB4n0jxF1PdQzNfRM9UvVJnviSVdA
         phdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1707756484; x=1708361284;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vO9W+a25U5jUhF+HZvb04VhQrlKLeZOsVt6dU84gc1U=;
        b=l5Wy9eLJY2+eMEmAog98aic5TX0gPi6S0mIvqcngpeMoN2lfjDV9xvNWZbzjjVbKgc
         S58ASalfRv+ZCXXctM8LcL748y+2AQGEyHyXfMEiVwD5H0ZEdqfv0LgGbXoZNxNvUHxa
         uj3qmFvGfgGToIWSYoGFGCG0HzWC5OMXewMutdBSFa+zLZWhW/qzeIzCntHcdaOOZpBY
         hJZTbM10TRmME95Od3Y0GRtmTkAjRe/zYCMmWXoQW15en2M6UKvs16uh0py47FVcPNhE
         5OHFmyFquP1Hj5CWphbyXopzl4xhNrqjH+dtSeXdXtssn96+zKG0Qc16r/9Kv1d1P2jS
         2xLg==
X-Gm-Message-State: AOJu0Yw/cZ8EinUj8bfAREKfbNZZDLbwZevMR9o1CX+QWAjOUgMtTaO0
	auAFpHKmstLuFcNGoVTOsRKuDh9hu4ZKJui5X1ap3JfuG4bkDlbl5KR2O7y8
X-Google-Smtp-Source: AGHT+IF23FQ2BpHCGhb1ZPSMNxvPN8PFQJYmVgr8Y1WKS6R7x+K2njNaSVYObHfwgD0JN7OL1zxD2w==
X-Received: by 2002:a05:6358:1212:b0:176:9f24:d06b with SMTP id h18-20020a056358121200b001769f24d06bmr9078321rwi.1.1707756483781;
        Mon, 12 Feb 2024 08:48:03 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCWU5gCDrUP9ApxMOu3kMvALZZJN+JxKj3mS9cQVwMtJEtTK4mFbCOsIvelYGjlXy9HAhV62hJT96cZiEyM71GdsSJj3pvF8/MfyNHILH7NFL3kWQEBXjJqzMK+K
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id a22-20020a637f16000000b005d8e280c879sm639081pgd.84.2024.02.12.08.48.02
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 12 Feb 2024 08:48:02 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <0096a674-3d47-4cbb-b19d-447616183ce2@roeck-us.net>
Date: Mon, 12 Feb 2024 08:48:01 -0800
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (nzxt-kraken3) Remove buffer_lock
Content-Language: en-US
To: Aleksandr Mezin <mezin.alexander@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Jonas Malaco <jonas@protocubo.io>,
 Aleksa Savic <savicaleksa83@gmail.com>
References: <20240212141311.110808-1-mezin.alexander@gmail.com>
 <b553e1f1-0e2f-4b1d-b501-7554bf86d0c7@roeck-us.net>
 <CADnvcfJhwszPE0EiP8cv6-QTzE+y6wJ89YqExz6wX=93=-QfVQ@mail.gmail.com>
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <CADnvcfJhwszPE0EiP8cv6-QTzE+y6wJ89YqExz6wX=93=-QfVQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 2/12/24 07:50, Aleksandr Mezin wrote:
> On Mon, Feb 12, 2024 at 5:13 PM Guenter Roeck <linux@roeck-us.net> wrote:
>>
>> On 2/12/24 06:12, Aleksandr Mezin wrote:
>>> Instead of pre-allocating a buffer and synchronizing the access to it,
>>> simply allocate memory when needed.
>>>
>>> Fewer synchronization primitives, fewer lines of code.
>>>
>>
>> Trading that for runtime overhead and an additional failure point ?
> 
> Because it's a USB device, hid_hw_output_report() calls
> usbhid_output_report() -> usb_interrupt_msg() -> usb_bulk_msg() ->
> usb_alloc_urb() -> kmalloc(). So there's already the same failure
> point, and the overhead is already there, no?
> 
> Honestly, I didn't think too much about performance - because I expect
> such devices to send and receive not more than 10 reports per second.
> 
> I don't insist on this change, I just want to understand when to
> prefer simplicity vs potential performance.
> 

We'll have to agree to disagree that we have a different understanding
of "simplicity".

Guenter

