Received: from mail-pf1-f174.google.com (mail-pf1-f174.google.com [209.85.210.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59AA24499BC
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 10:10:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.210.174
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783678237; cv=pass; b=t5WR9PoGayJCcyFjUPZyvgJH/HuQvPIi9kotCF4rlwU8xqN+7ZCbHtYFtycd1OGQjhKqTohXU2u8d9vzikwoUinu9g9slg5RfPjtgdHnVpoLGnfCWY57JxTUf4vvdBDmUFDUwytwtW7cpbC0D5QjtuvRrrm3XzPAXN65pWlgFuQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783678237; c=relaxed/simple;
	bh=/OTm1Mi3vKRELZQ0UEyg5wKJbw+4onNskc01gMKGDvk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=SotJIo6MxLOSsUTVw5b9CC19dZQLYhU1Daec6P0ezlXpHuhbY+REDqCz+qe7H+rfsUJwCatUytx0TmGGte6BMsZIS1ydr1TkOLufXDqPSOJYIru+77q5ybLSNYxDY7LjbvOk9ZjdkOi1eRc86/KKj87IgD5olA3NKxkHGX+4i8g=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Bv8dABNG; arc=pass smtp.client-ip=209.85.210.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Bv8dABNG"
Received: by mail-pf1-f174.google.com with SMTP id d2e1a72fcca58-848743155bcso147884b3a.0
        for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 03:10:36 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1783678236; cv=none;
        d=google.com; s=arc-20260327;
        b=KdDBsHcSEy6lT7w9Pr0M9/eRQ4myi5ETL/XuAS9bUxejHY4XAJ+NmZj0iBCQPVQyKu
         gxMFxe8wp9oRAqzn6IDFxXZ0FphDBxByXzGJ+C2ogZXX2HrP/MuC+VYs0CsYlBCQv2VZ
         kxmaQD+72agXQMA4VR4m3U6aEzLyOu7gHe6EmepUyIt8K+AGRnh6T+/HMUWYTpSb1X8I
         3X9BCcwHmODFCu/gD9wFWUUnQvm+3gLxiYaqX3N/LQOD0kJtS13uwsxRzJQPPoEwCW3m
         t+JrVUsV6B3uoJfWAEm+sEpQcgKwKUi2FAmzTnYlUkpfrTEU7Tu1rcJx2KZtlnWUfsyg
         x+HA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=/OTm1Mi3vKRELZQ0UEyg5wKJbw+4onNskc01gMKGDvk=;
        fh=TRXNPijAhvoj15fy9xheslG1d/u473nGA1dVAFV36CU=;
        b=JztYUEnfg93P8viW5ab6VE8UHhHz/fc/o+d7JYk22byPu7YmY4D70XbP9tpOuHfWPV
         Sd0Iagwbb7HZ/WL58+v4bZZ9zkChz2/fxoqSxlniFMPYvVj+FzokhPeSE59iuD86o+AA
         rmWPHrN6LK+Hro1bBOfvAx2BB/NrTGAtjhv1IZxPl2IGuIEj6CJTgiLgEpdF/kKhiPQk
         4hnQWNcJb0GIgNmtqdzusI9PyJzsqhcVw7EeGAWGwqW+DCCFWtQ8wEsC2UV3d2KEVlHz
         J/PYcoij2SKNO8MQD9gntTvrkm8i5YS7hd1dqp7ZcExsFlvVdkR94SYhp3Maq+LbYPOL
         /TJA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783678236; x=1784283036; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/OTm1Mi3vKRELZQ0UEyg5wKJbw+4onNskc01gMKGDvk=;
        b=Bv8dABNGhmLVRJczky9AzKPO6kRtrzq8AkbKk2Fi+KNGPjoBZu+OcUwZlGD4+JbbJ0
         tXi/wDR+b0aJyYSpsA1reYjW34hXEoZYb0dHG7EzyNy7S2P4Fxebl0BZoB0bfjx/nGgu
         N2VcQepmLb01IKj4yJJHqAWbnYW0fHWMnt9L3e++PeGTl4Vu6RI3eOsA7JscMxSlGInw
         OjFAZvzKekXh98aBvuxizWrJebfIPgAhgORo71DNVpXcUTg3jPuiTAWOwNuXziP1P3vH
         9F40qNxLDsqSeqzjv8TX/+MP/nYRX6S+tlcKgHKRLWJXV6vKBT/oNQj0sWxgBqyaJtco
         B2WQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783678236; x=1784283036;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=/OTm1Mi3vKRELZQ0UEyg5wKJbw+4onNskc01gMKGDvk=;
        b=sE8TIVGdzHaayUEnMkaUVe4E2yikcO9Xf3yPm0D/2Uy8Upyzaneemu5s6JYSovMynT
         6mfmfSGTRoPYiW/8yW0cgRvUsjbIdjoFhMEMqKiw6S7bqJIYOGxUqOSHbCJHdWx/lR8X
         hGvm9L2wKaFUkneqK4yYqpUQp3LC2jShPsgL3Q+NtH7TtqbGy1sLB4Ahe5fBaXia6mcp
         paVTQDF0da5c0IWz9gOl46Iex694RqErYr/y5ro5VCJMvnSzPjXyLM17oFCnsc0ppSGQ
         eI5I+84IhexcAGPpplYges1MAB3mPT70bcMa+86Uv9ZbytvmBxVuPCZZn1r59qIkz9Qn
         C3kA==
X-Forwarded-Encrypted: i=1; AHgh+Rpg5yqvL2w5GJd35t+PpxN3+utSAt518WgdCFe02vwbxKdzFY51w8fClX0C4v3BLmMsGIdJGBKoa9w2zw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz+y/HujzKnNjlBU5Nkv8XpMzRtnKQtParYUO8vxgT1L/6WN5n8
	UPycvhECHJKr68p6GWt1Xk2tdB3kQW4gUnLqCiUsIOGqmjzNiitIiFF1vsw59cEEN5077mn21Ks
	+/hih2h3yrH8vW6zgfxlT6EN3qJI4kmYBScu2
X-Gm-Gg: AfdE7ck/W7uLPwbj+iDLvIAgSl3tcG1XGHwThIhpPN01J1HmSaHTkPg9v+MFUEMiFjU
	pictfd8KrJBtdFjthRmFHAjoOb6rpWLF4TYU9G69VMAq3YUFxP+k/inXhAhIAaAESftKWoKnJdk
	SMXTkJvv3NRd4/N+iOzm0mru9pYKoVj5VGs/Zs4Yjn9L4lP8PzxCf/v/CBf17e0U5x1+/iPGBqX
	8vJ3Fm9CKP2R67jAvlyFDWmACXzlY6ROkt2s/n0mSqVnAoBTkUb39CcdPdjyHMWN/Le
X-Received: by 2002:a05:6a00:4b02:b0:845:c6fc:2821 with SMTP id
 d2e1a72fcca58-8484302ae4fmr10412513b3a.22.1783678235670; Fri, 10 Jul 2026
 03:10:35 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260709204037.1998433-1-eugene.shalygin@gmail.com>
 <20260709204037.1998433-2-eugene.shalygin@gmail.com> <ce6bca91-ca18-4764-a268-1429b41fb918@roeck-us.net>
 <CAB95QAQSevPFXHxJ0yGonjXee8-qG2KWUKW5YDT+C4Fuji33qQ@mail.gmail.com> <5bb24169-6d8f-4401-8650-2a04bf49a2c5@roeck-us.net>
In-Reply-To: <5bb24169-6d8f-4401-8650-2a04bf49a2c5@roeck-us.net>
From: Eugene Shalygin <eugene.shalygin@gmail.com>
Date: Fri, 10 Jul 2026 12:10:24 +0200
X-Gm-Features: AVVi8Ceb8C09otxA1vqLUqcm4dwQnmwACfJxBEPcBPDhFIulEPIjopQd3v_G5jo
Message-ID: <CAB95QAQeLSxETxQCi7A+mwzq+HaceFxzsDuDGzNEuDjdd0jRRg@mail.gmail.com>
Subject: Re: [PATCH 1/2] hwmon: (asus-ec-sensors) add T_Sensor for ROG STRIX
 X870E-E GAMING WIFI
To: Guenter Roeck <linux@roeck-us.net>
Cc: Vishaal Saraiya <vishaal.saraiya@gmail.com>, linux-hwmon@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Guenter,

On Fri, 10 Jul 2026 at 11:03, Guenter Roeck <linux@roeck-us.net> wrote:
> Do you expect me (or anyone else) to be able to deduct that from
> the patch description above ?

Would it be OK with you if I simply submit v2 with elaborated
explanation, and add those blank value to the code later?

Eugene
