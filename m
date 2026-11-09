Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1794210020;
	b=hKLVhVnoqWISk/q+/fBeo+srDQg7le5f0idKqHy/9LCd796v+YJr8O14jh7fssGZVzDl
	 fQ9kxXAg3lJd75rHfFuH7ovUA9fFfmGKazG+6pLNP4Qe/JeHf0dvSD+FMu+MTdznHdzxM
	 XLoaBq7out16V4BsKM8iWvB8DDJqnBsP7gBKSQk/faJyrUKHTesWH3ApEApzWsXnA8VGK
	 Xyl8CenmtBobItnZQaiOPa5fdozaZ62pkJtwAyyas1iN32bC2SZRYJTwECcP+t2t7sVYx
	 E3jormL7i+xoCs/fxg8gnZW/pD4FGWqx13YvScrGECaoLQ9eh2BfLACi9CkAtgGyHYA==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794210020;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type:Content-Transfer-Encoding;
	bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
	b=rqg5uxdFeMFgE42TTGkeAjiq2QQKLvpwFdS1W13XtUJyVDMNjXBUZ+azzww1lXG58APp
	 UUa6P+awurYs8ch11OTX2eJSAv8S78WcOhZUz9HVtk/bqSzULB8CHPzMrTXYMd0PB/ML3
	 glnbrZzlQ66Xc0k5t2Xgox2Tzy59rUFkzVeikTBS7m9zAbxqy40pqk8NFEhcEL/9AwVdJ
	 SX32Q+TaxEqj9C4PDgBKS1HCLlBFPyjBMrqXjCAG7dUzKtGSMav5G4Vk9jC1/8qxUr/sV
	 bFaEkg9lBbKWbriBhR1wqZd3m1jGFmH1SKmdK40dKJNC7Z0l+Ctp59QB00RXsTwySpQ==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fw1HJ3eB;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.216.52
