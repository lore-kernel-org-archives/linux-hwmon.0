Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 923E137418A
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Mar 2026 08:29:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773649771; cv=none; b=u7E5fvqjDOEzkz2NLavNKNSBsM/lH6Otbnl5AtCTmrlqIVUzHGD1nnJ/6UfKpxsleuyuNfc2mdyNvPPqt0f9vEj2ncJthWybjn3hsr0AcoPi+QFU/jubEBJ3PVl0SU+dq28W6gbL2QNGCVuNPnFkgyTNI7j5RMWd6ysw4aaGIhA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773649771; c=relaxed/simple;
	bh=hwzxlHqOQjGJQ+Mize8M6nnnmbTo9unPGCkFg7bS8CQ=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=tr6yzR9c6FJ6qU6YO/tYBvOoHFBPvLF39Y5fDt+IjmoHsxZjpoDFa3SLvvT4BjS4G5FSpUrRNMXGW4lZPxLYzmvwGkDdY25WgVWlS3CJdSupxpnEwPpEsXHAJ4+v1gzrJDWrpeg9kyyjmw6aCRf8loVV5ncyjgTYxcIBCT8+WuI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lu8RzEfg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lu8RzEfg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 58A08C2BCB5
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Mar 2026 08:29:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773649771;
	bh=hwzxlHqOQjGJQ+Mize8M6nnnmbTo9unPGCkFg7bS8CQ=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Lu8RzEfgkdIW+kC4uHxiWhzeJyXhwjT8dhDxwAG6nvx/U0bYg5KRVmyT2b8bYkjAs
	 niCJU1YBwLIsyRPVx/Y0ERfbabTB2AXp0+Z78DZLHt9bYOGjdE/RPHL9cTbcCWcQe0
	 9FpDi3rk5O7gDQGsVommTC7YvocZM7yJT6MatoE1cw6utILxwDbP59IcVHQz+FlSNK
	 AHf61EDyzQhCVsFYlGGDYtKae+yolBKUk7Ex44GsNPCGZpZzXBkj+7Q8YEdh4nnEwW
	 KojJWUNhhUgDEUtdkz61aLM2rNmvpF1VuB8LqqWVye7ds92sSb0HP7omho6DWn9LM9
	 Vj7jmbNQm+Qgg==
Received: by mail-lj1-f178.google.com with SMTP id 38308e7fff4ca-38a49fc06b4so32385621fa.0
        for <linux-hwmon@vger.kernel.org>; Mon, 16 Mar 2026 01:29:31 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV8fVVDoLhYIWrwSEE1nKR34ydmhLUe/AEm81ovjh9Mi3HHeSoQsC/ugYBwJXsbjq8Khqa7mRhKFkGL/w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyy8APb/+NDyrIG1X3SSBffg5TAV4ApdGqrpl9gYXlHoCpO2HUk
	sjd3rX5Vw+HwIBJ3pYsbD8xRM4X9iUNZL4FH0MKHb+zdoO9IU6B0PpgNP/8Y5HwBgtOrJhZIWHG
	DxqakRMpN1sCUfOBlTPCHL8fZIPGL0ebc0HO73CxTOg==
X-Received: by 2002:a2e:be12:0:b0:38a:4dd9:23f7 with SMTP id
 38308e7fff4ca-38a8979b203mr37145211fa.20.1773649769930; Mon, 16 Mar 2026
 01:29:29 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260309134920.1918294-1-o.rempel@pengutronix.de>
 <20260309134920.1918294-5-o.rempel@pengutronix.de> <abPqGvy5FqJ0a0ug@tom-desktop>
 <abQMQAbbvV60bV2j@pengutronix.de> <7b1e12b2-f55d-4e70-9cb7-ecfa9d82ebdf@bp.renesas.com>
 <CAMRc=Mc4x0SOfoxB9Fv4VUmNjJLjdBnMSmFG=Y1JvLih6cODww@mail.gmail.com> <abUJfy4aqJhwhKcl@pengutronix.de>
In-Reply-To: <abUJfy4aqJhwhKcl@pengutronix.de>
From: Bartosz Golaszewski <brgl@kernel.org>
Date: Mon, 16 Mar 2026 09:29:18 +0100
X-Gmail-Original-Message-ID: <CAMRc=McPr66uPnipVsZ7mcfpQJTH0-7ne4sn2+tJ7LvXr8-FkA@mail.gmail.com>
X-Gm-Features: AaiRm52StXRrY5yCU4vp3OkaZjcp8gZE9QVzxM0p8xkW2HTlYlB-vYzvYdvUbhI
Message-ID: <CAMRc=McPr66uPnipVsZ7mcfpQJTH0-7ne4sn2+tJ7LvXr8-FkA@mail.gmail.com>
Subject: Re: [PATCH v3 4/7] gpio: gpiolib: fix allocation order in
 hierarchical IRQ domains
To: Oleksij Rempel <o.rempel@pengutronix.de>
Cc: Tommaso Merciai <tommaso.merciai.xr@bp.renesas.com>, Guenter Roeck <linux@roeck-us.net>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lee Jones <lee@kernel.org>, Peter Rosin <peda@axentia.se>, Linus Walleij <linusw@kernel.org>, 
	kernel@pengutronix.de, linux-kernel@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, 
	linux-gpio@vger.kernel.org, David Jander <david@protonic.nl>, biju.das.jz@bp.renesas.com, 
	tomm.merciai@gmail.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 14, 2026 at 8:08=E2=80=AFAM Oleksij Rempel <o.rempel@pengutroni=
x.de> wrote:
>
> On Fri, Mar 13, 2026 at 03:35:34PM +0100, Bartosz Golaszewski wrote:
> > > With this fix all is working fine on my side.
> > > I'm not more seeing the seeing the RCU stall.
> > >
> >
> > Ah, I sent this patch upstream for v7.0. I will tell Linus to not pull
> > it. How do we want to handle it then? Should this patch go together
> > with the rest of the series?
>
> Yes, better let's go the slow way. I can't guarantee it will avoid other
> regressions.
>
> Should I include updated version it the next patch series?
>

Yes, I dropped this from my queue.

Acked-by: Bartosz Golaszewski <bartosz.golaszewski@oss.qualcomm.com>
