Received: from mail-wm1-f50.google.com (mail-wm1-f50.google.com [209.85.128.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEB3E46F491
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 21:26:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785273983; cv=none; b=ENjnAstXxO8n27GIRmQQyzBLNHd48XmKGj38bQ3it7igaZ9Gv44otHhRNUOdGfe1WxTJI6JA8FCQOqRZneQ4OG8+d8FBfJUsOYTsqbkBMcm8B+W8LT6nE6iJglLJRAve1/kHGXoXv/OKHohDkiCpP7lptgSaRUGk7dzoibOCLKA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785273983; c=relaxed/simple;
	bh=X3gVzd44Z5+48P0KIGy6Qk2hcmMHC/+BMGNO9oeO2dA=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=aBFJoZJ9mnT1DQbb7zLQCXG1xhlldYfBwQrUzg3CTQXx3pOrH5FVy28rdBqHez6Ja03yVXTIMmjEOPxM37uJnS6GXpxtYB5Uq3ttiog44XHo3a8BL1SMsfYgbRg1RMo38g0D9aOVVYdPOxmqJotOyQnO406MQratm0rF9tl1KJ0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com; spf=pass smtp.mailfrom=googlemail.com; dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b=BCeIUE6c; arc=none smtp.client-ip=209.85.128.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=googlemail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=googlemail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=googlemail.com header.i=@googlemail.com header.b="BCeIUE6c"
Received: by mail-wm1-f50.google.com with SMTP id 5b1f17b1804b1-49556f97a9dso2041215e9.1
        for <linux-hwmon@vger.kernel.org>; Tue, 28 Jul 2026 14:26:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20251104; t=1785273979; x=1785878779; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=P3lsbOg02tlaEpH5jQfkKjxsVEXEmI/71XpI5rYozK8=;
        b=BCeIUE6czAkI+NzrF1cFNR1itRNYPDC+QTJa8kmkDMbwpGeZtWQqmwuV442whXYrKy
         vmdlkQVm4SVaY49zilvi/DtNErSmbdwHyC0BAiyBke6eAabAZMwEd/GlR57FN7xRaruX
         1wCUiCysYys0EFWxZWoKkRVn1/6wcSMr6VoTNN+TAW5AxQfHm3mhVGRc0exCwbZRUE6b
         dDi9ZiQgahBo6GYB3Fn/FWlpiE/LCIu33dtRZEIWa+DKCy58Zm25Dmp52MSEEgSfj7J0
         3oEdaMis0cwl6d63EIGlybCMVGVSYa+kaVPcbw+x0nnCn578CnbDKHQ5oSt9adzh8RfJ
         bzeQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785273979; x=1785878779;
        h=content-transfer-encoding:content-type:in-reply-to:autocrypt:from
         :content-language:subject:references:cc:to:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=P3lsbOg02tlaEpH5jQfkKjxsVEXEmI/71XpI5rYozK8=;
        b=ci5UuU1wr/znDLRqVy4jaVclqHEhPMzxM6Uaf+j1zdhfDbttvc/3xuGWmm8VJt52G7
         EeuZqEHwaOLNPm0l9nb8a4IOT6vFO1mdNMAAalt9BYUgmES5zgIbXTAmAKJch/M26Bi5
         3bDM9TdSD6tK7OtUpkwF9mxZ77hcUOmbYM2QsRJ645+AeXxutpmuLwItxMLruTRdd7xr
         iSIrZDdbkf7OtqWLzi9J1sdsw+3/u07bMJXIPvQd6LjUmrVFvwe20GfECvWcJNOu4oTG
         hKTM5nlZLGh6wsM0dXEjApq/eNv924272mEZE/xYn5XPMJN0uUIdwaktpUHziDMOpfuz
         CMqg==
X-Gm-Message-State: AOJu0YxcmZMQa+rPvlt6TRKnNaAqoCHjK70F0IUTR/HwhRK0ylLNizeW
	dUnDRci4i/QvSuF/jcdvRa+GUgLDCtaZ74r/8YPzYPygw92EDgOgXbUY
X-Gm-Gg: AR+sD10fqiwW9dJ+jR7TssgwepzFHcw5JnGspPrO1+RJY5NI/DTMFjQk6OytyL8Y5a+
	Tcr5Ob66Ht5P1d44Po7dhh2okYcRRs8HXj/dQT0Quvs6ktS990cixUcyCvj31nYRDcU27/96s0r
	EkPWs4IQUdgWzOuLNFKXhPCZJ0qYlEWYTY2OQo+G5ZaHBgSD6lpFtZ/e9vl7kzliZhzznRb6Lsg
	rgZj5/l6jdlMcplBycb+DSbFRAPxMemEOpidR4Xr7W/9AEI4UmDX1O2cLhXGHzUjOgbKDTbOKs5
	UV4llUHjip2i/ZcsUPsiLhOLkIws3klYzStQldLsQDzEiDQI9Ah5072ZTGgypG5qjBtsw6L3tSX
	mLKvxMvsU6N55TEUt88kWsZ0Ij36+6mpervj60e934loMGbMrfJONwuamkzraSVe51qIDHLVeoj
	zv4WhLp+CAA0SHPYSRFwevJrUH9cpgTxgkuRW+3vULESPTIiaEw6fdIthKU5toKZFZX3eO4qjWS
	AjwUgTE+5ST/70ZdzOEPKZkM39sbTZV18KTaNSyvcde/rjFmRp/MZp1QJXV8qUfJcna/aDoSDOc
	j7GFK5Tc7blyScKSWud4fOdU3y2PhfEUrUcl
X-Received: by 2002:a05:600c:b85:b0:495:6bc9:62b0 with SMTP id 5b1f17b1804b1-496c653f38bmr50034565e9.17.1785273979086;
        Tue, 28 Jul 2026 14:26:19 -0700 (PDT)
Received: from ?IPV6:2a00:6020:9cc1:9f00:d338:f5e0:aea3:346b? ([2a00:6020:9cc1:9f00:d338:f5e0:aea3:346b])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fb6b189e5sm2501022f8f.27.2026.07.28.14.26.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 28 Jul 2026 14:26:18 -0700 (PDT)
Message-ID: <ab8b093b-46e6-4738-afcf-4b97c9ad5af9@googlemail.com>
Date: Tue, 28 Jul 2026 23:26:18 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: rafael@kernel.org
Cc: linux-hwmon@vger.kernel.org, linux@roeck-us.net, sashiko@lists.linux.dev
References: <CAJZ5v0gcatfUYocWViAZjs=BkqSz-JK+bECm2cpanv9NrWgfnw@mail.gmail.com>
Subject: Re: [PATCH v2 2/3] thermal: hwmon: Register a hwmon device for each
 thermal zone
Content-Language: en-GB, de-DE
From: Oliver Freyermuth <o.freyermuth@googlemail.com>
Autocrypt: addr=o.freyermuth@googlemail.com; keydata=
 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
 fze6jkGoKl/JP9K8o+RRag==
In-Reply-To: <CAJZ5v0gcatfUYocWViAZjs=BkqSz-JK+bECm2cpanv9NrWgfnw@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Dear hwmon devs,
(please keep me in CC, I am not subscribed to the list),

after upgrading my systems to kernel 7.1.5 which incorporates this change (Arch and Gentoo), I have for now become aware of two places with userspace fallout from this change:

* KDE / Plasma System Monitor
   Report: https://bugs.kde.org/show_bug.cgi?id=523588
   Corresponding userspace code: https://invent.kde.org/plasma/ksystemstats/-/blob/46f7e842767774b96bcd22edec0636a267151475/plugins/lmsensors/lmsensors.cpp

   As Plasma System Monitor remembers the (full) hwmon sensor name in all widgets and thermal zone IDs may change depending on module load order, sensors are lost both after upgrade to 7.1.5 and at "random" boots after (whenever init order changes for some reason).

* (good old) gkrellm
   Report: https://git.srcbox.net/gkrellm/gkrellm/issues/98
   As shown in the report, gkrellm remembers the full hwmon sensor name and hence is affected both when upgrading to 7.1.5 and also at "random" boots after (whenever init order changes for some reason).

My custom Conky script followed the established practice of these tools and also broke, but in my case, I fixed it myself by just ignoring the thermal zone ID if present
( https://github.com/olifre/conky-themes/commit/6d015b9d9eae21ffab8c5571c387534bb93cbc50 ).

As I do not use Gnome or other system monitoring tools, I do not know if the fallout is larger than this,
but given that lmsensors returns the new names with thermal zone ID included, it seems likely other tools suffer from similar problems.

Cheers,
	Oliver