Received: from mail-pj1-f52.google.com (mail-pj1-f52.google.com [209.85.216.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BCE1606A321
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 07:40:20 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5BCE1606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Fw1HJ3eB
Received: by mail-pj1-f52.google.com with SMTP id 98e67ed59e1d1-3b0a2a44a0cso294150a91.1
        for <linux-hwmon@vger.kernel.org>; Sun, 08 Nov 2026 23:40:20 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1794210020; cv=none;
        d=google.com; s=arc-20260327;
        b=aFn7D39vC8l56mSWHdaSnEANfLdqdS2E1PwnAccMl8LHX5r8tLl7UiluxFd3n2keQb
         h8d0HUYOqdX5SvS3W061fbnQoyym9v4vzSYYEKGVDl1cCYMOPgRlgmu7Cq/8KgRhqtc4
         CB+T6B1JJPTJU6uP3f1favr2I1ImoUmwGE9iGl0JIoDhPPzAbL0frOSqyLN4MNeXBE38
         pA16uSiilE+cXIy4qnhCeeMe97ateuvK2ajYTmMSv7YhhRa+UAsBXTsQaa7C1qdYjD26
         v5Q8/hOVwvUK5lVYXIrTvcd1cJeBXN2wjMgxbfgyhnzYL/uYzL1bhIdxdp+mMOdwPxUV
         G1xQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        fh=st067WA/ra0VNCqdXh1/cGXFNCylILX0/nUiOPOrhs8=;
        b=rR132a0W381curhmjQF8+x7GTQreHBdDle5arpVHqACc9E04FHyXcz6gohbku8Iij5
         AAwFbqYe8dj+0XI4y76JT88/Mlax7nNNR/SAmO4vtH96Dkp0yXtp/Wo2rEOUXhOi4f7x
         TExE60zOIbbH+ACItXPh0dSO/IrxvTKavGyfLadpR+oqxLvQlQF0prER1rBExSG0BJZt
         ZZx8Z7h2OTCy7jqepS6UieJykmNlzuD4MVyeAcQ0TVYZdyHlw6fEvgoChOLa2syTU2Mr
         0QfVIARuj2kIIKK8EpitpyvzMvdDznPng/9kSLkQ7bNSlPVXjC9dTDEzrqs0aR/iEHHV
         3a6Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794210020; x=1794814820; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        b=Fw1HJ3eBrEG+YcG2OfXIKNyXLbtxL6pFyShNR64xnTBicLVJTLcqI70PP7XlmXPNx6
         VWmQ662eksYGc8vJo+lcMpjTIaYcJB9aokKPIxavS8OWhjpOs8W89bix1ozwYvKeb3b4
         M7C1Y4n+R7cdsAeFDh3I3fT0WNvzf0CnRZWDlQZYC+5M2rSyX8wMQx9uS+vQs8QSo0d/
         2FLip2Uo0zLuYIubK7TNTBZ4sl8ZrZ+JeHk7SDm/ZlHHFtWu1M3YyNEi+YttPBGWC2RM
         X/hXAhXzRlZNf20NwByFmIPl+GnzmQCqAB4nehLzmm3jWxLA5k3xC+msTg/JbR6XvUqv
         ep4A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794210020; x=1794814820;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=qbtFVfAV0d//avrt7X6KHwZhQyPReObvw80fRr8okBY=;
        b=n+g6jQNpCuVHQa6UWz54vQROX5BvMcmQmyJSNTgSINwGeq8EVlzmMzVDLY7RdGeb9d
         mBbwyQPqk8Sj8yqF/z9cmtHp/v+6imySSKTPA6AbnQQ36NE4yCvx1UpGP2W5hIjYKNoU
         26a/+ttcg291/7aqQRqGTKRp6eGSxjHJI44nk2WpKKyhbDXZCOmzVyljkd4z11FY4YsX
         jjUzwtHhmZWsVbe529qpFs5Po70k6MLQKPjSm8LHLTHLkcgM2aBfBk2uxCmaovlM9WFS
         IgWcQusDCvsCDxzWOv6PXU0CZz/cvONKPoHEEft9McGBOO6jvBon44/A09OTWb5XpHx7
         FvEg==
X-Forwarded-Encrypted: i=1; AL+hErFl3oOszTaPprDopDg798odGFfPKDsZcn979jO1D/xQePknju0Yh1DluuNW4/u5b061KhIOE8m1eR1I0g==@vger.kernel.org
X-Gm-Message-State: APuU4Z+FW7wT6pfYgflduDOOP9BAw+OlaaA7oIweQV7KGdax4w/EhAx/
	Ob3Fv2k5V2l592x896RsKWBfjjBJC2vm7MACBuGMgjegXaxAS/Sj3cY9nUbl4YiP7G+gkkvrnpc
	AEXfYVGp4vevfSluQbSNPoca8liUQkTE=
X-Gm-Gg: AYBFou2Pd5a4McJ01aRnx0BAUSqUeKjKcIzr5d66QYkqE9+sLbphTQACILtHWsY8iR0
	sK61w0f1tFTigQB6Oy3gwnpKF2Hcit9FDnLed7YojY+zUW7xssw0KTlDAJ2R0fhUM3zkbzjuzyq
	YZGhCtUgoFBrxZ5RYh7vs9CVu6w0QzqIqdVjmfVexjLJQZA+j923am/LPmGi4cVd2rT8mv1Kvf2
	WWthVwUF0ja1DoqBWoGLskXwSsKM+ZjVL4/09HWMwACUrZUWLmcpLxWJjzQJb8L0l7HmGeVFtj7
	SLc1D59srwBioRvs7DtW3ldWuJV3iFPy84/akMfwW4ma0OwIgiYmiNbtojxe7RnY5Tiy0GrjtzU
	iHICGI3ENaCOiTQAhQ0S0JoSdiLJJaUl3DFA=
X-Received: by 2002:a17:90b:384c:b0:3ad:a270:a623 with SMTP id
 98e67ed59e1d1-3b12d107e44mr3364118a91.4.1794210019701; Sun, 08 Nov 2026
 23:40:19 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102135330.2493332-1-robh@kernel.org> <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
In-Reply-To: <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
From: Chunyan Zhang <zhang.lyra@gmail.com>
Date: Mon, 9 Nov 2026 15:39:42 +0800
X-Gm-Features: AclHuK_dnPMk52UN3-2_wspDGRy5a6s-cwmnh8paY6ZY-G54Qz5KZ0bygsAWCVc
Message-ID: <CAAfSe-shr1+0YpxEvf+4k+DyGe3==PUiD72CwjE+RC4gX-ShiQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: Use hex unit address patterns
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Vadim Fedorenko <vadim.fedorenko@linux.dev>, 
	Arkadiusz Kubalewski <arkadiusz.kubalewski@intel.com>, Jiri Pirko <jiri@resnulli.us>, 
	Ivan Vecera <ivecera@redhat.com>, Benson Leung <bleung@chromium.org>, 
	Guenter Roeck <groeck@chromium.org>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, =?UTF-8?B?TnVubyBTw6E=?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, Olivier Moysan <olivier.moysan@foss.st.com>, 
	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Thierry Reding <thierry.reding@kernel.org>, Jonathan Hunter <jonathanh@nvidia.com>, 
	Fabrice Gasnier <fabrice.gasnier@foss.st.com>, Lee Jones <lee@kernel.org>, 
	Srinivas Kandagatla <srini@kernel.org>, Ekansh Gupta <ekansh.gupta@oss.qualcomm.com>, 
	Ulf Hansson <ulfh@kernel.org>, Hans Ulli Kroll <ulli.kroll@googlemail.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Vinod Koul <vkoul@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Manivannan Sadhasivam <mani@kernel.org>, Ray Jui <rjui@broadcom.com>, 
	Scott Branden <sbranden@broadcom.com>, 
	Broadcom internal kernel review list <bcm-kernel-feedback-list@broadcom.com>, 
	Kunihiko Hayashi <hayashi.kunihiko@socionext.com>, Masami Hiramatsu <mhiramat@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, 
	"Rafael J. Wysocki" <rafael@kernel.org>, Daniel Lezcano <daniel.lezcano@kernel.org>, 
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>, 
	Orson Zhai <orsonzhai@gmail.com>, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Shawn Guo <shawnguo@kernel.org>, 
	Chanh Nguyen <chanh@os.amperecomputing.com>, Alistair Francis <alistair@alistair23.me>, 
	Julius Werner <jwerner@chromium.org>, Paul Cercueil <paul@crapouillou.net>, 
	Dmitry Osipenko <digetx@gmail.com>, Florian Fainelli <f.fainelli@gmail.com>, 
	Thierry Reding <thierry.reding@gmail.com>, Ray Jui <ray.jui@broadcom.com>, 
	Scott Branden <scott.branden@broadcom.com>, Krzysztof Kozlowski <krzk@kernel.org>, 
	dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org, 
	chrome-platform@lists.linux.dev, linux-gpio@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-hwmon@vger.kernel.org, linux-iio@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-sound@vger.kernel.org, 
	linux-input@vger.kernel.org, linux-tegra@vger.kernel.org, mfd@lists.linux.dev, 
	linux-arm-msm@vger.kernel.org, linux-mmc@vger.kernel.org, 
	linux-phy@lists.infradead.org, linux-pm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, 5 Nov 2026 at 10:39, Chunyan Zhang
<chunyan.zhang@linux.spacemit.com> wrote:
>
> On Mon, 2 Nov 2026 at 21:53, Rob Herring (Arm) <robh@kernel.org> wrote:
> >
> > Unit-addresses by default (and most commonly) are hexadecimal. There's =
a
> > number of cases using decimal patterns. Fix all of them, limiting the
> > pattern to match the 'reg' limits if there are any.
> >
> > Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> > ---
>
> [snip]
>
> > diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yam=
l b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > index afa551f6185f..222d70baef1e 100644
> > --- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > +++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> > @@ -47,7 +47,7 @@ properties:
> >      const: 0
> >
> >  patternProperties:
> > -  "^([a-z]*-)?sensor(-section)?@[0-9]+$":
> > +  "^([a-z]*-)?sensor(-section)?@[0-9a-f]+$":
>
> Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Following up on Andy's note about this:

Please disregard my Reviewed-by. Even though I did look at some of
the other hunks, given that I'm not familiar with the other hardware,
I don't feel comfortable giving a whole-patch Reviewed-by out of
caution. And since I'm no longer the SPRD maintainer, an Acked-by
wouldn't be appropriate either. So withdrawing is the best option =E2=80=94
sorry for the inconvenience.

Thanks,
Chunyan
