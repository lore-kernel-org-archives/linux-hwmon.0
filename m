Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794406659;
	b=wJzlE02sLe/r7npsCqCZHMoSnGKrYo4DuT9HEGzdRlb9phqJCJI7959Z4CuR7FlLXwjA
	 u5WC3LFeXzEpJTKKcAjpbpO7niHMMKdpt8RPVY+INlN3eHO6X+rGOnpa07J8hvIt++OQZ
	 1pRRzi5dv1qIgM4v8nPwWnqgzGm5gIvNUjmESVVJyKhHA9l20qS4QrVSj7TmB6LTd73y6
	 Cn3K8de87He9GnrMguDD8d2z21nDXXOfGJr6tCSRNcbWHjX9Q5A3VZPbs/vPx6wpd1Nfh
	 sglJUL8AjnPDilCrXAlVY4kYPhV9aDS/ErTMjNuo0f0VXtryjdLNh94DLkryPv1H03Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794406659;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ST8iIzeb1I30IxQIxW7lxeEJ96ruVZsibwUtgOrtpKg=;
	b=5RDX2eYkjCZ/l0bOPJzQJUK0kA0WET3JVFPwOI9905Gks5h8k2Ap95LE+ylY1okMdZ5h
	 RxVjZkR5z9edQbaLHHwdCQs/lVjeVzzPdW0Y27kZCsbXVEEWcrlQoMMs7u2VzmygVVvEc
	 BZy5waTJkFXOrV9B7pzVFzPQtmDdKyVS9ZS73uIBrDMIGEE64Hxnmnu+cY091tBBw+GBF
	 35JsGr0o9d//dBlze2+doVTtO4nMn4Gve9XoTxpkQrHJmm7ZOHCorFHLuntk292FykBrd
	 YWi8F8ZSXcRbTIlMM6c5XgETXevssXmdncJuQRgozLXLYS9NvO3/EmjprZfGVDdji9A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NT4qgraG;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32643606A334;
	Wed, 11 Nov 2026 14:17:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=NT4qgraG
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A611F00A07;
	Wed, 11 Nov 2026 14:17:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1794406658;
	bh=ST8iIzeb1I30IxQIxW7lxeEJ96ruVZsibwUtgOrtpKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=NT4qgraGnRbz09Un1YgRe6pQIxx/5JX7MfGY+/9AAZrQezR2wajzhgJp9/WulFvyQ
	 DmcT0tLvlZ4cwjSwGcEHx/3rzayiUXynH/QKDbynfUxLobYdAZhP1S4GT5PPfnHMbq
	 tAMBtnRtp/PPzsi++gjTAM/9/q0WYhEr6VD5PfSDNaPULcSphXuD2bEkB4OQd4f/bl
	 f7MlWYB9qelAQqHityoZhUJNxvjFmFqP/xh/J5Wys3ORPmjzBgO7LTiUuvsKYK38/n
	 PlP6q7FT5V44w8Y+yX7QgMeSl60NveEI0DhPcfY1u9o8qnue2w7HNoFs+/j2R9k7rG
	 LzQghvCvR2rsg==
Date: Wed, 11 Nov 2026 08:17:36 -0600
From: Rob Herring <robh@kernel.org>
To: Robert Marko <robert.marko@sartura.hr>
Cc: linux@roeck-us.net, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org, rdunlap@infradead.org,
	Steen.Hegelund@microchip.com, daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com, nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev, linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	luka.perkov@sartura.hr
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add Microchip LAN969x fan
 controller
Message-ID: <20261111141736.GD1476246-robh@kernel.org>
References: <20261109133609.810876-1-robert.marko@sartura.hr>
 <20261110145414.GA3828324-robh@kernel.org>
 <CA+HBbNFE7ud3omp1e8A9w=PYMM+JPW-y94MiM68K2sz4HitU7A@mail.gmail.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CA+HBbNFE7ud3omp1e8A9w=PYMM+JPW-y94MiM68K2sz4HitU7A@mail.gmail.com>

On Wed, Nov 11, 2026 at 01:21:56PM +0100, Robert Marko wrote:
> On Tue, Nov 10, 2026 at 3:54 PM Rob Herring <robh@kernel.org> wrote:
> >
> > On Mon, Nov 09, 2026 at 02:35:05PM +0100, Robert Marko wrote:
> > > The LAN969x fan controller has a PWM output and tachometer input in a
> > > register block separate from the Sparx5-compatible temperature sensor.
> > > Describe it with its own compatible and binding.
> > >
> > > The optional fan child specifies PWM period and polarity, tachometer
> > > pulses per revolution, and thermal cooling levels.
> > >
> > > Signed-off-by: Robert Marko <robert.marko@sartura.hr>
> > > ---
> > > Changes in v2:
> > > - Describe the fan controller in a separate binding and compatible.
> > > - Keep the existing temperature-sensor binding unchanged.

[...]

> > > +    dependencies:
> > > +      '#cooling-cells':
> > > +        - cooling-levels
> > > +      cooling-levels:
> > > +        - '#cooling-cells'
> >
> > The dependencies should also go in fan-common.yaml. Perhaps
> > cooling-levels without #cooling-cells might make sense sometimes?
> 
> I removed cooling-levels requiring #cooling-cells, as it can
> technically work without it, its not ideal, but it works.
> 
> I am not sure if its feasible for fan-common.yaml though as we already
> have schemas for EMC2305, and more importantly
> DTS-es for freescale/imx95-tqma9596la-mba95xxca.dts and
> rockchip/rk3568-radxa-cm3j-rpi-cm4.dts
> that have #cooling-cells without cooling-levels.
> EMC2305 driver even calculates cooling states without a levels table.
> 
> I would appreciate guidance on how to proceed with this.

Okay. Leave it as-is.

Rob
