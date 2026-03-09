Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1D44362129
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Mar 2026 10:29:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.48
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773052176; cv=pass; b=qCceA3U55dD/lxp1wGV2+iBkIvgvLsNd0QA/XiHeG7oL/jeqGMG/N5BjQGBiAZcHOF7li+Yrzd/o9Cj4D3yFm81RXoCAe69DJWq/E0zqCekTCXu3KVWLoWl6SfPkpPPHeFINbHrPmb3j2vCPIL6ksdV5SQe5OwjSLH81DgKcjiE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773052176; c=relaxed/simple;
	bh=nzcbenEcYkPYYRcM15AOs1wov/pK1dlaepSRpqvipk8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ZDGFrq+z/AxAPTvWQqS9mW83QB0GCpoC/lqoDIOabxDuzISGU2u5vStUfWNDBovP634F7lVF3DvIkrMjcJXHEiWx3IjdnmIxCUFgLDD3lCVHaTIpQlO9DcifH7FRzzfkerESuMYQ4z4jgIopVhncjwgxCc9b87Vb/MHR8l7BqQE=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=iKKxMWPg; arc=pass smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="iKKxMWPg"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6617f0bcad2so5479573a12.3
        for <linux-hwmon@vger.kernel.org>; Mon, 09 Mar 2026 03:29:34 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1773052173; cv=none;
        d=google.com; s=arc-20240605;
        b=fbHSl2nGif+1C5uWH6R88QIeb04+4hmvVBeLH/VY8by0Wo60hEp2UgA0EFmPCOzzu7
         5Ro6IVAdDl3JllkBlXQ+8ozLgJNiLi5D4j4UDKg+wn+ps6UWIjnngjFPHEaGB6mU4A0a
         LiISJ2q+pYxlV7B/71vpYyfp1vSCO24JMklnyqNiSVvJf2mkZHLQMrfsNikuAFS70enx
         u6f0Y39kvxTrUxkfoZP88wTKNjJF32W9rifn4soHkEEMVcAq0FtyQ9fUVU3xIxXghbXu
         DtJckCbB8vbJJ68GX9vBT2atE30g+KWhIEK4XBzEyZXugsI+OQborocOS7AGUMf+3w/n
         o1Jw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=ZK2rFDeX0KxwuJJMF0gWd/rE1Tda8J7ydGgJVSDAuto=;
        fh=FfyPoZ79cfuHLIppCsjsrtdh8msTLOQjruvLBvLivIM=;
        b=CqMR71RoACmMqWLvRibtBXWHw55AoYdOx0opMKJ6vsnclkzMvl46gFFGeHblKO8DN7
         MUnPqQ3eDJxuviT+qz84MEY0j3M+77RAIy+l1Di7k1ROjtme22EIbERqeXlWSgepgkgn
         Eq7s/8ELNP1d53Cr0laSMkryf66LrmkdLPWZE2Mew7PG0wOBTU5V2wEn1VMEr3LcQQ+5
         hU+38yTV3PgIA7v5dSjdUVXZx4s0t5mCbwhFZjBk0+VjuA/zcU98fp9oapuCKtqJhb73
         ce8+r2pS3AKWM4eG3G200mdMzGeoXHpzQu+SECDnZzeLPKmv/3fM5ipGfeIUJKgZaaWB
         nuAA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1773052173; x=1773656973; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ZK2rFDeX0KxwuJJMF0gWd/rE1Tda8J7ydGgJVSDAuto=;
        b=iKKxMWPg5la4lx4k0o+gpw2SybnPOtL2JnRhcZBEoawcVs+OnyquSu7WrgfCx61QYQ
         ycMdSLanUVlSvnHkY9fmju9J6bzqCtH+3I+Kp6wLAtr0tTq1HmneIX4fivIjSBf7HxqA
         ofRqBBpfn9KNviP1UmVBw27SRh08P5kMn00D2Prd78fSReqj4+qapv09n5cScXJO0DJS
         oAiYOJPke4DM8M0UqJ3A7owZnLoIW5ms/rPdXtMFMM3E+VmifqcQ9IvkS1E2sByRkOJE
         9/YIVPd8Q5reVbffjCJPm0ZhPvRApJMAv3L4eKzRNGgnwETrydRXt7TXzc/T6F9ZEq7g
         03UA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773052173; x=1773656973;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=ZK2rFDeX0KxwuJJMF0gWd/rE1Tda8J7ydGgJVSDAuto=;
        b=odJGXov9ufIn1Ax5HjXIm+MLOXlBj8aiLr09n6WZx3+54rqaceqIdyXDX+M4wQxuDs
         ASHGLYK3ll1OpWCFsPMaRLh79s820dF1/7z7a+ZmHubErMwWe0MOgZHHLKtJjZzXwFge
         AtZCwmBsY38DuTo44GWj5D+53pqiGkXhjpZmkegBU6ee1dmY3whEXG1NTjsq5BugRZ4l
         ghraPsYwdMt7SsDAHbYb/taHZ8+2jjw+712VnZGfkh84O08PcShRr0sS/g/fg2wiX3+o
         QQiPLTmh4TBFK7QnVGomj9I9Cm3DWMIKuE4H5AgW/pmGLfIaZFIPu5YjsAVlGYngci27
         fNFw==
