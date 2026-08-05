Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93C5D481643
	for <linux-hwmon@vger.kernel.org>; Wed,  5 Aug 2026 16:14:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785946478; cv=none; b=rbBZqAtGQ/E2e4dulKqFYfDf8E00fz10PmxcMf2SxdEhlcebPO/a5WOsxtXc6rLdFRMCDu3dDdd6+KjS/pvtDMlXvR4b+9lwxqwNIaMUH7Wv1g16mfS5JxI3XvLcKY9/LeNe4wNP9DHq82P/aiufQ0hh7O318roPf3CMO36vd/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785946478; c=relaxed/simple;
	bh=bFZ+hJc9hMkjK9pdIPk5VrPSB+cjGP1DqZ9Px5qsZ0E=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=MRHefr1lHv7W1YPPGCLWVH97hOTqh5n4FWV93ff2f4lYn6qIBf5QUfjhL+GZTPkpvjfmpohJabVhzJ6BSr6xFHs78V3Q/vjshpnDZKMwdCvWXNUKrnBWh3xO5/ZaQKb0B9tIsiswJf8qCKAzaATxCP0BC6qEHvnerAPtlQFEQOQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=emCtkU0a; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="emCtkU0a"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49553515a8bso17457215e9.1
        for <linux-hwmon@vger.kernel.org>; Wed, 05 Aug 2026 09:14:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1785946471; x=1786551271; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=H8IBAabbdLNLLkqRza51KFEaOOm/QjUQKw/O3KuPRRY=;
        b=emCtkU0aR4ObG+sgU1yHVsE1J1uCN1qhUaWiH0BaSUlAZFDo+cwm4ve/GqITWLaxN+
         PQPePdCjNL8anOr3dGlus3Rq6IsCHfG6PnxJj9YpFuMGVp2/N30zl9Io4DXCt7S8MFrZ
         pKy/TMtt8kvwfQ7kZp0M2wJFtxGUaF7nZs85aPCgH9K7+uVNjtHt9gxvEqKVZIAFtwel
         pHRUUXxvUwym2shYkEt43tzTa80St71CDVS2AW+ijKvDGbUxoafo74R6tHNJfO/+gJKG
         Jc6TeoSc/kRvaEFIOdMU5vWiT7HFTL/V0yrG5CIQgfh+wCS0S/vXet2LduWrZ4Hj/CK4
         8iuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785946471; x=1786551271;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=H8IBAabbdLNLLkqRza51KFEaOOm/QjUQKw/O3KuPRRY=;
        b=UlPHUa+KQqdwznqpaMvSanMv9lbIqh0/2XHzqXpuncOEv2UUI3r2jFuN0ROwlbY5nF
         MY1GI97QUvx+F89MMl/Pi4p1Dtd6F9mDZXfyJSUx8dQPewXYLz21SGAMosRkjNuvF2LU
         HEICoS0Sy1wVUa7/gHwTlP7dTBGfbqfmGf/+RDKqY4XHcJQ0gEvcerwREr1Wx4mYBVcA
         6sqR8i9V9YyvSj6rv0iiH8dZGGA9L3CVTMCyP5wLK+dA1C59GOoThjF98FHaROppDFy3
         zNtif4Cr+Fd74EfLiloijoVrRM0RXoCn0T7bzASbx+T/8kj5qzDQV2OB+FDUKn2OWOch
         +fbw==
X-Gm-Message-State: AOJu0Yy+OtRaT8CcpKYcFRMxNq++jtcunb2ZET4+IZ7x3piaUjmndvwr
	mjDHibCRuYIdoEdfp1lF3yngOF3mdRI8CjCM+4fM6JWgXgBFNZqMO1NKTSooo6sm
