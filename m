Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 86D6033C521
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Oct 2025 15:42:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761234149; cv=none; b=P2n+wONmoMtSuMSNlHFm/wIbBcx/kKt9WGZPH3kxBeDUr4e685WGsK+fGaGQWkPct9NtIzef/6A0Mcf2+dPVgbMhK+1JjPKBEf5nkpOWsaL9VsCKQaonTxqmjRZ5ccTHLq/Yxk4MQH1vizj2Jn19OLsiF0RE2FN6ZSiQSrsoMwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761234149; c=relaxed/simple;
	bh=CdcIJyHX4clb96PckgG+JIrIZVu7Cky4+dgR8wQZ0AQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=iFZcekrwCLl/tvv2uMoEUdymkpJuD9R0J/flLtQcu7pNsPuQSZVneg+DxHw0QxzbkEVD91z3kS6XNowdggZLjnKK1yjcg3rmKK0yBFXu7hcxmUxTjCpj9Bxste6bUz97FF0aeZ04Z3Q4HXzlEUUJamW1BZk2jGWc4pl7iTUmm2U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XLsEC/hK; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XLsEC/hK"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-290ac2ef203so9374705ad.1
        for <linux-hwmon@vger.kernel.org>; Thu, 23 Oct 2025 08:42:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761234146; x=1761838946; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FiXLImZ7fPO15Ek72Gzubnx0U1bgG0nde4mxLe+ZreM=;
        b=XLsEC/hKI9rcYtvZep1kAQCqqw3YI29awmGXe1rBHmx869IAnxsBuaeEQYB0t6jLQs
         imXwO/2IUFcQ/T4FXrbzCa4iK4fw1KiOFu5ITCVwnTwBKQFw/Ld6UhdCElxyHmrOnC6L
         ZlL0a4p9RqTAN+T048bJ/RrIYJM+v6w4/AwZafr2sonvbFsXG58KyM/1bY5LSWq7BmH0
         3sFqTzk+Cpf+GXDmZpQEcqhfDS4YOKcZ/CeX/sZSZCikzQoMak/Sjbj0n1nb+YU+m0Qa
         D8WzDb1sjN9Dk5u+tUXh9878VLKtcU+YcYZlNPE3+zGCQNIaoO7A4ZRnOKxhG75gCRmX
         9aWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761234146; x=1761838946;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FiXLImZ7fPO15Ek72Gzubnx0U1bgG0nde4mxLe+ZreM=;
        b=jbVIc79GjKO5ge766QISPIFUOxUIupII6t2H3xp3GWnlOHqVbsaSuJdBqDAJ8uw5KP
         OVP2UxtMHOewMzHsc/ZwxxbSrlxAJ7Zn6BlcqcbuPZQkyiyw4sRhzjSNwexkqItE5DPt
         LIpBcg+nfkDcWxVYlSJ3KawD0Ry2dPZVdK32Gsy0STu4O5hQPbMO2SzBineIbWj728F8
         K15N4M7TcR9GrFwkCzShMI9LClQLR45WiECYN0DusZF+ztHzPPgs2fMc1pFknVbV/hDZ
         ZlSP1a87ugkdtMuuURjzVF+jKTV0SMgtq2TDDl60SJ701sOMYq5HeXynIy+vcJz9lc0d
         ZeGw==
X-Forwarded-Encrypted: i=1; AJvYcCUoLZ6+IkFLOCUQ0ou6QF9PTTdDrH8PZ0mqwHIyP/edFyYZISPrHfdB7b4bWlyhEMbAltJgVEkW9d7QUg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxyVv6yg1CGyb38WJGZAhdla1J5Z/7/pzhw+/eekuHFDX/9KbQd
	Rd+ykSrkSk75kQKZliVL51aR/9v0Ca+kbaU9c7BazT/0kVkxUU2Yz4Kp
