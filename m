Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A3D3A7193
	for <linux-hwmon@vger.kernel.org>; Fri, 12 Jun 2026 09:06:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.219.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781255213; cv=pass; b=L++X8uQvNAaYgyVZf7Fv7kJGKMlhQhj3EymuINdcBu8J+JbM0kbGCq1mXZ9fFSgZBeaiB8WA+UTL8DHeTOrs7b4UVDdZyUmlgB2HWAxLn9QpryxGHJSIB7FHo4WPx0zppQ9lx0sg89C8IH2djDifxvS93nFjGyBFiNfFGC7eHm4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781255213; c=relaxed/simple;
	bh=IsojegjKAwdLgtUNQObWKq5Q0mjssDHUxhr29/dEiVY=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=EIn96nQ7gmWQocOb6WHxX7K0sYvP2739SSeyg3tn2dk3gQLkoC0NXJeMUR07nw/1CLX8xwPOQbM5kR6PfWjU5UnJAMjZecmwgfuII0VrzxucWqyGz/GDva5r3K5draH54Ys78uidWCMTyn3KGUM2JgC0inN2MevSqvo5cE/o5Yo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XwGVSarp; arc=pass smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XwGVSarp"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-8ce9df31130so12093566d6.1
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Jun 2026 02:06:48 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781255207; cv=none;
        d=google.com; s=arc-20240605;
        b=ig2SvE/PozdGi25MQKNb5cTOcE4NPsUb3zHSHwgFwuzc34WFsQ7BPv1Cg7/kfi5V5g
         s2EqxQtrzm2656S3mDrKGNO6iYSGYrJfIUyYFbWIfa7F/gFHti0thMeeP5QUY2WF/NPN
         V0Zymf9t6FlXNlg1kFDKMqIRLyLnDo9wn/qjWdk1oCklpLUG6DkzQezKvs4cUhv5cm5H
         lwq0dJup4nB1gj5u8TEtYfMdehwJooXOLsSPiwcaeuJw4gnOEf4O9UaIVeEoji9XEh1z
         TXzL090F50UdEtrmzDzTpp1ECof2Q6N2QI34FS/sQJnNpstbG5fad4hBEVPawfvcY8zb
         COHA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=jWwQjl84zpgSaQa4jqoTy8ry+T8ZHf8hg3Nkjy1g20A=;
        fh=w8ZtSd7gV9d2UeK6tm4xOm+hGjsTLjb9r0jL+Y4qDeM=;
        b=TrA6sQ+J9Xk+ASH3Ji61GqVxsFG4EmGPOt+JcjH4ijgBIW0THwvV9X+Xj7ZF1nXQzr
         QHEphnJTco8ky3IGAm3XCgdRQ+l7d36aajHktFhHhAuvGpc24nFfst4TfCsIHXUueIyv
         0UmhQlB5u9QXb1ENhPj1eoVO4a+fHYw0XMJqVJOboSJIoeFz7+6JWRytOm8rne7CeiGj
         Nsg1T610ez/U61XOsCNMA20IwZAcGwPIKWqgt3vouB1RmYmCn2A12Npve4cMMTpsYUP3
         wxLI+KF5Xmkt/AcN24wHwe6uPNVc/xT98jSAUZVAQSAYuoK+V0V0ma6AWXu0iGuZfnKl
         d+VQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781255207; x=1781860007; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=jWwQjl84zpgSaQa4jqoTy8ry+T8ZHf8hg3Nkjy1g20A=;
        b=XwGVSarpY5KHHgERiE6pBCGc94GK1IoXCcBCcnVYBRBvyj2Wt0A+T5qIvLFwU+r41J
         JGOMgnfMlpdqI1IxHZbtXPwFo2QRMJaPco7bUL3SGvB1MmyDtl8Q4BP7NSQ61FvJL5rn
         Ir0+mF4R63nc0On+F0D0eXpJmRg4zpyFnEUWaZUu+QckELQIfk+DaVZtF6SERJTjrJGQ
         W3zWsV9U6t3tD0ba91oy4rfcUOfVR+r7+vBp+g3YmdYDr4KNH2ip3g8TPsYsENcLmn3/
         vBctj+esOEYd5hWE1p3mTFLYpuF0AWlGgkCR0looUoHIta1lyYdaXeJiWt/VhZjyNDxH
         lJ/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781255207; x=1781860007;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=jWwQjl84zpgSaQa4jqoTy8ry+T8ZHf8hg3Nkjy1g20A=;
        b=FuYnINYmkB0vsXqG5SNMp/yY13il9XIIHpVDkquxeHSgEztZcMhUjNY1JxlUPuT+OC
         N2aObDXhi9nAnjkQaQvSZ3XuUU8lOATJdyl7b27ScnZAtvSpf2GUG6qgIwtvPU2RBd3L
         RWrooIDM/ppZ5BzJkvByiR+rykRGX+YF/mekHMSx4kReQ/aX4j2eJCRyXJHQ9ySGsc78
         ZT2xJCnLCVxOSHauIWGk6zAkwJVzuqqe/Eqx/myzsvP0syuLEg4SqZA7HGp99V7vNexx
         GHPPFEeaLkp6j0Hs7KnIlX1spufnjwi8Z1LNH4c4g+AWb5bFXRIsJpYf+amEppkL94Kx
         fHKA==
