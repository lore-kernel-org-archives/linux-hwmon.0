Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 695F53783C3
	for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 16:02:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787932953; cv=none; b=EkSgmzhz1+rDJausM+rSnfYHDDwNT/DnEeqfYg3/KQ1AwGYli/onQ6Aui2C5uhioWEFc1MgMX8K44SdGkQ/nOWmGvFxuoBhgTwSunK1koX5glQ3GwgMMrnBh4kwv6h0mR4x8XBDls9fuXcrIDA29xGvkXMIMLbCiHZiuh21BNLg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787932953; c=relaxed/simple;
	bh=8qNLw56B9TLSQptSGJHh3rd1tE5g1AfjbOjTAkxyS4Y=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Ou6KBTX+CQ3vjAmAbQRdsLu79drob01LypJSnePRQyD17v5gWwGgarUtrH6M8Az+S+KEp4O/nH9cdxJ9Snfl0UBjqn7MMqEXvmxHhWJ0xmRjvD5kWfUHgUfVDV1FH8M+ZlARHMmZH6HOsEMyAXOKuIb0I3bqeaSgf7mNgOTHCaI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=WkmEmDqf; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="WkmEmDqf"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-cbe6295f05bso1820999a12.1
        for <linux-hwmon@vger.kernel.org>; Fri, 28 Aug 2026 09:02:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787932952; x=1788537752; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2AFRIUFJKCO3T6nN8VW+Ys+Hp+I2sL0vNH/Psf88O/M=;
        b=WkmEmDqfrrWf3MLYSU7s/hlpIInLnyCW7RRytHfa5WLexsvbRjGuGbUht8Eqvd7PXs
         TeKfJGxbGdaeRY8WH3KWxwYTqnhyi8ZZ/Fj+EBOtwHdY88M87NmsHt9djLfi/Lwnps1p
         GG8ImKlwDe4puPh6KodxSj5iJIoST/VFeUu+38Q7jrhgE+ZgBQmfULysq4d5AaHLKWfC
         tm63EOBWR8AMePKKvyGKqueWjBheOY07pMXCcYITykZpg1qQeN8kvveuTz/iAaMqssEL
         upHSiqQyP7SbvWb9lAIc737W1anwxK2QQqfBdAqryfL7Wf0zpTIdjtsMs6oi+5jk5hqf
         pmrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787932952; x=1788537752;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=2AFRIUFJKCO3T6nN8VW+Ys+Hp+I2sL0vNH/Psf88O/M=;
        b=Ne9ozLWeTENoMe667TByCMGwBOgM9g1O9+LMIIgp3dSkF/XbATchySO7Ey97jpvx+n
         bLInVQ3cO8nnbSQdMkrSDjRolMLvIlemZO9f6a8+GHcFP44d2sgXQI8vc7Mmfzxz9ZqP
         MnMFXUCC7nf+Amh2c0xrD6ubkMJYYPh25DfmIHSpuenUJQjP9+iupCAE8rJ2epnsfFPr
         wmVWFg2o/IL5INNvOnvZX2FZ52bCqioG8gEX4I0DDvTUGSIiH8Zdm86IFF8fkH1Pu66e
         2uhKUAP+tgrMwC4CPc7iwPOvuad6bIoSglH7OY++zjjzhvg0c88wLX3i2BebFoTP2OrK
         nuhQ==
X-Gm-Message-State: AFuF++nOgkb+9EZevtDItXQpUoObM5DqXK6DWRLOn0fVJazoaB7MS484
	jKqhzrVHwEed5Us8mM95E4MXK/xfz19OnbjYaX3qbeQR6/dlpIGE6h43jpzPMQ==
