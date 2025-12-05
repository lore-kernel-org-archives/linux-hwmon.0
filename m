Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81B8528DB49
	for <linux-hwmon@vger.kernel.org>; Fri,  5 Dec 2025 04:05:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764907530; cv=none; b=sbzjfVa2PMbhI7es/dDs3Zqrm2Q7DjM1j+oyZK1yyGMZ3NySPAHhh6J2IuT9j/w39bBoYevTB9rRhXuPVljlObAbNvsK2pk2cRsfJ5jgN1Szm7nYVXXnBiw+43b8v6SYrVOIYK9Re/Bj6V2gFYWhdN3maxHJVC8O8YDwxzo3ceo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764907530; c=relaxed/simple;
	bh=3WooEMBEIiI1ih+Z5ac3eb4jmNPd9aYs/7BCZ38Wp4M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=YeY5VBSpNvoAKxLMsKG4wFOhziLXo67u3v8B4kVsy/9vdePD1vbTBFsbXAu3Wzf80EUNQV5aCHMhZd0iMcd0/HovLnBYW4Fjg4u4HX8GxtHzhBxQt79gM0A7EJKqFac1rMWd/8ASzpiyAmaY7Lg0I/M7GvTt7JVRygK76cylUuo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cMM/WAHh; arc=none smtp.client-ip=209.85.216.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cMM/WAHh"
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-343774bd9b4so1335860a91.2
        for <linux-hwmon@vger.kernel.org>; Thu, 04 Dec 2025 20:05:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764907528; x=1765512328; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=sxtr04/CdO/nBRw6OB3UfQO+MKJp82d8nLIf3JYYCvc=;
        b=cMM/WAHhvWQXqLuVr3ZuuDIZfeLPs+UBJdlHfrYtwumxFYZgfqkgjgVOjR9ftNpPGO
         td27dsrtCtrBVG6iP2uc0WCf3EamYLIpDb/1VVwQMMJlt5evAqebiFm0VEJEaAXBUHjV
         90pXqjuxm6KK2ZvbhETE+NH5D0JDgL9enqha5g/+guPejM5Ar7lWLG8FjxBBAJGoRUKr
         jYdXl0QCUlE7MSHV+CmSbu3PQjLWsfdgD2YvlENWVQZjTbRFTMK2ipbwwacwN4/xitZy
         tc3d3lpvLixTQ/O7JTy0n6xAa++k7EzysZAGb9F6e7BJPpNRdd55LJHOUebna7CQuC6Y
         1q5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764907528; x=1765512328;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=sxtr04/CdO/nBRw6OB3UfQO+MKJp82d8nLIf3JYYCvc=;
        b=dBIAOp6U1FUSiKKwsVqkz09PX70x+7Ec+53sqZ2dmxY4CfWuQ8j379INIyGpbv2snu
         DV03lxL5A/LZspHG4m4J5WRvzIkqsqjmIWb30IrwgvahBrI2YInFUByhBt7hhcnQEjbW
         fX3iJy5uK0e11ci2eltTHnWvAJkp4302W6IbJYH6zaxs3f6c0kjuLhqgV2eatOOGthOb
         ThUfskVqrqsbXT3G2zq4NAOl3kuE0/LveKFshGSnKtd+cqCBOAalb8yaqv+CvpdoN58V
         GdVBLzeCERGlMQyTNPB6EnAoZXn/JhyUjnLOreKx7+JHz2QzWgMCPA72ngzqoqV/TX5l
         N3RQ==
X-Gm-Message-State: AOJu0YzfjudEQupTYM5JOpH0jflJk7sD6Y4eJGhZO0GFxJBzXajVXgZn
	dZn0s7KRNY7R5eFYK+WCM0PWvEIO+pe3x6q5YFfCuB7NXrMdi3uEHRtePIcmHg==
X-Gm-Gg: ASbGnctA1GAgweSLbr1So1E7aPxfJRVR66jp8elrKwONiPsr+5bvhRz65/2VTpyV62Q
	AEmRUt4xy6mqJ+tOY1ZmNL4vfYm9QvVd8zcs0Ilo5gqWsJEcJ6R+SfeiN+PVh1pF2yiBfEAv4KS
	NLi+6n/tiyZChTqaf1MVSvS03mkT5ZlqOuPqsMFW9NwypXDuH/LdLMceYk89fJr1Ld9v6W/RwFf
	78WNIdYZtn/LHol7PrlE1e3flp9t+iueZbsB6zmY3AL5LHfYp7m1TNt5uPnBEKKv/sytEiBHmBk
	2mOFQmL1engVWZoKahjceDhZbOsSKLSf+nuzZP54AE2UHKLUhHY9H1G7k9g3n8lBrZgtpiHubqh
	su+B7lJRTwxyUzL//fxg95agiC5W+/vLk/F3KFZ1qQ2itKmqrJ0uuoCnre5c5BphmjIJQJO6HMj
	PC4RCjw1pE+pBDFKgP5zQpdWQ=
X-Google-Smtp-Source: AGHT+IG8P+qAxFlCrC+ycTMdBgzsYo4fLMzcjM8+5JOcJ9ZqbS7AgsyfD/5MHZMKdum1M67KnRPivw==
X-Received: by 2002:a17:90b:4acc:b0:340:b572:3b7d with SMTP id 98e67ed59e1d1-349126c85bbmr9073573a91.19.1764907527631;
        Thu, 04 Dec 2025 20:05:27 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-bf817c3e6c3sm2391747a12.17.2025.12.04.20.05.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 20:05:27 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 4 Dec 2025 20:05:26 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Gui-Dong Han <hanguidong02@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
	baijiaju1990@gmail.com
Subject: Re: [PATCH] hwmon: submitting-patches: Explain race conditions
 caused by calculations in macros
Message-ID: <7d00f67c-298f-4fbf-9b5d-986ac4fa6d77@roeck-us.net>
References: <20251202175536.12774-1-hanguidong02@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251202175536.12774-1-hanguidong02@gmail.com>

On Wed, Dec 03, 2025 at 01:55:36AM +0800, Gui-Dong Han wrote:
> The current documentation advises against calculations in macros
> primarily to avoid code obfuscation. It misses the risk of concurrency
> issues.
> 
> Add a note explaining that macros evaluating arguments multiple times
> can lead to race conditions when accessing shared data.
> 
> Link: https://lore.kernel.org/all/CALbr=LYJ_ehtp53HXEVkSpYoub+XYSTU8Rg=o1xxMJ8=5z8B-g@mail.gmail.com/
> Signed-off-by: Gui-Dong Han <hanguidong02@gmail.com>

Applied.

Side note: this is good enough for me. I'll be happy to accept a
separate patch with a more detailed explanation.

Thanks,
Guenter

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
>  
>  * Limit the number of kernel log messages. In general, your driver should not
>    generate an error message just because a runtime operation failed. Report
