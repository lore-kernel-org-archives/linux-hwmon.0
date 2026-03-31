Received: from mail-ed1-f43.google.com (mail-ed1-f43.google.com [209.85.208.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 270AB3EF0A2
	for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 16:46:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.208.43
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774975597; cv=pass; b=AxD57N9ObToWwA3NnGpe2XXXIqf8jkUioeOeYJiNE7ctMqbfjd25ao+1NdmccjjoJZiC0pXQGDkbYqLW/1z6qS+4Gpg852fOpfaxItWXgB343MgF4lyPJqvXWSafgXFx2LBvp9ckXMKxw4JYw4MQnt6AtmKtCIGEeo8++NlmGCs=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774975597; c=relaxed/simple;
	bh=HzYbfwAcPnd0HwHQXnUiS/moFgAvTCCmXeteH0hKD9Q=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=aoFdDTeAAf4kqlQkv18cG8bDJzIP3m5u31/MWzn+16fi4FubO1K6S/3cwc5OL4Q9ysV9DQRve7/k4FEubeHfqOsv8mWgS65L0BzMluFbZWgEvwJ2gF6OaP6O69dFWRDRDCmhj503Kogz3lRPJENLWZAs2VUBKT+JW6W9A8uxq6o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net; spf=pass smtp.mailfrom=flipper.net; dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b=HAN7d5g5; arc=pass smtp.client-ip=209.85.208.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=flipper.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flipper.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=flipper.net header.i=@flipper.net header.b="HAN7d5g5"
Received: by mail-ed1-f43.google.com with SMTP id 4fb4d7f45d1cf-66c05fb27e4so3403030a12.2
        for <linux-hwmon@vger.kernel.org>; Tue, 31 Mar 2026 09:46:35 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1774975594; cv=none;
        d=google.com; s=arc-20240605;
        b=ZFg+vXrwfIVOl3U7Zyh01K4Z3WWlJIhLNSaV/X4JpBGL5YCu1W9lNcfXr/tOOiqgX/
         gcwSSm50iI2pVDdeHcV08fLJTuEE0v0qBrKOLFxDiZfoNHC3gEJXuG+ui1YeRz+I+6I2
         Lt5BGnmE4bxs1StzrafzXNq5C9fc84uW4BYWNCv1wnlIqvkLLixQHSQgtmli8eBdUg6t
         W3R36u0TN3GyTZ3NNYI+O4U/7dUlcCRbAz/MT8GbgbvnyMIKgR9mqV4MAh5xpDD0z4/L
         4gTAs6ppUvVpQm/zuci/C7IvRNeTXxWamuayv+E4x/54kL+yk43jG7QlF/q9dKO+sucn
         2ckA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GouBERXJUhyxyJHAw9h3FhUT0Po7LZnvJzNFya+cCZs=;
        fh=4B5tKh3wiDdiwzSXTdVJ1BlzECSAOIUbqptnYI7m+MY=;
        b=D/oPCqt2h29p3MKex7d8dN6xJ52nhGOh8+zVb054zbDxXRXgoOvW76DorHJvLmlnzI
         Ev8nrXKdYL4gjFPWnSSlLBiJJf/5u2eIsGmkdOdXjylpxQHk6eycCwOrz2EOV9oM63mo
         3cUgtC2DEiPvRdsuvDK6gexq1hslxxx2YTXjOUhpCeQfnBCUHeJeiIvWAeLmivw3HPs3
         xntuZDmcYVkIiO+bEQAke+lcY1a+268S+SHtTVCXU3yWpDvqs4pI9B9jg8nr7lNfv0Me
         njz/Ly6M+qdkKPZH/fX8unk5Vp7fsG52Aq+CsMnLfL3zKlvYfxMLyi+PLY5/EhNnsuGt
         fXYQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=flipper.net; s=google; t=1774975594; x=1775580394; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=GouBERXJUhyxyJHAw9h3FhUT0Po7LZnvJzNFya+cCZs=;
        b=HAN7d5g536a8S0VxiVaSJhnocvOWPgJz4QXT9mKjHfILmlk0n1JmX7+w9uliqNKJfJ
         drSa2dlqAOE7nhnd/oiGwyYXKSaLsqAR+pvGSCFQwscDx7xc3ij3ggoFPhkJS1I2duSm
         ky/IErQoVqvLO0xh0H72gaQOqNIDq0lOWvSCOKxA940Lk1aLvxvAhZgKTYFjrSnw0n4S
         6al4rGxNQnI54F5DbzRRinWotP27yclMVMw0FyuO9FaAtoCRgFcmRYGWzEbl51QyDLUl
         bBswKqQIpvJIVKyFQJhj6fgl2h5zr6vQ5yJUfczOk20k9wRZ2rAqTpQoQWt1RS+bjMSS
         kg8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774975594; x=1775580394;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=GouBERXJUhyxyJHAw9h3FhUT0Po7LZnvJzNFya+cCZs=;
        b=FIjdsFW9TL3Zke0+ecuVHkoK/EKz0WW891zMg/y886eDB5dKENOpcGCp6HWLlwBNFR
         2xV9C9v/V/rehMDXJX8G3vVhBwulNdhH5NvAJaY+vwNlX/a8ZB8HgcXsLiFhYATOOy7n
         9+i84BOW/4cjjdfY6lGmxxHH0wGTIo6xrkD+Ms7RHt1arjz6VB1NNAmu527M7jLxcaKG
         i+QUS2s0GwZzze0CIpHQLQO3HIi9RkwOP6v6eUhUSRjRIcFMbgj9arQbADtsMke2hsqe
         EPMeYrMzdicyqslL65FDW7GR3qRfjM/4av/Yw45qmDtoKvbkebfxv3I2qFjEdjG15YyJ
         19Qw==
X-Forwarded-Encrypted: i=1; AJvYcCWowCJ3bU99IppQCQIJJIpNMvZ9x0QFK3AJgSORgE4+ztQD22pNE2HAUJMAbTVmw+Qh+qYCWegUlb8RLg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzRaAAg+PPn9L9xehZnNU6kC6VWsDS9/TgUrnCjpWoAckoTCyo3
	PumGVn4rQQUauuoKzpY2M2x+VCZKVs50JdlbKPMPFnNrxP28BV+Jocu0pl0riXJKPT/JnMsDWbi
	GHLV8RcdKtJ6NtquAq3W28hsffT1pUsCx4EbrmF4MSw==
X-Gm-Gg: ATEYQzzW+r/btK2HQTNlMf/zI0QThmx53WjSF739Ir4I7dxuFLkMW7nWkVnFOxW24PS
	c9KgKN+T/uqSBAlqUZnUeXC8b7wWabHzWjCeiV/y33LUhVshz9Y108j+HHjZ8ujDWv6w5dTJ4KF
	3v7YLcCwJmr1vVl18gk00fPmt/taXLW3Nvm15QKqHXOcx3pn7keogvKUQVhjcmTHswdoCuaBwHZ
	xT7wUrLrYIVPVfoNS1WiW4HekZtoqFewurnzU37rc/rNQIxiFg5lnOMzRXBE976jebTm3yBF9s2
	O3opjDY=
X-Received: by 2002:a17:907:d854:b0:b9c:8da:15ab with SMTP id
 a640c23a62f3a-b9c13cb9918mr23266166b.44.1774975594310; Tue, 31 Mar 2026
 09:46:34 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260330-ina4230-v5-0-eeb322d95b3a@flipper.net>
 <67a5d1c1-a9c5-47fb-a0ec-5b69a991b01e@roeck-us.net> <20260331155246.GA1299761-robh@kernel.org>
 <20872ef8-f68c-4916-a05f-404fd49fff00@roeck-us.net>
In-Reply-To: <20872ef8-f68c-4916-a05f-404fd49fff00@roeck-us.net>
From: Alexey Charkov <alchark@flipper.net>
Date: Tue, 31 Mar 2026 20:46:23 +0400
X-Gm-Features: AQROBzBF6QMV9ZUgiTg9Y6ZYRCRlZXMOMlDxfEHthEBqJ9A_mQSIAoXoi4cvHQo
Message-ID: <CAKTNdwGcXcE25QiBTrZO6akMad+Lny5iPvAAAmUt6x2Hyzu5wg@mail.gmail.com>
Subject: Re: [PATCH v5 0/2] Add support for Texas Instruments INA4230 power monitor
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, linux-hwmon@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Mar 31, 2026 at 8:10=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> =
wrote:
>
> On 3/31/26 08:52, Rob Herring wrote:
> > On Mon, Mar 30, 2026 at 09:07:32AM -0700, Guenter Roeck wrote:
> >> On 3/30/26 08:14, Alexey Charkov wrote:
> >>> TI INA4230 is a 4-channel power monitor with I2C interface, similar i=
n
> >>> operation to INA3221 (3-channel) and INA219 (single-channel) but with
> >>> a different register layout, different alerting mechanism and slightl=
y
> >>> different support for directly reading calculated current/power/energ=
y
> >>> values (pre-multiplied by the device itself and needing only to be sc=
aled
> >>> by the driver depending on its selected LSB unit values).
> >>>
> >>> In this initial implementation, the driver supports reading voltage,
> >>> current, power and energy values, but does not yet support alerts, wh=
ich
> >>> can be added separately if needed. Also the overflows during hardware
> >>> calculations are not yet handled, nor is the support for the device's
> >>> internal 32-bit energy counter reset.
> >>>
> >>> An example device tree using this binding and driver is available at =
[1]
> >>> (not currently upstreamed, as the device in question is in engineerin=
g
> >>> phase and not yet publicly available)
> >>>
> >>> [1] https://github.com/flipperdevices/flipper-linux-kernel/blob/flipp=
er-devel/arch/arm64/boot/dts/rockchip/rk3576-flipper-one-rev-f0b0c1.dts
> >>>
> >>> Signed-off-by: Alexey Charkov <alchark@flipper.net>
> >>> ---
> >>> Changes in v5:
> >>> - Reworded per-channel subnodes description in the binding for clarit=
y (Sashiko)
> >>> - NB: Sashiko's suggestion to allow interrupts in the binding sounds =
premature,
> >>>     as the alerts mechanism is not implemented yet and there are no k=
nown users
> >>>     to test it. If anyone has hardware with the alert pins wired to a=
n interrupt
> >>>     line - please shout and we can test/extend it together
> >>
> >> The bindings are supposed to be complete, even if not implemented, so =
I am not sure
> >> if the DT maintainers will agree here. We'll see.
> >
> > Given ti,alert-polarity-active-high is added seems like the interrupt
> > should be too. And the interrupt can specify the polarity, so is that
> > property really needed? There's alway the possibility that you have som=
e
> > inverter on the board too and the interrupt polarity is not enough, but
> > solve that problem when it actually exists.
> >
>
> The alert pin can be attached to a board interrupt, or (more likely) it c=
an
> be attached to the I2C controller's alert pin. In the latter case there i=
s
> no interrupt property.

Alright, I will add the interrupt property and keep the dedicated flag
for alert polarity.

Following the logic of binding completeness, should I add a flag for
the single-shot mode too, even though I dropped that functionality
from the driver in one of the prior iterations?

Thanks a lot,
Alexey
