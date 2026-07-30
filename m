Received: from mail-wm1-f46.google.com (mail-wm1-f46.google.com [209.85.128.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E9C68411A01
	for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 11:07:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785409641; cv=none; b=f2KzU5gImgBQe+Gs4rnEJwWf2KQYNTtfxlfhqx7V4ACQ986v+aD4PtMJQYnCdVuw0lYPbraZxpQa5dSlSGpxRrzVNJOhYRB5Fgd9DbvdKrJ9GpBjb4Q96LDpd3Ny7pqU920BoDKpjPYwQx0ym07tBfWts5EIT1g9YTMSmWT7/jY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785409641; c=relaxed/simple;
	bh=eJjTVRMZVoKwofLWi3LVva7SIn7zgP+PhhVCCay9rrI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XoMIgh0INhSoBQqK6DXS4LV0U2QrxmejfbjQ/fe/sOn8jYkyI+gkdGkGOVNJP0ylUN6WhfXSJCrccUS7VHq+6RdaoKaXZRNgtkmEKe5aEdNEisWgywHA0oVLIGgGyIPeKFDNcknK0KBAIPnApJoHXvjRnuAyl82yLdwAe5Gk6lk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eho55y+C; arc=none smtp.client-ip=209.85.128.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eho55y+C"
Received: by mail-wm1-f46.google.com with SMTP id 5b1f17b1804b1-4954a32cf1eso9858655e9.3
        for <linux-hwmon@vger.kernel.org>; Thu, 30 Jul 2026 04:07:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785409638; x=1786014438; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=rzwQZ2FZuL5P8Gv1fpsnj5lYgdyhcN4VWRCQhBah8Ng=;
        b=eho55y+CVoDy2oye0k6Ku9EAGvlotUAm5pXldS0dS0TpZm6wwjbH21pE/g+pTmTCpX
         9nXo9TgZ54wKxUUesOrQ2ve2pkPq5S1B5oVqFlxwZT4duT4Dvi803MF75pXGZP1rKhLS
         VO13oq+RHsRRupSOpLBoLcuwSk/5ROCIsBc+eCusLIw+a5yJZ/zQ1nwdbOIDt3BLzNgT
         tAxzmd9qlhYMRI28MwKFq0X3plpYVL+7TKoLj32PnHbxYPTLBdEJowG4oaVxGCp1iMtu
         wloq3Nklh8ipNvBKEg1SwAnHUlG9kPre/3PFRDUO02hBzSlJfacuCB7FbLapn8hTeLTC
         OAnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785409638; x=1786014438;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=rzwQZ2FZuL5P8Gv1fpsnj5lYgdyhcN4VWRCQhBah8Ng=;
        b=UYlyF+bdIZUJyz5FBgnHhWuo11EK6wXMuXx/fLNgvpepwB0TbLTh7tEKwxfhIU9HpH
         seq/jCSuV7FIC239LBVEp0oWuv1ZKiZMKcMe0GgcuUPsQNA3ynggY/Maaxm6Jx9BboMP
         f8e4BkIfRbgeJuRWJpHBwV0xdIwTI2zAgFEKlRfZPNXPjPT4EjupQFF5P+rHXYSPCpJS
         28Z5RTeqT/8ODGYxTQpsrQCj8UU5uak0WSpzPjgcXwFSkxZLcLS7aFXxi9JQ+lwIV+6w
         /q48QHa4+3wuXyh9QLOtA9akdnkBkQVb0nfcaR3gN3nZq5C/k8Di1FhO8xEre9z5gfKS
         3i2A==
X-Forwarded-Encrypted: i=1; AHgh+RrxJSTVJggroYII28QeF8kl9pfwwoOvTr5SDBrx2ju/uvhUt3rb3uRMMds3ermJDz5HaRaV6RZ0azCtYw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxreeH8MlGKtREndiVjxv4waZpLSH6SDBTGWtTdJC0MS36nkAqz
	tswybadvnvS88bXoOl/8dzGpLZvlC3qwPBvDFiEH78zUwlFc5gIAfEFaiQBlAQ==
X-Gm-Gg: AR+sD125cRBhCfn62c9W9aFQg+yJO+TeuOVj7L+E4KTeMqupHbZL51SiPWn4fAteGWY
	UzpWIk8VtgtY4/qpQBCHcAVwgvQJVUwqVFORou+/U5FzP2FffsfrR8SEZqNkmGDjXCSGbxoqfDc
	qYKb+ty/1BFMMMkmatysrKc7RKnsznQgmBGAusdgPm4qW1pK9gSzM2yu+xBnNhlzHw3gV6n9y43
	9n5/oF93vwOqCpPpFi5aQZjeLWMrcVdvIFIelneS+fdGvfZ3yCjAjmCyj9GDnzbQtUNRho157f1
	FFcnpvglHwRRfuxyShuHFrEG7sJpvNpyYNbFFuofysXKAe5sD9Kw7vmfy0Bn5WhAvblaM/LP5AN
	UgLpxDmYulowtYZttZjmZxJnnWh4T0hGLWlaLUqNbAIv22JVvTUncab12IswCT2dwMvAnJQgLwM
	6dmH1snFsneso6oFBdT2kelO62dMzxitRiBeOF/Jf458/IIOmxz3vH
X-Received: by 2002:a05:600c:19d3:b0:495:6b78:6f4 with SMTP id 5b1f17b1804b1-49800e70069mr27708485e9.8.1785409638030;
        Thu, 30 Jul 2026 04:07:18 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-498010a0ae3sm54406785e9.9.2026.07.30.04.07.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Jul 2026 04:07:17 -0700 (PDT)
Date: Thu, 30 Jul 2026 12:08:27 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org, Mark Brown <broonie@kernel.org>, 
	Alan Tull <atull@opensource.altera.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: Re: [PATCH 5/5] hwmon: (pmbus) add support for MAX20826 and similar
 devices
Message-ID: <amswd7M_ROGC8VGg@nsa>
References: <20260728-hwmon-max20826-support-v1-0-224766e0acd1@analog.com>
 <20260728-hwmon-max20826-support-v1-5-224766e0acd1@analog.com>
 <amnvYB2Occ911k3B@monoceros>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <amnvYB2Occ911k3B@monoceros>

On Wed, Jul 29, 2026 at 02:18:55PM +0200, Uwe Kleine-König wrote:
> On Tue, Jul 28, 2026 at 05:03:52PM +0100, Nuno Sá via B4 Relay wrote:
> > +#include <linux/i2c.h>
> > [...]
> > +#include <linux/mod_devicetable.h>
> 
> <linux/i2c.h> already makes sure that of_device_id and i2c_device_id are
> available and <linux/mod_devicetable.h> is going away soon. So please
> drop the latter.
> 

Argh! Totally forgot about it (I have seen your comments about the above
in other patches). Will do

- Nuno Sá