X-Gm-Gg: ASbGncupddWxnNlyNcEhn9iJDCOg0SkfwBC+ioyIa4HSnlpKJ2UWJtuU3eKUHxPPCn5
	BrK/949njgI/vZ0aVYpR0Y5IKlG08tnuzCKxoIeNgjAzU6QTKwrjY1yrsmcac9vZTF1C1PsSj87
	2FyZkO3K19KeL1mz9ggeoQcA53NleNo9nSu5qJcQPq9X75DgKTVYXNIkropCx2C0eb9lFe7W42U
	TfugMyYsfyCFzFeTLh3XVb+VT24buDHABe++JI2Sd/DrfCNv8Z2no4vMw1No08XOf5Pgr+MUfQF
	SKnqSNEy3ljwlYBeFdmz+nYVu2xExI+OyNlpmL1aW1s6OIYucWO0CZXc2EwA7hVejp5VIwYr7hY
	YbcfNoZDxlNFsz9NWRF5r+tzQSUr6ELwOVQ+LCUX0CdKON6CtO6MT8QN0ooybNGWt2Y7/eZk2bh
	0LM3GR6/L22TrY
X-Google-Smtp-Source: AGHT+IFivLiKbkP0y2KMH2ZNEJ7GlEhOb9t2a5oI0W2mRRwwxItjHXvAd1GZTuvYOgULd0RdTXOLyw==
X-Received: by 2002:a17:903:1746:b0:290:9ebf:211b with SMTP id d9443c01a7336-290cb07d223mr295078455ad.40.1761234145718;
        Thu, 23 Oct 2025 08:42:25 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2946dda72ddsm27825615ad.6.2025.10.23.08.42.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 23 Oct 2025 08:42:24 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Thu, 23 Oct 2025 08:42:23 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Stephen Boyd <sboyd@kernel.org>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Andrzej Hajda <andrzej.hajda@intel.com>,
	Robert Foss <rfoss@kernel.org>, Vinod Koul <vkoul@kernel.org>,
	Moritz Fischer <mdf@kernel.org>, Xu Yilun <yilun.xu@intel.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>,
	Andi Shyti <andi.shyti@kernel.org>,
	Jonathan Cameron <jic23@kernel.org>,
	Dmitry Torokhov <dmitry.torokhov@gmail.com>,
	Georgi Djakov <djakov@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Joerg Roedel <joro@8bytes.org>,
	Jassi Brar <jassisinghbrar@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Lee Jones <lee@kernel.org>,
	Miquel Raynal <miquel.raynal@bootlin.com>,
	Richard Weinberger <richard@nod.at>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Johannes Berg <johannes@sipsolutions.net>,
	Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Bjorn Helgaas <bhelgaas@google.com>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Sebastian Reichel <sre@kernel.org>,
	Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <ukleinek@kernel.org>,
	Mark Brown <broonie@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Olivia Mackall <olivia@selenic.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-clk@vger.kernel.org, dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org, dmaengine@vger.kernel.org,
	linux-fpga@vger.kernel.org, linux-gpio@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-i2c@vger.kernel.org,
	linux-iio@vger.kernel.org, linux-input@vger.kernel.org,
	linux-pm@vger.kernel.org, iommu@lists.linux.dev,
	linux-media@vger.kernel.org, linux-mtd@lists.infradead.org,
	netdev@vger.kernel.org, linux-wireless@vger.kernel.org,
	linux-pci@vger.kernel.org, linux-phy@lists.infradead.org,
	linux-pwm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-crypto@vger.kernel.org, linux-sound@vger.kernel.org,
	linux-usb@vger.kernel.org
Subject: Re: [PATCH] dt-bindings: Remove extra blank lines
Message-ID: <0d01d218-15df-4553-8e84-fef84fde211e@roeck-us.net>
References: <20251023143957.2899600-1-robh@kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251023143957.2899600-1-robh@kernel.org>

On Thu, Oct 23, 2025 at 09:37:56AM -0500, Rob Herring (Arm) wrote:
> Generally at most 1 blank line is the standard style for DT schema
> files. Remove the few cases with more than 1 so that the yamllint check
> for this can be enabled.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Acked-by: Guenter Roeck <linux@roeck-us.net>
