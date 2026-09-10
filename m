Received: from mail-lj1-f174.google.com (mail-lj1-f174.google.com [209.85.208.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1553537F72D
	for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 07:16:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789024607; cv=pass; b=oPf+oUyc34z1QlQxGayHEGgMnO3imGVX6G7rhK7i0h0cFS/p333J/oYMCGJhT52NHYvuvJ+b/PSz7Zb4yuumj47P/an6e/IlhRDhj5FmV6q+YJSOCzIsSNTrTCT8wC9uvQ2mFr21Kr74s6mAorFEYxP7R2wq5TXoKfn7nWwZNSI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789024607; c=relaxed/simple;
	bh=UjsdrbcYuEZ9m34+mJNQ1HuOS/tJ6PG0a94ysyN0lFM=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=H4hCvspbLPsW+tnfFLjpAwplTrvz45ZZLBVkuKLftoaKq0PxGajqhrkvl1FgfC6C10PAJrw2pZtJ3rTfs/QKQmTT0T8Wn84BY/aX+tpCfrAjHYh+AcRYBtMO6QObWszKoBPHLnHKaWPV/vc3ohIXQCh2bwopWHdGA7zt9SWDS8A=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E/cn6Iwl; arc=pass smtp.client-ip=209.85.208.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E/cn6Iwl"
Received: by mail-lj1-f174.google.com with SMTP id 38308e7fff4ca-3a4835ab78cso31377241fa.2
        for <linux-hwmon@vger.kernel.org>; Thu, 10 Sep 2026 00:16:45 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1789024604; cv=none;
        d=google.com; s=arc-20260327;
        b=TTHyijFFyoN2q0nBwMsubiM8R324ulJElYAj4mk2j5fspGp8Spj4/lNAvSu42XPjJ0
         v434z+NxglZ4pvV55slOkrF9CGyF14D/BdEC7qd93F4j7C2fbUlIrfFwtGIc4bAdGV9D
         rS195lLHvjTdfAnSWaRZxtlwuXxa0RwKCdYoSEGpqIsp35mJfnKE+rsIKUkBTEQGcmRP
         oo4KL95LcDd7QJtPCgvr4QiK3JX18e4RZWCyU8vELQdFBpF3n0HCSeGwrp8FXSwye02F
         GEgAbH+i4wHvLtxyE4bIc+sJcjTj5uXMG9KhlNXF8AqSH+aIn82f7ZKuQh0QkOjnOfhd
         glcQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=UjsdrbcYuEZ9m34+mJNQ1HuOS/tJ6PG0a94ysyN0lFM=;
        fh=Api1M4IRGx9r+LYDQLoTpZctpBiHaYmKwzyAQHBPOhc=;
        b=I/ptGDEo/+bk70W4rGy8aboQzz1ZfFLMfyW84uSk2Zn0dYXu9oqH56FCOHAdIxNlcU
         usmXHCDqXJvoXffHZhQpGiguoTOL82FnDCj22AX8G3Wa2ccONTCsPH06r8UEau3BsjWL
         SDgGtl/+WwRAniFOpK2GypiwEoLmr5RIn/sn6IVyFsEG9NIbR7eUAeijh265geIhF+7o
         c6j/a8PVFnOkLQ7beDt3ZPKSVglkooA2ASYoFahO6jdqoZ2yrLbePxqaMKUPlpC5E+8d
         S90+/6obCj41egLF3ovombQY/h+o+7PADZb6cPY1HoR8oRbk7389UWEn739JTzuwbIeW
         BDYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789024604; x=1789629404; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UjsdrbcYuEZ9m34+mJNQ1HuOS/tJ6PG0a94ysyN0lFM=;
        b=E/cn6Iwl8/GWCIxXZ8G1tRxpm0XYE5xhRkNn+WU99GZqPHISawocCzTDDgtXCYPgwJ
         kcJQUDjpq54CfifQ6b3J6lv+tRiqtr/G030ZwEbwQJvaKnpAJuVCtuTS7zoL3j4OQODH
         Qjxa9YHcUmYIb1972AirjTRn668ntemP2xxj5hJz0768SGa/UGvwhdimpdn4cdl1LmSl
         YT6DfrpCI9ftwzTNlgPUEi6QBHmjh+MJsHJxkIzVbMMODhYi9kpKaHOMEh1UGoQs5u2k
         1DzHtCTLGkWkEvNov9n2ZyNSGDzpJE9lBTvWshK23QJIvPXY+tMWUGOWnGPyZjm+8EJQ
         Cu0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789024604; x=1789629404;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=UjsdrbcYuEZ9m34+mJNQ1HuOS/tJ6PG0a94ysyN0lFM=;
        b=pzZj//XclvMHFmo3ltRPPuhceplTw0Iza9FfxdvHmYLlyIpuwFojXlLQWKxhCAE5kz
         H+F8t1SD74D+pgmoF7guO37YTwLkl/p93ncf6Msqn8c2aESHiZtU/foRzVnCMfAUReVL
         swpAWIatNhAYOtLZ1GniAyvix1NngoXVLQLqRjAFg2xftmvYpyeq92hfUA0qk9XGbxkp
         5fnd36nvN9PiwB726Jwrjviics5W+eCeljn61JyVDB9ALdBZ8BTSZoaBPKmw6f+oWHgq
         zE233hQq7CDyRV7tGYiv5hPPbgUO+NckT0GdqkUydhp4eA2KTGn2xv/slc6JE3x79xhu
         cUcg==
X-Gm-Message-State: AFuF++kU8ZEWWmDZ7KVrpf0ote0ZcKOV8vZZhuk1nRJ5p4dPFV+s7bgQ
	B7gUgoV27nmSq3KizXZ6Q0koX2IOPxuHCvKwWlFiNQ0lM9vO8SzxxUmQ7m/P3kullKoVJYw6ay7
	qy4Ud3IYV/9SHTzzUCC9E86M+FnHgGPA=
X-Gm-Gg: AYBFou1ZwzBzqsU/VSPWwGhB6P/th1ZSBpXlgumWEkF+fkGIKAj5ner7ynOkHZPrncc
	iGDutsM1K2uxeeAlTy3vbDPohIaaSb/tW3JIdBWhFyGg2RGOSrIgYy/Fbj1pjP9DNEgdffwugcX
	h4rCAMfOpNwWk46cnMT91B3IG3WrCDoSRACKoIxka7P6kS22P26BveeLXfTp205r3XvU33PQRWf
	oF4azetdc37B1oJjwSBpTWJKRvHPSUysYkF0HBQAwl3GJh84pd9hGMQEe3ux2D0/0LMNyV9m/Og
	/6lTvHLmN95p8kHmaNHvlVEjzzjW1S0jiivrLBH51WYcoCI6rV61353vgrSsu8sqk5st9JSAJ4Q
	pRo2rq2YXeyk=
X-Received: by 2002:a2e:be1d:0:b0:3a4:9b64:9811 with SMTP id
 38308e7fff4ca-3a49b649b3fmr11090001fa.15.1789024603607; Thu, 10 Sep 2026
 00:16:43 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260907080831.11281-1-syhuang3@nuvoton.com> <c1f812d6-9938-494f-ae37-e250434a25f7@roeck-us.net>
 <CACW=pY4mpuC1+Z21egn3jJY6jtMhMx1PFFbM+Rcy6giuzXpJ1Q@mail.gmail.com> <3a941922-8728-456a-8e2a-7fa008dd5155@roeck-us.net>
In-Reply-To: <3a941922-8728-456a-8e2a-7fa008dd5155@roeck-us.net>
From: Sheng-Yuan Huang <hsyemail2@gmail.com>
Date: Thu, 10 Sep 2026 15:16:31 +0800
X-Gm-Features: AcwNN1X4FjemE5ofed7LBWR6jnl8AHuWB-oy0Ch_I1mQhfiWyKKr_gD5QY--0ns
Message-ID: <CACW=pY4e84hBiJxvLz09r=LD=OfssBFF_tXduUO0YJxqS3xf3A@mail.gmail.com>
Subject: Re: [PATCH v1] hwmon: (lm75) Add support for Nuvoton NCT7715
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Sheng-Yuan Huang <syhuang3@nuvoton.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Jean Delvare <jdelvare@suse.com>, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Sep 09, 2026 at 10:02 PM, Guenter Roeck <linux@roeck-us.net> wrote:

>
> Sure, it works, because your code converts the bytes twice, as I said.
> That doesn't make those conversions necessary.
>
> Other chips also use 16-bit config registers. Just use the same approach.
>

Thank you for the detailed guidance and clarification.
I think I understand it now, and I will send a v2 patch soon.

Thanks,
Sheng-Yuan
