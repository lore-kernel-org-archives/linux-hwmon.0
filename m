Received: from mail-wm1-f42.google.com (mail-wm1-f42.google.com [209.85.128.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96F193CF210
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2026 19:57:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783367836; cv=none; b=TmWv/r9Jcdy2EUbrxubIidpIs0dAZdHKwXP8h9YnPDkIM15iV37NINEHyTguz2+1Ce302pOhKgeH+GMWm/uNhq+JQ36vnidxYLWk0MPnpB7d3apsLYg1bfvH4y6GQDFCB43kFKSVvuI00aKcIf6u5MFzYqCPZKDJ7Ws0Fsi2yVs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783367836; c=relaxed/simple;
	bh=/furvPX525MY3jFRuyqHnfzD0IQttOMr6X/MTzUFjKI=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=A0YlK5EaL5mMvuncN2lAgdZ/MJyal5Tw8XSXRhRpYgjvFfbXUj4/Sqa9LOmR2L3Hh/yQt8N3SGf+ZOQj4iM0JLOxvNxz+Sf1Gt69bd++JBmZ83b5aln4V5C86C9o6xRoWJkt5ks6rUXsAYlxp9GQLXQsavT3sI+GqSWYdxLh+bw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=enlcFbtX; arc=none smtp.client-ip=209.85.128.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="enlcFbtX"
Received: by mail-wm1-f42.google.com with SMTP id 5b1f17b1804b1-493c83474ddso30886185e9.3
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 12:57:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783367833; x=1783972633; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=ZghLehPmGh+KXE5a35tMjUm1Efi/3xC0F9uWNmKMTH4=;
        b=enlcFbtXZ3FyGEs7YFEZi66YTBujSCwzcd365oNZM3cg6gsagNx3IGiT8rrj4QkEnG
         YNB96ser3QvxiKad3MonzEQU1l8xMJeAcZTgMz8a0dpz8G0WDuYEu0lOr/cFKJphIFxP
         Q/wHxwFobjBTsBWk7Wb5ls2YAWwYEQeUsjk25KDWbNNMiiD07VxMBYoMk864QCPaXr+h
         jWwt6FAzFs0OcgOL0H23eltB94MoMAjsS0yfMVgXbcbMQcpcJhPtaFG4DY8S3FQQ60+I
         M5G/UaBKFDEzpwwGN+3k7BJfjL4BOEUdjPxpSmQ2SnHSCxYcKRYKN23kihK8qC5tCakB
         k0eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783367833; x=1783972633;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZghLehPmGh+KXE5a35tMjUm1Efi/3xC0F9uWNmKMTH4=;
        b=TJ3J7WrLABOffQ9mTwoMcXf08G4HvxlJBazuqOiuvG/6yAdRdi3FPZwOpmkatBu8RR
         jVizFh0zJ2vUh6buP+Vb8CvJ14yt+E3b7GRm8tPVBFnKdRiauIAmjn1ZyEsLOCQlvT9l
         h3z4DvOAhYpDk42O9dfCzOCCdf0rEM7oU5XG2LPuN13BgDHQ1HHJF8/+MALJ4ILBHXEO
         pJoxsrVSFjEYGT046xsINdy+Z+is6fUIXwJYWLjmXn74UiIGyS2MTmPa7doGyb7rokch
         k+Bk08ek2B3OYmpaAQmRRuHXCEGOmjo7A/00/v47KU6pR10L5kr6Dh5h8rz4QB6LTBFX
         v0rw==
X-Forwarded-Encrypted: i=1; AHgh+RoyR5wXS/frlWcHzM8pQT7QsPXlHsbvFZ/TKNXT59VTazLeSgYjUxGoXVuU+tExzOZHCuDL+jAlDg59QQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwKEeCNeXZNYKh3Eh6pxfQ8W1CYDNXrzRe5aNCMa41FdGklfL/d
	ko2Olz1LYXGcKMUtyASspCUvG3v//+iqp0kqvcHRJG79VobBZwie2WNq
X-Gm-Gg: AfdE7ck1LDG68GhbRJoUSS+S2u3egvmsgTo3P4x+mHp8qFZ8vNDbrB8vZ+rkSak6FHq
	Qmo/l2A8mt7LK4XdSVrF8tKRZIzsAB15BndMruaOz4lvHpF+VlJEzpCUlMKoqaz9z8SmTEfm3u/
	5IWG7ML4uDtzxT/U5l9srT+W5rdAiec5rRzxv/P4RjGGuyzS176nBxktHCCTnZoWVYNgM+O0+bv
	90yiiMzWE4fqEEp2P/D4EjXYzmp3X/tkalfEIzLlLK1BB7aAKzE+KCCXnvObJGTE/Wj8A9yYSzB
	DJuw/X04K+/bop5roTTWg3GMyY1cldQIdv4ehsmtA0RGpBzQf6xvk/9Fc4xRFmH0cPb+z/eOOMy
	bG8YI0cxKd+w4Udycd73nbNOHaDKUCuhVVv0tWp1jZUlUh1fKp/yllrhzjzHzmX0+c2flKWvPTy
	iHN5llyqI9UtWqPztkQZMjIk/oo0CFh52KzCSy7yXdrem8Ow==
X-Received: by 2002:a05:600c:8506:b0:493:a438:7f98 with SMTP id 5b1f17b1804b1-493df08c944mr19822825e9.18.1783367832697;
        Mon, 06 Jul 2026 12:57:12 -0700 (PDT)
Received: from pumpkin (host-92-21-50-228.as13285.net. [92.21.50.228])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-493e006b6b1sm10506585e9.3.2026.07.06.12.57.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:57:12 -0700 (PDT)
Date: Mon, 6 Jul 2026 20:57:08 +0100
From: David Laight <david.laight.linux@gmail.com>
To: Animesh Rai <animeshrai853@gmail.com>
Cc: steve.glendinning@shawell.net, linux-hwmon@vger.kernel.org,
 linux@roeck-us.net, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: emc2103: use min_t() for explicit type in fan
 target clamp
Message-ID: <20260706205708.1da4fc75@pumpkin>
In-Reply-To: <20260706162519.6087-1-animeshrai853@gmail.com>
References: <20260706162519.6087-1-animeshrai853@gmail.com>
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.38; arm-unknown-linux-gnueabihf)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon,  6 Jul 2026 21:55:19 +0530
Animesh Rai <animeshrai853@gmail.com> wrote:

> Using min() with an explicit cast on one operand is fragile. Replace
> with min_t(u16, ...) to make the intended comparison type explicit and
> avoid implicit type conversion.

min_t() is worse than having a cast on the argument to min().
It just casts both arguments to the specified type.
If you'd tried you's have found you could have just deleted the cast.
But why is new_target u16, it could just be 'unsigned int'.
That saves a load of masking instructions.
Were old_div 9 and new_div 1 the rescale could overflow 16 bits,
overflowing 32 is much less likely.
(The surrounding code may make the overflow impossible...)

If the code even right?
It ignores values 0x1fe0 to 0x1fff (assuming the high bits can't
be set) so they must be 'special' in some way, but doesn't stop the
same 'special' values being generated when rescaled.

	David

> 
> Signed-off-by: Animesh Rai <animeshrai853@gmail.com>
> ---
>  drivers/hwmon/emc2103.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/hwmon/emc2103.c b/drivers/hwmon/emc2103.c
> index 27dc149a3ed9..fbb1b4025eb7 100644
> --- a/drivers/hwmon/emc2103.c
> +++ b/drivers/hwmon/emc2103.c
> @@ -348,7 +348,7 @@ static ssize_t fan1_div_store(struct device *dev, struct device_attribute *da,
>  	/* update fan target if high byte is not disabled */
>  	if ((data->fan_target & 0x1fe0) != 0x1fe0) {
>  		u16 new_target = (data->fan_target * old_div) / new_div;
> -		data->fan_target = min(new_target, (u16)0x1fff);
> +		data->fan_target = min_t(u16, new_target, 0x1fff);
>  		write_fan_target_to_i2c(client, data->fan_target);
>  	}
>  

