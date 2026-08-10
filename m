Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6972E326923
	for <linux-hwmon@vger.kernel.org>; Mon, 10 Aug 2026 01:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.49
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786327095; cv=pass; b=s67gGwftSRyyG2oT+aqeIYhV8gsKMOgPOLBC1LhS7POOuQCoXs/gHZoBswcdhI+l8shupK1JR+GfY4RcLTgvHOmONOXvqRI6xh0+2+UBgVqRZQkUoBJul4VcqEN9TwDUGIsSTrDJjEheKAuYDp2+6mbGw4HVW4txfIY5x3r5yEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786327095; c=relaxed/simple;
	bh=mJzYbZhO4Qq1InnLCEPucOEEqNgD3mON0izUL18nAsA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=b4Ge7J6n2MRt/r0+AB4THZ6qE2g+ZwlGGXl69w3qLMcdRnh9NjxukiG7IA1shpAohJOGx0J6ZKegb80ID9kQ1HpDr2qjTxuAQ3fjLveTqZWKJuGFTmSK0F6j57br+RGcXDY2AQFLrZh3Sgj7ZYZyHSdr9EhzdyQzMME2P3jkZ9M=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com; spf=pass smtp.mailfrom=arimil.com; dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b=ErCJi4fW; arc=pass smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arimil.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arimil.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=arimil.com header.i=@arimil.com header.b="ErCJi4fW"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-c1671ec8692so158390766b.0
        for <linux-hwmon@vger.kernel.org>; Sun, 09 Aug 2026 18:58:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1786327093; cv=none;
        d=google.com; s=arc-20260327;
        b=FDjDX9yqcqSHoufI4IC2/BquGWMw7pMrePvTor5Z3+EnEPSHc8f31IuOmrrc+YWlFo
         0M9oqXq+dpDen/hfRKFeEcCJS+59uVO4nRews//WxE3e+o2FdK8Bt5ckvKtWuGMmzjWj
         LB50nVrI6GfoTyUF2mCycGW9mW9CYDBGMBo5MpaRdfbADpi1m9oS1Vjpi+F1j9bRZHQa
         7vLdS/EuXcmlDU/KpAM+qQr0ksF37Ozwcz0LiaJSPkUctw3oNW9lSOsTKuNiKkD6aZXK
         lwEhCm/yJYFTQiNtZDeWFtfreO51U1XB0A4jdrnjPggfxsZbYmCKWAmaSAHChOfx7pRa
         +QfQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=mJzYbZhO4Qq1InnLCEPucOEEqNgD3mON0izUL18nAsA=;
        fh=pTxiqqA97cKjrnBhz+XdxXG7IZEHQ3SLU6FqRniurgo=;
        b=gpjgdsTDVQptmdBLDkrvYUM+F25bwQCL1CZUkG4tjqRjNvBOhEnQhN6pNM9mjZrqBY
         29Lr6psiQ5x1u6BXtKYv8cmvtV/tsx8e21gHCjNFuYmHRAodj1TMF9ZE1zeLIRr4EzRb
         ltTW8DynaQmOuazj685vhiz/3Q8IrdjBm1IsLWP0yKGAnh77wJB2y9vPHEO9m5GjtQZb
         r/3NV5WRbAkEl0cM+S+6IHAY2qBPRCfxWso9e9KPrdJVSs4E/87lIiCFJQD0DnXOwzyo
         8yLzvstKawOx5fzdmTICHPaR13Q+VGecIuyVSf1kTg4c52uKORPkxhGORIiCJs5/esPe
         TPPQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=arimil.com; s=google; t=1786327093; x=1786931893; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=mJzYbZhO4Qq1InnLCEPucOEEqNgD3mON0izUL18nAsA=;
        b=ErCJi4fWqWoyg2tMGce0TXrPjwb7S3JpaH4Qzil6vNJyBeWClaxt0O94MTNIK7LnKL
         rRs6lYjyspr2L2cKSOVz5xVEXanymTL2ad5W3gRbmLv+i2uNX2GVKKHbGQ12HqDmr1BX
         iclFDinaju72GpwrgMR5z9prcjlCVgkFyCwzb1p8fLwLuivvzVxVMcwSvZGt0UqW7IMw
         cX5eX38VmMtmwDxLnFeK4HnAbZ3BpjGXep5eeAMeCR2p0x8vntteviVrg5VRQbYGm93M
         ONSpLvcATC8KM4OLQ6FXQvBCTM4nsCdbm3aNmrowwcuE9lgOaE2Xxv/RuU2qDUYd3PwU
         Mp7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786327093; x=1786931893;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=mJzYbZhO4Qq1InnLCEPucOEEqNgD3mON0izUL18nAsA=;
        b=P7Vl2h5zx0ylMXVZmmDnkf+QxOsfEy7MQUaMR6tifCgY0PN8a2nyq47IJTQYa1/5yf
         bKsIXuwIx8yaK6SuN1IFTTiTgq4d+7jMHf0/TcQSe3jh1ZDSwmdPZM64WcjtS9ud7cn4
         OH8Y9/aK9hRZfI+wlKe5QA1CfM9miP5kTSvrLJv1o8CfffbY4nDSDrmu91f+L4PaA0S6
         YLhSPwsh4A0lg7ETQrFSjxUSrRkpg6bRx/VAJr0yHrhNBRy/F/35IaFbfmQRr0DCARA3
         vee1RiJrbPZ9pV2NrhuFQZaUjs/2POySEsh0828oZFHdZni8JGMGy/NoJXpWPlL/4V86
         8sJQ==
