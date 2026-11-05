Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=18.194.254.142
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793846400;
	b=jHqxopthyLmZTEt62UGDd9h9dlEhZq5WGD3ppTTQ3JkcVmYnSaGKJvg+8D2OfgyD/vd/
	 bp2+E3MuQN0sD7cg9RfX16nNQCM0MkmIsVamSRjbunw4FXyC0m6yhMaDmqyqT//pjLTN4
	 NkGfbjiTbup5sDyuxdUaS0eL1yVd1XkIMnkigBGJ68JyuYIbPZfKEB4+C6WLsmD1zQu7+
	 MyXUDZsobGX5dxvGQA1+ex+9whO5XArtLeZDlW09tqgc++U4DBtVgPHAAOsfKYzZDWNux
	 POUNGZFFDT53Ob+LwUx/HsXxcGPzGp1scJJay3wL0BjKjjztF6JAhx2ShfhuElzBAbg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793846400;
	h=DMARC-Filter:DKIM-Signature:X-QQ-mid:X-QQ-Originating-IP:Received:
	 X-QQ-SSF:X-QQ-GoodBg:X-BIZMAIL-ID:Received:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Received:MIME-Version:References:In-Reply-To:
	 From:Date:X-Gmail-Original-Message-ID:X-Gm-Features:Message-ID:
	 Subject:To:Cc:Content-Type:X-QQ-SENDSIZE:Feedback-ID:X-QQ-XMAILINFO:
	 X-QQ-XMRINFO:X-QQ-RECHKSPAM;
	bh=8nHg2KK9YdUFsDyCN5OyhUk3RMp8EQBW/fDZ8x8OirA=;
	b=5gNbb+hGCl3pUbj6syLe+uZKeyt0BEjxYG4dDHJ79Dt2JglajI4ona2Ben1QNpMagP3e
	 wJjN1EnBMMJU4pNY5bxdB/NadhhGkAQVKKypfTVMig2BT5cTVPybgqtpQ2crcQlPc7MAd
	 y0VLKmO8vguwt4MF9L4twxohfs+N07klTCxjjLQ+fWTRgIV2bQYI8iQRqH7MDzbEQbB5g
	 9goEWuW4a6vUewsxYzaQJkNFEH9lQtwOUPFPthktq04Wl2Iqv36nolvqiQ//WvXMMjHI7
	 mTE4AruoVgVOdJ0udElkFKxRXaG1/U5qbgSCr0lhmdlvczbW5kxPrPn6j8CtQYUI0Tg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=linux.spacemit.com;
	spf=none smtp.mailfrom=linux.spacemit.com;
	dkim=pass header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=KM6jG51j;
	arc=none smtp.remote-ip=18.194.254.142
Received: from smtpbgeu2.qq.com (smtpbgeu2.qq.com [18.194.254.142])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895F3606A33A
	for <linux-hwmon@vger.kernel.org>; Thu,  5 Nov 2026 02:39:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 895F3606A33A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=linux.spacemit.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.spacemit.com header.i=@linux.spacemit.com header.a=rsa-sha256 header.s=mxsw2412 header.b=KM6jG51j
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.spacemit.com;
	s=mxsw2412; t=1793846388;
	bh=8nHg2KK9YdUFsDyCN5OyhUk3RMp8EQBW/fDZ8x8OirA=;
	h=MIME-Version:From:Date:Message-ID:Subject:To;
	b=KM6jG51jfXUoSCb57V4cpBGaTQ+dTrgtvDKc7ult3QhPfcC4XqYOot3xI8+s56T5F
	 4p78QdFKgK1wTJxD2na7iIGYuuw6fGfVhGkO0ZdIlBOgi/OtzDf3u8aEo1FEXJiFys
	 Y9/rnd3Z+0HSwmDAR1GMB01LNKfhtvmSxzyyVA4M=
X-QQ-mid: esmtpgz12t1793846385td9dfa187
X-QQ-Originating-IP: 5JhhcJOz0vhMN833t3D+0RRiG1UD/1y8QebIIcigdQI=
Received: from mail-pj1-f48.google.com ( [209.85.216.48])
	by bizesmtp.qq.com (ESMTP) with SMTP id 0
	for <linux-hwmon@vger.kernel.org>; Thu, 05 Nov 2026 10:39:43 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 7098897350732282583
Received: by mail-pj1-f48.google.com with SMTP id 98e67ed59e1d1-3acdcfa2bd3so1226790a91.3
        for <linux-hwmon@vger.kernel.org>; Wed, 04 Nov 2026 18:39:44 -0800 (PST)
X-Forwarded-Encrypted: i=1; AKwUvBxhyiWvPkeJrL3+rfZ1VQ8qVzZtIoBZxgQry8XGHjYFYOGU7YxpAYQYaHXrjwCR+DT0/ueG+eoswYu7dg==@vger.kernel.org
X-Gm-Message-State: APuU4Z+wx5p5VGO/bV7kIkeqkYciCGKsnvCvSPavmFgQMlTRGexdG8EH
	GlTileDkwV904iexDvo9RUP074Dql3tRwl0LnTIfPiij39pJhpUrQGyA10Ux7TBGKNIAlh5NXOq
	SkaoQN3SGuPF99aPjY7p2fA3wLnlOEsU=
