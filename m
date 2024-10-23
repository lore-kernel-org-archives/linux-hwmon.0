Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53ACD1D0153
	for <linux-hwmon@vger.kernel.org>; Wed, 23 Oct 2024 19:19:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729711201; cv=none; b=hChZi62mIEWCqhzELb6SvA7VfJ1HNWThgDKT9vMK+XgI8x3pGZTgYHFpmCw5i5KMZMblC18oLU/VXybT8moo4x/nOv1SVSwW7x5EVMODJrEv9Z/WgbHrTjbNtj3QDDyd8bmDTTYx2qvoGXvgBFpAv7vJkYRgMOd/aYRcXdLR6Kw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729711201; c=relaxed/simple;
	bh=jVfaEMDiqxEbMojHP9PBFB3cC/z3et13Xb9WEIyCI8k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=o7lcUcf5BiQ6JrO56ZTC0B79XGO+aHX2zeEupQ/XabQaCMtKOFN34WCl6zI6ozIJTSHaq+v2uiYZbkV6D3LcTSQM/Te+qNy4EJcFQNeKJj9OfGBDc12yDtKJgpPIQQZlONAmUW2Lhc/ecmreTzK/qC/iJDcVzg9Qz0t/bjADCf0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org; spf=pass smtp.mailfrom=linuxfoundation.org; dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b=Jh3XAiz4; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-foundation.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linuxfoundation.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux-foundation.org header.i=@linux-foundation.org header.b="Jh3XAiz4"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-5c984352742so146392a12.1
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Oct 2024 12:19:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google; t=1729711197; x=1730315997; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=hmLs1fnyFuhch9ym0D8390T3Il2G3hywHxmDwOxNics=;
        b=Jh3XAiz4X+p+NMv9Z3v0DaoNUm/NyQJRjUGVGVTkrRlnMQAiiiNewDe4noafUJaIP6
         ug8NggQa+RKdSiGXWCo3otaQ/oRA5FYlYc89f+adMFUgm4uDxCKojRISecPpI3WuzWhE
         Kmr7FVDeWyZcy+Vo9PC6/igKDcwkF/WuzORkU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729711197; x=1730315997;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=hmLs1fnyFuhch9ym0D8390T3Il2G3hywHxmDwOxNics=;
        b=RFoNIt6yGT5l24G0bXFgenb0M1jqFMgPB6ShvuN3ZIMZoRJaSF08+xbG8p8ragQb3N
         Tii62Vw1WXEEaC8mBYt1WKznzQIYMb8/pRwYVuaZmsaUVjvvOjpADXKo/9Wwqmajwoqf
         hLM5vVMjsqtC3BSPo/ciwMU287snAg/rEoGT05vCFnY+E56y8LEVlUkHTgDuKY9XztFs
         hndTrkBHVY+C62fuTa0zvV6uE4PKR50HqC1eF/XrQwPcte4KrT/hwbNzxqDylvBZ+XU8
         hTLOrCUteYMB0o2Gui/ieOJ8GkzDbg5UhMYmYZGGxfW2fHZOeWgTwr++QgcMig/lnQLr
         6NFA==
X-Forwarded-Encrypted: i=1; AJvYcCUTaU8kJno17XqkJDcrvxWbMfVcfspiDMcYangYrMsYB6aMtEeiHKuhgMPwbWc4O34L5imeGeQ0kHLN1A==@vger.kernel.org
X-Gm-Message-State: AOJu0YwRTp7ZpoWfr+K6P7cEtW99LmbybkRQ5aa/pxu5ol6pcmP1WNoz
	txo64TOK1XX3WmMXrO7mSEdqoDtve6KItORwOYA/GFoaDdcRvfu5cUOFyZB2oJiQCq97zBSaWYW
	14S/seg==
