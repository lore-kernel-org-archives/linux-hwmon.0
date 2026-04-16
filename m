Received: from mail-dl1-f42.google.com (mail-dl1-f42.google.com [74.125.82.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6605A31A062
	for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 18:09:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776362957; cv=none; b=iyML3Ra8MSu1mfgEQPWoFMmtgJd5s4hY8bOOaU7qqVsHeN5y2RJ4MBjLugkgOLT/tgKA47jcr2Ip0cbFzQ0Elq5cbDFJOPaYtV6XHUDJLx3KJQeC/33PVkzz4LAD0vQ2Toh5pHmkt6BKDHBdhSb6j9Ryb2SH1kRjwrDXrdb8Q2A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776362957; c=relaxed/simple;
	bh=8LLcBZxKbesEH65s0Q9hKBPrL8LJIDUga5qB2PH/PHs=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=pV3vgQiS4ZRF90uIdyyMCFjZDylMAOGqrLQ9D6DtOlyXOoVuBvpGUs3lvHMyVdL9hFt/d6hmRG9p6Yi1CoC2B8sAgnwOIuxoUEtNqa7iREIm5qTZi+5nH1l9a1Od1WVzY136h4/uo/Xs15h/vAyFnQwqctEiUBzVWAJmztlzF3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ydd74rLR; arc=none smtp.client-ip=74.125.82.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ydd74rLR"
Received: by mail-dl1-f42.google.com with SMTP id a92af1059eb24-12c565dd3a7so631871c88.1
        for <linux-hwmon@vger.kernel.org>; Thu, 16 Apr 2026 11:09:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776362955; x=1776967755; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HZye2vplKUU5LS4z/qlGroyCrHO1/xWXM8eiS2rVWx8=;
        b=Ydd74rLRNL+gf56TsExvMJwO1EUArVqIf/hLKLulNHMKydNTEciW1wZnAVVR5a8qXT
         Vn9rvGMyljkynPYnY/xl5PsCgwTqxf5e6ppReye4P2mqfbzWDAjLq2jDRocs1DAU2GLi
         fbtThOHMRiH1VeW7DHd0v1XWdQDehWz+y6BDkYCwCp08khV5PQNljblpNO8MuqaPQpX+
         6rLgEfdnUIbSr4sNwimf6ro7PAg66uPJoWKrZOuTLvWMNs9enJIC6PTZT1iE67Ee7hnj
         sTGkDEoff4wsNm/js8vNF1Y2FbyYhRTlof4wBJgqQutFCQxlSyvlqcPvoVPJNTJ7e2Q+
         j+3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776362955; x=1776967755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HZye2vplKUU5LS4z/qlGroyCrHO1/xWXM8eiS2rVWx8=;
        b=byOWp2j+L5oecbALG0+AEqQr4bN27Yh5E3fgOaXzfmV4Pw69wffM6BvZyEcpzrhtQ0
         5XkTytU7TiA8vd/HxokjEF2kpASunKMBCvv3Xs6W8JbRy6aDOUjf5SUGb4nLem4ByKpy
         sWVXhU6r8JspcV+QFR2oAbJMG8x2Wwsv6MIqApa9OKS0BFEw3oEJfBMVG1pXf8pKxxnp
         u29bMM2f/VVYNWKt0whIhiS0tNqecrxAxuGJwjfk2xHMxUIm6l+UgOyA5u9JZSAVeh4L
         9TmZd46CNdlfGyd92UDQC15l+U+7NVWsmcjkrMWE9LqGQhPjZZV5QOITgPGSGEGsvnry
         F6Bg==
X-Forwarded-Encrypted: i=1; AFNElJ8jGNQWzfPfPt/ZuD3K9IGi5a9rT2TxC7p39VH7wKqNx6sdpGfhBlbsnaHvU1j8/palBOAbJ2c4I6fTUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxybXjRFn+xgE8qMnyh3hY9KXlWf6+GxOZzqKkuuyX1X21lKay9
	Mtc8ugkGL+vETkA5n4qi1ti8LfYCAGryn/A/nWuWcroLEte9EzGsM1tX
X-Gm-Gg: AeBDies4CKQaE97fk/ll4gzX4vCcc7sAnO3TsfVI85/V0p3l8a12uffkJedOHQwG6CN
	V8FNLYBoeBHaiOWmj/oojKnATere2B/XAvGpNIJ/AA5gQtKRvNaGMhbE0PLSmAT4WVR9ikKQyPt
	YTlU+7Egf/xkR6TORL65uZDBcIdMmBLpTLnHx+HJYgG+niskQCzVS+tBVW9L5FMsr40hwp73Yw7
	A0k4w2Wu84wzn4/tMalhiexL9WddOtSKSUFC5BSapedNI643OMLk/cTeoNk12G41jHRMoUvHAt3
	WKwRc2ykYQL3JT8B+7peHklJB/PN5N0QWO1rtld54OyAs1wRv1MBFuyPhTllq83lZ2D90plZkwf
	gdRwBS4IhZW09trYC92lp4BlBLTYQaHNZGLL6Y+Kn7TGO0iqS20aJoerbIK2XfE8kN+EvRX5SfC
	zN6ESVI23GSaOIhLZ40L/4ebPuLg6lZxa1JdtwMmujQHECqjU=
X-Received: by 2002:a05:7022:438d:b0:119:e56b:c75b with SMTP id a92af1059eb24-12c7287baeemr96092c88.32.1776362955194;
        Thu, 16 Apr 2026 11:09:15 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c641d18a7sm3423039c88.0.2026.04.16.11.09.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 16 Apr 2026 11:09:14 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 16 Apr 2026 11:09:12 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: Roman Gushchin <roman.gushchin@linux.dev>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, sashiko@lists.linux.dev,
	Alexis Czezar Torreno <alexisczezar.torreno@analog.com>,
	linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: add max20830
Message-ID: <cb47e2b5-5da8-472f-9c4e-7414b6cddf84@roeck-us.net>
References: <20260414-dev_max20830-v1-1-210d3f82c571@analog.com>
 <20260414043841.1ED2AC19425@smtp.kernel.org>
 <20260416-winged-ivory-mandrill-f1e8b3@quoll>
 <7ia4mrz2ssrz.fsf@castle.c.googlers.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7ia4mrz2ssrz.fsf@castle.c.googlers.com>

On Thu, Apr 16, 2026 at 05:45:52PM +0000, Roman Gushchin wrote:
> Krzysztof Kozlowski <krzk@kernel.org> writes:
> 
> > On Tue, Apr 14, 2026 at 04:38:40AM +0000, sashiko-bot@kernel.org wrote:
> >> Sashiko AI review found 3 potential issue(s):
> >> - [Medium] Incomplete Regulator Schema
> >> - [Medium] Missing Hardware Capability (Interrupts)
> >> - [Low] Devicetree Best Practices Violation (Node Name)
> >> --
> >> 
> >> commit 20a4d8dcd2f3344ac22d7d2e974bae1ef57874ed
> >> Author: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
> >> 
> >> dt-bindings: hwmon: pmbus: add max20830
> >> 
> >> This commit adds device tree documentation for the MAX20830 step-down DC-DC
> >> switching regulator with PMBus interface. It allows monitoring of voltage,
> >> current, and temperature.
> >
> > Sashiko devs,
> > Can we drop such comments? They are useless - we know what the commit is
> > doing, no point for reviewing tool to say it again.
> 
> It's the format which originated from initial Chris Mason's prompts
> and as *I understand* it's purpose was to make sure the llm is reviewing
> the right patch and more or less understands it. Idk if we still need
> this, but at least some find it useful: e.g.
> https://github.com/sashiko-dev/sashiko/issues/90 .
> 
> I'm planning to do it configurable in UI, but for emails I can
> only make it configurable on per-subsystem basis.
> If there is a consensus amongst hwmon maintainers, I'm happy to remove
> it for hwmon (in several days).

I find it useful. Please don't take it out. Maybe there is a means to drop
it from devicetree patches if that is what devicetree maintainers want. Fine
with me to drop it for those, or to drop devicetree feedback entirely if
that is what devicetree maintainers want and if it is possible to separate
devicetree patches submitted as part of a hwmon series from the actual code
patches.

Thanks,
Guenter

> 
> >
> > Please send only useful feedback to mailing list, otherwise this will be
> > just noise and going to be ignored.
> 
> Agree, but there are many sometimes conflicting opinions on what's
> useful and what's not. So I'm trying to make it as flexible and
> configurable as possible.
> 
> Thanks
> 
