Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A4452DF128
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Apr 2026 14:03:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775052236; cv=none; b=hg6tVpuolEviVqyyY4hLNlxucXigoeWi28/QlY1uvihjG9r72qW/wKHBfZfv4tca6erWz8HfEmTrNZwHHZf2crjCQ7QApcKNU2bHVM8gnsw4ZswMSsy42MRqWyVIUiLcg3Bmj6HWOPg4nl4FdMgifB2SQyEkWaAok0ZHDet0FZk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775052236; c=relaxed/simple;
	bh=SGCI4fsQhkaGTbbP2PJjfRfwzOSjN0Epesr8zDMhWAw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=W6i91+mAScNcjNzAQibSrVYHVnzV1Ep7uWyZWkkwJMRwcYlPpLa+UCnoX5lYSalxAovT3/xkTMYW3uyGJPh7cL8GjH6kL4PUqIwtOS4C2Kd1lHdkD+tE87qaqN9cA4c1WzlHY/xDElTGn/1gA23ewECJjEYoNkHY/uaSzAXUlnA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=asorNbkY; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="asorNbkY"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02DDCC4AF09
	for <linux-hwmon@vger.kernel.org>; Wed,  1 Apr 2026 14:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775052236;
	bh=SGCI4fsQhkaGTbbP2PJjfRfwzOSjN0Epesr8zDMhWAw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=asorNbkY+VGAHkIDOQa99YcLwbC5VlJmNBrPYqXqTJGN1oUd0asbj4qf9+M+U4dji
	 g1WC49LyqO1o09pbQsPfZHmGhsJxc4XDTdY7dwqyViQlkxJ16jmS7HD72y7altJn/+
	 z6QkgZGj7vNZAqib26QzQWKVw69TA15D0gfaW31xNcLY97DPUdREZ/k85Ky3ZKKaxW
	 FR3j5Q4ffE06mhSTsrrci2g1DuVr5I+t0LIS6hQs1n8xdiv//w3BxX3nYhqLQ8Xslu
	 ZL0ZcKG24JtXl2+3Ze5IYaoWKW6zjDLVsLReILj8tBHG2d+djIdtoRu9xZE1TvkrKv
	 JrF/sFENlvEaw==
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-66b2d49ffb0so6865715a12.3
        for <linux-hwmon@vger.kernel.org>; Wed, 01 Apr 2026 07:03:55 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCX3JO0w9ze17Pa53cTkuNcPUVOXFqUB5y/NBV747SE6OovDATTsPnrtlrc6iFaTrwMDjk+9Ssb7R4iNfw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwWtTqDAbLbeWasci5kMg5NxNq29EOxaazv1A/mlHXTfHZ5gdVn
	CwY+cmNDJ0sEONYo8TITbfB7KTLqJvC32U7TsyGbFzgjaaS0knjRDyh9r4cD4D/S335yDv2fPzF
	ZhreVr0hTAxTOXJJO4CC3LHJdxC5Umg==
X-Received: by 2002:a05:6402:1470:b0:66b:b6d7:df47 with SMTP id
 4fb4d7f45d1cf-66db09e27d7mr2641020a12.13.1775052234501; Wed, 01 Apr 2026
 07:03:54 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330-ina4230-v5-0-eeb322d95b3a@flipper.net>
 <67a5d1c1-a9c5-47fb-a0ec-5b69a991b01e@roeck-us.net> <20260331155246.GA1299761-robh@kernel.org>
 <20872ef8-f68c-4916-a05f-404fd49fff00@roeck-us.net> <CAKTNdwGcXcE25QiBTrZO6akMad+Lny5iPvAAAmUt6x2Hyzu5wg@mail.gmail.com>