X-Google-Smtp-Source: AGHT+IGCZx9c6m9NRbX049Iz9p+8xYsEtfC31GWV1agste9ojbDMXninML9WZHlmpnWcRK/FhnNsTQ==
X-Received: by 2002:a05:6402:35d0:b0:5c2:439d:2042 with SMTP id 4fb4d7f45d1cf-5cb8ac5785bmr3744061a12.5.1729711197509;
        Wed, 23 Oct 2024 12:19:57 -0700 (PDT)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com. [209.85.218.52])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5cb66c6b12dsm4803447a12.77.2024.10.23.12.19.55
        for <linux-hwmon@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 23 Oct 2024 12:19:56 -0700 (PDT)
Received: by mail-ej1-f52.google.com with SMTP id a640c23a62f3a-a9a0ec0a94fso9474966b.1
        for <linux-hwmon@vger.kernel.org>; Wed, 23 Oct 2024 12:19:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXiSlacUVfR9X1eQfDjtUteTQFTNr8mzS0P+6MD8/9Xcb4ssHXq83SCxSRwCxi4gb34vXcuacSMR2t/fA==@vger.kernel.org
X-Received: by 2002:a17:907:72d5:b0:a99:f4be:7a6a with SMTP id
 a640c23a62f3a-a9abf91ed4fmr407338266b.47.1729711194415; Wed, 23 Oct 2024
 12:19:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <a08dc31ab773604d8f206ba005dc4c7a@aosc.io> <20241023080935.2945-2-kexybiscuit@aosc.io>
 <124c1b03-24c9-4f19-99a9-6eb2241406c2@mailbox.org> <CAHk-=whNGNVnYHHSXUAsWds_MoZ-iEgRMQMxZZ0z-jY4uHT+Gg@mail.gmail.com>
 <e25fb178-39fa-4b75-bdc8-a2ec5a7a1bf6@typeblog.net>
In-Reply-To: <e25fb178-39fa-4b75-bdc8-a2ec5a7a1bf6@typeblog.net>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 23 Oct 2024 12:19:37 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjw0i-95S_3Wgk+rGu0TUs8r1jVyBv0L8qfsz+TJR8XTQ@mail.gmail.com>
Message-ID: <CAHk-=wjw0i-95S_3Wgk+rGu0TUs8r1jVyBv0L8qfsz+TJR8XTQ@mail.gmail.com>
Subject: Re: [PATCH] Revert "MAINTAINERS: Remove some entries due to various
 compliance requirements."
To: Peter Cai <peter@typeblog.net>
Cc: Tor Vic <torvic9@mailbox.org>, Kexy Biscuit <kexybiscuit@aosc.io>, jeffbai@aosc.io, 
	gregkh@linuxfoundation.org, wangyuli@uniontech.com, aospan@netup.ru, 
	conor.dooley@microchip.com, ddrokosov@sberdevices.ru, 
	dmaengine@vger.kernel.org, dushistov@mail.ru, fancer.lancer@gmail.com, 
	geert@linux-m68k.org, hoan@os.amperecomputing.com, ink@jurassic.park.msu.ru, 
	linux-alpha@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, linux-ide@vger.kernel.org, 
	linux-iio@vger.kernel.org, linux-media@vger.kernel.org, 
	linux-mips@vger.kernel.org, linux-renesas-soc@vger.kernel.org, 
	linux-spi@vger.kernel.org, manivannan.sadhasivam@linaro.org, 
	mattst88@gmail.com, netdev@vger.kernel.org, nikita@trvn.ru, 
	ntb@lists.linux.dev, patches@lists.linux.dev, richard.henderson@linaro.org, 
	s.shtylyov@omp.ru, serjk@netup.ru, shc_work@mail.ru, 
	tsbogend@alpha.franken.de, v.georgiev@metrotek.ru, 
	wsa+renesas@sang-engineering.com, xeb@mail.ru
Content-Type: text/plain; charset="UTF-8"

On Wed, 23 Oct 2024 at 12:15, Peter Cai <peter@typeblog.net> wrote:
>
> Again -- are you under any sort of NDA not to even refer to a list of
> these countries?

No, but I'm not a lawyer, so I'm not going to go into the details that
I - and other maintainers - were told by lawyers.

I'm also not going to start discussing legal issues with random
internet people who I seriously suspect are paid actors and/or have
been riled up by them.

              Linus
