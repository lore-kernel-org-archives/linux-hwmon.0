Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=130.239.18.156
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793969152;
	b=NotiAXjjX9vk9tIiT9NO8n46peJycDyeiovzzSZAIF5cQMJ0C8c4bPv6jM672hS3R2FR
	 9xaN5ChwoUgq84IUeX+JqnDlVlvtZmRBgeOdg1ESM+8ZNnlu5VNCKjAzfDWoL1As1MsI3
	 1f+usWo+U5HFc+yBbSygJdaB9KsClmk6TECHjxBCMilr4ZxvP8Z0vmkhwW1zqWiguZQkT
	 Ic4FH6wERVKv9alFsNt2lOu2eVkgcz7OvTyDZAwVs33L+m66nTWAaVbusD6yC/mctciag
	 cBbp5U6sYtuPZRavC0DJv0pScnmgICGiHSBNjEA6D3IpNBBW/R6RGdySeLBMFToqVjw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793969152;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Date:From:To:Cc:
	 Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=CB+fx59s9obQhpP45y+vZfFYVQ50if81DU7gRG4CuMY=;
	b=p2ENYwDpS1x6w5zj4fyxwpRj+WOgyRCxAUC/+0PVrfwdZAQ5t1t66llXJ5amiYxgN3eC
	 SX0Foa3LF7Kiu0Fwel00EgtfsodYRzBIFKlhtmApIt04o9y2uQIuN4W3aUmQGZB/ac4x0
	 NgUr0Dv3SPzGeGFmVjd0VNGoG+fESymyfKhbg7nsl01UZZsU3yh+rd/ncU4CfS5e6yryY
	 5HofwyztJWbUa9I091yxxmc7nuEcUKAlVgdRaKefD1XlomXlxtd5X2cDnY5vbij6GemRq
	 kPgnzuyHaPR+0xPqHKxNNTR1OUCwM+MvJRJYTALPMIqCFdho7rNDUCq66l4nP0aomsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=ac2.se;
	spf=pass smtp.mailfrom=ac2.se;
	dkim=pass header.d=ac2.se header.i=@ac2.se header.a=rsa-sha256 header.s=default header.b=QiqLXQHb;
	arc=none smtp.remote-ip=130.239.18.156
Received: from mail.acc.umu.se (mail.acc.umu.se [130.239.18.156])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 518DA606D807
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Nov 2026 12:45:48 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 518DA606D807
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=ac2.se
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=ac2.se
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=ac2.se header.i=@ac2.se header.a=rsa-sha256 header.s=default header.b=QiqLXQHb
Received: from localhost (localhost.localdomain [127.0.0.1])
	by amavisd-new (Postfix) with ESMTP id 4936F44B90;
	Fri,  6 Nov 2026 13:45:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ac2.se; s=default;
	t=1793969141; bh=kA2xVKHcLn8zBehRXPU/QMIv4zzFfkOb39ym3e2djv4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QiqLXQHb62h+FjcCNlMRepQReulQaLnqLiU0jtq6ZT/x1Q24PI/FevdFhvJO8h5jy
	 toem4ywQ1QWyz6BBTbAUzE30D4XaJJQFc1wy1bneBPNO7lsDBob1DyNkaI/xKYMEoC
	 YCHXuxNf+Vc3ucIBJSm+R6O117SJT6A1wsaeL8X0=
Received: by mail.acc.umu.se (Postfix, from userid 24471)
	id B5A1F44B92; Fri,  6 Nov 2026 13:45:40 +0100 (CET)
Date: Fri, 6 Nov 2026 13:45:40 +0100
From: Anton Lundin <glance@ac2.se>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH] hwmon: (nct6775) Add support for NCT5525
Message-ID: <au3L9FJUVRDuIsVN@accum.se>
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
> variants of MCT67xx series chips. I _will_ need to see a datasheet
> to confirm, or at the very least independent confirmation that the
> driver is correct.
> 
> Some more comments inline.

I've now reviewed all the comments and reworked the code. There are some
things I'm still thinking about and I kindly ask for some guidance.
 
> >   };
> >   /* Common and NCT6775 specific data */
> > @@ -840,6 +842,33 @@ static const u16 NCT6106_REG_TEMP_CRIT[32] = {
> >   static const u16 NCT6106_REG_TSI_TEMP[] = { 0x59, 0x5b, 0x5d, 0x5f, 0x61, 0x63, 0x65, 0x67 };
> > +/* NCT5525D specific data */
> > +
> > +static const u16 NCT5525_REG_IN_MAX[] = {
> > +	0x92, 0x94, 0x96, 0x9a, 0x9c, 0x9e, 0xa0, 0xa2 };
> > +static const u16 NCT5525_REG_IN_MIN[] = {
> > +	0x93, 0x95, 0x97, 0x9b, 0x9d, 0x9f, 0xa1, 0xa3 };
> > +static const u16 NCT5525_REG_IN[] = {
> > +	0x01, 0x02, 0x03, 0x05, 0x06, 0x07, 0x08, 0x09 };
> > +
> 
> The above are equivalent to the NCT6106 definitions.
> Please do not duplicate definitions unless necessary.

I've now remodeled this into:

+       case nct5525:
...
+               data->REG_VIN = &NCT6106_REG_IN[1];
+               data->REG_IN_MINMAX[0] = &NCT6106_REG_IN_MIN[1];
+               data->REG_IN_MINMAX[1] = &NCT6106_REG_IN_MAX[1];

It's not the prettiest, but it works. Is that acceptable?

> > +static const u16 NCT5525_REG_FAN[] = { 0x20, 0x22, 0x28 };
> > +static const u16 NCT5525_REG_FAN_MIN[] = { 0xe0, 0xe2, 0xe8 };
> > +static const u16 NCT5525_REG_FAN_PULSES[] = { 0xf6, 0xf6, 0xf5 };
> > +static const u16 NCT5525_FAN_PULSE_SHIFT[] = { 0, 2, 6 };
> > +
> 
> This suggests compatibility with NCT6116, with fans index 2 and 3 not populated.
> Would it be possible to model it that way ?

I'll rework it into that. The data sheet even calls it fan5 in one
place, HM_Rev_Pulse_Fan5_Sel.

All the registers aligns nicely with this, so I think it's the right
call.

The only interesting bit will be that the fan names are now 1 2 and 5.

In the data sheet they're SYSFAN, CPUFAN and AUXFAN.

> > @@ -1191,6 +1224,10 @@ bool nct6775_reg_is_word_sized(struct nct6775_data *data, u16 reg)
> >   		  (reg >= 0x59 && reg < 0x69 && (reg & 1)) ||
> >   		  reg == 0xe0 || reg == 0xe2 || reg == 0xe4 ||
> >   		  reg == 0x111 || reg == 0x121 || reg == 0x131;
> > +	case nct5525:
> > +		return reg == 0x20 || reg == 0x22 || reg == 0x28 ||
> > +		  reg == 0x59 || reg == 0x5b || reg == 0xe0 || reg == 0xe2 ||
> > +		  reg == 0xe8 || reg == 0x111 || reg == 0x121;
> 
> Sashiko has some valid concerns here.

This is the same as for nct6106, nct6116 and nct6126.

As far as I see it, we would need to look if we're in speed-cruise mode
or thermal-cruise mode, and adjust if we read word sized or not.

Any preference on how that should be done or should I just make
something up?


//Anton
