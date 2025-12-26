Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1BBF118024
	for <linux-hwmon@vger.kernel.org>; Fri, 26 Dec 2025 02:47:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766717224; cv=none; b=Mimv7TVPhv/3Y+dVswa3/07Tv4RaxN9ukI2JoR5tDWIjAqIxhD/6Tb6os8G/HGSuZKancStBJynLM4gYHxf4dMpMRuNyDunOp3sLv7T+J70FO9kcfEDpxlMg0hoLdKOISRvqpnz1g677MO3ylqReIPNkVwCtZUl+ZNVMUds5d1o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766717224; c=relaxed/simple;
	bh=xJiiTZNZCL31DvVz90Wx0EslqHC3mu+ygpLgc6tnU0k=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=mddXIHVGGk09MD/b42NqCHHEk6VFCcY+hcZZNO67fCxgkzZr1F2A5Nk1zegLmyBGxlDJPDBgVZTbEDT01QYiPq+3Wqn98XMl+C29TcDWXST9yablLZD9CbZ4+feeT6GsggoSuZUWs0TiXMVsfESqTcamwCo72nINhoiJs7hqP7w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IYxrDFvX; arc=none smtp.client-ip=209.85.208.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IYxrDFvX"
Received: by mail-ed1-f49.google.com with SMTP id 4fb4d7f45d1cf-64b58553449so7840722a12.1
        for <linux-hwmon@vger.kernel.org>; Thu, 25 Dec 2025 18:47:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766717221; x=1767322021; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Sc6VFXAWg98c93WjxpNUKPTmn+y7MpCFPtCQUe/fiGU=;
        b=IYxrDFvXirNlaYZhCO4Ed5lMBHRKYrqSPdbo4a9almOQ3pVoMtVuG5z8iMyYV+0avf
         smA+2iCugSw6cRA3nxnEYBF6qdDJ6KvdJ4j2c8imtZ4iv+OuIoqoAScgpemvfsIUL3s6
         i+UPCELFVMrCjIg8RUiW4JPIKM2Q2N3oLqKLZybrV78GK/jfBjpjYmzfd0AABdpAj2zU
         87RxrifbZ25QHGDI5cRpfpbqMBvX3mHxcvPwdGIrLjkG5+29ssJ2xQYF8agZVXuYcJSL
         YvPh5d2mFWP8lcCvPBXZyC0Hwaokx5y/mVOEW9A32kh/1tzA8UdWZWPo5y7MC9E4M31O
         OmUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766717221; x=1767322021;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Sc6VFXAWg98c93WjxpNUKPTmn+y7MpCFPtCQUe/fiGU=;
        b=aUAH1Pue5NhlL6edgHL2Zea6GudRAQBb2w4bXWYkjbTOEiVauWDu245YKAmvfRCnYJ
         kz1H/HEd3vh7fMGERC3w/y7RO5T0Q0v+uhR4sunPeOD0CJeIiDdYqjCsk4QhDeZSdikM
         awkzQwfbMQCDmTJwegMqemt+wsNNBIxJSDpKk9xsrt5E0z21v17jm7LIUrNJ5OjjMCVF
         Rsfiud405xJMEjInzlzguc3EP3QSNKptoas04MJZFRTzOJFy0JhSCgztBEtxWL+NrUq9
         HxiqNPQHGCRw0bL+9tfQlWo3wgnVGs9N0H5mfaypMDPHZACoPQCDMahdmlmmLUMqPKHY
         jrJA==
X-Forwarded-Encrypted: i=1; AJvYcCX5AqUEzx3JeQ/hUC1Z3Allj0QFQjK3f08ZL19p/1ZJ65ilSyTx3W/lnLGi/XAmuwBKCusIDsXjNILheQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YwIUE7PypIf/+sewZeYr4GzWqQ0Zdu/TTAuZzLYi9PcSI65u8BF
	hAH7Z1NgdGzjxkErb0aBuT53VUKV60obR7NpQ5OisXuBWD8KieWYUngh5IyCSVSW2EcbeotVE2h
	m85TT180G/CL5BSeJ89e3frgXvdANFq3m30kuJvE=
