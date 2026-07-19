Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B68B31DB13A
	for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 14:28:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784471338; cv=none; b=PqxO5YdP1GDyPoBekBJySLS+zsrcAaf9eP5VxetvNM7XWCJI9ySN3uaouUmNjIlgMdTZ4NRu+NI91lnA24ck2WEtKfnJyDXxAt7K6gGcU+Z6S4zX3yTmiS8h9AxI7GNkP6vJtUGkpF3sz37oSO7ouwExPK30mhdkXLLPAP8E5hs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784471338; c=relaxed/simple;
	bh=ggVjkFZct/5lkhmmHlU+eub6iJOrvUDtrMTPOvTQKjE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=rh+CD+y6wnKFclvuC6kW41rrXD4Tg2DmB5pDJUONG7TWC1a3o4v9x/02rXL8ScHT+icn7CLGdbAdJ3INlqbGaSrw/3yLSpC+iQhAyM0805OzTLaOIv1wVVBcv93ryWEHSJN/ycivx9vgSKuZsSfW9WvrLShhqyiVQ7dk5oKL3us=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Cj+AG0yy; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Cj+AG0yy"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2caf228a910so72614665ad.2
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 07:28:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784471337; x=1785076137; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=MC98ctxgW8MLeh3Pdj+g0UDjTMAemyH6Fuqjpns6SUo=;
        b=Cj+AG0yyzPm2H1QbwUPA+xkj4JJ4neDekjMC+vdOHCS4XQVoq9/XtUO7NDf1KxAcMd
         3MWsT4K1puDvTD3EueHbzQEAEnztz96GJHQ9SQq/axeo6YAc3BjwnOmjMh7mkGeMGgkm
         Xrud/gueaSkF8AYoe1kgcCcmd4sSqlwMOuNSzPVQMRKU+2j3x2GzIjY/i/zZaVLD9VgR
         cqgsR9R42hUJIA2i1Y+3/QQZJQwQabJNvEf8s8a2s07UG4EYLW39KjK2Y357CsSFInvT
         YyY403vY60K9RWOGTCQh31FxlQwFvJYfWL54G0woFAbozkftg1svXBM7n40BNUZYzteQ
         t38A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784471337; x=1785076137;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MC98ctxgW8MLeh3Pdj+g0UDjTMAemyH6Fuqjpns6SUo=;
        b=TJ6PtuiHF6nCGLOCnaAUtosxn2venOozZgkmsGoLDeGSsvsXBXDYnBJD9k1LZYRxtZ
         gqj2JCJNV0NwK1/gUunHHHdAeMrWy3vb5cMSvMowu9QPrnxD4fyz4J2dc3hwTmvTR3M7
         oCIR7ZOxingwinrGabab8msVNhDsZPDicw1DDcVoJb2zH7jPKOKNrYnrdu0wsO7GzeE+
         Z0xOsnW1g2PSRna4K8oqItakZKRjExYGOs3x6BVT0QtQtkSWraMZ9OLhtGqCUe5Tn7u/
         kYGs9TpKT+oOVpDbz2U9v5tZFpBylJmLRNI14wPpCwlGKebMtme9szjVWaU9WGerSJNC
         81sg==
X-Forwarded-Encrypted: i=1; AHgh+RqO0IrMydqSRfhXBryzyNfa0LUjka4R2N9SFQj05NYTf17brk81SIwLIKyjh/A3vIbRvoma26bM7ejCrA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwkexXHQ3LtMVd8icZtfJvZX36D1+myZvuw/lfbJ7nxPQTmiVXj
	VGD9JLp9M6soePHhaXmQ/bJUd1k0pVqtNVnxS/wk+4nsx0yiL7YAjaNn
X-Gm-Gg: AfdE7clop7nEaFPbdDrfHXRD1Q9yl8JOIkV2H8K5cA8sOmkh5ExB8UkSjzHvf1vIF0A
	kCiuEH4L7loAv2NZcJlSWx02F0hd2mPTwVh0mQJ4g/Lgs3FGqBd3tkkvZlfvJYT9W4XClIKFRYI
	OHVyVEvSL4JhN1m3qKmP79gRhjPuPF6amDNAYO/xFBgzyecur3NQEZZ+LzUMquz3fAKEPC/aCjj
	uSwSrtRd9Xx5IHnMyuzGtW73EU09+nDAYBGWMFqY7g4uF1m6GhWCvr/3XQO69Lg6WtXg6X+E11c
	OHgq/UXELKiFkVxghoILregInm01iFL7H1sncpAjmyzG+C28PGJTd5dgIQrp/Z9/0pVnT6DxIZB
	nhyoM49aKam8wQZ3Scm89KdEtAG5g/MQ3CkWaeWX+f+zyUa60kTcO0SsfPWMGFw71WUI4fmw8/5
	pL3XVU9BlFgecflv4=
X-Received: by 2002:a17:902:fd85:b0:2c9:b1ed:eb5d with SMTP id d9443c01a7336-2cf34a2a308mr114210865ad.47.1784471337121;
        Sun, 19 Jul 2026 07:28:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:da43:aeff:fecc:bfd5])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2cf346daf66sm41246475ad.50.2026.07.19.07.28.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Jul 2026 07:28:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date: Sun, 19 Jul 2026 07:28:55 -0700
From: Guenter Roeck <linux@roeck-us.net>
To: wenswang@yeah.net
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	corbet@lwn.net, skhan@linuxfoundation.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add MPS mpq82d00
Message-ID: <bcf83c20-166b-4473-8d5f-16444b4434ee@roeck-us.net>
References: <20260704081810.1701587-1-wenswang@yeah.net>
 <20260704081952.1701914-1-wenswang@yeah.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260704081952.1701914-1-wenswang@yeah.net>

On Sat, Jul 04, 2026 at 04:19:51PM +0800, wenswang@yeah.net wrote:
> From: Wensheng Wang <wenswang@yeah.net>
> 
> Add support for MPS mpq82d00 controller.
> 
> Signed-off-by: Wensheng Wang <wenswang@yeah.net>
> Acked-by: Conor Dooley <conor.dooley@microchip.com>

Applied.

Thanks,
Guenter
