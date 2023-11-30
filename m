Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Vv94PjPR"
Received: from mail-wr1-x42e.google.com (mail-wr1-x42e.google.com [IPv6:2a00:1450:4864:20::42e])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E95C81737;
	Thu, 30 Nov 2023 02:20:35 -0800 (PST)
Received: by mail-wr1-x42e.google.com with SMTP id ffacd0b85a97d-332e58d4219so446681f8f.0;
        Thu, 30 Nov 2023 02:20:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701339634; x=1701944434; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=+ENkTeWKgGbNcGzhVyIelDFWcUGoKs+6RWlRK8agZtQ=;
        b=Vv94PjPRXUbpMSqBx7pjlPLgquTkckhUCwqPohI5VuWWYvFWar0Y907cO2D1Ff3mBp
         KHLaWXzVmWlXmG68inmZcb8JPtX9mE51L8v5UQdZmRKC41p27QtuaLHVODlUHfnVGBAx
         +r4gxqm6vE4ERdTfNteJzFJU36+MFP2dqF/jMkpfHT8HXCTNYPGr+uIpB62Y+5aUyGYQ
         ZodduHF2oRswx1EGqiXPAYIVL6HLlVC3NVBhTtiGWajt5dzHf7YoUwqXGyZhDFUYH2j3
         qqCJ6xwiirXi3ek7QcqXw7CGxlyJDucl19D/j31RAiUyk58ccKE/AZbMWuNAVcXkFS/p
         AjNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701339634; x=1701944434;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=+ENkTeWKgGbNcGzhVyIelDFWcUGoKs+6RWlRK8agZtQ=;
        b=ZfeHTQrG7eakn7/dP/wa0iKtEgDqPOy88IhgsDi/iDVCfGatAbZIOM0UHNOIJSt9Zm
         DoUSkMvEYd1k5llgEWlsMer52rPN5EV9OWxCIf0epSmlwcnQKOapIANAlPLRxXjCDZJN
         BbTt88wybkQMcIueo5lQURIIpbvJEaq752NAl+UFPg9WTU6oIDE3hcE3O1qBvgYyS3Z5
         TOA3R/nvwmdaHnxvYiwBiWPd2whwp/PZN5XNWi7+ElNZMTaVqJcKJeHPSlS4iU+6vhQK
         R3DacKg9tKAKl9pbHgKyz2ffVSCiH1KeYwD6dHZjAaWYfqxODdij4VsKacXuVfqYu2Nj
         hMFw==
X-Gm-Message-State: AOJu0Yx0rHv8n5ipBL9NQMCcPEShs/ZH+pl87SRW7Ifdkoj8GuYfE6EN
	QZjmywk2jddIZvM0OtCPdxzEk0nNyxQRwEgf
X-Google-Smtp-Source: AGHT+IF4NXr04ovSdSepSgCurWmhN9L/62dYg5ABTXGLAIDsHR8tgu1dpG6Klbn/dSHhs9pxkVRkQQ==
X-Received: by 2002:a5d:4e10:0:b0:333:12be:f39c with SMTP id p16-20020a5d4e10000000b0033312bef39cmr4923663wrt.41.1701339634101;
        Thu, 30 Nov 2023 02:20:34 -0800 (PST)
Received: from ?IPv6:2001:a61:3456:4e01:6ae:b55a:bd1d:57fc? ([2001:a61:3456:4e01:6ae:b55a:bd1d:57fc])
        by smtp.gmail.com with ESMTPSA id y7-20020a5d6147000000b003330b55b941sm1117877wrt.77.2023.11.30.02.20.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 30 Nov 2023 02:20:33 -0800 (PST)
Message-ID: <971eb35068639ec404669ea5320c8183ea71a7d0.camel@gmail.com>
Subject: Re: [PATCH v2 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Linus Walleij <linus.walleij@linaro.org>
Cc: nuno.sa@analog.com, linux-hwmon@vger.kernel.org,
 devicetree@vger.kernel.org,  linux-doc@vger.kernel.org, Jean Delvare
 <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Bartosz Golaszewski <brgl@bgdev.pl>, Andy
 Shevchenko <andy@kernel.org>
Date: Thu, 30 Nov 2023 11:20:32 +0100
In-Reply-To: <CACRpkdZr6TdQCLy73Yx2RdMgQifd67remdxENBKYx3UvEMm87A@mail.gmail.com>
References: <20231124-ltc4282-support-v2-0-952bf926f83c@analog.com>
	 <20231124-ltc4282-support-v2-2-952bf926f83c@analog.com>
	 <CACRpkdaksfS4WLNQ6ohauAPq3z2LPG2uF37_jWtm0brQHaDtNw@mail.gmail.com>
	 <6384831c05b8ceeaf4a16cf9229770252989b762.camel@gmail.com>
	 <CACRpkdZr6TdQCLy73Yx2RdMgQifd67remdxENBKYx3UvEMm87A@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Wed, 2023-11-29 at 21:55 +0100, Linus Walleij wrote:
> On Wed, Nov 29, 2023 at 5:08=E2=80=AFPM Nuno S=C3=A1 <noname.nuno@gmail.c=
om> wrote:
>=20
> > Cool, I actually thought that having the direction + get/set stuff woul=
d be weird
> > given the fact that we can only PULL_LOW or HIGH_Z the pins.
>=20
> There are several drivers in the kernel that implement .set_config(),
> it's existing and should be enabled if it has uses.
>=20

Yeah, it might make sense to support it specially for the input case. AFAIC=
T, if I
use the .set_config() (but from a quick look I think we will need to add su=
pport for
it in gpiolib for the high-z configuration), then I can't use the gpio_regm=
ap stuff.
As the driver stands I don't think I could do it anyways because setting gp=
io2-3 and
alert requires to write 0 on the register rather than 1. But again, I'm sti=
ll very
suspicious about the whole thing. The datasheet states:

"GPIO1-GPIO3 and ALERT all have comparators monitoring
the voltage on these pins with a threshold of 1.28V even when
the pins are configured as outputs."

But we can't really set the direction for gpio2-3 and the alert pins (only =
getting
the level and setting it as PULL_LOW or HIGH_Z. gpio1 is the only one where=
 we can
configure it as input or open drain ouput. Bah, I'll try to see if someone =
internally
can shed some light on this.
=20
> As Andy points out: when the driver reaches a certain complexity,
> such as a huge table of muxable pins (that need to be configured to
> a certain muxing from device tree), and numerous complicated
> pin config options (also needing to be set up from device tree),
> it may be worth to implement a separate pin control driver that
> act as "backend" for the GPIO driver.
>=20
> I think a separate pin control driver would be overkill in this case,
> it's a PWM driver with some smallish GPIO portions AFAICT,
> but you get to decide.
>=20

Agreed, the chip only supports 4 pins and it is an optional feature. The ma=
in usage
for the chip iis to act as an hot swap controller (which maps into hwmon).

- Nuno S=C3=A1