X-Forwarded-Encrypted: i=1; AFNElJ+JMugi24xTaHsr96vZDi0P2OXFOMssIbTGFu0X3hKrpJMM0K1ZguC31QKBGzgm08A86cGDEOS3eK5o5g==@vger.kernel.org
X-Gm-Message-State: AOJu0YxQ0MSVtGwT4hyaSFxkRAmGx9eqQUCFw0APLa2XLeyef3mLtPNE
	hMSwdV5+Qy+vyR0jZxlZI8OTBp3dvJGwTKqpTlQjHBqcTQIVJCbOTes9zXeZdB471lLHdU/M0W5
	kX7icu+KWMbRI502m2VJGRksOWMOzJCWY5kVQ
X-Gm-Gg: Acq92OGWK2aJxUEg7M71keHSjIbrHWlmMwhIr9Lr2yCDB+RenWiHLYUzJU3G7aDcggC
	2HYzN/5Ulk18uQOSO7N3GSgXEds6W5A9rzG/ztfV2mNui/+cDbWxZfgCkAG0C3V3R5qnmeH5j5O
	uRm1sAHtiqPehyhZDWTGwDGXZhZL3L9PxYIAlqTJ4RoHify1M8hCfb79zHqBHT/HJDNQUmGaxFa
	xhwJg96FSi/vD7rUeo+xhexUlBfZfTw2CQsev+6eWR2n/4Vv/50DLDlDRuyBJB/WdBqQdyll3xz
	8dgAzHf9
X-Received: by 2002:a05:6214:3383:b0:8ce:e416:610c with SMTP id
 6a1803df08f44-8d32cabe370mr33975566d6.19.1781255207244; Fri, 12 Jun 2026
 02:06:47 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260611-lm25066-cl-config-v1-0-02e567bf3d91@gmail.com>
 <20260611-lm25066-cl-config-v1-1-02e567bf3d91@gmail.com> <20260611-mocha-strive-a7f3265dd3f4@spud>
In-Reply-To: <20260611-mocha-strive-a7f3265dd3f4@spud>
From: Potin Lai <potin.lai.pt@gmail.com>
Date: Fri, 12 Jun 2026 17:10:38 +0800
X-Gm-Features: AVVi8CcNLcTbD6v5Tw0D33_UI0Q9NrseU5jWT3dG2q2Uo9P-neDK5VnFrDmIZiY
Message-ID: <CAGfYmwWPhdpTLGhOdddJ0hSj-H86+XOVGTR9eDkZSVqGRLfJvQ@mail.gmail.com>
Subject: Re: [PATCH 1/2] dt-bindings: hwmon: pmbus: ti,lm25066: add current
 limit properties
To: Conor Dooley <conor@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Zev Weiss <zev@bewilderbeest.net>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Cosmo Chou <cosmo.chou@quantatw.com>, Mike Hsieh <Mike_Hsieh@quantatw.com>, 
	Potin Lai <potin.lai@qunatatw.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Jun 12, 2026 at 1:27=E2=80=AFAM Conor Dooley <conor@kernel.org> wro=
te:
>
> On Thu, Jun 11, 2026 at 05:58:44PM +0800, Potin Lai wrote:
> > Add mutually exclusive 'ti,cl-smbus-high' and 'ti,cl-smbus-low' boolean
> > properties to configure the device's Current Limit (CL) behavior using
> > SMBus settings instead of physical pins.
> >
> > Signed-off-by: Potin Lai <potin.lai.pt@gmail.com>
> > ---
> >  .../devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml  | 20 ++++++++++++=
++++++++
> >  1 file changed, 20 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.y=
aml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
> > index a20f140dc79a..95ea7c26dec2 100644
> > --- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,lm25066.yaml
> > @@ -46,6 +46,26 @@ properties:
> >
> >      additionalProperties: false
> >
> > +  ti,cl-smbus-high:
> > +    description: |
> > +      Configure the Current Limit (CL) to use the SMBus high setting.
> > +    type: boolean
> > +
> > +  ti,cl-smbus-low:
> > +    description: |
> > +      Configure the Current Limit (CL) to use the SMBus low setting.
> > +    type: boolean
>
> What's smbus specific about this? If the pin was connected to a GPIO,
> you'd then need to have different properties or use these ones with an
> inaccurate name.
>

The "smbus" in the property name was originally meant to indicate
that the setting is configured via the internal register over the SMBus (I2=
C)
interface, rather than physical pins.

> Please also spell out "current-limit".
>

I will rename the properties to "ti,current-limit-high" and
"ti,current-limit-low"
in the next version.

Thanks,
Potin

> pw-bot: changes-requested
>
> Thanks,
> Conor.
>
> > +
> > +dependencies:
> > +  ti,cl-smbus-high:
> > +    not:
> > +      required:
> > +        - ti,cl-smbus-low
> > +  ti,cl-smbus-low:
> > +    not:
> > +      required:
> > +        - ti,cl-smbus-high
> > +
> >  required:
> >    - compatible
> >    - reg
> >
> > --
> > 2.52.0
> >
