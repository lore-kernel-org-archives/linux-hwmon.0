Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9CC6B242D86
	for <linux-hwmon@vger.kernel.org>; Fri, 12 Dec 2025 16:55:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765558511; cv=none; b=kUex7pezSy53rsTiIRtLNjCBTuYp9u9oLypuI/bCyu2SOkafn57XlHW85Sorop9aPPkv8yCksdKIY0UsWGXArvjJDej04hMWLsGXaOz9/CTtLDdKaEskaX0a40lll5Ld/zyfTn/d3x0XR533bgYsIHa5y7/YRFAdhlcenVp8w0I=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765558511; c=relaxed/simple;
	bh=ZSdEYNBQZmpD2tooK1Re5wdlIsvwhaGcrS9FBRtGE/8=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=V7GAfyN/oxQF1/sg70o+prQLcXrTXoaAwJa7LjSWNc07XRC1VRtmoHPCCKsEq2aYoWkScSdKRQc42o+KnmIjKEcCMuK4sZW6vMkd921rvkfhGMProwutbtk+cavc/bX5lgsd80kDpulYKiQr8OjhHDV5kVRpd44flWFG4rssMsA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=QWbX+/F4; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="QWbX+/F4"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4775ae77516so16256205e9.1
        for <linux-hwmon@vger.kernel.org>; Fri, 12 Dec 2025 08:55:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765558508; x=1766163308; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=ZSdEYNBQZmpD2tooK1Re5wdlIsvwhaGcrS9FBRtGE/8=;
        b=QWbX+/F4E2QZje7nQG4bOnogQiugfBB3gK++Zz/i5pyXvG5DyC0eOnEoGJMZIfQaHZ
         te4H9jln5PMWu3voqRdhcpXcdGSleQpQHu3TXbxZXRfosHU1REfVTx0o7ejJa0c82W7B
         ycubrkCIHV9agtbSeMkLfNyJuhv3827WXAIVQ4BTjxmKafkMmc26nxKi3yntI49wwR61
         3DBPQRT2mBPF6DCRsdg00IGgt65NRgODO36x9Qe2gAncaOrxgrm+XapP+81j8Sl78417
         bjkfcVSTsq1U6702JkZomm8xz7LLMkDYV3xvUZj3EPPmVmt/Q1/9H8Dq+yPF5K44E9Ml
         qyZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765558508; x=1766163308;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZSdEYNBQZmpD2tooK1Re5wdlIsvwhaGcrS9FBRtGE/8=;
        b=F7CxZiiBggnRi6S09Jh5Zw1L8cSM1m4u6LvDb8SuYpc3tFAe6kEirBAhimJXJB90Nq
         HDRH/3IvDEeMJK5Rp9L7g/HMz1DUUKetp4Syp18J0Hl9nKf0s022JYWgUvyyPHjbY6cG
         TDgSN3ZZdVmNFDYk5ZULo8ej96q6izsO5GyB2h8wIOcDsVD0GbldMNhAmD9eqTSBAzIO
         HNvzQUv1ZQyewLyyUVQBaWPBE3KD8T5GOrblq7K3SWHSLveOW3k48GXdqe2ubYMfZgoF
         JJ0qbLF8fOnjsQ/7Mao7MuJAtVLZTm6aQvwIs2A152sqIXit1VaPeEB4gMZFcoaOaC9W
         dwUA==
X-Forwarded-Encrypted: i=1; AJvYcCXIN6AF4ueN685sHDkYE/p/VAvlSziXDq7R9Y88qRUbCoW9CGDPAtsPi5eGpqW5i7hnm1IS7Y2ouFxMIw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw0Ktpmakpk1qs0c3OoWEsWbESLTgKtNnEWAh6R9kTo8SIdQVz7
	klIlaXxD3X2AM9oHRTKiVlWhcKSaOSaFTSsgXluBb3+BaP2PN0QKFg3W
X-Gm-Gg: AY/fxX7s9Un/kWMyGhpBMYPtTM6a2Bry9PKgjitOc5LcbCfuD0243jrGSv9742fqqIS
	h876KRzzpJfIV2wwVJXDaiYUxwKVHkudcT+4PiMN421xgmvvUk//JTWOybZELSSlSMlSct+9Czy
	DfNrlhGHRAJh2Qet7MDjPoAp2hTEgoheEojnjeX+qXipPvUeZ2cN9q1Hk8p3TPuIL3Tg9+SlXTL
	EFgnosU+B58FPIut8cpGbtsccHY0siKDE7iIlicek6Gy27OEj26WLYBwkKqq7h7Pqi77xVwwEaU
	PxteoZLEhdy+OrVK0tll38y0WPWNB5CyufTKKgIb1gvo41AQE1QO4ZvStA8s3w1x7+w2fyenaOM
	c6bzmyDFCEDan4BRBB6+XTRvS87SVabA3CbKTlqa/3UG2NzcqnLaFKIvR1ttkDkScwzMYt4MiDw
	6jbhjrhU0J+93WZ0V6yEs=
