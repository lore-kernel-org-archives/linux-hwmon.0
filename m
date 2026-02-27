Received: from mail-ed1-f44.google.com (mail-ed1-f44.google.com [209.85.208.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A01DF33A030
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Feb 2026 11:19:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772191158; cv=pass; b=Jtec7f0ekdNybLYQQBSsIfRK6olSVrTUSaLJvBIj/pPKtYIlx9GB/4nhNcYob4oxScm2QXz4TOm2k5h+8kN+v6k/CWNQ7+tdEgePUvSKer9fBYTxOqOYAsncC4TR9Sln3lUH5HugFFqFOrnPTComXuZjBiYYvpbhfO7PHT/vf0g=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772191158; c=relaxed/simple;
	bh=IqYEhsL1D9wOTVoKnbtmM4dfqH6hZJq5zpOWmWUsdDI=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=E/WpWEuTBiluSJTNbzL9rYqDvgJgK5XIMIcFP4TnlpBS6GBlAWxKDCXOqOCzJDqzRzC4+sE7q/7QwfcKgWLEAV7F/xdSgnYAko4l9Te2yiRBBryHnmXdLl7j9Yf0fwfryiAjE2JGnMYmOx2YSO+/mhBlTGbNi4OSLFJDRZa5xYE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=iAH7MK5y; arc=pass smtp.client-ip=209.85.208.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="iAH7MK5y"
Received: by mail-ed1-f44.google.com with SMTP id 4fb4d7f45d1cf-65c5a7785b4so3093859a12.1
        for <linux-hwmon@vger.kernel.org>; Fri, 27 Feb 2026 03:19:16 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772191155; cv=none;
        d=google.com; s=arc-20240605;
        b=Ou74TzM4e7qlHq871SOBgE/qf2ncsVPTGc8PTPCbJdeaoZhPm27Y0xwSBY9DL1tEIs
         jur3Q102AONDiahJCf/ftf6oOAiz7dAQsjXjIiDKnU3wwr/J3wRmfYW+FyAxnrVGvQSr
         QIecxil5mNiy5NxgRXzLOzndWLp0zee88IPMT83E5dZbdm6ff7ww5rBm3rZ9KncEkkVk
         N/20K5XsDtXumLZS5nKXY1rwitttqYUBX43os0xOPqhBHq0cDpMKdDBwEAb4lbd3WYJe
         rE4XAljWIIUl8/3X1QFTuN2bul/EyVzahwP1yR/NfGIspPpNUamkPWfqmssf3fpMJd5u
         6g9g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=V4Xpqv2bHmTvN1Dj3fqhmrqYQsZINM78hGn3frtqwk8=;
        fh=vRYnEhK96BJpaWQDPdDL12HpvV7WYqH/b41vJNRguQU=;
        b=JntHHQLQpBBAx8h3ogNq+snIjiigq9VeMg8kIlHsia82cF3F614MMGLzT0YIHrFuF2
         sHklBlhoU6+QMyrTVotJg7CcXpGX57j3Nar9GtLonm+rrVX2mlr5xD+xvzuarqMAyhr7
         vK1mOZy8vVOXsXzTFhFgH6dBJNntJog1XPqLyO4z1KHK1pJCiK7haCJNOYJMSb5daLK5
         +MYmRUcga0kzGK06TcFXg87/nRRsZBRWnd1rcSDUzs4VrOObXm2ukd5w3fmeyPcgAzrW
         OsZEyKH7WcRtrS1OEeyH6RcXyibvvEIL66wuURKp+G7EzKJylmUW9lTrO27oB87cKQ8t
         J9dA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1772191155; x=1772795955; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V4Xpqv2bHmTvN1Dj3fqhmrqYQsZINM78hGn3frtqwk8=;
        b=iAH7MK5y4UCjKCLlC5p4toxmeQaBlNrXFrMxS4nMACM37Lc7yXyZfJn3E5POwdOqKT
         kR/6It4Lwakqj8TPcliC0J1ZcrMcuynA1ej8VLZ/9woN90RloAvyaLpR4IviTJrNqayg
         JbwhlpfYqLY4hVS116+fkzuqpJmtPbgGcomdP4hkL4BmEG/mudOS+iW48MTF84a6PmgO
         saIzOm6Q219vu/XsiT6DkITE2vdwsjVYU8JB8bwB7rnJrwLZzVi964/VlIfrtukyE84M
         ILQCjFVml4sLoufyIJUXR4mfi9YFZa8j4vk0bcM62Sxmxkpnoam94M37hkO3yZt70qbP
         rgjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772191155; x=1772795955;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=V4Xpqv2bHmTvN1Dj3fqhmrqYQsZINM78hGn3frtqwk8=;
        b=MNHRXDY7THDd9OD1FfdcYnPCCMbSHpzWG1bsxp27bGwvp30X0I7ViK+9Ia9vxzMtgD
         1sXoVuc5S+v747opJXFzOzf/ksOAjMC2VenrJAarxF8TLLJTvyvzXVQq6fxADxoOJ4/w
         WhsP8vDnWDbKa2OciJsgWDk9WmrEm4yphaIZp9kegkwiDFpJxOHPf2gezDekL6t9dQuv
         1dPSVEFj8Ax3slh4CK5VTDNCuQZm157+Lr/DWcUPSCDjokTqw+jAamXm1kgVlpoV03Ph
         qgFjiPRS5m3DJ1ySq65k20D8TY32p3cx0K4+ZUoO2a33AWHuADq0GQf6LIkTEtrnJB7M
         9oCg==
X-Forwarded-Encrypted: i=1; AJvYcCURhq14R2x+emhsPqK0ZqPubfwigx7SQIf8xhZ8tNjXrRCwPpccodjAU5QqguMBwq4Awhr2rfmU62PwSw==@vger.kernel.org
X-Gm-Message-State: AOJu0YwESN3OwfD/Ztpn1IbQkU85bgIZV00D3z8HwIDMKNZaku8pZqSN
	VbxlfrWtR+NWBvw+MWRFI6UbjKoHA1yekd3tIpS/+z2fm18I8LLsa+Whw2N9Fg56WGtvVpHL1go
	hrrIIiVYC1YsuaQ+5qHSbbQKmATcEvOIKIEbkh+tr/qgRLtln9qCWIqv6RQ==
X-Gm-Gg: ATEYQzy8BfG+5EFkQAe4I6ojwL9fifrZgkCZwsWtNkiHU60/+1OHtzNSLzIV5/Sgr/a
	IjzHZOqs6Ss4BapnOl8WIv6wCi2CoEBtmAnvtqVMqMTCtFVduypiriZ57gKHU4S85UCCJlw2I4x
	cGlfuyqK231B8Mee6huDL2XuoCofPRuWZYvzX/cqAF/L1J+PIdJDM8z25B5WWCC1fY4IHxEeOOl
	0R4UzQmz5dA1QcVlvUaGuAYrUtxKjQBNSTIayZsYMAwA8Hui7A63aLw1kAfbaFqO+yrNvuElSJV
	+/bz+w==
X-Received: by 2002:a17:906:9fc8:b0:b88:4c99:bc0e with SMTP id
 a640c23a62f3a-b93763d2329mr157001066b.26.1772191154904; Fri, 27 Feb 2026
 03:19:14 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260225-ina4230-v1-0-92b1de981d46@flipper.net>
 <20260225-ina4230-v1-1-92b1de981d46@flipper.net> <20260227-prudent-tunneling-mole-6dedf5@quoll>
In-Reply-To: <20260227-prudent-tunneling-mole-6dedf5@quoll>
From: Alexey Charkov <alchark@flipper.net>
Date: Fri, 27 Feb 2026 15:19:02 +0400
X-Gm-Features: AaiRm51rCw0oHYNDVqiMqSIblU7wjQqf9rO_7JmzfthzvHDl0ktahOmA-FUnRUc
Message-ID: <CAKTNdwFuBRvFXABOHiRnS6TEDiUDRAteF2N+-wx5zH-GRDYB-Q@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: Add DT schema for TI INA4230
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 27, 2026 at 1:53=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.or=
g> wrote:
>
> On Wed, Feb 25, 2026 at 01:29:11PM +0400, Alexey Charkov wrote:
> > Add DT binding for TI INA4230, which is a 48V 4-channel 16-bit I2C-base=
d
> > current/voltage/power/energy monitor with alert function.
> >
>
> A nit, subject: drop second/last, redundant "DT schema". The
> "dt-bindings" prefix is already stating that this DT and this cannot be
> non-schema.
> See also:
> https://elixir.bootlin.com/linux/v6.17-rc3/source/Documentation/devicetre=
e/bindings/submitting-patches.rst#L18

Ack, will drop in v2.

> > +patternProperties:
> > +  "^input@[0-3]$":
> > +    description: The node contains optional child nodes for four chann=
els.
> > +      Each child node describes the information of input source. Input=
 channels
> > +      default to enabled in the chip. Unless channels are explicitly d=
isabled
> > +      in device-tree, input channels will be enabled.
> > +    type: object
> > +    additionalProperties: false
> > +    properties:
> > +      reg:
> > +        description: Must be 0, 1, 2 or 3, corresponding to the IN1, I=
N2, IN3
> > +          or IN4 ports of the INA4230, respectively.
> > +        enum: [ 0, 1, 2, 3 ]
> > +
> > +      label:
> > +        description: name of the input source
> > +
> > +      shunt-resistor-micro-ohms:
> > +        description: shunt resistor value in micro-Ohm
> > +
> > +      ti,maximum-expected-current-microamp:
>
> Please add it also to the example at least to one node.

Ack, will add in v2.

> With these two fixes:
>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Thanks for your review Krzysztof!

Best regards,
Alexey
