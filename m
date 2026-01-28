Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DDF042309B2
	for <linux-hwmon@vger.kernel.org>; Wed, 28 Jan 2026 09:43:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769593403; cv=none; b=eW7yjlFkgy8Zo8IMDJh/f1xilANady62nBO7ww6yqzcj4GTxBtCIi1xJXfMF8NwqkreunzRJ0NZtZOcAfTyn3B35fwb6pwIUGucmi2GsERIDAAUOKRpd7gklnfUyqkvZafUhjbWmQdS5lyZIDoy5TL+uGs4XQY+QBso5LEXkwWk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769593403; c=relaxed/simple;
	bh=nMrCEc2j5DclRR0VL3fs98R4zeyzXJH4AdEhgbDC6pY=;
	h=Message-ID:Subject:From:To:Cc:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=Wlyx+Vx7CklYkTzRhSlNMfQgyU174bTdwR7K6P9C5ZjYBlhkGXcRPJA/9bQpPMMLN6pXnQgEmzlSqgbSpWa031iJrjkn03fBoonEVwP3qBu8x3iviaH0qzmh7mPmIOxwobUzNvG22nwAzYciqHDQNEjAW/7t8hERFMX79Uo6www=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=jADakhnf; arc=none smtp.client-ip=209.85.221.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="jADakhnf"
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-42fed090e5fso4113858f8f.1
        for <linux-hwmon@vger.kernel.org>; Wed, 28 Jan 2026 01:43:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769593400; x=1770198200; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nMrCEc2j5DclRR0VL3fs98R4zeyzXJH4AdEhgbDC6pY=;
        b=jADakhnfc0qcVxohGd46xY/Hp3hxsOp+AMTPJdcbVZTEzMusz072E4fkW/elIVKuE8
         HyhslAvF0zxzucX3+ZvLd0sVZCKtHhKvSG5qlx41BiKtLEALZ4pR6e8YFAUEKxm/3B/s
         dj2MVfJeKwoYo3vGr45VJBmpcCB6W/fPkYD54Wup2hMNJ7RTq7px2pfBfwqJfgp/JE3W
         g/HAQETM4oxzKC7xyqHB3HJCHERYfQwZFb6diKni+rS98BF9ZUswwq7Mwj1lKYxo3dIb
         H9GyzTaLjeyLa5/+LNQozO1Q44xOlB1/R3kxTNvJwHZZs8tiQHOgn1JmAdPWUFeGKe3Q
         4hLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769593400; x=1770198200;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nMrCEc2j5DclRR0VL3fs98R4zeyzXJH4AdEhgbDC6pY=;
        b=NyMCcER32IVepM0h4xmhIUltlJISZl/XygO365SXYsoM9c8fW36i0/nc6s3fK62Qc2
         Y1sIQJ3mn7NLljjYB9VF9kvFy8GEGMTlBatiQ+5FdbxzQCA8sqcm9Re0nNPg4DT53KTK
         71e4vYHPJGm+JxXC76W0pOxypyPfUa1Fous+2QEKJ8DgrPKz9I8GhTZNl+jj+QHgiJ32
         5cBRQLmY+s+Cy5Xa6aszMA9n1QY0QuzJfk1ZZVw3+W3FQvCV7oIJFVVau1z1MgM522Ez
         u52q6KNYHB2pdJjJ7Myf1IQiyAroD4d1Ej+hH5cJtvfjPDZ3UrRb8TKlMzKGgwnm6l5s
         ifcQ==
X-Forwarded-Encrypted: i=1; AJvYcCUS252PLQHAh1iqo/wfackbGeX/uRDwbBPFnhA5+dOSoK6uk1js0P29gSjEH+Y+Ng/tz+jQ3XiJfz4Uug==@vger.kernel.org
X-Gm-Message-State: AOJu0YyV5PbuQ7sN8WrdJEu3YLRQd8FA2kzxpk9CubzpepLLuwtZ8Crz
	ESWM84ksT/vt8+MBImAoKQeR6wl6tNPK/FIN6st0pGYF7aZaZVQ/qniH
X-Gm-Gg: AZuq6aIkht8jqHsDqo/7wOrE5aoha/j7rbWBG3CfsTa0TmRQcKp+kcaxHW+VDkCl0Hq
	yYaea+o32B0FXP9xtCOQFCXvyuk5YKIwu/szKmFR1qIqrPuYv95m+e6mdDFFoHs6A3Xos8/cPUh
	IyFQcioT4SgamUg1StXRgqvUIL/C8JFQGnhimEVSqrX3LEFtlte5gwho/No8A7m6R2SWmXTbLPH
	UeB9INa5DOGOx8QRANxieG/cNYcq5xfLISWRI27cxWSN/OflGQw//4kM+Qkv/nlEW5lvfLQiPDu
	DrlKBXtOY/feQ64mVet5JDdp2KQkUIltAqAkgeuGZy80Ic2dgyfm68Fzq/2NJlgnEDTic1KYDb8
	YLtbUwixwVeVsu8g9MYmzBKU57XhZGyLJASKcivGajKmgH+6T4SulTeRkMbGc7Xp2ZZDIL6TzAq
	8K3nzSI8wrz8n7hbBotzc=
X-Received: by 2002:a05:6000:2084:b0:435:8d02:b9cd with SMTP id ffacd0b85a97d-435dd05f1c5mr7512803f8f.26.1769593400162;
        Wed, 28 Jan 2026 01:43:20 -0800 (PST)
