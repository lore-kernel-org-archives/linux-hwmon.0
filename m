Received: from mail-pg1-f179.google.com (mail-pg1-f179.google.com [209.85.215.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CCFB2392C3D
	for <linux-hwmon@vger.kernel.org>; Sun,  9 Aug 2026 22:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786316098; cv=none; b=eQWHr05mbk53hQiYKG6nuREuU8EFA46fpXUfLvqilqC6It+3pfuFNW9bIgbU3+adJHS66H53s1Wn+QSekIfype8scvcgdlU7X7jxHaLamF4yghX9PMsA4Z+Dcnd42jM5J7SBmd5bNGDzy7HCizohFEgY3MzYPeTldc7U/dKUPcg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786316098; c=relaxed/simple;
	bh=hIXWJq250gqUcG4mGFuAA37OyvwHaVdQdaUly6I3HjA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=CX80OKja9hUBjQQ8Mjzt9QDmG73C6s8kYg7QzuOorH6xowbZNFRj0MpHPYZLLbZ7UMHe9aBhpT1oRF1SUIxcpeQ+cb3QdTnAU7X0QJSdqigs1tF8FWw3INeJEukcopVgPBY476YpFjorlynkM8XgE1DQHFhIYWM415uz6BDPb2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mPNiTwMQ; arc=none smtp.client-ip=209.85.215.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mPNiTwMQ"
Received: by mail-pg1-f179.google.com with SMTP id 41be03b00d2f7-ca88130e09aso835245a12.3
        for <linux-hwmon@vger.kernel.org>; Sun, 09 Aug 2026 15:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1786316095; x=1786920895; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cc32SHbG9mzW1RPtIpp/AmfFth4TURZ8sejqUbJgMaI=;
        b=mPNiTwMQXz7WFh0nllGSnLf09kSuB/PAM8zWlmov77PN2HJ+BuTv1p0S4rihPBAP5x
         cdVJ69V6k8NKKfmfTWw9wBT+9MFtYgWQ8Sw85nxm7T5SlmOMOoK1w2snuqW+oZdlfaKN
         7LQGGvLYJIg6hPdn+F9/5v5BRFFamCEw24mp5dpVr2oZGxbLLl5dkuQ47RqUhWY+AqBN
         cJJibcBgkZCJAkXKzUOPgZrJV84rmt80tjtS8PObaP6Ady30xPy+Ygj72lr7qX53QMHh
         pbkHJdnRPzC7OofAXvcLTheHHfJGMb6E80351pQOaj2yyVD02LeMHgcdZR5/XGr8foqj
         HdGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786316095; x=1786920895;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=cc32SHbG9mzW1RPtIpp/AmfFth4TURZ8sejqUbJgMaI=;
        b=Dn4Hx7R4mbkQE6uqcjEU1/m+lt38T72dfFsUZRgWrzDQt2Yzz/OpNcOYed8RUQRaZI
         BFYeffx/jxv9XVDGk7Rte0DaBgvEY3Vmx9c3LiNs2Wbk8J0eURiBrrDiu2sF07bRQYce
         VmDFksUETIXdWPChPIXxdSp2av1n5ADz8BVIwP1oxnWrVPuNXx97aFGwW4KqR/GS1DDW
         gWalRcbvOek+SKwmuVo3NM8n+h5JzP32hltdsOtb7vZ+RT34NhOealTvY3YkB6G+L0N6
         4bMxPvomD+gpuIzmRpDOTETiBPMSuWy4RiKEE9wDwMi5LvblTYCCiLfOpA6mlE1KU4jx
         Xxag==
X-Gm-Message-State: AOJu0Yyx4VfeedAONqM8JRaqItNkScQdJy/nuMZMXZ20BT6lZaOj3M3w
	rEQUh/ySGeC99O03g77zureeDPokNqpVk/vdO2Jr40l33lh4EEDEVrWYlCSfjQ==
X-Gm-Gg: AR+sD12s2TnCyK932+vBEF0I+1Jb5og0QgTT6rTbLejYkw9D14ykpONoiaXu7uX36ku
	toIUqRtETD6SLgrj8/sJo1zWfd/JAEMUtCPGu4k4/XQT+xGa4Q+ECCcL56zlGhsKzfDYEm9DRLD
	12TZP6b16LMBjBJtOvgzoHavz64WY1nzGBaCzhkAA3CbjXowDlph6vHgtb8Spx0KNRpfPMmb85c
	t7gccQgG9t7YgR6tCb+7cc4T2RV4REc1ksPdYsZvssmcaWd/3XW9zYkcxUfB+O+F0s927gbb9Q8
	61UMawvyx/rRLTgJhhvRuXGIaYkSSrXhZt4xW0SayJIi/8w5fflKXyjckAzLFMYQNB9byMebsMr
	+DbR1bmKHY/dc2uDsBRxKW++GGFpz7Ju4t0NpFJPD8+7LAkDzbkhWo0w6B86riT6ramSUm6z4j1
	wwHtwnYQuaT5xMt17mpR/pIDHVeRTy9rlEcnwCfcxppGATbld1LvKbdjrnVcbjhsYmIwB71YXBq
	DSfIHaKKSNjqxWZYJV/N4Wa270Ou8Pu3TmbOA==
X-Received: by 2002:a05:6a00:a803:b0:842:5a8d:3035 with SMTP id d2e1a72fcca58-84f2e00ea2dmr45516374b3a.22.1786316095152;
        Sun, 09 Aug 2026 15:54:55 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:da43:aeff:fecc:bfd5? ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cbe8f38839esm2937919a12.29.2026.08.09.15.54.53
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 09 Aug 2026 15:54:54 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <28fd27da-ced5-4c2d-bbb8-0eda383bf767@roeck-us.net>
Date: Sun, 9 Aug 2026 15:54:52 -0700
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] hwmon: (asus_rog_ryujin) Add per-device configuration
To: Arimil <renari@arimil.com>
Cc: linux-hwmon@vger.kernel.org
References: <20260807000107.1786892-1-renari@arimil.com>
 <20260807000107.1786892-2-renari@arimil.com>
 <20260807001412.B61901F000E9@smtp.kernel.org>
 <5a817284-a9f4-48b2-9f0f-802c5dc6963c@roeck-us.net>
 <CADBHdQ3x4bFe518q2PjZvGJ2=qP45+5Cmm8f99J9gRZCJun0aQ@mail.gmail.com>
 <d7bdb634-6fce-4bfe-a24f-864d20e46d92@roeck-us.net>
 <CADBHdQ3LhfunbnwCE2AYmWr5XwqSvJ8WGkQFW1G=GQv4dp=Ndw@mail.gmail.com>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 np3900V20aS7eD9K8GTU0TGC1pyz6IVJwIE=
In-Reply-To: <CADBHdQ3LhfunbnwCE2AYmWr5XwqSvJ8WGkQFW1G=GQv4dp=Ndw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 8/9/26 15:03, Arimil wrote:
> The github mirror that hosts the same code here:
> https://github.com/aleksamagicka/asus_rog_ryujin-hwmon
> 

Sorry, you lost me. Why did you submit a patch series for inclusion
into the upstream Linux kernel if you want it to be applied to some
downstream driver on github ?

Either case, sure, go ahead, and feel free to discuss with the maintainer
of that driver if and when to submit the patches for inclusion into the
upstream Linux kernel. Going forward, please do not submit patches for
inclusion into the upstream Linux kernel if that is not what you want.

Thanks,
Guenter

