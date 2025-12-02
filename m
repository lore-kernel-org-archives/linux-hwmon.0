Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DCD2E0B5C
	for <linux-hwmon@vger.kernel.org>; Tue,  2 Dec 2025 19:43:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764704606; cv=none; b=I8U0y6uXNPGBFV6kEUob14jt/L7eQuVkuLPwXR+Z5riJti8kEwwRG6SuF17Enswied2i2Ch364ilR3lOLgpvPYovabp7siesEU798XBGS89Lzflb0BpaW4duW1+RRbzfCRuGpUUmBkwrbEwQLVyqcO4kGg1WCWx0+i77PruxvLQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764704606; c=relaxed/simple;
	bh=DN6zQC2zJCQpmeFX+9DGfMwRcP40PLDHgKbjMJM1lpA=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=RvrpcGG2w0z0WnXQ3m72H54pNfDCIzpbmqqlc8bLMA1RoGIB0y3Zx5PH82bNZKnlDDd2QAF7rbEy5dk2BRWoT+MAjdRemUJBJAlSceKMqD5Be/cOP7PcLNfnEh97QkIg0FE2QoRA6hnUudL8LRF7wLK9tKmnoMXaMsB3nGFoeuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KmXPZbtL; arc=none smtp.client-ip=209.85.128.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KmXPZbtL"
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-477a2ab455fso67392585e9.3
        for <linux-hwmon@vger.kernel.org>; Tue, 02 Dec 2025 11:43:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764704602; x=1765309402; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gDh2DV1vQxhDyXR5drpjXQ/a7fQdfze1z8e43PzP88c=;
        b=KmXPZbtLvn+o01fwEnKIP+jKG3NeUo4OGlR78wCsdiOSWRHDMSzsREQP/V1u+Bi/j4
         kuvAhKDp9lqr7Z5JBs1GG8DDKFtcRQ56+9NX+hpaRbB80hlr96r74rdID0NG4dvI5e4t
         JYs8IrAQj0wIixKYV4x/YQ1VD4B5wn8+3BSbs54KLbg0o3H7nFu+ShOpm5x2bHh5iw7k
         jhocX8RqXhyQsLq8lQatrwSJb+OxLB92UfTxIZk5+RDNq5ViARTcqg7jdRUsKM9f+yZt
         n2tUE2nqJHrL6N2Ly7SMiJqOqohxDRed2Y91YmMTVdC+msvpZLW6y3MrTRzO081w+ucM
         thbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764704602; x=1765309402;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=gDh2DV1vQxhDyXR5drpjXQ/a7fQdfze1z8e43PzP88c=;
        b=kUHI2VN2HdWLQf6EuN7nB08ufCmHwwzTx9wpatdGzCk6mub+ogh9S4Bpf//HcbVCpM
         qY63bVczh57yP+kXOdytcwuFEmRj1aN+69UwPdIxUR9tlodBymT1sLC/T2BxF6lTjyo3
         /mvKzUIbYCBAHLOosNdVTzXjN2BPKkm7/I49lQqCGSHX/Wsmi2pzLVNkjE+DVHzsDK0L
         OLCgucn4TJaqwvZMgoY9UJQHjZeo3GwE1HMdxdTPdrvGW9KkEJpBC5hA5RwLDISbkDX3
         6l9DA3TCfIAaPJ4WnhQq9r81MfTlWYxdKRr+1TioMBGeYzsUj+OFAh5JTHtyxqgiJdmy
         7Ujg==
X-Forwarded-Encrypted: i=1; AJvYcCVsQsCYJ4bUNbJUpx53PtsfoP6iscy5qAQJompql4ppsFgtYs7aeQ6of5w2zlbZl+DQuLi4gWCXbabsgg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwbN4NKN1WA21JFERXGzQAGdWKRA3nKlFfwZs4B8gCEhQPsuC+G
	WNg3gWPBqpwWcHeurZbx081NvAPyhMkWZwIGsyUPKBf9OStLhXZdb65C
