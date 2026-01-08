Received: from mail-dy1-f171.google.com (mail-dy1-f171.google.com [74.125.82.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5E580439003
	for <linux-hwmon@vger.kernel.org>; Thu,  8 Jan 2026 09:24:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767864273; cv=none; b=Eay0nkdFDy1OslnL/aG3Mf3zp22JmBnhWxbqLJX0nPxESQlkClHRZApCJOl6oUAXV3FP3mbCV5vBgb29WWfi6N/zemuAhFotF54ZIAzYhEMWb7zJlb2q8Vp9b/ZfM3EpNHBnPrI61iZY1uSe6JwujW2uXmA6ILnNoFN4v1VkSB4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767864273; c=relaxed/simple;
	bh=ypBflX1MqfjSoWNBKYCx5jzX7uGjSsdKXfNeInXxr88=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=fuvMI5kmlsoEnj5MmKeW/qa22sDLRsQD8jQ7S+PVkjFFf0fU5ShNl+mY6W/+2CVTOopKTrPI2tjxzXFwzNhiCTvsyACA4NXrh4zf5rHz+tpqwltEt5hIEC+FzXmTuaomczO6dKK9wgAsF6WDMutPtIfF1xQIWEfD2N7sS4VA1Qw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=i2PwEilP; arc=none smtp.client-ip=74.125.82.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="i2PwEilP"
Received: by mail-dy1-f171.google.com with SMTP id 5a478bee46e88-2ad70765db9so3770258eec.1
        for <linux-hwmon@vger.kernel.org>; Thu, 08 Jan 2026 01:24:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1767864263; x=1768469063; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RRSrXpiX5rE6qSHVK45R2QDUw1xhEhA71pylvunk+JQ=;
        b=i2PwEilPS3risla3Pgc3/PR3H9LctnKwWAELTw9wIlBfrNs3wS4lQ5PiBN81z70N+Z
         pdccAOvyR3SBHmCUzMZOYbYX+JsSbMUDvvp9/SrQZn7xfl5WjZzVO5SP/+vtaVp790P9
         n1ZAm/hq/x/dXyfzCtUy7B2fhB3MGLiDc4s34nT3Gnwocz8bOg7GmwORnL6xTF4g1En5
         xYZgPQC0Y1VDJhrqdzif+QrO2iD+DASSB1f9d9O2YB5yt99hkXKVn22oS0uKMvavQous
         HAusVurWdCIp52drjHi7d8wff0GqmtA+NQX0ZB0aCYZDPPePgKALPrBiJOMJVDS5pxpS
         mSMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767864263; x=1768469063;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=RRSrXpiX5rE6qSHVK45R2QDUw1xhEhA71pylvunk+JQ=;
        b=hEqApMrnw/mJ3bGe8QxjXE9Yx0k5fc7j5Oa9iFCJQvt8KRsrEhkt6FZ9Z8xvDbCH1v
         NXiQMWI0zEAe38co7SauP6qkffZ+mbKuuknA/Xw94XvAlzcMa7RWDx0H3CllYzRaB88G
         N9EHEYNAuU1VK/Zv7dVn1Rl2FbBPq4IH7ouhTutNJrhBWL1RitnujkKfz/hfK6br7p4H
         1sy+DogWDdfMgTdp9nnnOvQ/3zRQW0llj5IZhgCfgm+AdW/W62WLVMN4t6sh+pqpz4bh
         un0AzeO1HClsK6sUsXTbaBvvFJTHVFzWWl7VP33g5bxWfQdLEg8Pi9GrzA29/TsfJ09Z
         a78Q==
X-Forwarded-Encrypted: i=1; AJvYcCUCcFBeWjhCg9p47NJihaVTq62wUnIoL+z2AtdlwJypa0Bio81qzhAI7RxsCORjVHfWOflU69xCeNNhzg==@vger.kernel.org
X-Gm-Message-State: AOJu0YxuG5XYqiVgY9JARxUCmE2xiwIOgysBOAE7qS9rcGv7Uy42kVJd
	wWfaQru5LPbBVsT9J5nbq8aGh5HEcRCMhgm2Y211VbGXXklDdvfT3XkwPeqtQLxXd/R7CYqYFdX
	bZBWVN9bF70HvmwUrlTZSHehgrxdZDsQ=
X-Gm-Gg: AY/fxX65jhS31JdtARfOFsdBDICIh1gEtWZpaUZcNDZ5Vy9cDWmY38KMclPKQNK/r++
	3TjDs/MqRFoPvHt5CVVP0hZc1+r4bZ1QL1/i2SgItSGN4loZfT06KoFD3Ed50YemsTfxifi/CIi
	uurHBALJc4SkvQmir+Is1ni6TRJHMIvyinKkgThUe8t1W5L/BgHTE2wOSQ5m3WyBiWaXWC5A8Rn
	MMhVEa5pW2tQbLujMGMdFsY+/Mx47ch2TEsOj2nZSb6kk3zNhlqihICr1ykKL2YWNaky56X
X-Google-Smtp-Source: AGHT+IFn0/ByzLwgXHz4AukygcYOKJHlo391c3/PwDUd+CINV+nWPvuo29hY+e2ZqB+wNr7PalGB4Lfil/yRKfVATpk=
X-Received: by 2002:a05:7300:5794:b0:2a4:765b:b4bd with SMTP id
 5a478bee46e88-2b17d31c87bmr4142360eec.37.1767864262501; Thu, 08 Jan 2026
 01:24:22 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260107144507.46491-1-Ashish.Yadav@infineon.com>
 <20260107144507.46491-2-Ashish.Yadav@infineon.com> <7bf30b16-c98e-4c18-816c-58f632fcf939@kernel.org>
In-Reply-To: <7bf30b16-c98e-4c18-816c-58f632fcf939@kernel.org>
From: ashish yadav <ashishyadav78@gmail.com>
Date: Thu, 8 Jan 2026 14:54:10 +0530
X-Gm-Features: AQt7F2qrTjVKYq8OXKdyyzYH2Sp7FePaNX9Cz1g5Ydq_4isG37hB9sfeOuxQ6d8
Message-ID: <CAJKbuCY=Q2d5sFigb_wTPTKzqpeHX4c5f704YFCqKhsKE32YpA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] dt-bindings: hwmon/pmbus: Add Infineon TDA38740A
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ASHISH YADAV <Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Please find my response inline.

Thanks a lot for your time and feedback.

With Best Regards
  Ashish Yadav

On Wed, Jan 7, 2026 at 9:44=E2=80=AFPM Krzysztof Kozlowski <krzk@kernel.org=
> wrote:
>
> On 07/01/2026 15:45, ASHISH YADAV wrote:
> > Document the TDA38740A/25A device tree binding.
> >
> > Signed-off-by: ASHISH YADAV <Ashish.Yadav@infineon.com>
> >
> > ---
> > Changes in v2:
> >  - Review comments address:
>
> You need to write here what you exactly changed.
Sure,I will take care this in v3 version.
>
> > https://lore.kernel.org/all/2ee75453-0869-4348-ad92-f7ff71aca75d@kernel=
.org/
> >
> > Driver code in review process:
> > https://www.spinics.net/lists/kernel/msg5985470.html
> > ---
> >  .../hwmon/pmbus/infineon,tda38740a.yaml       | 81 +++++++++++++++++++
> >  1 file changed, 81 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/infin=
eon,tda38740a.yaml
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda=
38740a.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda387=
40a.yaml
> > new file mode 100644
> > index 000000000000..cd4102350a15
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/pmbus/infineon,tda38740a.=
yaml
> > @@ -0,0 +1,81 @@
> > +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +
> > +$id: http://devicetree.org/schemas/hwmon/pmbus/infineon,tda38740a.yaml=
#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Infineon TDA38740A and TDA38725A Synchronous Buck Regulator wit=
h I2C
> > +
> > +maintainers:
> > +  - ASHISH YADAV <Ashish.Yadav@infineon.com>
> > +
> > +description: |
> > +  The Infineon TDA38740A/TDA38725A is a 40A/25A Single-voltage Synchro=
nous
> > +  Buck Regulator with I2C designed for Industrial use.
> > +
> > +  Datasheet:
> > +  https://www.infineon.com/assets/row/public/documents/24/49/infineon-=
tda38740a-tda38725a-datasheet-en.pdf
> > +
> > +properties:
> > +  compatible:
> > +    enum:
> > +      - infineon,tda38725a
> > +      - infineon,tda38740a
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  infineon,vout-voltage-multiplier:
>
> vout of what? Of input supply? But there is no input supply... Maybe you
> just want to set output regulator supply?

 Yes, output of regulator supply.
>
> > +    description: |
> > +      TDA38740/25 pin strap parts are available in two flavors of 1:1 =
& 1:2
> > +      vout scale loop.
> > +      For the 1:1 vout_scale_loop version, there is no need for any re=
sistor
> > +      divider as output voltage sense pins are directly connected to
> > +      the output.
> > +
> > +      For a 1:2 scale loop version, it is recommended to use 499 ohms =
each for
> > +      top and bottom across the feedback path.
> > +      However, in some applications customers tend to use an intention=
al
> > +      resistor divider across the output with a different divider rati=
o other
> > +      than 1:1 or 1:2 to alter the actual output voltage.
> > +
> > +      For example, if pin strap part is set to Vboot of 0.7V,they use =
a
> > +      resistor divider to generate 0.75V using the equation provided i=
n
> > +      Section 13.3 of the datasheet.In this case, as there are only tw=
o
> > +      vout_scale_loop options of 1:1 and 1:2 that the IC can identify,
> > +      Read_Vout would still read as 0.7V in the telemetry and the base=
board
> > +      management controllers would use this telemetry data to monitor =
the
> > +      rail parameters leading to false tripping of the system.
> > +      This multiplier is used to offset the telemetry output voltage R=
ead_Vout
> > +      so that the telemetry data is reported correctly to the monitori=
ng
> > +      controller,in this example the multiplier would be 0.75/0.7 =3D =
1.071.
> > +
> > +      This multiplier is required only for any external monitoring of =
the rail
> > +      output voltage. All the other Vout related parameters are used
> > +      internally by the IC and there is only a slight impact on the fa=
ult
> > +      thresholds.The impact can be calculated using equations in Secti=
on 13.3
> > +      of the datasheet.
> > +    $ref: /schemas/types.yaml#/definitions/uint32-array
> > +    minItems: 2
> > +    maxItems: 2
> > +
>
>
> So this was a regulator before, now it is not. Confusing... Parts of the
> description are saying this is regulator, so you miss regulator.yaml
> reference in top-level. Anyway, I am not doing full review with such
> incomplete changelog.
>
Sorry for the inconvenience.
Regulator part is taken out as per review comments from:
https://lore.kernel.org/all/2ee75453-0869-4348-ad92-f7ff71aca75d@kernel.org=
/


>
> Best regards,
> Krzysztof
