Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=130.239.18.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793973019;
	b=LfVQix0jyLKlyDz8EdSfUyze0ZSWoqF/75rCgQPdFEj05H9vg9JzVCFfvQsTAWzSAKg3
	 taxE5mPn+FK0qpjF6+NcsuGg6+jiYMoRppyhd4wYtFVLj60K/Il8HzqcM2GB3RxR5P1uJ
	 xvNdUw34G9WQ1l46nQDKEQxtsxreu3G2btI69xttNEfpkWOd/gMkKegV0Y4d4zoruijTH
	 tYKXecKqKWi/QM9iLsH05KRPmPOGR6yXadX51oXGpIf/wc6vvuy+qmpcoOABp+OorrhTG
	 Ma7sZyNtYgHcRT5BYiY/CjA7AKjAwh6liNdhmi4iA+QJt38S1OOQpbEV5j7pIKvN7Rg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793973019;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=ANBlmTwShaEwErG21jXGNj3PDZf6DNbvT/J2U/bYhqM=;
	b=tOgqzuWKyywpy8f3lB2aA01m4jgF/g4Do2aV1iVnHWIIj/W/WV2hNq4lPZ6F8LC63Ixc
	 fQXKL1YIpgIWhyK16N19UCdDsfZ9SmRIRPt3AeMPHCdhkB6pN5D4Y1wsFaxQU/syXlcMx
	 jpn1ykXbErwScQGfL1jfNuKyDibwzXcI1QfLGCNMv5MEJIYtbu6IFuDm7ztSbwpYwKZNu
	 KphPkipses30axlPARNOx8CDsQjHUTRpZ7VWAwXwf/n3jYa/IHGXyHrkd70grj7swKxcS
	 i0aCwvPbptz+urieytZzcXSx8PHPH02YwZ7UXVaDO3Nd4j7SvVYw15YUgkWTovOCxow==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ac2.se;
	spf=pass smtp.mailfrom=ac2.se;
	dkim=pass header.d=ac2.se header.i=@ac2.se header.a=rsa-sha256 header.s=default header.b=TaYOOPFU;
	arc=none smtp.remote-ip=130.239.18.156
Received: from mail.acc.umu.se (mail.acc.umu.se [130.239.18.156])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAB35606A326
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Nov 2026 13:50:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AAB35606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ac2.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ac2.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ac2.se header.i=@ac2.se header.a=rsa-sha256 header.s=default header.b=TaYOOPFU
Received: from localhost (localhost.localdomain [127.0.0.1])
	by amavisd-new (Postfix) with ESMTP id ABE8944B92;
	Fri,  6 Nov 2026 14:50:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ac2.se; s=default;
	t=1793973014; bh=DWVp2FdiDTw4PVB+k91ShmuvJ9Kry/xwhloNL8qMzms=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TaYOOPFUIsdXTkPnpDQETA8u/5JNVUtcmByYP6v4xfQ8Q5VaYaGjvtK0y13DSvi/z
	 S/yKdvs2f/qewFhTFe17mFu+TGoX8ErRdYcmkd3qB39G27wsB111RYEE3ipZJcIGtM
	 5Ui4Etu9pz3zEntDfkfTmGK3nqLgb3vhwxs8iliE=
Received: by mail.acc.umu.se (Postfix, from userid 24471)
	id CC6CD44B93; Fri,  6 Nov 2026 14:50:13 +0100 (CET)
Date: Fri, 6 Nov 2026 14:50:13 +0100
From: Anton Lundin <glance@ac2.se>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH] hwmon: (nct6775) Add support for NCT5525
Message-ID: <au3bFWAf/Vkaqq8/@accum.se>
References: <20261103132948.144216-1-glance@ac2.se>
 <9e1f1a68-ef65-4e38-9396-48836ff50979@roeck-us.net>
 <au3L9FJUVRDuIsVN@accum.se>
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
In-Reply-To: <au3L9FJUVRDuIsVN@accum.se>

On 06 november, 2026 - Anton Lundin wrote:

> On 03 november, 2026 - Guenter Roeck wrote:
> 
> > On 11/3/26 05:29, Anton Lundin wrote:
> > > Extend nct6775 driver to support NCT5525.

...

> > > @@ -1191,6 +1224,10 @@ bool nct6775_reg_is_word_sized(struct nct6775_data *data, u16 reg)
> > >   		  (reg >= 0x59 && reg < 0x69 && (reg & 1)) ||
> > >   		  reg == 0xe0 || reg == 0xe2 || reg == 0xe4 ||
> > >   		  reg == 0x111 || reg == 0x121 || reg == 0x131;
> > > +	case nct5525:
> > > +		return reg == 0x20 || reg == 0x22 || reg == 0x28 ||
> > > +		  reg == 0x59 || reg == 0x5b || reg == 0xe0 || reg == 0xe2 ||
> > > +		  reg == 0xe8 || reg == 0x111 || reg == 0x121;
> > 
> > Sashiko has some valid concerns here.
> 
> This is the same as for nct6106, nct6116 and nct6126.
> 
> As far as I see it, we would need to look if we're in speed-cruise mode
> or thermal-cruise mode, and adjust if we read word sized or not.
> 
> Any preference on how that should be done or should I just make
> something up?

After stearing it down for a while it became pretty clear how to solve
it.

The code already handles it correctly, it's just that the register is
always read as word sized which is wrong.


//Anton
