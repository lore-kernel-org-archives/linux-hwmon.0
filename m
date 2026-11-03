Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=130.239.18.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793727231;
	b=HBPXc4CTWg6AL2leOhNd+JdDO1oD4ho9jyvjH/2Kre8Y97KpKr6mBYQDKGTpVHKnf1/t
	 ccOQ+WIdJ+u+Z0bmgvQ80a84aqL01qBFUi3hc4pVswyMG/aELnREoG3NC1hNPhoTwO1N4
	 k7gXZCs1gBmfVZjNuLNSKtwpTG5YOHheNdd0pAnCCaDokbnkN8oHH9ifEz6P9H4B+eW8a
	 /h5Iqhx/AVQkQtXUftqn9I0kXxmofgR4Kamf5PvaIsDZsbiFjhbat2EPO3NyT8TciBv+h
	 rwz5Kvc4QZnv5/55NcD9f5Hd//gBX3FwBo10XddjHvPrlyJXaNWdSJS9Xsel7WtoHnA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793727231;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=rXmDXcARzX0O5DkeUil04GxgnetOTJkg180BZgB6TM8=;
	b=neXFfW9PyDwQcnooZcW/c6e0MHdt/CxBkGcWUtoJ+W6Odc+D2fNRa1iiBrBHmFkoRuWD
	 PURONAq/6j1/zhx7zymlE3MCiQFadKNVVWIoZ8vOl2oPZz/dO+Tr4RQNKmHBfHIWKRB/p
	 dkRBKSsWM3+Sl6pHyhXUsPjgG6WyMIKodMhn/yQz0lQ6oi/L1YnP55TXs3CfYqrdiNzWN
	 77pCIYMTQodDHl+NTirHApsJOdx5ZXAA0psEutao/0adhOqmIHIfVzXdre3tgMrBKzUXK
	 TRZlEdl5DGmhVSSSUWXyQR5BCwuTf8YHq19PORfp17f3z5krU/58p/9AMTbxstnGAcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ac2.se;
	spf=pass smtp.mailfrom=ac2.se;
	dkim=pass header.d=ac2.se header.i=@ac2.se header.a=rsa-sha256 header.s=default header.b=ji92g2hu;
	arc=none smtp.remote-ip=130.239.18.156
Received: from mail.acc.umu.se (mail.acc.umu.se [130.239.18.156])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F673606A330
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 17:33:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6F673606A330
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ac2.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ac2.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ac2.se header.i=@ac2.se header.a=rsa-sha256 header.s=default header.b=ji92g2hu
Received: from localhost (localhost.localdomain [127.0.0.1])
	by amavisd-new (Postfix) with ESMTP id 8BED644B92;
	Tue,  3 Nov 2026 18:33:46 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ac2.se; s=default;
	t=1793727226; bh=oJk/fXUkfJdDx2eXj2yYL9tfoLm5ga41i/wpcz/MPdg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ji92g2huLF3DMsXPECV7mn7ySAfpSDnlNYs3Q5Fg7tdO8cH1qixO+oy39zuCS5rSw
	 bnjcfPaTYCws9w4hcm9MSSRXAGrpNasCmUgN/Jvr+IO+gvzwWZbIRWIcdF9FZt/SQq
	 PDhTBrm4CIxL0i6LMaX7po/J1Jx0hLCsY9LSv7rk=
Received: by mail.acc.umu.se (Postfix, from userid 24471)
	id 0507E44B93; Tue,  3 Nov 2026 18:33:46 +0100 (CET)
Date: Tue, 3 Nov 2026 18:33:45 +0100
From: Anton Lundin <glance@ac2.se>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH] hwmon: (nct6775) Add support for NCT5525
Message-ID: <auoa+d1nBZeD3U7s@accum.se>
References: <20261103132948.144216-1-glance@ac2.se>
 <9e1f1a68-ef65-4e38-9396-48836ff50979@roeck-us.net>
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
In-Reply-To: <9e1f1a68-ef65-4e38-9396-48836ff50979@roeck-us.net>

On 03 november, 2026 - Guenter Roeck wrote:

> On 11/3/26 05:29, Anton Lundin wrote:
> > Extend nct6775 driver to support NCT5525.
> > 
> > Assisted-by: Copilot:GPT-5.6-Terra
> > Signed-off-by: Anton Lundin <glance@ac2.se>
> 
> 
> I don't havea datasheet for this chip, but I do have to say
> that this seems to be off just form chip numbering perspective.
> From the registers it looks like the chip is mostly compatible
> with the NCT61xx series, but NCT55xx chips are typically scaled-down
> variants of MCT67xx series chips.

Yes, its quite close. My first quick-n-dirty stab in the dark was to
just alias it to NCT6116, and that worked surprisingly well.

> I _will_ need to see a datasheet
> to confirm, or at the very least independent confirmation that the
> driver is correct.

I have a datasheet which I could send you if you'd like, or if you
rather request it yourself from Nuvoton.

> Some more comments inline.

i'll go through it and send a v2.

> > --- a/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/nuvoton,nct6775.yaml
> > @@ -25,6 +25,7 @@ properties:
> >         - nuvoton,nct6797
> >         - nuvoton,nct6798
> >         - nuvoton,nct6799
> > +      - nuvoton,nct5525

I mostly added devicetree bindings because I saw that all the other
variants the driver supports had them, but then I noticed that nct6126
was missing.

I won't consume the devicetree bindings, so should I rather leave that
out until there's a consumer for it?


//Anton