X-Forwarded-Encrypted: i=1; AJvYcCXApeKXzOQlcpT0AQiJmJiTsXO/egUQrciz3k+oTOq0ArVSBHK3q6yfxEm1lOcGd3GCipVfUAW2IgAfKg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyQDIFTOe2uG7PAk8XY/AKEVu2lHxN0nAXfk4J8WqKh8y6ivrsh
	dl5V8a2VaHfnXHpdBGOQBJTULY8+UZY2PQVIbZA3LJfbaExI3My6C73S0EsUmKyjnlMBM+af8TH
	fNNOGC13QZHwh5LOwhd5o5+3uax6fzBtl2sAWuEka8w==
X-Gm-Gg: ATEYQzxOgqDm/mdLsABO+8lQtRDUjeDtkMAGNKHm0PLJB9+2iy6UKmaG4YJDGblJm2X
	Nhs5b9I006BeEPf6sNTdBh6ST68j1doogHIvOhBeQLlP7QYq2CDHu51r9xg1wIelDtfu2eIJfTW
	Zm3pHWeX1YINUkiPJJtNDUHcHeg0gqX/Ohn3fUk/beUSgljlL5+JyOuwIGURkUP4aLhtC4JsFA5
	0ZOWvh7BiLuKoWHtntIxHMvU9hOMarAQoYIGcuOqMn9+5y5CxNzaSOlT44At+f6xU8ECqPm12L8
	flfueDA=
X-Received: by 2002:a17:906:ef06:b0:b8e:8874:8384 with SMTP id
 a640c23a62f3a-b942dbcdc8fmr543893266b.4.1773052173195; Mon, 09 Mar 2026
 03:29:33 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260302-ina4230-v2-0-55b49d19d2ab@flipper.net>
 <20260302-ina4230-v2-1-55b49d19d2ab@flipper.net> <8584bf59-84a4-4b23-90f1-62297ee0da57@roeck-us.net>
In-Reply-To: <8584bf59-84a4-4b23-90f1-62297ee0da57@roeck-us.net>
From: Alexey Charkov <alchark@flipper.net>
Date: Mon, 9 Mar 2026 14:29:24 +0400
X-Gm-Features: AaiRm50_OXYeMv9cxXjeiyzokshUjqswaEkBZbVdDO0ssxvP7RrafNQdZtT7u4c
Message-ID: <CAKTNdwGdMoFN3yd+pdS=Bd3vHmx6WE+j3ccworu5O_ysRCznDg@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add TI INA4230 4-channel I2C
 power monitor
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sun, Mar 8, 2026 at 9:46=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On 3/2/26 02:55, Alexey Charkov wrote:
> > Add TI INA4230, which is a 48V 4-channel 16-bit I2C-based
> > current/voltage/power/energy monitor with alert function.
> >
> > Link: https://www.ti.com/product/INA4230
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> > Signed-off-by: Alexey Charkov <alchark@flipper.net>
> > ---
> >   .../devicetree/bindings/hwmon/ti,ina4230.yaml      | 130 ++++++++++++=
+++++++++
> >   MAINTAINERS                                        |   6 +
> >   2 files changed, 136 insertions(+)
> >
> > diff --git a/Documentation/devicetree/bindings/hwmon/ti,ina4230.yaml b/=
Documentation/devicetree/bindings/hwmon/ti,ina4230.yaml
> > new file mode 100644
> > index 000000000000..69839e7a3197
> ...
> > +      ti,maximum-expected-current-microamp:
> > +        description: |
> > +          This value indicates the maximum current in microamps that y=
ou can
> > +          expect to measure with ina4230 in your circuit.
> > +
> > +          This value will be used to calculate the Current_LSB and cur=
rent/power
> > +          coefficient for the pmbus and to calibrate the IC.
>
> pmbus ? Is this a typo or cut-and-paste error ? This is not a PMBus chip.

Indeed, cut-and-paste from ina3221 which I used as the basis for
making this one. Thanks for spotting, will fix in the next version.

Perhaps it should say this instead:

This value will be used to calculate the Current_LSB to maximize
available precision while ensuring your expected maximum current fits
within the chip's ADC range. It will also enable built-in shunt gain
to increase ADC granularity by a factor of 4 if the provided maximum
current / shunt resistance combination does not produce more than
20.48 mV drop at the shunt.

Best regards,
Alexey