X-Gm-Gg: AR+sD10Op0xw4DUiDDtgJrcFc/1eaYzz+YFoeiEqVaEKfzZQTfxmHPbKbSbC76c38ao
	o/N5z2M+/uO+zX0iemytCm2GOadK2esSkhi7DGkwTZefZwLDqYdUlTpoLTwXBsiQik2c8+Vuhz9
	GIF2M0MQPTYJwf+pBZIbZ1wBVaTmKZ6svM952cMD3Fm5HRPe8KxApgzpIO2mGUxJpt0DNZBq4T9
	jfKFJI16UNgSm5hhuuZGCGlpqXghKjq87AANKINnr8JiOw/2iQ3Oh6GxF2zPbqrNAWrl7Zdoyps
	2ndbve3sKnSHOcR4AUkzrRXCIKjMjF/vaXOnvT2k8hBA2kilgIEG3qOr8PgThhbuzm0R5OB2QOY
	7Pj9v+9n5/rYlIsI4DlaHl2LEmf17okJGagFvxpvOl3HZNbZD2wmGCB2eC5cyNY7efqUDEHk7W5
	a+O9KUofJoZcTvv8Du3PZTCyKGzDuNYOZLJYs70j6WuIk9b9vGgK+H
X-Received: by 2002:a05:600c:3589:b0:493:c845:bc20 with SMTP id 5b1f17b1804b1-4994e79ab0emr108087475e9.4.1785946471167;
        Wed, 05 Aug 2026 09:14:31 -0700 (PDT)
Received: from nsa ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-49949fc2da2sm211935055e9.3.2026.08.05.09.14.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 09:14:30 -0700 (PDT)
Date: Wed, 5 Aug 2026 17:15:41 +0100
From: Nuno =?utf-8?B?U8Oh?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Hardware Monitoring <linux-hwmon@vger.kernel.org>, 
	Nuno Sa <nuno.sa@analog.com>
Subject: Re: [PATCH 0/3] hwmon: (ltc4282) Fix issues reported by Sashiko
Message-ID: <anNhXSyk19mBzUTx@nsa>
References: <20260805005721.1566034-1-linux@roeck-us.net>
 <anMA34nFCvAQUk6V@nsa>
 <842d9244-8e00-4df4-89bb-c40d0c73e203@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <842d9244-8e00-4df4-89bb-c40d0c73e203@roeck-us.net>

On Wed, Aug 05, 2026 at 07:28:34AM -0700, Guenter Roeck wrote:
> On 8/5/26 02:26, Nuno Sá wrote:
> > On Tue, Aug 04, 2026 at 05:57:18PM -0700, Guenter Roeck wrote:
> > > This series started with a patch fixing a potential overflow issue in
> > > maximum poer calculations. Sashiko then reported a similar problem when
> > > setting current limits, and finally found a problem when evaluating
> > > adi,current-limit-sense-microvolt.
> > > 
> > > This series fixes all those problems.
> > > 
> > > Note that Sashiko reports more issues in this driver. Leave those
> > > to be fixed later.
> > > 
> > > ----------------------------------------------------------------
> > > Guenter Roeck (3):
> > >        hwmon: (ltc4282) Avoid overflow in maximum power calculation
> > >        hwmon: (ltc4282) Clamp negative current limits
> > >        hwmon: (ltc4282) Fix parsing adi,current-limit-sense-microvolt
> > > 
> > >   drivers/hwmon/ltc4282.c | 20 ++++++++++++--------
> > >   1 file changed, 12 insertions(+), 8 deletions(-)
> > 
> > Hi Guenter,
> > 
> > During ltc4283 sashiko's review was clear to me that this one also needed some
> > attention but no time for it so far. So thanks for this.
> > 
> > Also, the clk_init_data remark is very much an issue. Not sure if you
> > can fit that in this series. Or I can also send a quick patch for it.
> > 
> 
> I did run the series through Sashiko several times before I sent it out, and
> it did report a variety of other issues, but not this one. I am not really sure
> if initializing the data structure is sufficient, so I would appreciate if you
> would send a patch.

My plan it's really to just add ` = { };`. At least for the clock flags
might really be problematic to have some random value.

- Nuno Sá