Received: from [192.168.1.187] ([148.63.225.166])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-435e1048a54sm5346836f8f.0.2026.01.28.01.43.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 01:43:19 -0800 (PST)
Message-ID: <382e259ea3835ffbd2be9c36b529875f5a43f38b.camel@gmail.com>
Subject: Re: [PATCH v5 0/3] hwmon: Add support for the LTC4283 Hot Swap
 Controller
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, nuno.sa@analog.com, 
	linux-hwmon@vger.kernel.org, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-doc@vger.kernel.org
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>,  Jean Delvare <jdelvare@suse.com>, Jonathan Corbet
 <corbet@lwn.net>, Linus Walleij <linus.walleij@linaro.org>,  Bartosz
 Golaszewski	 <brgl@bgdev.pl>, "Rob Herring (Arm)" <robh@kernel.org>, Linus
 Walleij	 <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>
Date: Wed, 28 Jan 2026 09:44:03 +0000
In-Reply-To: <eed64bf1-93af-4b36-adf5-1476cb40edbb@roeck-us.net>
References: <20251223-ltc4283-support-v5-0-1152bff59a61@analog.com>
	 <eed64bf1-93af-4b36-adf5-1476cb40edbb@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.58.2 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

Hi Guenter,

On Tue, 2026-01-27 at 09:39 -0800, Guenter Roeck wrote:
> Hi Nuno,
>=20
> On 12/23/25 04:21, Nuno S=C3=A1 via B4 Relay wrote:
> > This is v3 for the LTC4283 how swap controller. Main change is that I'm
> > now using the auxiliary bus for adding the GPIO device (done depending
> > on FW properties).
> >=20
> > Similar to the LTC4282 device, we're clearing some fault logs in the
> > reset_history attributes.
> >=20
>=20
> I ran the patch series through an AI review. Results are below.
> Please take a look.
>=20
> Thanks,
> Guenter
>=20
> ---
> # Deep Dive Regression Analysis Log
> Date: 2026-01-27
>=20
> ## Commit 5998c620fbd8: gpio: gpio-ltc4283: Add support for the LTC4283 S=
wap Controller
>=20
> **Context**:
> - Adds a new GPIO driver `drivers/gpio/gpio-ltc4283.c`.
> - Depends on `drivers/hwmon/ltc4283.c` for regmap and MFD instantiation.
>=20
> **Findings**:
> 1.=C2=A0 **Typo/Naming Issue**:
> =C2=A0=C2=A0=C2=A0=C2=A0 - File `drivers/gpio/gpio-ltc4283.c` uses `LTC42=
823_ADIO_CONFIG` definition.
> =C2=A0=C2=A0=C2=A0=C2=A0 - `LTC42823` appears to be a typo for `LTC4283`.
> =C2=A0=C2=A0=C2=A0=C2=A0 - `drivers/gpio/gpio-ltc4283.c:26`: `#define LTC=
42823_ADIO_CONFIG 0x12`
>=20
> 2.=C2=A0 **Logic Verification**:
> =C2=A0=C2=A0=C2=A0=C2=A0 - GPIO direction and value setting logic appears=
 consistent with bitmasks provided, assuming
> register `0x12` and `0x11` layout is correct as inferred.
>=20
> 3.=C2=A0 **Regressions**:
> =C2=A0=C2=A0=C2=A0=C2=A0 - No critical functional regressions found in th=
is commit alone.
> =C2=A0=C2=A0=C2=A0=C2=A0 - Code quality: Typo in macro name.
>=20
> ## Commit 82433332ce16: hwmon: ltc4283: Add support for the LTC4283 Swap =
Controller
>=20
> **Context**:
> - Adds core HWMON driver `drivers/hwmon/ltc4283.c`.
> - Handles I2C communication, regmap initialization, and MFD child creatio=
n.
>=20
> **Findings**:
> 1.=C2=A0 **Critical Regression: DebugFS Use-After-Free**:
> =C2=A0=C2=A0=C2=A0=C2=A0 - `ltc4283_probe` calls `ltc4283_debugfs_init`.
> =C2=A0=C2=A0=C2=A0=C2=A0 - `ltc4283_debugfs_init` calls `debugfs_create_f=
ile_unsafe` creating files associated with
> `st`.
> =C2=A0=C2=A0=C2=A0=C2=A0 - `st` is allocated with `devm_kzalloc`.
> =C2=A0=C2=A0=C2=A0=C2=A0 - **Issue**: There is no explicit cleanup of deb=
ugfs entries (e.g.,
> `debugfs_remove_recursive`) and no `devm_add_action` to handle it.
> =C2=A0=C2=A0=C2=A0=C2=A0 - **Consequence**: When the driver is unbound/un=
loaded, `st` is freed by devm. The debugfs
> entries remain. Accessing them triggers a Use-After-Free on `st`.
> =C2=A0=C2=A0=C2=A0=C2=A0 - **Fix Required**: Use `devm_add_action_or_rese=
t` to remove debugfs directory/entries on
> driver detach.

So actually a nice deduction from the agent but not accurate given that all=
 the entries should be
removed in [1]. If you want it to be explicit, I can add the action but giv=
en that the dentry is
given by i2c, I would argue it's fair to assume i2c will take care of the r=
emoval. Thoughts?

I'm also planning to pick this up again but was caught by something else. S=
o hopefully next week.=C2=A0

On another topic, I also (you questioned it in another thread) looked aroun=
d and I do have a ltc4282
board with me. Given that I just need to power up the digital parts to acce=
ss the i2c bus, it should
be pretty straight to get a register dump. So if you're still interested on=
 that, I should be able
to do it.

[1]: https://elixir.bootlin.com/linux/v6.19-rc5/source/drivers/i2c/i2c-core=
-base.c#L634

- Nuno S=C3=A1
>=20
