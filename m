Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9C7C1396B73
	for <linux-hwmon@vger.kernel.org>; Tue,  5 May 2026 12:15:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777983349; cv=none; b=gyyog+ItEJkV+H6fArsOLkgqWDL24uCE0vxjwEYkpGrY9UUezKkfJi9EEEPQvJ+iNVCr1/tggCO2w7PH8XaZd8gIsf5WCt6afFVRQVhM3EC0Au1GTLNDjm7w46Oh5RRgDUd1XtfTLMlRsKmDdf98OsZyIOzA3R04OsnxmxsYb7U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777983349; c=relaxed/simple;
	bh=amGP14lvo6Awwpihch2ZMpdyWhksqDJBgFF2F1tRutw=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qOI7p+nCwLOzcLXBJiAzIFO+OHKaneXNt9tu3Sv3ZXv16qWS2pVgDGHnkaAFgKmqGj/R2wLT4Gvm0nrMv1Yo2m2qr+mi/5EGMCCxlNFQ2gGzg2JGtJ+HvhGtn3C5yQG25lO8ZqNX/Zs5K4v6GGrUutiNUUg6n2T7/YYQYYvnOqA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Hz9KfG6J; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Hz9KfG6J"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C967C2BCFF
	for <linux-hwmon@vger.kernel.org>; Tue,  5 May 2026 12:15:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777983349;
	bh=amGP14lvo6Awwpihch2ZMpdyWhksqDJBgFF2F1tRutw=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Hz9KfG6J5gP+buFVJBGwOVhp4df+gQ2VRn9vm1ouYOH1UKR28AX6ednKAKUhXIMfP
	 pstUTAasChD8UFs19JQniLOLOWZcUgkZ7Wa0HHBK0uDdb/rQmzyrbeuziEmejQi0h+
	 hJHq+6IpI3Zw/8dOIXGgCzjlLQ6JTKrFr1XrhmRv+9AYvQp/IDbQ+d7/lwz7Qw3kzX
	 vmLvUybSwd1MIhDLOyt8ShVBrNE6f108ucQ3iEqAImPPJZ9KdgEJZaCCMx73XvFxJK
	 yVvGN58wkvNc7MCksoWlh55FR6+o4TMy6loJpAANfzbW0n/kRf9BoSY65EwyTo9siW
	 pdDguqpDxej8Q==
Received: by mail-lf1-f43.google.com with SMTP id 2adb3069b0e04-59dcdf60427so4791765e87.3
        for <linux-hwmon@vger.kernel.org>; Tue, 05 May 2026 05:15:49 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AFNElJ8IKtmeO3WfdkDH6BhrZ2u2LR3OzCEINekH/B0IedqpbuVAfuDGYeJzA/3MHQ69AqRXbzA+8Zxu/rLM+w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yz8dhyyCZVzeKmK4Z3tpqxHr9JQb/DqQxxtdqjr4PmUjTtFZTG2
	jIib/fyJgBsCBALmt+vSmHYuI2y4Y1vWF01YCGTqmTglbU9+0sbV5xAi2cJhdzm9T6zqONxIJ87
	ZxTKxs6kB+S4GMywEC1PHqMOSZQD64xQ=
X-Received: by 2002:a05:6512:39d1:b0:5a8:722d:8013 with SMTP id
 2adb3069b0e04-5a8722d8073mr3384978e87.34.1777983347488; Tue, 05 May 2026
 05:15:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260429161430.3802970-1-daniel.lezcano@oss.qualcomm.com>
 <20260429161430.3802970-4-daniel.lezcano@oss.qualcomm.com>
 <CAJZ5v0jTbOkR8Odok2Cq6iWHGRzkF56spHr2xp_M8Zayg6ZAfA@mail.gmail.com>
 <CAJZ5v0ikmPwRq6ykwCH=Qi7Z477sTktm5dRU721Ye6+qQKs2Dw@mail.gmail.com>
 <731f3161-a202-40e0-ac22-aa16ea58e832@oss.qualcomm.com> <CAJZ5v0huQ3B4buieAUnbqnbV_fpFBPG3+UgULs0qcK9j44NwSw@mail.gmail.com>
 <cf419489-82b1-4b07-9eb4-e8b0ab8ec155@oss.qualcomm.com>
In-Reply-To: <cf419489-82b1-4b07-9eb4-e8b0ab8ec155@oss.qualcomm.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Tue, 5 May 2026 14:15:35 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0iLc3ObJ28M2q13RHYb8eDqqyug_k3v=w_X2bahbKCZnA@mail.gmail.com>
X-Gm-Features: AVHnY4KzudGtbpTjekFrmaoDwHWtg60BHTPEEP8SsX5RZynjZ1huV1HNAro64g4
Message-ID: <CAJZ5v0iLc3ObJ28M2q13RHYb8eDqqyug_k3v=w_X2bahbKCZnA@mail.gmail.com>
Subject: Re: [PATCH v3 03/11] thermal/of: Move the node pointer assignation in
 the OF code file
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: "Rafael J. Wysocki" <rafael@kernel.org>, daniel.lezcano@kernel.org, 
	gaurav.kohli@oss.qualcomm.com, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Lucas Stach <l.stach@pengutronix.de>, Russell King <linux+etnaviv@armlinux.org.uk>, 
	Christian Gmeiner <christian.gmeiner@gmail.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Guenter Roeck <linux@roeck-us.net>, Joel Stanley <joel@jms.id.au>, 
	Andrew Jeffery <andrew@codeconstruct.com.au>, =?UTF-8?Q?Thomas_Wei=C3=9Fschuh?= <linux@weissschuh.net>, 
	Benson Leung <bleung@chromium.org>, =?UTF-8?Q?Pali_Roh=C3=A1r?= <pali@kernel.org>, 
	Avi Fishman <avifishman70@gmail.com>, Tomer Maimon <tmaimon77@gmail.com>, 
	Tali Perry <tali.perry1@gmail.com>, Patrick Venture <venture@google.com>, 
	Nancy Yuen <yuenn@google.com>, Benjamin Fair <benjaminfair@google.com>, 
	Heiko Stuebner <heiko@sntech.de>, Thierry Reding <thierry.reding@gmail.com>, 
	Jonathan Hunter <jonathanh@nvidia.com>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, Amit Daniel Kachhap <amit.kachhap@gmail.com>, 
	Viresh Kumar <viresh.kumar@linaro.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Amit Kucheria <amitk@kernel.org>, linux-pm@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, May 5, 2026 at 2:13=E2=80=AFPM Daniel Lezcano
<daniel.lezcano@oss.qualcomm.com> wrote:
>
> On 5/5/26 12:20, Rafael J. Wysocki wrote:
>
> [ ... ]
>
> >> [1]
> >> https://lore.kernel.org/all/20260422174305.2899095-4-daniel.lezcano@os=
s.qualcomm.com/
> >
> > I don't think that adding the init callback is a good idea, sorry.
>
> Ok.
>
> May I create a separate preparatory changes splitting the function and
> then rebase the current series on top of it ? So we end up with smaller
> chunk of changes ?

Sure, go ahead.
