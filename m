Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16D4A330B03
	for <linux-hwmon@vger.kernel.org>; Tue,  4 Nov 2025 16:30:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762273854; cv=none; b=Kl2M4FWd4apq79lr5+G6KCnblaGSBgx8hPYCnt91Ai4cAoZm1QB4xXiKoFpciugI0prQ36KdcWSi22tERakWcnczew9YSWwjbl1a3iWbEdb6o0oI+ckejI3pS7xC6wjbJNlOj9dpA94rYCf0EXo5YOX3wMgjvvnaPfqaDAm/EvY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762273854; c=relaxed/simple;
	bh=ydXIsLmfUSB94agjmgKYcaRKq9ovCyLllNi8aS0nWz4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=CEsDcJAVOdSGbxZnirA6yuuIQen+QcsQDaVERrUtwme1j5IX8HUQ+sEn9vyXsZ7C1KvtllqhEj0riFEfBEUtuWOZXwvX1+ewbRo+dZVHoclDIyY7BRijGNfBonZUBQndDC9nhilQFNwE43XjicJAO3hnz5cKr1FStzxLEdVI+W0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=owN4HpcT; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="owN4HpcT"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-294df925292so52581725ad.1
        for <linux-hwmon@vger.kernel.org>; Tue, 04 Nov 2025 08:30:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1762273852; x=1762878652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d31+LDw3yFV8ld/t7W3tLHwlIZVxgW+LoH7NOfugl48=;
        b=owN4HpcT0GfTC5dGYS39sdIOqFOR895Xb4Ol86/Bcy/U5xhI86+1Xi8lAVDsEa/web
         biOZfkoUgkDMPM+XaoaX6NwOp059JP5k3H9g5gfzfBf1Y7cgnL9/Ltj2JZDpwclCoPep
         dnHCbVIPU3GNauVFirnMica0C+swHGjnwXzLdZD2iAEYbueAlWABcYeghzOvpdtgp/OH
         4+xrTlFPTzXChnWA0VwwGA/duT3XfVUKmuO1H/j3Zije21FQqbNAfJlCAg1Y35OOHJQG
         gTD9x9C7bOJztROup9+mHaGT61DD73rok9jfyyU46qrUT4dtPg82O7cj+sqCU9ZHJuB3
         RgXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762273852; x=1762878652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d31+LDw3yFV8ld/t7W3tLHwlIZVxgW+LoH7NOfugl48=;
        b=MgidC2JWH5zxPGuL4d0NPsvD+fFBYVPDzr/AXgFsWTQlOGOR0AYBd2KXoHmoqr7njE
         g+dIOGS1at+rBvjcFtpP3GBk3fZ00hqZX5geFPZXoxQuue3kINCpkKAR7NVHi1AqtZk7
         dV+dzngHMnOUajoRX+d5z5v87lCFjVigTSGFIvC6fCkXrvRUGZfdNzDWohbB4B/c9b8K
         f/0j8sy20xRaGtW3+9m4kW8o0KPBep1BY6GZaXW6smcIr4UtGKsiaXlUEDXlOmVLmBzn
         8y40MM4FusBoSgv9MSiFoVzq5bjdWt3U1jqRYRmIJhnJosZO8f0cFG8gXJiaprNFyVrY
         GtFw==
X-Forwarded-Encrypted: i=1; AJvYcCXjVWh+DSNUf6/Ktu6h/bhU3/NoQ2u4Qk+L7rfTaeDps1JM9vSoiRCBiEDFzqgGZvNjGpYORqdvFXni1Q==@vger.kernel.org
X-Gm-Message-State: AOJu0YwCvOCLBKvGdatnvC9pJYLiI0ff58Pa1zNDr/3e3x8ExpKMZlHq
	v9s+XI85QXECKo5TrfVdEAqccBR12dO28H2ubjbNV79UckrnyeweyOiGj8mzlgWJDRg=
X-Gm-Gg: ASbGncsXi3AEhf9nSXehB99rSzGIXMItdCMi7y6vfnPUxiEpGQodDFIhB3sWzf8o2vy
	26pKcUd94f3IQxkxmIKyAStrt0BQW7jKSIumxbn/n95gY/fVSOTog35H/4nOOl34yZ91JgKpQh1
	ItyEdfGLJ+ZkWZdl2u1UwcetCvqoH1UjV/KBGP89Jupi7pHWlLJIDYsytlsQfyEErotAWrReFq7
	MyPXq7AEGUzFYiLfaUDhXqp9Ro/s+6fD/6dKKfUPmv5a7Fsv8OMCSI3V2wcTWlS1W3k1PiToZsH
	nCtiOBezWqBFFAjYSmwwo/1On3IQLunqduLVdPwN+v2Vo21+dOojC3jW1/mdH8/zdSy+yXNGqw0
	Esq2JXuuHWrK7DjZolQjOv1ZaBp9sAE+g/uNKERVDLztO0ev1LG3SHbRcEAZMW4NbILH4TOIe19
	rbKCT3brO9SiZaPcGi+Q==
X-Google-Smtp-Source: AGHT+IHbaudmm3cpw/JwLUVFx3dKgg5E1mpsgsGgzUDgg+to2aXDhn3Bml2DCn+xajZ3lSmEZpKKPQ==
X-Received: by 2002:a17:90b:2249:b0:340:f05a:3ec3 with SMTP id 98e67ed59e1d1-340f05a4045mr13294027a91.33.1762273851997;
        Tue, 04 Nov 2025 08:30:51 -0800 (PST)
Received: from z440.. ([2601:1c0:4502:2d00:dd6d:728b:493b:482e])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3415c4aa89asm5024650a91.11.2025.11.04.08.30.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Nov 2025 08:30:51 -0800 (PST)
From: Igor Reznichenko <igor@reznichenko.net>
To: krzk@kernel.org
Cc: conor+dt@kernel.org,
	corbet@lwn.net,
	david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org,
	krzk+dt@kernel.org,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux@roeck-us.net,
	robh@kernel.org,
	skhan@linuxfoundation.org
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: ST TSC1641 power monitor 
Date: Tue,  4 Nov 2025 08:30:48 -0800
Message-ID: <20251104163048.1130482-1-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104-ruddy-tuna-of-efficiency-3321d3@kuoka>
References: <20251104-ruddy-tuna-of-efficiency-3321d3@kuoka>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

>> +additionalProperties: false
>> +
>> +examples:
>> +  - |
>> +    #include <dt-bindings/interrupt-controller/irq.h>
>> +
>> +    i2c {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        power-sensor@40 {
>> +            compatible = "st,tsc1641";
>> +            reg = <0x40>;
>> +            interrupt-parent = <&gpio1>;
>> +            interrupts = <1 IRQ_TYPE_LEVEL_LOW>; /* Polarity board dependent */
>> +            shunt-resistor-micro-ohms = <1000>;
>> +            st,alert-polarity-active-high;
>
>That's wrong IMO. Either you use it as SMBus alert or as CPU interrupt.
>If you use as CPU interrupt, then the flag in "interrupts" defines what
>is the level of this interrupt. That flag is a combination of both
>CPU/SoC side and any inverters on the device. And actually you wrote it
>already - "Polarity board dependent" - so why do you:
>1. Provide polarity twice
>2. Provide inconsistent values - alert interrupt is level low, but
>alert interrupt is also active (level) high. So level low or level high?

I tried to illustrate both in one example, but I can see how this is confusing.
Will it work if I split the interrupt part into separate example?

Thanks, Igor
