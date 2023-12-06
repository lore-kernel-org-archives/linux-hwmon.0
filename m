Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RzdVUKB6"
Received: from mail-wm1-x335.google.com (mail-wm1-x335.google.com [IPv6:2a00:1450:4864:20::335])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5BA93A1;
	Wed,  6 Dec 2023 00:38:14 -0800 (PST)
Received: by mail-wm1-x335.google.com with SMTP id 5b1f17b1804b1-40b595bf5d2so71104505e9.2;
        Wed, 06 Dec 2023 00:38:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701851892; x=1702456692; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=yzrIQSDj7iD4AI+Qk2SNNB2s4PzYTQjVrXFHRggcHZs=;
        b=RzdVUKB6N//Cg+ZRw9LghYrrfW3b/pLU90TYfztpGiqedE+afEQtStN9kaZU4bbUgB
         MsybQYvX+07iurF91BwB4DuDxhxxSQfs/M45ahvcExy0ZgFBRlQCdY2Yag4sJ2KgZsBA
         Ehhl+LFhCrbZ7oej3wg3o8G5xHW19lUF9p9KqcRpOifaQnQxACtyOUFa9ghZ5cxxejNf
         nSmQbL/Fz16zj8Cmjusk6loVlyprJxj6qY1HLMkCeYud2Sw1j91JTFMHfpN8L17qiVbv
         KsOItQinwEoQconwZePp64MUClIv17Y1JsfjZT20iBfTyGT5mVuk6I+avzn+dLGBL3Od
         l9ZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701851892; x=1702456692;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=yzrIQSDj7iD4AI+Qk2SNNB2s4PzYTQjVrXFHRggcHZs=;
        b=NGPqqXGI2qE/UWnchBS6yvVh5C6GyiD1dZBP+zT5SpymWR3hsH4brwjExPOeDBF8PU
         zaX1s3JVwgMQ4txY0PBvdq6ClyFtKGZsXD4c/LTwagW8sbx6cgLlx62BEYXc2aVw8nJR
         W/mRtJsBbymD7a1zNUkjxI0Vbw/aEXK6L7esYX9yO8SJzn3SP4K1OUPHr0i/D7QIa4Zp
         KkD343mDbVjUzopwnyBUXE/Eadk/V79T7AE792pb86bEhlF+6MZfNrSV9uMk4v5tavQH
         d2fI5DxQbk/GR9PUlKdi1RJg9Scm0laoBhh/D9HbfNpWMfPPi+sTibb8paKJI+MmlT6g
         BJhQ==
X-Gm-Message-State: AOJu0YzMHKraoS+DGUyPYR7DFgnSHaZcMe5e72hPFYMvqZh8g1dkQAfX
	NJ1cDbUpFDljQGY4JaWkwH8=
X-Google-Smtp-Source: AGHT+IEEWtaYdXId5WgPzy/X3b2sx2wX+90fgD1DmLE7l9dt5mgSeaJ+85PBr3yL7fJN/OaCr10Nfg==
X-Received: by 2002:a05:600c:91c:b0:40b:5e59:99c9 with SMTP id m28-20020a05600c091c00b0040b5e5999c9mr222346wmp.233.1701851892085;
        Wed, 06 Dec 2023 00:38:12 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id k26-20020adfb35a000000b003332faefd86sm14436262wrd.0.2023.12.06.00.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 06 Dec 2023 00:38:11 -0800 (PST)
Message-ID: <92aeaa124adf7e678f9ef1750b353fe9d11f8909.camel@gmail.com>
Subject: Re: [PATCH v3 1/2] dt-bindings: hwmon: Add LTC4282 bindings
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Conor Dooley <conor@kernel.org>, nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Guenter Roeck
 <linux@roeck-us.net>, Rob Herring <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>
Date: Wed, 06 Dec 2023 09:38:11 +0100
In-Reply-To: <20231205-cognitive-propose-aa71278f65ea@spud>
References: <20231205-ltc4282-support-v3-0-e0877b281bc2@analog.com>
	 <20231205-ltc4282-support-v3-1-e0877b281bc2@analog.com>
	 <20231205-cognitive-propose-aa71278f65ea@spud>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Tue, 2023-12-05 at 16:18 +0000, Conor Dooley wrote:
> On Tue, Dec 05, 2023 at 04:22:55PM +0100, Nuno Sa via B4 Relay wrote:
>=20
> > +=C2=A0 adi,overvoltage-dividers:
> > +=C2=A0=C2=A0=C2=A0 description: |
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Select which dividers to use for VDD Ov=
ervoltage detection. Note that
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 when the internal dividers are used the=
 threshold is referenced to VDD.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The percentages in the datasheet are mi=
sleading since the actual values
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to look for are in the "Absolute Maximu=
m Ratings" table in the
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Comparator Inputs" section. In there t=
here's a line for each of the 5%,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10% and 15% settings with the actual mi=
n, typical and max tolerances.
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/string
> > +=C2=A0=C2=A0=C2=A0 enum: [external, vdd_5_percent, vdd_10_percent, vdd=
_15_percent]
> > +
> > +=C2=A0 adi,undervoltage-dividers:
> > +=C2=A0=C2=A0=C2=A0 description: |
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 Select which dividers to use for VDD Ov=
ervoltage detection. Note that
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 when the internal dividers are used the=
 threshold is referenced to VDD.
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 The percentages in the datasheet are mi=
sleading since the actual values
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 to look for are in the "Absolute Maximu=
m Ratings" table in the
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Comparator Inputs" section. In there t=
here's a line for each of the 5%,
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 10% and 15% settings with the actual mi=
n, typical and max tolerances.
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/string
> > +=C2=A0=C2=A0=C2=A0 enum: [external, vdd_5_percent, vdd_10_percent, vdd=
_15_percent]
>=20
> > +=C2=A0 adi,gpio1-mode:
> > +=C2=A0=C2=A0=C2=A0 description: Defines the function of the Pin. It ca=
n indicate that power is
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 good (PULL the pin low when power is no=
t good) or that power is bad (Go
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 into high-z when power is not good).
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/string
> > +=C2=A0=C2=A0=C2=A0 enum: [power_bad, power_good]
> > +
> > +=C2=A0 adi,gpio2-mode:
> > +=C2=A0=C2=A0=C2=A0 description: Defines the function of the Pin. It ca=
n be set as the input for
> > +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the ADC or indicating that the MOSFET i=
s in stress (dissipating power).
> > +=C2=A0=C2=A0=C2=A0 $ref: /schemas/types.yaml#/definitions/string
> > +=C2=A0=C2=A0=C2=A0 enum: [adc_input, stress_fet]
>=20
> None of these properties have a default nor are required.
> What happens when they are omitted?
>=20

Yeah, they get the power on reset default values (or whatever is in eeprom =
but that's
not the typical usecase). I'll add a default for all these properties. Your=
 question
already made me realize something I need to fix for v4. For some reason, I =
thought
gpio3 was the default pin to be muxed into the ADC (and hence monitored by =
hwmon) but
I realized that gpio2 is the default one. Hence, I need a boolean property =
to allow
for users to mux gpio3 instead of gpio2.

- Nuno S=C3=A1