X-Gm-Gg: AY/fxX52JCt0m6/914/amexk8/tX/3Xry9ZRchYzvZSUgoCsU0PvQcu3FT0oA2GzDow
	6pbO+8QPxTGQ+PLpTklUUZCJuMF3miLfR137b1rlhrQNgYEqDHzSOrBgafFvZ3tXPXOBiUVFf3l
	ywB76YjrcusDJYN1t+aqj8PTxRRTh68JW3pvYWwuKySZDAQqvul9XPFNGw+MpOcju5Wn70lpBhi
	S+32rzxyjw7pC9NU6Bb9lp2S/HTU7xoqky3ntyBN+Dal7DFzkB8Wwe1VkQQX10NkJ6AUJbV
X-Google-Smtp-Source: AGHT+IEIYVIBnbesVoRgIXaKl0qIn6Gn7v9LA2ZlbmCmdpsuWPSHYk6K4E/+9S+Uq59Gj5Yu4Th1cjDN8S21bie23E8=
X-Received: by 2002:a05:6402:1454:b0:649:b492:70b1 with SMTP id
 4fb4d7f45d1cf-64b8e2a6fb8mr23973347a12.0.1766717221216; Thu, 25 Dec 2025
 18:47:01 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251224084821.2092169-1-hsu.yungteng@gmail.com> <490569f8-a434-4297-b11e-ad34ddc4ae1e@kernel.org>
In-Reply-To: <490569f8-a434-4297-b11e-ad34ddc4ae1e@kernel.org>
From: Yungteng Hsu <hsu.yungteng@gmail.com>
Date: Fri, 26 Dec 2025 10:46:50 +0800
X-Gm-Features: AQt7F2rVQjHxlmfBvtqyMd7ayXMOkDaSIbnZF65eOCKeZ-ZxhtBPf_e7OEAJUDo
Message-ID: <CAFT9tykPEt+zTREF9C4AXtGp0qDh_65LjHZCK9F=NFhE-K4dGQ@mail.gmail.com>
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: add STEF48H28
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, linux-hwmon@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	devicetree@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Krzysztof Kozlowski <krzk@kernel.org> =E6=96=BC 2025=E5=B9=B412=E6=9C=8824=
=E6=97=A5=E9=80=B1=E4=B8=89 =E4=B8=8B=E5=8D=886:03=E5=AF=AB=E9=81=93=EF=BC=
=9A
>
> On 24/12/2025 09:48, Charles Hsu wrote:
> > Add device tree bindings for the hot-swap controller STEF48H28.
> >
> > Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>
> > ---
>
>
> Where is any changelog? You keep sending versions but you never
> responded, never said what happened with this.
>
Thank you for your feedback.
I realize now that I misunderstood the process.
I previously thought that the changes needed to be included in the cover le=
tter.
I will follow the proper procedure for discussing updates in the thread.

> >  .../bindings/hwmon/pmbus/st,stef48h28.yaml    | 43 +++++++++++++++++++
> >  1 file changed, 43 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/st,st=
ef48h28.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/st,stef48h28=
.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/st,stef48h28.yaml
> > new file mode 100644
> > index 000000000000..c6a4b02bcd84
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/st,stef48h28.yaml
> > @@ -0,0 +1,43 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/pmbus/st,stef48h28.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: STMicroelectronics hot-swap controller with PMBus interface
> > +
> > +maintainers:
> > +  - Charles Hsu <hsu.yungteng@gmail.com>
> > +
> > +description: |
> > +  The STEF48H28 is an advanced 30A integrated electronic fuse for
> > +  the 9-80V DC power lines.
> > +
> > +  Datasheet:
> > +    https://www.st.com/resource/en/data_brief/stef48h28.pdf
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - st,stef48h28
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +
> > +unevaluatedProperties: false
> > +
> > +examples:
> > +  - |
> > +    i2c {
> > +        #address-cells =3D <1>;
> > +        #size-cells =3D <0>;
> > +
> > +        pmic@11 {
>
> Your description says something else? Confusing.
Sorry for the confusion in the previous version, the datasheet link
was incorrect.
>
>
> > +            compatible =3D "st,stef48h28";
> > +            reg =3D <0x11>;
>
> You keep ignoring comments. Can you start responding to them?
I have updated the patch accordingly.
This device is not a regulator.
It is a power monitor, so regulator properties like supplies or
adjustable voltage are not applicable.
>
> NAK
>
> > +        };
> > +    };
>
>
> Best regards,
> Krzysztof
