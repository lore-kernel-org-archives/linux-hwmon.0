Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8F7D22F361E
	for <linux-hwmon@vger.kernel.org>; Thu,  2 Apr 2026 13:41:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.170
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775137269; cv=pass; b=AnI5WH881NoFlc9xXLlRz9kf2tVZIEbeuy7MHPRsBr5l1UvUJUn0be81ZaRwP7M++Su91PzKxdx7pnAxwoGZAs+fzt428PQjtSN3p3hpkSp80jyNNELJUA/IsMrEVmOjTylFCqfB6r5oX7bDiui8xw+SL13U7Fa07dmE9nn0gHI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775137269; c=relaxed/simple;
	bh=j31LenoTy1uKvnVqhIeRFwZCEF7f7Cchst3+394Z+mY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fewGPK2CdgMg2I6sDnFSHQNYadyx6PFk0QoZKpw9WmIhd/Lm5LRc3izHK1ZL2spJlDLuguroq0LvBl6Tw2CfPiqbAgEjIRycVUjBh0v9kt9YKqf/LrJJM8xdcmOaJ7WC8TCheqGp9euuXisaHzCKST9nVfrl2NjV9+BBIIGYC2k=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j4NxVPk/; arc=pass smtp.client-ip=74.125.82.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j4NxVPk/"
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-2c15849aa2cso1090420eec.0
        for <linux-hwmon@vger.kernel.org>; Thu, 02 Apr 2026 06:41:07 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1775137267; cv=none;
        d=google.com; s=arc-20240605;
        b=Pr3QrCqi8Y15FwVz0q4/E3jm6v5dk3+309662IXqvn54++ULB1lm7Gbg/VPMtRY2f5
         brDbUpJLRJoSWOyxmHSg7z8+HiMmAR4RytFaGWBVcrnk6AvmZ25UG/SpCXrz7Rl0GPlM
         kN0vOHurP7drhi3K/tJVouyZEs/iJhfe7agLva9iuWdtudlKHGUIRC2FrFLART1wrI62
         U/4XDa8u0tU/KWBwx2dHZw60tcXPzuyqlZFufZtS422HDLt2GP1nuwepEjN+MDMkiEAF
         ygsV93teyDNM9WdKjTc6l3wIhDM6T2yuBWQy+REsDMYBCNP/j/ENuDtWrc5lohpTQeBR
         fePA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=bzprnD2NwNOBSnHYwPc+3qZ075TLzZE8A65ElDi788w=;
        fh=nReS60T0EtSOgjA8VEJmtH752XKyL2QmaWJedQm2R0Y=;
        b=h17ehRlrTycmz+dd7eZ43Fi+aV/5bXaVsNH/r5nJu8305W1g6ws3tWTAmLW1IPUujb
         fDtU/Uf2Q7xNbvv85mVE8FGb1kOekM7PSA5w2Lhgh+6DloNl16WOtI7K6YaPL0qK1ypW
         946k1/RiWSNGSrvZ1d3F3Lw81V+29ym8Z924o5NJzxcz5J5UM0S1wAXsIWRenhHs3XfP
         A3RC1zNniN2Y33aPDu8GumA43ptURtO2g//6ATgUnj1gjO3wNXoOmm0ZLkdobhxYvbZZ
         Tp69S3ELzplQ4sbmRARRMphx+NcTIzQPhDO9IUQVi2L1bWcGhFXjERzRazi/UUaHgyEV
         j9ZA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1775137267; x=1775742067; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bzprnD2NwNOBSnHYwPc+3qZ075TLzZE8A65ElDi788w=;
        b=j4NxVPk/PM1awsgXhlfTfVYzAKhaJQNehx6pOV2xBxITHH41UhQl78uR/B0EkJhypd
         hbnNBew+l6HZNje03eJHF1H3n9ju1Xso16r3T79VH1VYUuCUejQ0Hq64vajrQT71n5Em
         scBp5WgoUIi1mAdn/g5JKLq6C92LRoLH3tR9zaAGD9UDZEBEsMaEkNvAWdDI43oarqiA
         0M2RTCyNuYj5GFoqNYI0GsoPpq8lqLYWMlhooJwuyy/KrJAbsrFe4iyDaMjI0JiquHZo
         tAmCGyomiH+g8N8+kmRbY4mFD5DGH6v1GBb0JfFhoiXjdqSTgN3CU7N+STVTUd5fCjrz
         QFuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775137267; x=1775742067;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=bzprnD2NwNOBSnHYwPc+3qZ075TLzZE8A65ElDi788w=;
        b=MFTRtpgfGR/NBF5xNpWMpIbppo0NTg3ctEHgbH4HKyFNhrnQX2xY1nbvD+RDx+lV5Y
         gWLH60/+iLAquGz0DpmLTYQ4pN/qRzWR0VCE6WyVza1gbTbLRVf1gbdGJFuu8tXMTEyo
         IiZuPDNJLVfUcZsvkG1HWBEkW0ADYBcXXhygSxWnRoRya9ClYcRqLuisj3iZdy++EQzq
         1x7a2gBHusP6y0vRp35FokbYdwk4ma5bOEN0dBCQNz9w3cwDeaQ804/uWmdnWVseL92V
         ZaUcUM8cq6ADU0/O12aQDxBSoJ1cxByJ6IVaAvF9RQk4xq2VdBKi+t3oU7VU3W0UM9ie
         WtEw==