X-Gm-Gg: AR+sD113LrmmWo89kB4z86ACKQCL85oKHK1deDYlad/XZgEoyAPQnG0uQX5WSsR44qi
	+dGBafGqCn0kxL7AC0XSega0zoHWG7JvXh475JK5T90DiDmaxN1pfPnWEZKlV7H9DzWqRoGFxS2
	WZXr7Ik8DcH2M4+IyWgg6WZPb+5qzLL250ZsUDT+KX9vY/fpVJVCu1C7DdEx8UkJu3mGEhQXIHe
	3ZKwblmGKGAxmF824vjJyeymujz/Kq85CGqAGLftc6LPzjNuCMvN5/gNlY9Whg5R/Y+Ko6sl8op
	Oh8wOgFEj+0hcZ/mpCGw7N1rWksZV5QyrjYnl5KvRHzCcNbzddIa1LFshjjB+vaLG9V4ozynNwr
	L6U0oqRi1bnlO0VSXt6QVL1KfGw7vCf7XY2vbenixcmNjvW4zQLlxcPSt1AROKmkDQ8BujRe3Og
	58b0/++Iug7hlrC4HZWYTmhXuk6uGl2LtHMZGtJvrSPmq2GsDFzCw0WylSk16vFVadOc1q1lYoh
	ET4Nyrbc8VTyOCz8GI48CuOZOSjPu6Nb7ic3f8GkvlpficG
X-Received: by 2002:a17:90b:37d0:b0:385:3ab:fecb with SMTP id 98e67ed59e1d1-3989b565671mr1045102a91.4.1787932951484;
        Fri, 28 Aug 2026 09:02:31 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-396dda36ed6sm3116562a91.2.2026.08.28.09.02.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Aug 2026 09:02:30 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <4da32bd6-5b54-4765-b5ad-82bac2bbaaa2@roeck-us.net>
Date: Fri, 28 Aug 2026 09:02:29 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 0/1] hwmon: Add Minisforum UM780 XTX EC monitoring and
 fan control
To: =?UTF-8?Q?Sebasti=C3=A1n_Peyrott?= <speyrott@gmail.com>
Cc: linux-hwmon@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260825184107.355980-1-speyrott@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260825184107.355980-1-speyrott@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 8/25/26 11:41, Sebastián Peyrott wrote:
> Add a DMI-gated hwmon driver for both fans on the Minisforum UM780 XTX. The
> EC is an ITE IT5571E, but its register layout and OEM commands are defined
> by machine-specific firmware, so the driver only binds to the exact board
> revision and BIOS version on which it was tested.
> 
> The driver exposes both fan-control temperatures and tachometers, two OEM
> automatic CPU fan profiles, and two writable system-fan transition
> temperatures. It preserves settings selected through its interface across
> s2idle.
> 
> Tested on the target system with concurrent RPM reads, OEM profile changes,
> system-fan threshold changes, unload/reload stress, and s2idle resume. The
> settings were correct from the first userspace sample after resume and
> remained stable for 15 seconds.
> 
> OpenAI Codex assisted with reverse-engineering review, code editing, test
> orchestration, and patch and email preparation across a long interactive
> session. I reviewed every change, ran the live tests on the target
> hardware, and take responsibility for the submission.
> 
> Link: https://lore.kernel.org/r/20260818181345.203295-1-speyrott@gmail.com
> 
> Sebastián Peyrott (1):
>    hwmon: Add Minisforum UM780 XTX EC monitoring and fan control
> 

Note: For a single patch, an introduction patch is unnecessary and just adds
work for the maintainer.

Guenter

> ---
> Changes in v3:
> - return -EIO after bounded RPM coherence retries and -ENODATA for an
>    unknown CPU profile;
> - seed saved settings at probe, update them only after successful hwmon
>    writes, and restore them at resume without reading the EC at suspend;
> - clarify saved-state naming, live threshold validation, and resume
>    documentation.
> 
>   Documentation/hwmon/index.rst               |   1 +
>   Documentation/hwmon/minisforum-um780xtx.rst |  68 +++
>   MAINTAINERS                                 |   7 +
>   drivers/hwmon/Kconfig                       |  16 +
>   drivers/hwmon/Makefile                      |   1 +
>   drivers/hwmon/minisforum-um780xtx.c         | 501 ++++++++++++++++++++
>   6 files changed, 594 insertions(+)
>   create mode 100644 Documentation/hwmon/minisforum-um780xtx.rst
>   create mode 100644 drivers/hwmon/minisforum-um780xtx.c
> 
> 
> base-commit: 75f2c0b3690702c90863c2e138cb5520670845ea

