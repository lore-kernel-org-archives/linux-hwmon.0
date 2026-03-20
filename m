Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 164BB3D413A;
	Fri, 20 Mar 2026 17:26:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774027594; cv=none; b=cOwOXrofZyYiIdcvfopG5wDFG3T8MALhpszZnxjzpk33jl4k3ZC2LIFns86qwVe0fWNdcmZJZ4d8z0czZnOmvff6mWno75xlNpHGhJKQlWvWnE2s0xBu7SlehOzsA/dyOZz93jwiMRqUwHrAQR8Nu+jDwZcV0DPbt4OtcVm5fto=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774027594; c=relaxed/simple;
	bh=TCBFXsphVvwb9Dg/wEdcC11+4vRR3UYnV1stt+8g40o=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=d0lW2k/hOe/uBg8GSNcEqNu9poPmlOBCCG8fZb9dEjhi10qUWcbMDFz9aKY8jN1Rhpd7JYq/8CRUWLlKr7GJS4V8aKjmSmMmt2/6xRWklUbklB60nie0HS9kv2pOKVKmGy1Wdx/hnsRgBfLJkCNDPTlvXhkrGsUBcjEhxG78jTI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=SlSkPjNN; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="SlSkPjNN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57D6CC2BC87;
	Fri, 20 Mar 2026 17:26:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774027593;
	bh=TCBFXsphVvwb9Dg/wEdcC11+4vRR3UYnV1stt+8g40o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SlSkPjNNOb/+Jo9X0CCO//QoRS1cc+hL4KH2yaDLPRTWGB1cx14CbMbnZE4WJc0rn
	 mTBRE8McDmrW9Ldpd10K9KaO8gmUsdTW5R4s8lhQoMiVmoY9t1us2FSttu4bqjcb90
	 L6FHcWByw1pgtb5/IObFe0qIOqWQZ0G2+SjQh+VU6xY8pmqGi5uqSRBFF3/yzRzVfn
	 FoWVPewN07UHsXCEs5JlxG/Lq/bn8xoZbiDRmqFYanmyMqxAytr2EX2+tpkhxBBbYH
	 OcJqNLKh59G0kOAImjNqTBmqla5wPtAtlPZkfA3UVXgCOy/22sOf+1K9l8oGP9K36W
	 +XtOpp5lg9m7w==
Date: Fri, 20 Mar 2026 10:26:31 -0700
From: Drew Fustini <fustini@kernel.org>
To: Icenowy Zheng <zhengxingda@iscas.ac.cn>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rahul Tanwar <rtanwar@maxlinear.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>, Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v3 2/2] riscv: dts: thead: th1520: add coefficients to
 the PVT node
Message-ID: <ab2DR5v6DoqsFmbj@x1>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
 <20260309162457.4128205-3-zhengxingda@iscas.ac.cn>
 <abWTh/HkVAiIjInt@x1>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <abWTh/HkVAiIjInt@x1>

On Sat, Mar 14, 2026 at 09:57:43AM -0700, Drew Fustini wrote:
> On Tue, Mar 10, 2026 at 12:24:57AM +0800, Icenowy Zheng wrote:
> > The manual of TH1520 contains a set of coefficients a little different
> > to the driver default ones.
> > 
> > Add them to the device tree node of PVT.
> > 
> > Signed-off-by: Icenowy Zheng <uwu@icenowy.me>
> > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > Reviewed-by: Drew Fustini <fustini@kernel.org>
> > ---
> > Changes in v3:
> > - Added Drew's R-b.
> > No changes in v2.
> > 
> >  arch/riscv/boot/dts/thead/th1520.dtsi | 4 ++++
> >  1 file changed, 4 insertions(+)
> > 
> > diff --git a/arch/riscv/boot/dts/thead/th1520.dtsi b/arch/riscv/boot/dts/thead/th1520.dtsi
> > index bd5d33840884e..2160c8b6c2261 100644
> > --- a/arch/riscv/boot/dts/thead/th1520.dtsi
> > +++ b/arch/riscv/boot/dts/thead/th1520.dtsi
> > @@ -753,6 +753,10 @@ pvt: pvt@fffff4e000 {
> >  			reg-names = "common", "ts", "pd", "vm";
> >  			clocks = <&aonsys_clk>;
> >  			#thermal-sensor-cells = <1>;
> > +			moortec,ts-coeff-g = <42740>;
> > +			moortec,ts-coeff-h = <220500>;
> > +			moortec,ts-coeff-j = <(-160)>;
> > +			moortec,ts-coeff-cal5 = <4094>;
> >  		};
> >  
> >  		gpio@fffff52000 {
> > -- 
> > 2.52.0
> >
> 
> I have applied this to thead-dt-for-next:

I had removed this due to missing binding in next. However, it is now
again applied to thead-dt-for-next as the binding change is now in
linux-next via the hwmon tree.

https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?h=thead-dt-for-next&id=a7aa874b69460896349985833059a764e688f1d0

Thanks,
Drew
