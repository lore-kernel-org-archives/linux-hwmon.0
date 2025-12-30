Received: from mail.andi.de1.cc (mail.andi.de1.cc [178.238.236.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6D5522BD030;
	Tue, 30 Dec 2025 09:49:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=178.238.236.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767088155; cv=none; b=F5t1Da8hUXuSrjdESlziFkpSri4oOmd7VJnPCv3L3C8+1bzag7Vsmz40GaFXWYQPBlgsN9QOvdteBcsM4KrxAcYX0VPP58xi9oOvOUNOL3mDxiQohQZD/N+59C0rVVEsXelQ/MXnDct5HKFM2nkbF16IZZ5n5AGnS8tV7n2GNvg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767088155; c=relaxed/simple;
	bh=33mXL0SIrMaMtc048DkclljfAr/rbOWcL1qOQ81+Xe0=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=D/22vURTSYpcs8UJvGdR+NTr+HyrQRE1g6TI7OxGc1o9GoJNDCHW2CZpeSA6zNM+BQbnCNqsfNB4RGIaqv9BTc5FAOy0I0/UFbvWq1HCKmnZv1ttqCIVzkaR8AX5zThHG32WajDF14bs0nt9/fKUkg0XtUQZSb3ZiX+ycq9a8K0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info; spf=pass smtp.mailfrom=kemnade.info; dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b=QcdnL785; arc=none smtp.client-ip=178.238.236.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=kemnade.info
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kemnade.info
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kemnade.info header.i=@kemnade.info header.b="QcdnL785"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=kemnade.info; s=20220719; h=References:In-Reply-To:Cc:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID;
	bh=07F0iDY6hdFBvfF2IbNa7op1Jq9y426DzZHvAVBpWyE=; b=QcdnL785lb4fd5s110peGxloSW
	mfObB/bvVN6z1v2MGqia2rzc73sbJ2nZL3hyYVn9BrINZjRz0i7xM2pswDXJsFFT8w9FzaH/+ZMEI
	Bm4olUqaqpc3DDxrwA354p0YSz9ZKhCeprVtJt9dxflnSxkJiQDy7C5IlQtWP63pAW3cLfLMUFd9+
	6CvZjCMzq6XkscUKK3wHuhok2u0JCcJxAtKmakocstgqmfw6t0LQbPszoPXWD2Bq5/KiWIry+2vWY
	qKOGVTJjPM03YXXWMS9KM3P+4ms6dH8fLiA6TLN7Q6dWdQBKyrx31ERTquv0G6Bj2pMk+Zy6MzrP7
	ZxUCA/fw==;
Date: Tue, 30 Dec 2025 10:49:09 +0100
From: Andreas Kemnade <andreas@kemnade.info>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
 linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
 linux-hwmon@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: regulator: Document TI TPS65185
Message-ID: <20251230104909.3236ce13@kemnade.info>
In-Reply-To: <20251230-rustling-mandrill-of-domination-ddc04b@quoll>
References: <20251227-tps65185-submit-v2-0-1882024b8f33@kemnade.info>
	<20251227-tps65185-submit-v2-1-1882024b8f33@kemnade.info>
	<20251230-rustling-mandrill-of-domination-ddc04b@quoll>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; aarch64-unknown-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 30 Dec 2025 10:08:57 +0100
Krzysztof Kozlowski <krzk@kernel.org> wrote:

> On Sat, Dec 27, 2025 at 11:20:36AM +0100, Andreas Kemnade wrote:
> > Document the TPS65185. GPIO names are same as in the datasheet except for
> > the PWRUP pad which is described as "enable". That pin is optional because
> > the rising edge corresponds to setting one register bit and falling edge
> > to another register bit.  
> 
> Nothing improved in the subject. Mark asked for proper prefix and you
> used exactly the same prefix, so the same problem stays.
> 
Quoting:
The Documentation/ and include/dt-bindings/ portion of the patch should be a separate patch. The preferred subject prefix for binding patches is:
"dt-bindings: <binding dir>: ..."

That looks like what I am using.

> Please use subject prefixes matching the subsystem. You can get them for
> example with 'git log --oneline -- DIRECTORY_OR_FILE' on the directory
> your patch is touching. For bindings, the preferred subjects are
> explained here:
> https://www.kernel.org/doc/html/latest/devicetree/bindings/submitting-patches.html#i-for-patch-submitters

besides merge commits, patches with subjects doing the same seems to be:

d0f9f5b7a335 dt-bindings: regulator: Document MediaTek MT6363 PMIC Regulators
0f1010284076 dt-bindings: regulator: document max77838 pmic

That looks like mine. So no idea what to improve...

[...]
> > +  vin-supply:
> > +    description:
> > +      Supply for the whole chip. Some vendor kernels and devicetrees
> > +      declare this as a non-existing GPIO named "pwrall".  
> 
> GPIO cannot be non-existing. Anyway, use name matching the datasheet.
> 
That is correct, GPIO cannot be non-existing. That comment was just
meant as a help for people trying to convert the dirty devicetree mess
out there into proper, submittable material. But I will remove that help
as you request.

Regards,
Andreas