In-Reply-To: <CAKTNdwGcXcE25QiBTrZO6akMad+Lny5iPvAAAmUt6x2Hyzu5wg@mail.gmail.com>
From: Rob Herring <robh@kernel.org>
Date: Wed, 1 Apr 2026 09:03:43 -0500
X-Gmail-Original-Message-ID: <CAL_JsqJcqMM1LK1dEFvjRWdOc8g=7+G4VvF-jmzbSJ1ijBB=1A@mail.gmail.com>
X-Gm-Features: AQROBzBc9EnjuxZ3X3qDBWErhdwoqW9DR-aRGycYdhakIyR-QawFuda4ds96piM
Message-ID: <CAL_JsqJcqMM1LK1dEFvjRWdOc8g=7+G4VvF-jmzbSJ1ijBB=1A@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Add support for Texas Instruments INA4230 power monitor
To: Alexey Charkov <alchark@flipper.net>
Cc: Guenter Roeck <linux@roeck-us.net>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 11:46=E2=80=AFAM Alexey Charkov <alchark@flipper.ne=
t> wrote:
>
> On Tue, Mar 31, 2026 at 8:10=E2=80=AFPM Guenter Roeck <linux@roeck-us.net=
> wrote:
> >
> > On 3/31/26 08:52, Rob Herring wrote:
> > > On Mon, Mar 30, 2026 at 09:07:32AM -0700, Guenter Roeck wrote:
> > >> On 3/30/26 08:14, Alexey Charkov wrote:
> > >>> TI INA4230 is a 4-channel power monitor with I2C interface, similar=
 in
> > >>> operation to INA3221 (3-channel) and INA219 (single-channel) but wi=
th
> > >>> a different register layout, different alerting mechanism and sligh=
tly
> > >>> different support for directly reading calculated current/power/ene=
rgy
> > >>> values (pre-multiplied by the device itself and needing only to be =
scaled
> > >>> by the driver depending on its selected LSB unit values).
> > >>>
> > >>> In this initial implementation, the driver supports reading voltage=
,
> > >>> current, power and energy values, but does not yet support alerts, =
which
> > >>> can be added separately if needed. Also the overflows during hardwa=
re
> > >>> calculations are not yet handled, nor is the support for the device=
's
> > >>> internal 32-bit energy counter reset.
> > >>>
> > >>> An example device tree using this binding and driver is available a=
t [1]
> > >>> (not currently upstreamed, as the device in question is in engineer=
ing
> > >>> phase and not yet publicly available)
> > >>>
> > >>> [1] https://github.com/flipperdevices/flipper-linux-kernel/blob/fli=
pper-devel/arch/arm64/boot/dts/rockchip/rk3576-flipper-one-rev-f0b0c1.dts
> > >>>
> > >>> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > >>> ---
> > >>> Changes in v5:
> > >>> - Reworded per-channel subnodes description in the binding for clar=
ity (Sashiko)
> > >>> - NB: Sashiko's suggestion to allow interrupts in the binding sound=
s premature,
> > >>>     as the alerts mechanism is not implemented yet and there are no=
 known users
> > >>>     to test it. If anyone has hardware with the alert pins wired to=
 an interrupt
> > >>>     line - please shout and we can test/extend it together
> > >>
> > >> The bindings are supposed to be complete, even if not implemented, s=
o I am not sure
> > >> if the DT maintainers will agree here. We'll see.
> > >
> > > Given ti,alert-polarity-active-high is added seems like the interrupt
> > > should be too. And the interrupt can specify the polarity, so is that
> > > property really needed? There's alway the possibility that you have s=
ome
> > > inverter on the board too and the interrupt polarity is not enough, b=
ut
> > > solve that problem when it actually exists.
> > >
> >
> > The alert pin can be attached to a board interrupt, or (more likely) it=
 can
> > be attached to the I2C controller's alert pin. In the latter case there=
 is
> > no interrupt property.
>
> Alright, I will add the interrupt property and keep the dedicated flag
> for alert polarity.
>
> Following the logic of binding completeness, should I add a flag for
> the single-shot mode too, even though I dropped that functionality
> from the driver in one of the prior iterations?

I don't remember what that was exactly, but that sounds like a user
selection which would be some sysfs or other runtime control rather
than in DT. Unless the h/w design dictates what mode should be used.

Rob
