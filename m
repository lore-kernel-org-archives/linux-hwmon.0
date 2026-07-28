Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B2A4D1096F
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 01:04:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785200662; cv=none; b=CCqzDYFRmvJyjcNk2WSFm5QtaoUZGG6ea1c4rXBrV6ZD18dW83M6Qqz7bm7pX879HPMdZobF9MNvhJRVU7gDvOGKF+Sj2w9KVpLW9ukwjxJs9P8VE4E5VMHZpG9bgZr/Bk/twCK8D9rvEHAUoI2MrM4d9srgC8NPaOrepSHGs/E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785200662; c=relaxed/simple;
	bh=unAvIVonix54UPl7eQWcz0QQA0jMIgs9KsR3Kf1o1X0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=WGaVngn6m32S9iP9vrSaTEUhi3J0XlHvlBYGRBBecUQT3C1XXOd/2tcUuqpyEU0AxYUqmKOqmezCygKBtyqPTwto+9cRVHYOr7KdX2AkKpXGluBGLIrwx8Br70bxf49/sK6EXzvzR2mv9ROIetBJuB6zg8N3llPASwjqvWVw+IY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K0wE02T/; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K0wE02T/"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2caced6038eso6759545ad.0
        for <linux-hwmon@vger.kernel.org>; Mon, 27 Jul 2026 18:04:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785200661; x=1785805461; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=nvi2/HPmrvdHj6LL2pgseMdPP3LS7NbfAQWuVOGmlpQ=;
        b=K0wE02T/gXcnJRR9INaBkNJu0FqkBfx9TkIvj3Dl2q7RpYFNgPLLZsMs2QudLlUSeS
         C95upcqBZL/Z56eIymIxCPDLvJ7l5hFNuGgwdBhd4MloCsxeI14gRGHyJ8s5nqnhxT37
         kMRBUAer/RA1gSHZ136QjmKaMCdRGHTqXuIqgGr1oWC6NIoEl2yU7efscNtXFOEAbWVJ
         TdQuYWbxhYkWt/Qd31HBJmr6Mx0qhztsUGcp/Nw3xnkSU4kW6gb35JybQT2D/d76e7Mx
         gLvlOsLtuQ4c8xpRIWogxW069vwvdD4CcnkTpPwPN9zK76ba3UjZGlwUJsCf2V7J7nVB
         izYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785200661; x=1785805461;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=nvi2/HPmrvdHj6LL2pgseMdPP3LS7NbfAQWuVOGmlpQ=;
        b=NpW3QNUNY/cJLTha9GxL99ZIV+vg07Gkr/JGQIZ2tgxJqr05fAIsIpGY/xDNjrIT5D
         /oAXsSdo6LDI3edfTUAdI7NXf53Yx8ZFqo57OPQRDCNRAW+cO/pQtw7XMVwlGw6wNbqR
         qTYJXNR7jAM5YxFV7Iycgj4djamHaBmjJugXs40IP0H8Xv1BxoH25y71wgla3fsTO5yz
         5gEMJ7LR8istXxLwl6LUCiToYkHP65uW0x+Lz7gu5bxGGOuWae0qD+9POxekptB55aV5
         R9Iwz1pKkfmZ/s8aTiOn9agFaXvRJdU6w4EmvBvN7YGwqxq9/BOYKhFniU5XL9ODjB5P
         zqFg==
X-Gm-Message-State: AOJu0Yw7Kag38t4a44mLZxDbC956qdf1gaIYHdBeWb5kYV1JPIt/dtAy
	bJnCjPVILmTKhgdQlt/wjVmkkLez2YXwFAWvAPS/BQB2/qtPABZC8A5x
X-Gm-Gg: AR+sD11VgsJjYnj+E0wZyBKZBUhpKb6KHTQJex1SflkycqcgzMOFzRBHW8rod5qU25x
	0/yvQKCjdBVTtj7vbUzKd/5sjF3CHhI3fZmfoLx0fQ4U0ci8h+shK48jLkQh/sC94VDFj8q2E9I
	/gOESIAnI3WFiAK6CLzy+a5qlvWb+trrvtT0/upDurUtpWGD7eDfDnbPG/bHY14TFs5KiXyDkpq
	GCip7Fdf46Y1iJ8zSYSoSQeGjQrAoqNcQnIGAbJ5Z/crYe0b1IRp0MMiIvIakfqX5pL/2WREcyq
	Tk2HAdulPervjdblwdz+DcNo2ucN770Iyac9CNe6OoT94mIMtOOE1Sl0xzhZYr67uRHN1qnf3Dd
	/hVBxR09XSnkArXXEEftS4inDJbuFI7fYHtatFi0I/lAxNxp87gjRCmlkbXd7m940MsxfJg4ZBX
	loRbIo3QJfo24VIn7ynr87sLEpjknUb3T8aGLxFQKN/S7LH6E5r4c=
X-Received: by 2002:a17:902:f705:b0:2ca:d4f:adab with SMTP id d9443c01a7336-2d015da633fmr1806175ad.19.1785200661006;
        Mon, 27 Jul 2026 18:04:21 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cfde7bbda1sm42454695ad.53.2026.07.27.18.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 27 Jul 2026 18:04:20 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <418c14f2-2f89-4ebb-99ed-1f7326a811a8@roeck-us.net>
Date: Mon, 27 Jul 2026 18:04:19 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [hwmon PATCH v2 0/8] hwmon: (adt7470): Multiple fixes
To: Luiz Angelo Daros de Luca <luizluca@gmail.com>,
 Chris Packham <chris.packham@alliedtelesis.co.nz>,
 Andrew Morton <akpm@linux-foundation.org>,
 "Darrick J. Wong" <djwong@us.ibm.com>,
 "Mark M. Hoffman" <mhoffman@lightlink.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org,
 sashiko-bot@kernel.org
References: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260727-adt7470_fixes-v2-0-598e38a46ba6@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/27/26 17:22, Luiz Angelo Daros de Luca wrote:
> This series fixes several issues in the adt7470 driver:
> 
> - Restore PWM configuration after I2C failures.
> - Avoid cache corruption after failed writes.
> - Prevent busy looping when auto_update_interval is zero.
> - Fix incorrect temperature alarm reporting.
> - Cache the PWM frequency and fix error propagation.
> - Correct unused PWM auto-mode mask definitions.
> - Fix TOCTOU issue when reading fan data.
> - Fix PWM auto temp state array corruption and missing bounds check in
>    sysfs read.
> 
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Thanks a lot for all the fixes. I applied the series.
Please feel free to fix more bugs in the driver if you feel like it ...

Note that Google decided (again) that my e-mails are spam, so you might not
receive this e-mail (and the others stating that I applied the patches) directly.

Guenter

