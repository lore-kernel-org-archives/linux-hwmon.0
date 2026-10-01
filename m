Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5BA333B777D;
	Thu,  1 Oct 2026 08:18:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790842684; cv=none; b=fxL/Nkr7KT28XqNzlklvCEBvV7n0dypThgjqYvoilTIKqUgzWibE/USqVaFQBvp6H5azZkNLg+dMulknqwOwrwTRAaMyJ/wu7qqp3AtSBPX9Z9rQypIHd21wCpB1VFH0t8OCZ5ByyyAZqUKlVQ31+w4RAc9ay2xRilkn9OKfDhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790842684; c=relaxed/simple;
	bh=QXDQ+OspMZqb4HJ/NT5tmFnjddbCDSZT5sV4r+E4/EA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tMPf/Z5lTFsoZ2sf++JnUU+KamTqH79aDmtXyokFCa+vmOr/iCDXyUFKEdGbvOt9TfilYqLnsbedloXylC/S2R7PUultNhfA1uSPwAj0h5OD4bHzUFDtWJKYwBwE+qu66ujpdr/anQVn31+T0zds9+e8dAXzcoNxwdnVGG51KgI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TeukVepO; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TeukVepO"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2C12C1F000FF;
	Thu,  1 Oct 2026 08:17:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790842681;
	bh=uJ4LATxvBGPupAWwKvn70eY8k8KsKVWYIsLbmOrHFcI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=TeukVepOUU2MqlJIhZaQeIwQKh7jNTqLX8qmBh/FblfNocvXKs4lb1IWCXQpuJMUL
	 gdIr/rf5I5lK000e8kFodXr3PpvmcFLJRJTJUhpTt+nwH/pBH2m51HsAJgc0OmccX3
	 sifQ1cEDslyqq/IaP8C1nk86QDAcHMtlRI6AbcuFTheZY3FCC/Lf3LlyA/JTga5+pJ
	 BkKh882rlrBjgviIRlx1KH6jPbm4Z7clX+4FEcUMEygrKv3jzp9C1mzXdXrMvJrmK3
	 Kn6BMp/P0dcdR3LEhorzsWpswfPVrmcPSzYVa0li7/iQnFNLAgG5lwfoUxPpwJjk/z
	 kPKZhPEoPxOcA==
Date: Thu, 1 Oct 2026 10:17:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Luna HART <lhart.opensource@witekio.com>
Cc: "sashiko-reviews@lists.linux.dev" <sashiko-reviews@lists.linux.dev>, 
	"robh@kernel.org" <robh@kernel.org>, "conor+dt@kernel.org" <conor+dt@kernel.org>, 
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add TI
 TPS389004/TPS389006/TPS389008
Message-ID: <20261001-luminous-alligator-of-inspiration-4f80f3@quoll>
References: <20260929-lhart-dev-tps38900x-v1-0-7045c5894152@witekio.com>
 <20260929-lhart-dev-tps38900x-v1-1-7045c5894152@witekio.com>
 <20260929231757.5B97D1F000FF@smtp.kernel.org>
 <AM7P192MB07852B4444A165F85EE74B14B48B2@AM7P192MB0785.EURP192.PROD.OUTLOOK.COM>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <AM7P192MB07852B4444A165F85EE74B14B48B2@AM7P192MB0785.EURP192.PROD.OUTLOOK.COM>

On Wed, Sep 30, 2026 at 11:28:08PM +0000, Luna HART wrote:
> On Tue, 29 Sep 2026 at 16:17, sashiko-bot@kernel.org wrote:
> > > +allOf:
> > > +  - if:
> > > +      properties:
> > > +        compatible:
> > > +          const: ti,tps389004
> >
> > [Severity: Medium]
> > Will this properly evaluate the compatible property?
> [...]
> > Should this use contains: const: ti,tps389004 instead?
> 
> I believe this is a non issue. This pattern is also used in an existing schema file:

Correct.

Best regards,
Krzysztof