X-Forwarded-Encrypted: i=1; AJvYcCUuOE0BL9QET0K8H4iscncs40Kqz/DM79bkN/bOu4BgOu5kE+7I1O8yK1fropyXRFejOeKAk1reAuF4Yg==@vger.kernel.org
X-Gm-Message-State: AOJu0Yy+/s2Ms5Z8Fea1VI4wuWupTNObg9sL/PC73okzk6LKJ7bdnDQv
	9abxLX18UTlBnqhCtxCPXfWyTPynTCZE/2l2W00Yh8SPCcYiho60zBA8PtxoQNdWbHFntSFNRZ3
	dDMRFSWIfFbPe6DYoM3tSjtIY7PzMo2g=
X-Gm-Gg: AeBDietmdTDYvpThQyN8mUJ/yl0PcHLNT78Xz++AibJWjWZ9+gCoVDUk4zwXJZD9PvM
	bTtptni5vkBWi4I/zEOY3NULp9vjAzzZ9S4gjmIaq0kC6sKzyvtlzEcTMzlHmmJg84Y+nqt6zwZ
	R1is7+DJkUo7uWjzpM6HuzpVBZBQdmZm0smaCD2tbjAOfGRt+RrG0VeQZEwvu9FQezplTgaALSf
	iCR4LPor9UYg6SvjdE0w2BMj9Lp99aiMC2Z20xkg0xn0xQq4tOS679HvcTDwlM0dU5cLvlNZULK
	SHTyiw==
X-Received: by 2002:a05:7301:f83:b0:2cb:4b8f:b2bd with SMTP id
 5a478bee46e88-2cb4b8fb38cmr464544eec.6.1775137266531; Thu, 02 Apr 2026
 06:41:06 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330102345.37065-1-Ashish.Yadav@infineon.com>
 <20260330102345.37065-2-Ashish.Yadav@infineon.com> <177487146147.2070608.2849563543220120287.robh@kernel.org>
In-Reply-To: <177487146147.2070608.2849563543220120287.robh@kernel.org>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Thu, 2 Apr 2026 19:10:53 +0530
X-Gm-Features: AQROBzDpt0f9VPS6lmST0qZzeJ30vGsEijfXAAYlIHDTMAUfdpzcYnc60p6UGko
Message-ID: <CAJKbuCaPxeFdc-Y4XjRoXy=Ck6Ne6j1c0TJYmz0bmn1GqgWwmQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon/pmbus: Add Infineon XDP720
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Ashish Yadav <ashish.yadav@infineon.com>, 
	Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Thanks for your feedback and time.

'make dt_binding_check' issue is address in:
https://lore.kernel.org/all/20260401104550.115715-1-Ashish.Yadav@infineon.c=
om/

With Best Regards
   Ashish Yadav

On Mon, Mar 30, 2026 at 5:21=E2=80=AFPM Rob Herring (Arm) <robh@kernel.org>=
 wrote:
>
>
> On Mon, 30 Mar 2026 15:53:44 +0530, ASHISH YADAV wrote:
> > From: Ashish Yadav <ashish.yadav@infineon.com>
> >
> > Add documentation for the device tree binding of the XDP720 eFuse.
> >
> > Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>
> > ---
> >
> > This patch introduces a YAML schema describing the required and optiona=
l
> > properties for the XDP720 eFuse device node. It includes details on the
> > compatible string, register mapping, and rimon-micro-ohms(RIMON).
> >
> > The RIMON resistance is installed between the Imon pin and the ground
> > reference.
> > ---
> >  .../bindings/hwmon/pmbus/infineon,xdp720.yaml | 52 +++++++++++++++++++
> >  1 file changed, 52 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infin=
eon,xdp720.yaml
> >
>
> My bot found errors running 'make dt_binding_check' on your patch:
>
> yamllint warnings/errors:
>
> dtschema/dtc warnings/errors:
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/h=
wmon/pmbus/infineon,xdp720.yaml: properties:infineon,rimon-micro-ohms: '$re=
f' should not be valid under {'const': '$ref'}
>         hint: Standard unit suffix properties don't need a type $ref
>         from schema $id: http://devicetree.org/meta-schemas/core.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/h=
wmon/pmbus/infineon,xdp720.yaml: properties:infineon,rimon-micro-ohms: '$re=
f' should not be valid under {'const': '$ref'}
>         hint: Standard unit suffix properties don't need a type $ref
>         from schema $id: http://devicetree.org/meta-schemas/core.yaml
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/h=
wmon/pmbus/infineon,xdp720.example.dtb: hwmon@11 (infineon,xdp720): infineo=
n,rimon-micro-ohms: 1098000000 is not of type 'array'
>         from schema $id: http://devicetree.org/schemas/property-units.yam=
l
> /builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/h=
wmon/pmbus/infineon,xdp720.example.dtb: hwmon@11 (infineon,xdp720): infineo=
n,rimon-micro-ohms: 1098000000 is not of type 'array'
>         from schema $id: http://devicetree.org/schemas/property-units.yam=
l
>
> doc reference errors (make refcheckdocs):
>
> See https://patchwork.kernel.org/project/devicetree/patch/20260330102345.=
37065-2-Ashish.Yadav@infineon.com
>
> The base for the series is generally the latest rc1. A different dependen=
cy
> should be noted in *this* patch.
>
> If you already ran 'make dt_binding_check' and didn't see the above
> error(s), then make sure 'yamllint' is installed and dt-schema is up to
> date:
>
> pip3 install dtschema --upgrade
>
> Please check and re-submit after running the above command yourself. Note
> that DT_SCHEMA_FILES can be set to your schema file to speed up checking
> your schema. However, it must be unset to test all examples with your sch=
ema.
>