X-Received: by 2002:a17:90b:562d:b0:3ad:a462:f07f with SMTP id
 98e67ed59e1d1-3ae8982c1ffmr16206466a91.45.1793846382617; Wed, 04 Nov 2026
 18:39:42 -0800 (PST)
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261102135330.2493332-1-robh@kernel.org>
In-Reply-To: <20261102135330.2493332-1-robh@kernel.org>
From: Chunyan Zhang <chunyan.zhang@linux.spacemit.com>
Date: Thu, 5 Nov 2026 10:39:06 +0800
X-Gmail-Original-Message-ID: <872B2B4EAE847E62+CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
X-Gm-Features: AclHuK-lEE7dv-iC1Lsio6aPGOufL5hgelB1hFojisk2-zoMsjC0hhsp9HraOXA
Message-ID: <CAAfSe-uD=s0RpuqQ_h+_fErcEC+G=N_LA6e=p_sXJ=iG7jMc3Q@mail.gmail.com>
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
X-QQ-SENDSIZE: 520
Feedback-ID: esmtpgz:linux.spacemit.com:qybglogicsvrsz:qybglogicsvrsz3b-0
X-QQ-XMAILINFO: Nlo6pw8ywIsW6KMYKeZxkW1JFLDuBaESzSZTJVwvOtZJ4bqCcT9JNbhN
	ERgvUPIdy6v/ASSE370106wtvHPwlLDmtexs2EwBxDmfyjAv8zdMUrasLayvGoIRdITlYaK
	+mAQWkiwkbW0ioJg1WG8Lyj8DdTElmLQJivfXxpU4+PlenV5D7yFnjpIimkoUGCAOZzGl4Q
	nw7TTqkKI+9DFBU0JKAz00rBSEC1SWBW+1FVQBik1W/rB34BczVUnShnfA+LzaUbgi0977g
	VypUjU7UbyncrPPQiAjS4YLoEREdAF3e8TklfMQpw8rGJRDgFT281WA7oiZu5J5bYp5sos0
	u4nmPMZvPFbk2cjnyB+EnLjzVYrgAqecMHh8Gadx7+09UO/b74yypVQICQ/1zTHqyBVgZL0
	LMz2JKG5WsxjPd4Vc1u/ryBXdV3mldUORjpsVtyH2xPWfhKCWQjjmUM4O8+Tof5qzmAXBaF
	gp0jEl9QyA/9PJAoEcEh1M+NTdQm973xL8xq8SQSSZNuscYeAX+8ExiQTciFRhjPLzrscDD
	jgJ8RxCmi+CfGYRT4hmy39k4cAX/S/iE5SmQOgcqedTCt1q5h/FLbnUG5aGxpdSuU81Wvs1
	6/DjjH7idk/cQIP8aYgLFKubJh/TW3XiKI9T89Exk8fm998U/DB+nA80g7QmZWoWF5BXG1C
	WxYzZ0DhJ1dlAJa/f/HtCzOk/m04aKKvvQDLwTEJgU7jkWLCRh8MvuxlChluYD0cPlFUOOV
	K26ZgNAvn0mRQTBX91t9x9IiaRt7M2QRpZYMBFmKQ/UxPDJz+FC4bFuDDdiUQw00FZ7M+9p
	hoDlKt4q8qqM6y7wRIDn8EtcvYItRnXDpuXS+e3fi3rjpvBP7VWpdByQ4DXxR8skO38NVpG
	MivW7OW3bM/KgEcWdUoczAdNKZx9ONegrz6xgNww7oPXTGvyY6iOxBQMsduWjb5EPB07wlF
	1Iy2P3e1SpgqYhWZywvy6v4ojXnT8/EnjAHM7Zdc3nyTRFuFDDgyQi1+jvfn7ySVzsAohzB
	Hb11d0zK31SUrhJIWFA2m9nkQnlvH005HJHAkqWTh+FyZHuJCO
X-QQ-XMRINFO: MPJ6Tf5t3I/ylTmHUqvI8+Wpn+Gzalws3A==
X-QQ-RECHKSPAM: 0

On Mon, 2 Nov 2026 at 21:53, Rob Herring (Arm) <robh@kernel.org> wrote:
>
> Unit-addresses by default (and most commonly) are hexadecimal. There's a
> number of cases using decimal patterns. Fix all of them, limiting the
> pattern to match the 'reg' limits if there are any.
>
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---

[snip]

> diff --git a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> index afa551f6185f..222d70baef1e 100644
> --- a/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> +++ b/Documentation/devicetree/bindings/thermal/sprd-thermal.yaml
> @@ -47,7 +47,7 @@ properties:
>      const: 0
>
>  patternProperties:
> -  "^([a-z]*-)?sensor(-section)?@[0-9]+$":
> +  "^([a-z]*-)?sensor(-section)?@[0-9a-f]+$":

Reviewed-by: Chunyan Zhang <zhang.lyra@gmail.com>

Thanks,
Chunyan
