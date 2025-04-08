Received: from mail-lf1-f46.google.com (mail-lf1-f46.google.com [209.85.167.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 128A91A9B32
	for <linux-hwmon@vger.kernel.org>; Tue,  8 Apr 2025 06:52:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1744095147; cv=none; b=AJr77CZXIl+Y9SO8xXb3hkgScjycWBfhzJ6upzX940+TI3CmrfocsxoEPmX0djlknQ4RZJnnz3tsUdjNHK4tTGNyAnFNhoLXGa5tbEw3fcLBDwgvnANdl/egSe4G5jl+tWbROLYy7ZggBla8yqk27rOpozsFacqjd6gXCwuVJVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1744095147; c=relaxed/simple;
	bh=vf6oJzq/bPFc/YRQCADH9ZXRKMlsCU0j8KOzZ+98lIA=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=DZ5u5rV+blb4LRcQRj3FQ4uxMYWJG8gv+lEPWi3oSfRD8xwWJydxXbledEjagwEcSc3UdsuSa9QUYImbUVIqnnwHI2e4H3cIoTxLw1w26f2MzWCWe7cZnK6fP7/oUM91jjatckl5fr53bY4J76jfECCLPaP8qf0SyxlpdJ4a6I4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl; spf=none smtp.mailfrom=bgdev.pl; dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b=GIydpwTb; arc=none smtp.client-ip=209.85.167.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=bgdev.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bgdev-pl.20230601.gappssmtp.com header.i=@bgdev-pl.20230601.gappssmtp.com header.b="GIydpwTb"
Received: by mail-lf1-f46.google.com with SMTP id 2adb3069b0e04-5499659e669so5411617e87.3
        for <linux-hwmon@vger.kernel.org>; Mon, 07 Apr 2025 23:52:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20230601.gappssmtp.com; s=20230601; t=1744095143; x=1744699943; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vf6oJzq/bPFc/YRQCADH9ZXRKMlsCU0j8KOzZ+98lIA=;
        b=GIydpwTbNPedqgAnaJIwidgN/W7voMlgFtnLGRtw7G2AmPn7mcXzizlnHOj2gSGU88
         jkkPtcik+b9YZJkjQseDT+GxHKJ/ipaDo5bTyr4HPw/kLvOfwccXI2aUpqsg5WsEvRKp
         JJBev78fFMe4a7Z15hJrtlRhMYj8remMjmX8CgYcQixFk9TUtwtgTxk8THEt+RooapWq
         nb37END5+D7cns9j5cS7cvGwR8Lv5dWK/i1gnvBMGb+RXzfra6Pw6fG3V+f1iRHtpLUD
         hRrgFXO6YRb6HeOygr8JQqf4FeLuuCTmbUiwGqp7kOAVu6PXcWNQM/BAT8KOOKYn/Vzw
         0kbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744095143; x=1744699943;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vf6oJzq/bPFc/YRQCADH9ZXRKMlsCU0j8KOzZ+98lIA=;
        b=iv5P+3bagKAHR3WDEs2rQl0TeuYg4N4qcwyEZoEV+u2tIgXmlt2seo5knwmhEvKsqn
         HCRBbHgHQuBHsSqObPq4efEKKslsTwqT4RWhbPij/yvGnT9ef/M+m9XvcNYcD7uszLtB
         gwcjHd4p5V3yWObP5ipuN0W3IV+V2x7WwclRFexwKI9m5Kjh1kiJlQb+UsY6XIZzFDpJ
         Rdu0Ix9IwMvL+YE7Vaoy0fMuTy/yrKfEomoyzSasIZ5Hr+jZ6Zzousq02OZJWD6wO06J
         X4YLjIEsdGYrLJmT57iwWNtMkdfAeyi3P19VIeC1r1Jsk3lc0N1jIGUTmdOQu8YPPxBQ
         +buw==
X-Forwarded-Encrypted: i=1; AJvYcCUuMuaNJnNUItZMoJCO/vAgis58E5pRXv3JlW/KeL0I0DhHOlPZKd6zG+HffhsTZaUIz3O3RjvRtZYMDg==@vger.kernel.org
X-Gm-Message-State: AOJu0YwH3gXHS1bU+Jstopj0bYFsxlEUt995N5f4TJURpgZ9XB5nFD+g
	CT0jv98pbafPZm5JQ/8jsbmAN6MjIGOQwCyvVSL3MCk+aAD/YqtviMcEhY+iv93wBxUYs9RnWAY
	eNSDvRGPaHMsTxlUQs1VBQT7Il2WZ2REjDWLoHQ==
X-Gm-Gg: ASbGnctdcMSwUNs/A2NUBO0FXCqG0dNWrjHfhGBLd9OQ8w0KfvQPQtAatQ4Cx/kj2ir
	0fcdbNZJvxcPz8iVC6SBTjFh9WiLZYWTmSAuhVSi+7IQngQGNxPTWDUn4WS4kqkcv8h/pZa+XSf
	a4RWnU+1lAQXQ96z8idD+xq17YAeVM8WySVIYdgqA93N+S4acZz/QhTT8K5g==
X-Google-Smtp-Source: AGHT+IECuXwUgttIYmipcRZs483+Xh+G6HX0MYQ2jLg3x657dEkCs1xbA89taTjzPBp/9Tj6/5D3zg4rfFi8yu6LhXI=
X-Received: by 2002:a05:6512:1191:b0:545:a1a:556f with SMTP id
 2adb3069b0e04-54c2280c627mr5194521e87.50.1744095143040; Mon, 07 Apr 2025
 23:52:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250407-gpiochip-set-rv-hwmon-v1-0-1fa38f34dc07@linaro.org>
 <20250407-gpiochip-set-rv-hwmon-v1-1-1fa38f34dc07@linaro.org> <134ac671-13f1-4d29-a81b-a0b7285fd049@roeck-us.net>
In-Reply-To: <134ac671-13f1-4d29-a81b-a0b7285fd049@roeck-us.net>
From: Bartosz Golaszewski <brgl@bgdev.pl>
Date: Tue, 8 Apr 2025 08:52:12 +0200
X-Gm-Features: ATxdqUFQ6EJKtiHczeZsGSim0VXzSIH6RtKdJovw_Wse8g2c6D3jMpykHOalA7Q
Message-ID: <CAMRc=MfUvhPK55hNy2jkBMp4vdaWkyNtn-W6hxzVFvLNU_jvLg@mail.gmail.com>
Subject: Re: [PATCH 1/2] hwmon: (ltc2992) Use new GPIO line value setter callbacks
To: Guenter Roeck <linux@roeck-us.net>
Cc: Jean Delvare <jdelvare@suse.com>, Linus Walleij <linus.walleij@linaro.org>, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-gpio@vger.kernel.org, 
	Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 8, 2025 at 12:00=E2=80=AFAM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On Mon, Apr 07, 2025 at 09:16:16AM +0200, Bartosz Golaszewski wrote:
> > From: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> >
> > struct gpio_chip now has callbacks for setting line values that return
> > an integer, allowing to indicate failures. Convert the driver to using
> > them.
> >
> > Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
>
> Applied, after fixing the multi-line alignment issue reported by checkpat=
ch.
>

Huh, I always run b4 --check, it didn't report anything.

Anyway, thanks!

Bart
