Received: from mail-vs1-f47.google.com (mail-vs1-f47.google.com [209.85.217.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A6ED383C7B
	for <linux-hwmon@vger.kernel.org>; Fri,  8 May 2026 08:20:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.217.47
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778228451; cv=pass; b=nt2jJs6mmSiNA+/EBuAhV6kmp3V+3jOYM3aLLnwyTgtV2W6AQQS25tBeAPifYZdpLB9tdL1q3VgpUYM8m3swd9zMfyl9iDb8/J/jhTM08tEjst78Cb+vcYKmz4Y1DKjdYQRq3m2L3tISYz+u6gsLhiUkPkurIvtU0WmZfGbm1LI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778228451; c=relaxed/simple;
	bh=lTkF7Xj1pPLGJApccu/V8Mry4PVrzP0dv5SU+hphSqo=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=jOwSPNCPBDmi156y1526+jwPtco6uzFMx8CCu15TLvcQZnZMxZaZdPC+BiBHZ3hZCEIcex5aySQLBPz35RZKAx7xV1ilOQcNRkNCtWzukrUCf2zhSpBqfOPc2wh7hXRFt0N4d7Tn42hUUkLxKt2tX15nwQZHBBmcWWaP3k+NEZ8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ovy7WJKb; arc=pass smtp.client-ip=209.85.217.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ovy7WJKb"
Received: by mail-vs1-f47.google.com with SMTP id ada2fe7eead31-5ff05af29b4so665712137.1
        for <linux-hwmon@vger.kernel.org>; Fri, 08 May 2026 01:20:49 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1778228448; cv=none;
        d=google.com; s=arc-20240605;
        b=eQKZpGEL/3z5bE6xObhotDTslMGcw2uaLfohgq2SeJOZ6Z/PnCv6mbkhE4qns1xRA+
         T7ulb3Jof9MUb5nDazklmfyKntFhkbFJ5dT1b37AH3f5u648ZBLbgVcNzH9MuWGu/W9n
         lC1yR6EtHTyjv0bEL0UrfFsi0lNXaByv1Q2SnaZ9i9jtgyPhbUP483j7ErOOsAdo+YHP
         z4NhPg5RC7oVBVLrC1Kzai5vu2++37HNab8/N9o667xqdXnlo40pl3+8mas3jRyQtVCM
         NyB2DUtGPTr6KDjeA0QzrtQBZnAaK5Yefk9rZVPJrTUZxL4QeSS1ybfbZfjMuoKvu192
         qRYg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=HHvqc5QQlNg6QfQkGnDzkz4AP6jx9Mcp6qm5SqdJ5gs=;
        fh=c/3QOEt0Gu0PhTUFah/h4JgtdWOK8kXu3UHcY9RuDdM=;
        b=QQYfPeuyZh3A6b8GVIj0KLHFhNI4BplwlUh8bU75yg0sKEb117ImicctFed2XZ+OPo
         SAf4jybs5tZsU4P496gldsj/SZcbeWmt31fL1MGApIjJ7wenvJZ3IClHFXgksPCO/635
         +LDYbGWpCQ3/kZ0BKEdV+iGo7UYlSeF6fepytznoXgx9WrhcwObkbP9zxm8Vu/TeBJDo
         nav0DFo3kt0vPwiisFvOM9cXeJtUScOV2Eu5tiIcgFsKBuLLlJAVKDWUUdDRcDOdi0AM
         fMIrHT3wBMGUdikERy8jvgMdBPzWuC8YPoegIq+c00HndEuO3eK1ZudJ3SiP7yJ4pyal
         X2mA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1778228448; x=1778833248; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=HHvqc5QQlNg6QfQkGnDzkz4AP6jx9Mcp6qm5SqdJ5gs=;
        b=ovy7WJKbLUXUpfS9AK2nUoxnoJ9aJC6emEzi+YmThLXN3+ZEuEXrvBzJQGuVY42x+C
         LrikbL6KCjLDmFV54CKsT+eLXen8f96b8TRh0qwRS6iuazJxpaZNiPO1+t8ZqeSG01/3
         iKVptjKvNT8Ac62at3juk15Mcc/wEYp4PFs2E/Tg6YnohqQT5LrWCYWyLOir8aqkAtBu
         1xHn1s36xFW+mmiaqKn7KH6MsGDm1rWMU2X+H9DUfZfP/4G+KgHqTsUiVi0q2TexHLqD
         rvEigLzLkD5gXEU2j9fTz4cY8ohLJvXfyb/Z2FMKo1iZKvkd1sDYlOkbVki1Umxcskep
         60+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778228448; x=1778833248;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=HHvqc5QQlNg6QfQkGnDzkz4AP6jx9Mcp6qm5SqdJ5gs=;
        b=DQT/gx3Bhdv5POMBjUQTYABz1oGrJBmNc0RXT1d41L6UZ9VxxdriyiB7Te64Zjuvrj
         2tVHOLAagoV/yAu3wtRB3Mdul4yAalhm6bVkyGvt21ugdUJYWSSfQxeP0bZAUpUA8Y1P
         90wCmPQd0JtI4SImtl/eD5TCt/5VA2RCrkqI0hvnz3LMrOuRaBP4KuzezOcGxQFUDBm2
         F182gAGr7jxaAz6rP7MwUuEf+1gwMSqr0LoiKOzpqsLb2tJ7KjQHTQzluytQCWN02N17
         5k3bgz/IZMaM6HHdjLApVZw2bh/9oeUJhg1EHgplHscilHU8WcIRzmPv7B2pnv4X6mle
         kb2w==
X-Forwarded-Encrypted: i=1; AFNElJ82kuQI5Cyp7q1pj8nZEJA/j7tFfk89VQ9cVlaEjGVz2lVUQ8ClFKi09bkpoNhVc4JR5sHB/fFNpLq+CA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyUKWyYDbPNmwUcmTHx81t6+m20AahQwGbqTgjsE9b439zQVN6x
	LrBpvdhBAIAuZOo6so2HBkZaVsIB+s+shzoUYN3P8zLPIuShsy4V1FH62yZ78XvgqS7ZPP1A05u
	mXXdUfXQqDstRRaaJoOlh33q9VQGNGPsMlSTx
X-Gm-Gg: Acq92OFjAummaOWD55w5ZPH65r+sVsSyDknT9dIVN8jmPquoLyNVRZO2/zoViNrWmOn
	T2aHqOuzF//WoGzz4MVAyQq9/BRjWDj4Orwzm9vKH5MsX+j2F4F6HenEaL06d3Mbge7JPAR5yBQ
	enfTrIlMzAfeSnA82gAKlUfwYd7PqZiY3AUXeQE2fN4R7W3AhUp8kdXWcpBQY5hVrVfJfd5CaNn
	AETKdk7WwQfF3wAuA8T74r1YHtmBM8EEiOiOnOCn1BaTulV7mtiK1AzqOaxW/Q2ZqWnsRr8DOng
	0otcbgGYMubQJsSw
X-Received: by 2002:a05:6102:26d1:b0:608:6b33:5bc2 with SMTP id
 ada2fe7eead31-630f8fc123emr6203272137.18.1778228448423; Fri, 08 May 2026
 01:20:48 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260507-add-e50sn12051-v4-0-ff2b3768ac7e@gmail.com>
 <20260507-add-e50sn12051-v4-1-ff2b3768ac7e@gmail.com> <20260507-squealing-vanish-16fea3c114f5@spud>
In-Reply-To: <20260507-squealing-vanish-16fea3c114f5@spud>
From: Colin Huang <u8813345@gmail.com>
Date: Fri, 8 May 2026 16:20:37 +0800
X-Gm-Features: AVHnY4LY8-27TKesI70xHAUIFe9rb9_MdP2mFDNPu7z3TNgg0dnTs4zeU01pEIQ
Message-ID: <CAPBH0A_D3siq+_CMM5Ouqemn56eJhU8U7KuL5gTC8h_tvL7kXQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: hwmon: pmbus: add Delta E50SN12051 binding
To: Conor Dooley <conor@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Kevin Chang <kevin.chang2@amd.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Colin Huang <colin.huang2@amd.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Conor Dooley <conor@kernel.org> =E6=96=BC 2026=E5=B9=B45=E6=9C=888=E6=97=A5=
=E9=80=B1=E4=BA=94 =E4=B8=8A=E5=8D=881:07=E5=AF=AB=E9=81=93=EF=BC=9A
>
> On Thu, May 07, 2026 at 01:12:26PM +0800, Colin Huang via B4 Relay wrote:
> > From: Colin Huang <u8813345@gmail.com>
> >
> > Add devicetree binding documentation for the Delta E50SN12051
> > PMBus-compliant device.
> >
> > Signed-off-by: Colin Huang <u8813345@gmail.com>
> > ---
> >  .../bindings/hwmon/pmbus/delta,e50sn12051.yaml     | 42 ++++++++++++++=
++++++++
> >  1 file changed, 42 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn1=
2051.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.=
yaml
> > new file mode 100644
> > index 000000000000..72aefe212d17
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/delta,e50sn12051.ya=
ml
> > @@ -0,0 +1,42 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/pmbus/delta,e50sn12051.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Delta E50SN12051 PMBus Sensor
> > +
> > +maintainers:
> > +  - Kevin Chang <kevin.chang2@amd.com>
> > +
> > +description: |
> > +  Delta E50SN12051 is a non-isolated 1/8th brick DC-DC power module.
> > +  It is a PMBus-compliant device accessible via an I2C/SMBus interface
> > +  and provides standard telemetry such as voltage, current, and
> > +  temperature measurements.
> > +
> > +properties:
> > +  compatible:
> > +    const: delta,e50sn12051
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description: I2C bus address of the PMBus device
> > +
> > +required:
> > +  - compatible
> > +  - reg
>
> With only these two properties, shouldn't this be in trivial-devices?
Thanks for your comment.
I will remove this file, delta,e50sn12051.yaml,
and add device into trivial-devices.yaml.
>
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        power-module@40 {
> > +            compatible =3D "delta,e50sn12051";
> > +            reg =3D <0x40>;
> > +        };
> > +    };
> >
> > --
> > 2.34.1
> >
> >
