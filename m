Received: from mail-ed1-f46.google.com (mail-ed1-f46.google.com [209.85.208.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00B1139447C
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 03:24:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784517846; cv=pass; b=leVWhQ9uFhDurNwmoDi9YXqc6C7riklBRQ7KnCHPwKLMXx9DkRGopDpTo/85xB0C+6K/+8yHKzPk7i22gSzgepSKFAiUjVx8tYNU6K6qznQqET3w2HAoynxHsaXJYZRQOr7Ay1LEtGfWqfLYxYOiw/mmi5WZxm7DMsy+AzE5C6c=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784517846; c=relaxed/simple;
	bh=oRIe/84zUcYPF7WKctWcQse43kn0k7OaGkq/Am/HD3U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pFgYtdvG/CTRxUJ6in8MkjZgFh1QjDNF3iPoUKh4QX2zYNg7rj+H7uRYJlZ7txV4UtOxLys127ff8aw3O6avLfmIqgz2jfT7yBvasVhSqhDx08PXKS+5SpMLeP9qME0sm5q8Aew8Xez0JMmFYOBXiuuigTxBEygWUS15c12FBnI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=OjWcHmEJ; arc=pass smtp.client-ip=209.85.208.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OjWcHmEJ"
Received: by mail-ed1-f46.google.com with SMTP id 4fb4d7f45d1cf-69a50b818c8so15662231a12.2
        for <linux-hwmon@vger.kernel.org>; Sun, 19 Jul 2026 20:24:04 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1784517843; cv=none;
        d=google.com; s=arc-20260327;
        b=kg61GjkV00OTcMSFmCaG4i7ehMwDGGqeq9pSuiutt0oxR5LGf47KRkPYAzSUcYX81T
         h3uHEV8z4pV9TFx4ExDBCahdGJLBFLfcr2xhDemmqoY9Y+54EG1LCRMOHvMuUIsevLSK
         FsAbPtGUVA36F9q3XJaJxbx/KkeSxwDM2VxtVSstkohrqhKxvBg47h3VYlbV8cWELcHK
         u4zioQgkFzkKWqPNqYH7hAQl5Sf7T7tQsLNb8fRPRAwKD6jMjzK3BopoZD4r0TwWg29E
         AjYg1sQWPDR6KoT2qgHQadYWV3+bjPF0Ts60gVP99pIy6qi/AB6DJBWGPn9USyfWc2x8
         JeGg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=8V+cmq0ObXqhIAMf/P6Sid/1xN3TypvFqnYYrUPHLBo=;
        fh=N9Z87eG/HzL8ti0cgBStMTEqiW810YfndzyMugtMrHs=;
        b=LYPjC+ZpWQATbi2gN9mn9AHO/+NSmcAC09ezlW1qamuHmkXBEZ7xhLr1IW9tC5Gl5o
         By5YC2teErKp2SGU/DiC6m4Sq8YulFaYZTsgz0OTUzE79jzG8asUpBEu0p2XsiCFtrnT
         T9hIihk1b3uDFXXPOfeCBErgcucjLejUBOg85j/HLFth9G2Z8bo32tE7qQBU/gl3ghw/
         Yi05Ag9QoaM6RxuQEkQMk4+W+ZvBYT9G1PENIMkIUpz+feBZ/YlpfkuJBMCU9c3VOvTM
         vYvkGpxszPKvQYvZ5eY+Bz0rs1PTmotfSUGP1RJ+we9QMJByCjd61JI57VyMX8rkitOV
         YJnw==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1784517843; x=1785122643; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8V+cmq0ObXqhIAMf/P6Sid/1xN3TypvFqnYYrUPHLBo=;
        b=OjWcHmEJ/Q20yrwJ5tFk8ckX0yTSNASrye0ByaxGOf6sOtFK7cQJrx+uxYgQAndoyw
         aSQqXgzgdZcaelmyk0MSsdfHB68R+eitTqG4H+kNukzJ14iFu63z1S/UX//KruSdCmGu
         xHUQ38Q+Ymx1txoGlm6b4+rErDC861aPCJrhlgvA4ON56W+nhCu+yZPe2zEbnnd88LxZ
         9AFmxrgXjvTZqjGCdvDkm2bZnsFy+SM0TiXwhpZPNMkeeY9TByPo3+I80QnP4kjWa6oY
         ZiDYQpziDoSrk7iTPw1lmqZyRXiliqCY7ML6OFg8Xr66e/WQXpE//J7P25qtA3HA6AYL
         wUVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1784517843; x=1785122643;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8V+cmq0ObXqhIAMf/P6Sid/1xN3TypvFqnYYrUPHLBo=;
        b=Jm2XMA4FPpRLAiRetrdyOq+SrPxnP9KO/jnam5H0G/BIXwJxT/mNEZ4eO92hXnqi7B
         q8aL+bK2u30P6xd1MFtAN5akmrfUNrftYNP9ryaGP7vNPQFVwgUda9ELs4R4CGwN8IBv
         Rnsl0q4o2k3o71VnPX0di9i6gIUcCo9Po2AGmfMf9DUoigjZOroWKR6MMTTw9VkC2+ef
         HOMYuXnL+e5TwN/0/cBTyIBhpMo5q945pi7piFWn7C/8QADi0RTzmi18C2IBuF5guaMp
         e1LeNWuRFFxLNF6l2TyM1LOXRTH1sJepdy0TrRXHAPGpgEPTKzamwZN9CGfOCkIT9SdO
         Oyow==
X-Gm-Message-State: AOJu0YzYLReATySQJiDO9eMWIJgJKWwI/U+/F4Fdq5CJaVsTJXKO/MUF
	/cqS/Z8yKm9PID0bBuFA3ilqwRdwUOW5h3ConfuRx9YfugdpbOXjvOp2o56+5fsgljxMEuCWw4V
	FHyZZ/eL6X40nGYZkAtxqeiqbUmHsWvk=
X-Gm-Gg: AfdE7clEiX4dsQCS8hbPCMEkXRqLKY/gwZ2uwiX00/Z/dRB1+JyxbIlmba+5hNYQhNN
	Z89oo+9KSDPUSehjm/yVW9SOSrvUiQ1bXno0dsTEwvgvJCk6zN9gIwyW6q1wwoljMzryiX3JPkh
	iaRygEYYPK3bXJrnJLbC85WGa01zi6welUOIpuW474aIlgOj3fY08rXke4F1GvwVWTINGiQUWdO
	g8l6ZXypnoIoIb1U6lP7tzdLFit2zWRxqPEtbZmpp5t4j98nONqQRjTMSMz9pEnuAG/JeOAvKbm
	Oo5mSt25ciQFjQlpqpBI
X-Received: by 2002:a17:906:7947:b0:c12:9b93:61fd with SMTP id
 a640c23a62f3a-c16b46aa27amr427440366b.6.1784517842957; Sun, 19 Jul 2026
 20:24:02 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260717-adt7470_thermalzone-v2-0-a55147958fad@gmail.com>
 <20260717-adt7470_thermalzone-v2-1-a55147958fad@gmail.com> <20260717210439.356FF1F000E9@smtp.kernel.org>
In-Reply-To: <20260717210439.356FF1F000E9@smtp.kernel.org>
From: Luiz Angelo Daros de Luca <luizluca@gmail.com>
Date: Mon, 20 Jul 2026 00:23:50 -0300
X-Gm-Features: AUfX_mzsv1aeyFo6ikWaI5--bnju7xbF9TV1ObqLQI1Nx-0zHSbgM8sQSA2VqxQ
Message-ID: <CAJq09z73W9rtS75K2802jmZpHcAag-Sz6roKQW31cYANH4gjFA@mail.gmail.com>
Subject: Re: [PATCH v2 1/6] dt-bindings: hwmon: add binding for adi,adt7470
To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org, 
	conor+dt@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

> Thank you for your contribution! Sashiko AI review found 1 potential issu=
e(s) to consider:
> - [Medium] The binding defines PWM output and thermal sensor provider cap=
abilities but fails to include `#pwm-cells` and `#thermal-sensor-cells` in =
the `required` list.
> --
>
> --- Patch [1]: [PATCH v2 1/6] dt-bindings: hwmon: add binding for adi,adt=
7470 ---
> commit 6372aff696282f1ac0ec9a8f1372c186734704a2
> Author: Luiz Angelo Daros de Luca <luizluca@gmail.com>
>
> dt-bindings: hwmon: add binding for adi,adt7470
>
> The ADT7470 hardware monitoring chip supports PWM fan control and tempera=
ture
> monitoring. This commit introduces the YAML device tree binding schema fo=
r it,
> defining PWM and thermal sensor provider capabilities.
>
> > diff --git a/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml b=
/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
> > new file mode 100644
> > index 0000000000000..14bb6359c91f2
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/adi,adt7470.yaml
> [ ... ]
> > +properties:
> > +  compatible:
> > +    const: adi,adt7470
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  "#pwm-cells":
> > +    const: 2
> > +    description: |
> > +      Number of cells in a PWM specifier.
> > +      - The first cell is the PWM channel (0 to 3).
> > +      - The second cell is the PWM period in nanoseconds.
> > +
> > +  "#thermal-sensor-cells":
> > +    const: 1
> > +    description: |
> > +      Number of cells required to uniquely identify the temperature se=
nsors.
> > +      Valid index values are 0 to 9, corresponding to temp1 through te=
mp10.
> > +
> > +required:
> > +  - compatible
> > +  - reg
>
> [Severity: Medium]
> Should #pwm-cells and #thermal-sensor-cells be included in this required =
list?
>
> Because this binding defines the device as a PWM output and thermal senso=
r
> provider, omitting these cell properties from the required list allows
> incomplete device tree nodes to silently pass schema validation.
>
> If an adt7470 node is created without them, dependent drivers attempting =
to
> reference it as a provider may fail at runtime when parsing the provider
> specifier.
>
> Could both #pwm-cells and #thermal-sensor-cells be added to the required
> array to enforce complete node validation?
>
> --
> Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260717-adt7470_=
thermalzone-v2-0-a55147958fad@gmail.com?part=3D1

It would be nice if Sashiko-bot could have previous submission threads
as input context. It would be a great way to avoid false-positives
like this.

The ADT7470 can be (and is, in real-world devices ) used as a PWM-only
device. Likewise, nothing prevents its use solely as an ADC for
temperature sensors. Because its use cases are modular, neither of
these provider properties should be strictly required in the binding.

Regards,

Luiz
