Received: from mail-pl1-f179.google.com (mail-pl1-f179.google.com [209.85.214.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBFB249C4CA
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 18:28:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788287289; cv=none; b=RuVkVvwhjk1HDfTWHSR34HBYIsciJALXG95ct8FWlI+z3fZmkNuNTjnz4/lVvNL6P5sBMKQilEB0+Re53/8WQA0CLE+DDpEf9vh34MUIuZ9IMl/NOZeqLJ5NbIMxP58vsWP1H3GLcUuneVZS7dpUc4/vfOpkb6Ov3l4TAqHx2/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788287289; c=relaxed/simple;
	bh=eIv7sXQfukA3E9bNuBLSBpsgJZfia3N6dlr3sw++rMI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=U7bwr9rfSdrzFJ6dDQQEBYgxy/mzeo8YHVHv0jOzfhmKIIB2f5R7j3Mutm0EofyxjwjFMLTMgoNQJaPf7v78UsDfmlK92D3wUvujD4tT8CXTig9R+3+NFQZD3VzddK/ZA3aPGI47kv3sGY2CvGXdJYW2zi6HPI+Zblq/Efnl718=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jSyooizy; arc=none smtp.client-ip=209.85.214.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jSyooizy"
Received: by mail-pl1-f179.google.com with SMTP id d9443c01a7336-2d53197d8b5so908955ad.3
        for <linux-hwmon@vger.kernel.org>; Tue, 01 Sep 2026 11:28:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788287285; x=1788892085; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ou33Ickh4Vn8VVAaowrPfNfM6K+Q0yMcz8uPAbeqWEM=;
        b=jSyooizyDH0KvMQ4LDC5jcubirp7gk1i4Fa5uosxWoa/uaj89lE5VZoOUsM9+olub3
         rgTSkncBbCizlF2eJPruiwKI30kvdRBOU/GZaoap3FzhosguzyLWcGqIR1G5cSpsj2eB
         RHJ3k74F7w2Ij+NK9eNRUCKKOKG/8mHJbCc7sn+EvxLwDBqyNA4jbUGI+29ZynOgjN1S
         YTgyqb1HQWoLqlIpaQalHOF9HQovQOol+oGw519i8iuRcmge/QWxzqIfnBTU7m20PLfS
         z9ay/IVV7fAUF9TE/mpJ5/nS1iXg2imwLG5sVnyRQcU6QufI6Xno081oSCaouX4XFRje
         8DLA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788287285; x=1788892085;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ou33Ickh4Vn8VVAaowrPfNfM6K+Q0yMcz8uPAbeqWEM=;
        b=H2JmG9Q/A8iuI8fMBaYRHly9S662uJSXOXnMc0F+y6gRa2/I9Wd4F1ZrghV31kyovr
         OdTOLyupFeFeaOav0rnN5aIvJaT3czwgJxfip96NE1e6DgAH59JWU6DSpipTqSKyHj1J
         oRXjCLxUK+v3MUXzNHyxT4lJGH95fG4aUjunlmtTuJMZyEfApzRbUPndaQy/44lCb+zB
         e45I1N26She2bk5QOiwhJomgbHFGoG/b0oJjyBejPAsPibXrueZtJHF2cs2Cy6t2k+fW
         KtVQNfFoak5dAmJKY0qaJvU9oOd+51hd899fJoBKOhCU3zryn2ig1oImbOkCkbtqoWVP
         0W9A==
X-Gm-Message-State: AFuF++mFXa0SN7q0OXhjac5ApiR+3mhiq1GbPAoNI0zSwl1vAs3RhpFy
	LewjpRDuXRzVTkk4YtZO4J+WdafUxD4uDZFks1xk73j+0iRiBjVBQ6Iec83VTw==
X-Gm-Gg: AYBFou0vRwmLYiQafuwor1FPPcC/36WSXCErV0mxUXLxzhyenR9IN+moWnfFUzibL9J
	ItmVrUCLmMf7/BfWVbOi5dySNsEP4pVAlBZsPEErOSnKpFDL5JPrPQKiy/vm9tPHBUVwZELFxPd
	Z55QXwBnuHP/MOBLlPx6oUcJX3ttP6DW5sfW1JVLADcBcS0hDkynYA7c6GV/foalnbFNyzkC3b+
	UEwOm7lE+SgELbk4qAFRC7DxyarOJF4G84fNzdVeISs2BYHqQVDi0XztmVCA+J3TAd1+yUY3Saz
	yXrCtU3m2EtOkQYizeyTUfTCCN7hPRbj+aTbOnoIpBfi8FxZe7Rnwimzt4cz6yLZHsMcpLbSpGq
	xIoNgnU3m8vKK6jzWvuRITX2irO3fmA49vT9A3+YbORi5/K2GlDGaJLrY+Zd1n9uTSCyEr/sQJh
	sMJlocwGOLtdvZBx9Hq2ZDuVfJUL/h/VV1pjHWe8Wf/NmUcbb6RcXvTbdklWDznUkUHdiDDVd0O
	+5nG26i6tekbGj3cYmqwIukAzoMn2x+Z/txqQ==
X-Received: by 2002:a17:902:e948:b0:2cc:f5b8:4c2e with SMTP id d9443c01a7336-2d94a8892fdmr161450535ad.9.1788287285440;
        Tue, 01 Sep 2026 11:28:05 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2dadd357facsm2468135ad.12.2026.09.01.11.28.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Sep 2026 11:28:04 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <fbb88a92-02c4-48cb-93a2-678ee169e88e@roeck-us.net>
Date: Tue, 1 Sep 2026 11:28:04 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] hwmon: (gpio-fan) return IRQ_HANDLED from the shared
 alarm IRQ handler
To: sashiko-reviews@lists.linux.dev, Cong Nguyen <congnt264@gmail.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260901155648.1538876-1-congnt264@gmail.com>
 <20260901160931.DD3811F00A3D@smtp.kernel.org>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <20260901160931.DD3811F00A3D@smtp.kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 9/1/26 09:09, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> 
> New issues:
> - [High] The interrupt handler unconditionally returns IRQ_HANDLED while registered as IRQF_SHARED, neutralizing spurious interrupt detection and risking a CPU lockup.
> 

As I suspected. This interrupt must not be configured as IRQF_SHARED.

Thanks,
Guenter

