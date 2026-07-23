Received: from mail-ej1-f53.google.com (mail-ej1-f53.google.com [209.85.218.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49D0317DFFA
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Jul 2026 02:48:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.218.53
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784774914; cv=pass; b=XORj0Pz9GJhknJkDm9BZ4S5os2cwhjHLOzEhXgQe/DugD825HEMjBGI59ycLJ0L1WQ/q+XWJ2W2FVNh2ZlUVc+mkKk18CBBwc3y8eZiPd0JIhjTydxSZoiizQv7cJ+nl7AJKhF/3I8OHx+fLdU8szVA4JR0H39WNDu31ohPLNBc=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784774914; c=relaxed/simple;
	bh=ke7GuAFVu437cGSyxYRHXKBdtjCTY1U8R29Cxj1Ke88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=CgG6Kff48QO2m1yId3ZuHNRTKbhuIHhSJXvExicet9oLgVPSDxr5xwWtFrHlMpxxSOUUFox+R77baZfuJ09AHXENiF3X6ljXKbCtT7UmdAEJNfSezh1HrFgiIbNPkC5qZtgx74gZ1FUEAeC9i65/2bIEXDUUWwR9Of+SwhqdYWI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=g/naGK3a; arc=pass smtp.client-ip=209.85.218.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="g/naGK3a"
Received: by mail-ej1-f53.google.com with SMTP id a640c23a62f3a-c15e2dab83eso30642866b.1
        for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 19:48:33 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784774911; cv=none;
        d=google.com; s=arc-20260327;
        b=aGpyK+1WkG9OyyvSD9WL7m1WeaD8B85FHpAgb+IyKMFSfUVYUgK5pA6BCfwOMHZokV
         U3d4sSM82ZhKYh10Tnhv5ez190B0Cxxzxpf4WuYHCSgaJhF0tNPuY1zSAggh/SSF0WCD
         Q5Jr1EBtK2UiTQAxh65mvB1Fhv9h8z8U3WDJ3aQr/l5qlKQD6qI9gA0tVEulKjAssaQ+
         XpYa/wXVQ2JvgZ/YpqLmizQBESvZRPJqXEl8ueLYECsB31A8mswj6grxgJuo68voaz0b
         S4AVYVrXsxR6SiRvtjtr2c5QxIcbfZ7kl60S24ukFteSZRTi4ebJ2OUBLSNGPhUmCXiG
         RKfA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=YXTUY4hlZVOZQ6Ng/x5Zh4USeJPKiqRMjOwBWZGBJKI=;
        fh=qIPtKKnDzJHCa3HHwVc0btHHxidV1K5xLlYXoSJPntg=;
        b=Nkv/nmSD6GChPIX74iyPU3IcpG98nQpB+7DmZlZknhw0fYwYNoZEUoLCWhJ+fNOfne
         RYuceWW2jZ/S+qy6dVwpqIAq29OXOqEuZfTGZJZve83A58ocvCgGX7pNp+eKLuM4k7Yi
         UisPr1m9aDQcfWBQNMHCTr0OevIQgjLGm0QIMcDZwJxHsO7UXDAzcu9/qat++dAiipJs
         fDh7pYAZMOrOGpuXwBz1C+Pv0STXv/qlCsnuXpMDMATr5Z/KeaaukLxy3TnQaHTcfts9
         VrtQxCqXrppezLo/F9T+x8m1qkqVwpWZkE/ViJt7Czielc3XawAP+ldHcO5xHYFO7IBQ
         JP4g==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784774911; x=1785379711; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YXTUY4hlZVOZQ6Ng/x5Zh4USeJPKiqRMjOwBWZGBJKI=;
        b=g/naGK3avTabE5114tTgCShzUmBWRcbzEf+vhG+zFbs3JPuqAPtNOvwKI60HCMrU0O
         vNjPm7lomimMBIFMTWQV3VxKgJDGOQBOu4Q+IIANY7VlQ5LTyDdl6uk9qW0vRVGnsIVb
         bQM7vZVKfcvmatIYoQXBWwl81u77XEMyY0oFnt02WS6r49b8sH77X183w0xiHx17CxBs
         IQZCi6cWSR1GbxTac28wbhvutGyVblXecNe+vaJ4IDizddNdYR8RllEWdJgPamIVk7QY
         EImkhuA/5rVbHoXpNtOCXXJXb21kCuTCh9UKH5JrS+ub9GN8ReOl8HjWpRPqkK5Mk09c
         iPXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784774911; x=1785379711;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=YXTUY4hlZVOZQ6Ng/x5Zh4USeJPKiqRMjOwBWZGBJKI=;
        b=WA2X14rNZMEjgrVzdiqWCe6SpWMk5xeBWJ13OvEccRZC1xhyoxejeg2wvL05q4Jc/M
         BOav/GvgNhzQYYcIfYg5zEcYLsXnpejWcnQ3kDh6bVXJMOOel0l6Q2ezo9GhTUpDkipY
         sNXPxEZ/PayQ0aI1OLFvw62DbO74ifo0xs/Yd5nnV6P3hqWfEXK9s5FJJBTkCpTk3rJ1
         TKeUEdpCtUmAECtaqs9jH9FUHsqeadVq3dKcTMdgyxZXDp3kIK+7l0DQZacENBKZ91Bk
         ewlRYUs2QY9SXjXuMrpYb4SmmhpnscXpqjxewgG7Jif396Ddc/lxOSklCMAJCDyKGTAY
         f50w==
X-Forwarded-Encrypted: i=1; AHgh+RqXs8u7bccZsjRrofgoUEqy1UBkcQbtA0qq9N7NOXdF3zpIZr1JBxTfj9WfociideDtSNou5aPq/Sse0Q==@vger.kernel.org
X-Gm-Message-State: AOJu0Yxgyhrzgm4yCGvQ8Vj5VEho8sf2dR6/i61+O6Glgt8niHA003NV
	qzauMedktQbffifC09I9FamEVoJnfCp6W1kit+hQty3a3NjOUWfPcPCDaoq9EBrfw3eNZRsECBI
	51+jbm/xrnX64bpJP7fMfyBw25ghO+sY=
X-Gm-Gg: AR+sD12aYzg0rQIDjmc6bdVuUuzDSxcSyn7jrd8fQK+KYyCv4UINo91sfP7hbF862lr
	H6uw8EG7pGn6vhGgYhcLd5ZL1B4BHPPNfINMnp8npamHDFf3naEQXX3sn2h7f+8bTHgBPaDl/M3
	a1eq4Uxhqsj4L2nLCRFYLFX7cYMDCVlFSSiPYCY+PgnwXSK2RYI534QXjBuHfX9RzyFAg+QDJer
	3BOenlosXFIYwq+xJcEu4mbEjmysDY+voc0CZdM7o86N4Yim9NtkHS8Lm4oHKDYqTuZV7oLtJ2S
	xy+aDlaK9czwHi+2BvtY
X-Received: by 2002:a17:907:a4d:b0:c16:2dc0:e1ed with SMTP id
 a640c23a62f3a-c1c5092a1e9mr61858566b.4.1784774911324; Wed, 22 Jul 2026
 19:48:31 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
 <20260717-adt7470_thermalzone-v2-1-a55147958fad@gmail.com> <al3yFHvlzQuIywEj@monoceros>
In-Reply-To: <al3yFHvlzQuIywEj@monoceros>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Wed, 22 Jul 2026 23:48:19 -0300
X-Gm-Features: AUfX_mzkrTPcnkr7ItIXKDS6UZlJkREqRBtsmkpKmefnqjNZVsCZyHSowWgwH7Q
Message-ID: <CAJq09z7z13hO33xpfQNYc=eHec3yN3H2yVy=oqXhuvhRZhvX3g@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add binding for adi,adt7470
To: =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <ukleinek@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chris Packham <chris.packham@alliedtelesis.co.nz>, 
	Andrew Morton <akpm@linux-foundation.org>, "Darrick J. Wong" <djwong@us.ibm.com>, 
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-pwm@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Uwe,

> On Fri, Jul 17, 2026 at 05:59:14PM -0300, Luiz Angelo Daros de Luca wrote:
> > +  "#pwm-cells":
> > +    const: 2
> > +    description: |
> > +      Number of cells in a PWM specifier.
> > +      - The first cell is the PWM channel (0 to 3).
> > +      - The second cell is the PWM period in nanoseconds.
>
> Please use #pwm-cells = <3> and $ref: pwm.yaml#

Thanks for the review. I already switched to #pwm-cells = <3> for
the next version, so that part is settled.

Regarding $ref: /schemas/pwm/pwm.yaml#, it doesn't quite work here.
When I added it and ran
dt_binding_check, it started rejecting the example node:

hwmon@2f (adi,adt7470): $nodename:0: 'hwmon@2f' does not match
'^pwm(@.*|-([0-9]|[1-9][0-9]+))?$'

It turns out pwm.yaml also constrains $nodename as part of the
allOf, so referencing it forces the node name into the pwm@...
pattern. That's not right for this device: the ADT7470 is primarily a
hwmon chip (10 temperature inputs, 4 fan/PWM outputs), and the PWM
channels are just one of the interfaces it exposes, so hwmon@2f is
the correct node name here, not pwm@2f.

So, for the next version, I'm declaring #pwm-cells and
#thermal-sensor-cells directly in the binding instead of pulling in
pwm.yaml via $ref, and pointing to pwm.yaml only in the description
for context:

"#pwm-cells":
const: 3
description:
See Documentation/devicetree/bindings/pwm/pwm.yaml for the
generic PWM binding description.

Let me know if you'd rather see this handled differently (e.g. keeping
the $ref and accepting the pwm@ node name), but I think keeping the
node name aligned with the device's primary function is the more
correct approach.

Regards,

Luiz