X-Gm-Message-State: AOJu0YydaiYBqS2cCC3VmBdoeX6R5chqLqIODNWqyPZT0hrFObtCNvZJ
	Rzwbhh/sy+RGteskDO1KCKpLSCwYciebW8FqCrMb666wxKgWJ2B9cr6/KnSwSAwf40xTLInnTeX
	obuFyO07P8/ReHwj/Mgr4K4xeGavj9LIgjGaKLR6QEt+Z7+BVqNZS9mHacg==
X-Gm-Gg: AR+sD12zbFA6QV/gPZNVNR+9/262+zxpGIau7JBsOlUe6xhyDdLGElDXYkw4vlyVBq6
	B+jmKTvEuWPuVKx45vtm1S+gYEdJFqrfhSAMtJSxR0O0iD688gJKYKDAbowr7IHWfKz2iyKb1N9
	1LclA2BJzZbYSYgEnVsuIxrA6aFUDOFVJE91trmwXekPdBuIjTRcYSRCaLE2JHOPK4AA3yptZw6
	l8C9cDzlN4KvEXYXvTshn2MFiB8qsF42ryH1AwLkUxCQi2FvQ/ctuF2+24QSZIk2gtQt4TDCx+2
	OuO60N8lUJmKnT72hLWVH8nlKwxnSQ846hI5BzfzDbCtOw==
X-Received: by 2002:a17:907:608d:b0:c16:1227:e3d8 with SMTP id
 a640c23a62f3a-c2039b51b3cmr1787309766b.13.1786327091981; Sun, 09 Aug 2026
 18:58:11 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260807000107.1786892-1-renari@arimil.com> <20260807000107.1786892-2-renari@arimil.com>
 <20260807001412.B61901F000E9@smtp.kernel.org> <5a817284-a9f4-48b2-9f0f-802c5dc6963c@roeck-us.net>
 <CADBHdQ3x4bFe518q2PjZvGJ2=qP45+5Cmm8f99J9gRZCJun0aQ@mail.gmail.com>
 <d7bdb634-6fce-4bfe-a24f-864d20e46d92@roeck-us.net> <CADBHdQ3LhfunbnwCE2AYmWr5XwqSvJ8WGkQFW1G=GQv4dp=Ndw@mail.gmail.com>
 <28fd27da-ced5-4c2d-bbb8-0eda383bf767@roeck-us.net> <CADBHdQ1z5pp6FjdensAVYTEbJ+DqU55uP33LvFVCMh6cpQo9kg@mail.gmail.com>
 <d54a5f1f-b369-43d7-906b-43bf6189cb42@roeck-us.net>
In-Reply-To: <d54a5f1f-b369-43d7-906b-43bf6189cb42@roeck-us.net>
From: Arimil <renari@arimil.com>
Date: Sun, 9 Aug 2026 21:58:01 -0400
X-Gm-Features: AUfX_mzVVT7xLL1Z9RZGUFnlPJfNbBYaQyq5PCy_MPKTQR2B_PbkhVTzmPh4qzs
Message-ID: <CADBHdQ0TyQiAke+fMLs0hgOhbE7b0h_FopzZ6Qcmn0L9j0F=dw@mail.gmail.com>
Subject: Re: [PATCH 1/3] hwmon: (asus_rog_ryujin) Add per-device configuration
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Aug 9, 2026 at 9:19=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
> Please stop top-posting. Then why do you even mention the downstream driv=
er ?
> Its existence and/or status is completely irrelevant for the upstream ker=
nel.
>

Sorry for mentioning something not relevant to the kernel or this series.