X-Gm-Gg: ASbGncun+9rOiy5RmEZm5gnTwkVGi8r1VPS2/tizh+RWx9cxLIiN7xOQjVqN21TOtlN
	yYxD6JZkvLsbuKImJlL9i3lLcydA2kJEJPZCZZN1QYOP7LOa0EVSGoQXLBBGTC10VjJGYr45gc2
	uA6Vay+Npey8mFy7VyzRRZKhfiee68j4qsiGvVMFDqQu5FVyoA8gXYRYA1w621eua9hY8/DHVm6
	SpKQRm53bnelxmRS2W+XcSpv3mK8BHa3QuhDSRQLF1ldOx1h7CHfNnVB7ekvBD2Z7zdh+p94d3d
	nMizEkfjngH9SBuDaYAxZXsZAhPf5GknlcjV2jG9KgSZh9wmWB0vEXBbXLay5k+P9WqyGIpNL//
	fRu0oSFUqOaI+8zwCKH2edqgaK0GB8FqdPHOOHKXbnAaIJHnFA7swivWqQUkLD3M1Td6Dwwxr7y
	LuoxhRfcpe6nX1DGYh05J0XDSeUAEMydvn+FIaEmkRuW3DIlQRRH3T
X-Google-Smtp-Source: AGHT+IED4z5SQC2uxdBuHUP84XFImOXO0cS+0mtKiuQ7ogoVBzSwQgPWqu6NDEDQeRozD1on7+E9Lg==
X-Received: by 2002:a05:600c:314f:b0:471:131f:85b7 with SMTP id 5b1f17b1804b1-4792a48199fmr9387045e9.15.1764704602087;
        Tue, 02 Dec 2025 11:43:22 -0800 (PST)
Received: from pumpkin (82-69-66-36.dsl.in-addr.zen.co.uk. [82.69.66.36])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792a665e40sm3414595e9.16.2025.12.02.11.43.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 02 Dec 2025 11:43:21 -0800 (PST)
Date: Tue, 2 Dec 2025 19:43:17 +0000
From: David Laight <david.laight.linux@gmail.com>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: linux@roeck-us.net, linux-hwmon@vger.kernel.org,
 linux-kernel@vger.kernel.org, baijiaju1990@gmail.com
Subject: Re: [PATCH] hwmon: submitting-patches: Explain race conditions
 caused by calculations in macros
Message-ID: <20251202194317.555d0911@pumpkin>
In-Reply-To: <20251202175536.12774-1-hanguidong02@gmail.com>
References: <20251202175536.12774-1-hanguidong02@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed,  3 Dec 2025 01:55:36 +0800
Gui-Dong Han <hanguidong02@gmail.com> wrote:

> The current documentation advises against calculations in macros
> primarily to avoid code obfuscation. It misses the risk of concurrency
> issues.
> 
> Add a note explaining that macros evaluating arguments multiple times
> can lead to race conditions when accessing shared data.
> 
> Link: https://lore.kernel.org/all/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>
> ---
>  Documentation/hwmon/submitting-patches.rst | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/hwmon/submitting-patches.rst b/Documentation/hwmon/submitting-patches.rst
> index 6482c4f137dc..7f7095951750 100644
> --- a/Documentation/hwmon/submitting-patches.rst
> +++ b/Documentation/hwmon/submitting-patches.rst
> @@ -82,7 +82,10 @@ increase the chances of your change being accepted.
>  * Avoid calculations in macros and macro-generated functions. While such macros
>    may save a line or so in the source, it obfuscates the code and makes code
>    review more difficult. It may also result in code which is more complicated
> -  than necessary. Use inline functions or just regular functions instead.
> +  than necessary. Such macros may also evaluate their arguments multiple times.
> +  This leads to Time-of-Check to Time-of-Use (TOCTOU) race conditions when
> +  accessing shared data without locking, for example when calculating values in
> +  sysfs show functions. Use inline functions or just regular functions instead.

That is only half the story.
#defines are fine - provided they are written properly.
The main issue isn't TOCTOU, but just calls like foo(*arg++).
It is important that side effects of arguments only happen once.
So it is important that #defines don't evaluate their arguments more than once.
That is the real issue.

If you are reading shared data without locks there are much bigger problems
if it really matters that you get a valid value (see READ_ONCE()).

	David

>  
>  * Limit the number of kernel log messages. In general, your driver should not
>    generate an error message just because a runtime operation failed. Report