X-Google-Smtp-Source: AGHT+IG2FHJPf4h+6NnUN/J0xatATINNGdkgXy2Mr82izBMwFzE+zbujDdnvd6sCuR4Ij6NDN+G5Bw==
X-Received: by 2002:a05:6000:2dca:b0:42f:b1c2:c35d with SMTP id ffacd0b85a97d-42fb48e460dmr3260075f8f.50.1765558507843;
        Fri, 12 Dec 2025 08:55:07 -0800 (PST)
Received: from [192.168.1.187] ([161.230.67.253])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42fb0fc8d5fsm5630678f8f.2.2025.12.12.08.55.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 12 Dec 2025 08:55:07 -0800 (PST)
Message-ID: <f530e0c818048bb3ce5c3505a35c1ef99acdf9f1.camel@gmail.com>
Subject: Re: [PATCH v4 2/3] hwmon: ltc4283: Add support for the LTC4283 Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, nuno.sa@analog.com, 
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Jean Delvare <jdelvare@suse.com>, Jonathan Corbet
 <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,  Bartosz
 Golaszewski	 <brgl@bgdev.pl>
Date: Fri, 12 Dec 2025 16:55:48 +0000
In-Reply-To: <ee7b7dcf-7756-4ffc-8a2c-e2cf33aac725@roeck-us.net>
References: <20251204-ltc4283-support-v4-0-db0197fd7984@analog.com>
	 <20251204-ltc4283-support-v4-2-db0197fd7984@analog.com>
	 <144d50f7-398c-4b10-bd21-a6d0c6c7b4c8@roeck-us.net>
	 <67209860ae2ff5626b7eaa50f2dd4b496eaa06d3.camel@gmail.com>
	 <ee7b7dcf-7756-4ffc-8a2c-e2cf33aac725@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Fri, 2025-12-12 at 08:46 -0800, Guenter Roeck wrote:
> On 12/12/25 08:34, Nuno S=C3=A1 wrote:
> > On Sat, 2025-12-06 at 10:40 -0800, Guenter Roeck wrote:
> > > On 12/4/25 08:15, Nuno S=C3=A1 via B4 Relay wrote:
> > > > From: Nuno S=C3=A1 <nuno.sa@analog.com>
> > > >=20
> > > > Support the LTC4283 How Swap Controller. The device features progra=
mmable
> > > > current limit with foldback and independently adjustable inrush cur=
rent to
> > > > optimize the MOSFET safe operating area (SOA). The SOA timer limits=
 MOSFET
> > > > temperature rise for reliable protection against overstresses.
> > > >=20
> > > > An I2C interface and onboard ADC allow monitoring of board current,
> > > > voltage, power, energy, and fault status.
> > > >=20
> > > > Signed-off-by: Nuno S=C3=A1 <nuno.sa@analog.com>
> > >=20
> > > I finally found the time to write module test code for the driver.
> > >=20
> >=20
> > Thanks!
> >=20
> > > Some early feedback:
> > >=20
> > > - The driver must work with non-devicetree systems and without device
> > > =C2=A0=C2=A0=C2=A0 property support. Select defaults where necessary.
> >=20
> > I'll double check that... But one thing that already comes to mind is r=
sense? Rsense
>=20
> Yes.
>=20
> > is the main design choice for a thing like this. Not sure we can decide=
 on a meaningful
> > default for it? I believe we have the same situation for ltc4282.c
> >=20
>=20
> Agreed, but that doesn't make it better (and I don't have a unit test for=
 that chip).
> Default would be your call. I usually go for 1 mOhm.
>=20
> If you have access to it, can you send me a register dump for LTC4282 ?

I'm doing home office these days and I'm not sure I brought that chip with =
me. If I have
it, I'll do it!

>=20
> > > - Attributes marked as readable in the is_visible function must be re=
adable.
> > > =C2=A0=C2=A0=C2=A0 It is not acceptable to return -EOPNOTSUPP. That a=
pplies to all
> > > =C2=A0=C2=A0=C2=A0 reset_history attributes and maybe to others.
> >=20
> > Hmm that's a mistake. They should be WO and I have the same bug in ltc4=
282 so I need to
> > send a patch.
> >=20
>=20
> ... which helps explain why I want to be able to run unit tests (which re=
quires defaults).
>=20

Makes sense. But from a dt bindings point of view, I assume we should still=
 keep it as a
mandatory property?

- Nuno S=C3=A1

