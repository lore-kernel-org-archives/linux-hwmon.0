Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DD243E1730
	for <linux-hwmon@vger.kernel.org>; Mon, 25 May 2026 08:37:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779698225; cv=none; b=sIpau2sYO6Eb2im3XXCWvOVfDzTambX1//tjsoRSUYnZ37p9JRZrajFtIsJj8ER+qBPBDE0+KDZG+cIwQm6M1tidI6tyaYEnjChO1bI0/HxHaHTAFFBamRfTDWkOgCsK2UB7oAoCTsrlcANGQ7pXa8nWBYIUrWtd95X4MOs7V9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779698225; c=relaxed/simple;
	bh=IEiv6ppFYux2Sd53XihNqei/CAFoKAVx3MrnHuAZjxw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=BLW7B5Zr8GlQ9JfBXoFa75aUMiWCe6WrKPlIKSJodg6VU46YtjcOTp9REriEC4VR6+AHpCzgc4TVQE1vpG4xS7sTmdwTmKITmL4V3ZzA9TJ54Z7mrK1Cx6PqlakBja5ae0APNuTy1QYJFu87g6gPPsDL1SN8oV13LBOTqN3d60s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KXkBTgeJ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KXkBTgeJ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E71161F00A3E
	for <linux-hwmon@vger.kernel.org>; Mon, 25 May 2026 08:37:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779698220;
	bh=IEiv6ppFYux2Sd53XihNqei/CAFoKAVx3MrnHuAZjxw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc;
	b=KXkBTgeJLNoKTQvHv+m9wPcQedePDSn86veOdJCQ3cvT8s+z2AqDxhTJE+QrIQht/
	 QUNpSBKC0i+wdrAcJy+30m/1fUltR54ytX5w1xue9Cen6Vbrp4lLgNNa+s4TIwkyj/
	 pprqjq1qEs24dbH7TMk7R/eb/UBDIvLk3l/B04YYVGaNhF6WZ4iMr4EJ6wVC7r43J5
	 kG7f34DlXAnsYRTnFlbf23VDLlVceIaOT+zwV0ro29ASmUZULWQIAqsOigR0KL6nAv
	 nktID94RlFIqnGK73x0bC8bqSdP+VaUrMJdeVVSFU0SH9yd62QFaabIanwaVUkNmAy
	 2/tL72HNCQhLw==
Received: by mail-lf1-f50.google.com with SMTP id 2adb3069b0e04-5a8fbe18b1dso14975673e87.2
        for <linux-hwmon@vger.kernel.org>; Mon, 25 May 2026 01:37:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ+aoOKYWk2QZAE5n2gmqUtNjMaKAw6GiS2JjULIxawGqB5ekdSSgpIB13K6DHM2ANSB5nsyBlOOuweBmg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxBFDt0jOKAOrHfwfO1X+y/34rT6yQnfkg8I9Iq3vODaHXsKbTR
	XQdhksCCdvBauNIEcFPCmsfe8XUcs19fgDlpye2lNP66FYPLP3JT4VBShHr8Zmlqt0FmnF7FtPl
	u4aPwq2EB88C4+5x/hffEFHs/rU9MMbk=
X-Received: by 2002:a05:6512:1082:b0:5a8:96cf:c8c4 with SMTP id
 2adb3069b0e04-5aa3232a140mr4367217e87.15.1779698219721; Mon, 25 May 2026
 01:36:59 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260516-adm1266-gpio-fixes-v1-0-38d9dd39b905@nexthop.ai>
 <CAD++jL=rasuYTot3M8u75PXRgrhbCzpue=pY2Yxx7ymVwhgGGQ@mail.gmail.com> <8855d587-8351-42f4-8f79-9e763f56ccf0@roeck-us.net>
In-Reply-To: <8855d587-8351-42f4-8f79-9e763f56ccf0@roeck-us.net>
From: Linus Walleij <linusw@kernel.org>
Date: Mon, 25 May 2026 10:36:46 +0200
X-Gmail-Original-Message-ID: <CAD++jL=TV-UEJD1dZVfWhv3rCG4B_9A7bA56ZXOiLmaYGysYQw@mail.gmail.com>
X-Gm-Features: AVHnY4J4wRuxqubn3frRZE4rkZoNRmpScnrgJSL-JsP8y2yZAjddaBh2LbJNBeM
Message-ID: <CAD++jL=TV-UEJD1dZVfWhv3rCG4B_9A7bA56ZXOiLmaYGysYQw@mail.gmail.com>
Subject: Re: [PATCH 0/2] hwmon: (pmbus/adm1266) adm1266_gpio_get_multiple() fixes
To: Guenter Roeck <linux@roeck-us.net>
Cc: Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
	Alexandru Tachici <alexandru.tachici@analog.com>, Bartosz Golaszewski <brgl@kernel.org>, 
	linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, 
	stable@vger.kernel.org, linux-gpio@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 19, 2026 at 12:25=E2=80=AFAM Guenter Roeck <linux@roeck-us.net>=
 wrote:

> > 1. Convert this driver to use regmap
>
> That would mean to convert the pmbus core code to regmap,
> plus all the pmbus client drivers.
>
> PMBus uses a mix of registers/command with different size, plus some
> block commands. That would be a difficult task. Byte registers can be
> mapped to word size, but for block registers that is difficult,
> and then there are commands with zero data length. Maybe someone
> managed to do this somewhere. I tried some time ago and could not get
> it to work.

I didn't know PMBus was that complex and honestly thought it
was something simple that had been regmapp:ed ages ago ...
allright, definitely an exercise for another day.

Yours,
Linus Walleij
