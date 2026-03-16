Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E4D072701BB;
	Mon, 16 Mar 2026 14:22:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773670922; cv=none; b=evgPkNBmJCZDRTTUt7n7YKkDcQIhKmOpjXEG77Tp57nCgAFbMsLsFg+e0FjhRW9Sk4fo55nv0+nnimtzqMwKuvypnNJi+KF7/HjbC91U7+97Z6hYdUTfBqedgEzdDfG0imB5AMkgJhaJfqjljU1PJY+DD6ZXZP46ESjIiBtBHzw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773670922; c=relaxed/simple;
	bh=iXFAkyHZVPA9Js7q3zVpJAkTrRXaqU4mUKoFiz/fVeA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=XmPOpY9YSQhV1TPT8u+xyfQSrAINfbALH47j267Octe4/zM+KGiOfLBcpM6iH7baCk5L6wFAbugJK4TlFSVj+D3XvSW2y2XyNOi09S3ZhhCxgnxR6Cs5xjrqUNJUzpiTaDxh5vzegjXF3hRvEpxKKno8+5nHKKDUXoqKsUpFcfQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vb0KmWB/; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vb0KmWB/"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E1B1C19425;
	Mon, 16 Mar 2026 14:22:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773670921;
	bh=iXFAkyHZVPA9Js7q3zVpJAkTrRXaqU4mUKoFiz/fVeA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Vb0KmWB/iuxyOrVhlK4FapCa9mzGM9nh5PwOvP5hUcrlaMDuUNCzi5wkoBiyWHY/z
	 fiKgUdjgNBKIBFECaUTHUebuRP/ifJ74CUnhNlbmvOAlk5d7pwZEGqq/6bRVvLADKj
	 jgjKDDwr/6RtuoCMnPW13oUD3QnhaY+DmO1wQPEL69HXv3xVL0lmRt+n8arUADfk8i
	 ZlpgmCUVCnesskPTC2+ro56U1mbwxfdhiSp7tTulsWEta/JALyYsMPH7oqxQowfpSp
	 NhbQXPZNKsG9L4snwizHaOAoIhOnL3oloIjuINpdgQuH0qfwgA7vG68ikaY/pXEsTB
	 +ycUgioU6SEOA==
Date: Mon, 16 Mar 2026 07:21:59 -0700
From: Drew Fustini <fustini@kernel.org>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Conor Dooley <conor@kernel.org>,
	Icenowy Zheng <zhengxingda@iscas.ac.cn>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Guo Ren <guoren@kernel.org>,
	Fu Wei <wefu@redhat.com>, Rahul Tanwar <rtanwar@maxlinear.com>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org,
	Icenowy Zheng <uwu@icenowy.me>, Han Gao <rabenda.cn@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: moortec,mr75203: adapt
 multipleOf for T-Head TH1520
Message-ID: <abgSB6DBABOtk+tU@x1>
References: <20260309162457.4128205-1-zhengxingda@iscas.ac.cn>
 <20260309162457.4128205-2-zhengxingda@iscas.ac.cn>
 <abWTO7QBFIcjxKn6@x1>
 <20260315-cogwheel-dislodge-a3efe31728d1@spud>
 <0f88a17c-7c21-4ae5-b418-dfb4b4ac5d6a@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0f88a17c-7c21-4ae5-b418-dfb4b4ac5d6a@roeck-us.net>

On Mon, Mar 16, 2026 at 07:11:37AM -0700, Guenter Roeck wrote:
> On 3/15/26 05:12, Conor Dooley wrote:
> > On Sat, Mar 14, 2026 at 09:56:27AM -0700, Drew Fustini wrote:
> > > On Tue, Mar 10, 2026 at 12:24:56AM +0800, Icenowy Zheng wrote:
> > > > The G and J coefficients provided by T-Head TH1520 manual (which calls
> > > > them A and C coefficients and calls H coefficient in the binding as B)
> > > > have 1/100 degree Celsius precision (the values are 42.74 and -0.16
> > > > respectively), however the binding currently only allows coefficients as
> > > > precise as 100 milli-Celsius (1/10 degree Celsius).
> > > > 
> > > > Change the multipleOf value of these two coefficients to 10 (in the unit
> > > > of milli-Celsius) to satisfy the need of TH1520.
> > > > 
> > > > Signed-off-by: Icenowy Zheng <zhengxingda@iscas.ac.cn>
> > > > Reviewed-by: Drew Fustini <fustini@kernel.org>
> > > > ---
> > > > Changes in v3:
> > > > - Added Drew's R-b.
> > > > - Fixed some typos in the commit message and slightly reworded the
> > > >    precision sentence.
> > > > 
> > > >   Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml | 4 ++--
> > > >   1 file changed, 2 insertions(+), 2 deletions(-)
> > > > 
> > > > diff --git a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > > index 56db2292f062d..7d57c2934a8a1 100644
> > > > --- a/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > > +++ b/Documentation/devicetree/bindings/hwmon/moortec,mr75203.yaml
> > > > @@ -105,7 +105,7 @@ properties:
> > > >         G coefficient for temperature equation.
> > > >         Default for series 5 = 60000
> > > >         Default for series 6 = 57400
> > > > -    multipleOf: 100
> > > > +    multipleOf: 10
> > > >       minimum: 1000
> > > >       $ref: /schemas/types.yaml#/definitions/uint32
> > > > @@ -131,7 +131,7 @@ properties:
> > > >         J coefficient for temperature equation.
> > > >         Default for series 5 = -100
> > > >         Default for series 6 = 0
> > > > -    multipleOf: 100
> > > > +    multipleOf: 10
> > > >       maximum: 0
> > > >       $ref: /schemas/types.yaml#/definitions/int32
> > > > -- 
> > > > 2.52.0
> > > > 
> > > 
> > > I have applied this to thead-dt-for-next.
> > 
> > That's odd, why is a hwmon binding in your branch?
> > 
> > > https://git.kernel.org/pub/scm/linux/kernel/git/fustini/linux.git/commit/?h=thead-dt-for-next&id=eb4fd43ff6793681f0a0a8e8ac861142caba2b19
> > 
> > I don't see an ack on it from the relevant maintainer either?
> 
> I don't get it either. Normally I am the one to apply hwmon bindings
> through the hwmon branch.

Sorry, I should not have done this. I should only be applying dts/dtsi
patches to my thead dt branch.

Thanks,
Drew
