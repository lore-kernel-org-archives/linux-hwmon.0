Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="SWMPbqs9"
Received: from mail-wr1-x42c.google.com (mail-wr1-x42c.google.com [IPv6:2a00:1450:4864:20::42c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B9ECC5;
	Tue, 28 Nov 2023 07:46:46 -0800 (PST)
Received: by mail-wr1-x42c.google.com with SMTP id ffacd0b85a97d-332e40322f0so3505182f8f.3;
        Tue, 28 Nov 2023 07:46:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701186404; x=1701791204; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eaSqohHugtt6grw6CEKXWSAnRWopnEUVV/N+wIwdxWQ=;
        b=SWMPbqs9ng1eB6exXFiWps/Of1W0zWcMVl40ANAUMY6CFq3ffjDiQA7iIBlpics069
         on0aUhJCLr18i+WfqDYdeTz3DAEodZZ52KMRzWDA2S4TJDym/wIkqrjrGOYZ/U4YlXVF
         31594k8MtqLzpnbpTFI4to1c+2bb8MvS12csrxeKtwvVHYFqEjUT/BeMKWIb92CkgMjo
         r5k7ol9pj5CV/EMx35++IbdMK2EOeKAAEyaBNJ9+kgy8UtBvrJxRkSrh1NYu89AjjNTb
         Up0pGXfUNPsd377Lkx2vIRhDrCeOW0hNBNIHvSa78U2Y6uwNviVm2CsDzZR5qhk9flZJ
         xC4Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701186404; x=1701791204;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eaSqohHugtt6grw6CEKXWSAnRWopnEUVV/N+wIwdxWQ=;
        b=shFPklkm3JMSoG4oF1vrA1Myv3iKEnSdVkgALhE8SWTfe9QFN1aI3tKMXbpzzDETOr
         4z39n5sTzEiEIg9YpdUQycCLt/rhwm5pgkQn6oSbU580ETuLrox5VK6b+f6++ENtT+Ai
         1Oue6gpDGTZXYY2qCGcysjEySANJxBJM6T7cif8Z3gkSplGos7kA2QzUb4U8wnlIwm8Y
         zQO4mjB5XAlBOZCD6Rd97ETNtwKQZhi97giLJXal7zd1qbiJAXkv2PIM8Y/o0qrfANLF
         pb8fNna5UWfiOmzQrARrzB9HaNWKO8nBkOxfw1mWBvPI+HkGyQBfm5eMWzE1Hm+ryRq8
         tsfg==
X-Gm-Message-State: AOJu0YwvcLIfqHBsxUcgCPlBYqXW7SQ+PLOnrsozpgLC5xQoMtyeQHTF
	IbxcwtSn5MMCi50O881qMsE=
X-Google-Smtp-Source: AGHT+IHuXzZ/2bcrZP6mKjeZQFKF3z9OOwNPyxBC+M2EUC+TojqMO8yb/JYBs7Ci1biEYfYlmxZPEQ==
X-Received: by 2002:adf:fa8d:0:b0:333:12f9:d381 with SMTP id h13-20020adffa8d000000b0033312f9d381mr746477wrr.36.1701186403956;
        Tue, 28 Nov 2023 07:46:43 -0800 (PST)
Received: from ?IPv6:2003:f6:ef1b:2000:4423:d503:bf11:e8c6? (p200300f6ef1b20004423d503bf11e8c6.dip0.t-ipconnect.de. [2003:f6:ef1b:2000:4423:d503:bf11:e8c6])
        by smtp.gmail.com with ESMTPSA id o10-20020adfcf0a000000b00332cda91c85sm15264190wrj.12.2023.11.28.07.46.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Nov 2023 07:46:43 -0800 (PST)
Message-ID: <e4147e797ee2a35092f4dbf9e8687fb63f7a8c5a.camel@gmail.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon: Add LTC4282 bindings
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Rob Herring <robh@kernel.org>, Nuno Sa <nuno.sa@analog.com>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck
 <linux@roeck-us.net>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, 
 Linus Walleij <linus.walleij@linaro.org>, Andy Shevchenko <andy@kernel.org>
Date: Tue, 28 Nov 2023 16:49:43 +0100
In-Reply-To: <20231128153733.GA3313427-robh@kernel.org>
References: <20231124-ltc4282-support-v2-0-952bf926f83c@analog.com>
	 <20231124-ltc4282-support-v2-1-952bf926f83c@analog.com>
	 <20231128153733.GA3313427-robh@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.1 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2023-11-28 at 09:37 -0600, Rob Herring wrote:
> On Fri, Nov 24, 2023 at 03:18:16PM +0100, Nuno Sa wrote:
> > Add bindings for the LTC4282 High Current Hot Swap Controller with I2C
> > Compatible Monitoring.
> >=20
> > Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> > ---
> > =C2=A0.../devicetree/bindings/hwmon/adi,ltc4282.yaml=C2=A0=C2=A0=C2=A0=
=C2=A0 | 206
> > +++++++++++++++++++++
> > =C2=A0MAINTAINERS=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0 6 +
> > =C2=A02 files changed, 212 insertions(+)
> >=20
> > diff --git a/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
> > b/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
> > new file mode 100644
> > index 000000000000..6c979f70687e
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/hwmon/adi,ltc4282.yaml
> > @@ -0,0 +1,206 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/hwmon/adi,ltc4282.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: Analog Devices LTC4282 I2C High Current Hot Swap Controller ove=
r I2C
> > +
> > +maintainers:
> > +=C2=A0 - Nuno Sa <nuno.sa@analog.com>
> > +
> > +description: |
> > +=C2=A0 Analog Devices LTC4282 I2C High Current Hot Swap Controller ove=
r I2C.
> > +
> > +=C2=A0
> > https://www.analog.com/media/en/technical-documentation/data-sheets/ltc=
4282.pdf
> > +
> > +properties:
> > +=C2=A0 compatible:
> > +=C2=A0=C2=A0=C2=A0 enum:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 - adi,ltc4282
> > +
> > +=C2=A0 reg:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 vdd-supply: true
> > +
> > +=C2=A0 clocks:
> > +=C2=A0=C2=A0=C2=A0 maxItems: 1
> > +
> > +=C2=A0 '#clock-cells':
> > +=C2=A0=C2=A0=C2=A0 const: 0
> > +
> > +=C2=A0 adi,rsense-nano-ohms:
> > +=C2=A0=C2=A0=C2=A0 description: Value of the sense resistor.
> > +
> > +=C2=A0 adi,vin-mode-microvolt:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Selects operating range for the Undervo=
ltage, Overvoltage and
> > Foldback
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pins. Also for the ADC. Should be set t=
o the nominal input voltage.
> > +=C2=A0=C2=A0=C2=A0 enum: [3300000, 5000000, 12000000, 24000000]
> > +=C2=A0=C2=A0=C2=A0 default: 12000000
> > +
> > +=C2=A0 adi,fet-bad-timeout-ms:
> > +=C2=A0=C2=A0=C2=A0 description:
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 From the moment a FET bad conditions is=
 present, this property
> > selects the
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 wait time/timeout for a FET-bad fault t=
o be signaled. Setting this to
> > 0,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 disables FET bad faults to be reported.
> > +=C2=A0=C2=A0=C2=A0 default: 255
> > +=C2=A0=C2=A0=C2=A0 maximum: 255
> > +
> > +=C2=A0 adi,overvoltage-dividers:
> > +=C2=A0=C2=A0=C2=A0 description: |
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Select which dividers to use for VDD Ov=
ervoltage detection. Note that
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 when the internal dividers are used the=
 threshold is referenced to
> > VDD.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The percentages in the datasheet are mi=
sleading since the actual
> > values
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to look for are in the "Absolute Maximu=
m Ratings" table in the
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Comparator Inputs" section. In there t=
here's a line for each of the
> > 5%,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10% and 15% settings with the actual mi=
n, typical and max tolerances.
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/string
> > +=C2=A0=C2=A0=C2=A0 enum: [external, vdd_5_percent, vdd_10_percent, vdd=
_15_percent]
> > +=C2=A0=C2=A0=C2=A0 default: 0
>=20
> Default is an integer yet the type is a string?

Argh, another leftover from v1. Thanks for catching it... Will change it in=
 v3.

- Nuno S=C3=A1
>=20
