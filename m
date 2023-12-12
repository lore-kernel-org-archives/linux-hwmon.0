Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="W5p32vTW"
Received: from mail-wr1-x434.google.com (mail-wr1-x434.google.com [IPv6:2a00:1450:4864:20::434])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0EC95109;
	Tue, 12 Dec 2023 05:49:59 -0800 (PST)
Received: by mail-wr1-x434.google.com with SMTP id ffacd0b85a97d-336210c34ebso2098926f8f.1;
        Tue, 12 Dec 2023 05:49:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702388997; x=1702993797; darn=vger.kernel.org;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:from:to:cc:subject
         :date:message-id:reply-to;
        bh=SKCoI3Z14PMDWcBeZWOED9ULYXLkoHexXMA063HaNhM=;
        b=W5p32vTWRBu7G7SyoHFwo2TH36h6bYjpZTTWZzTaMzwDybSljuhaaiSZ4VhXeMAcqM
         R9PrSKCMJQjrxbNEQ36zdBsAU1yKXstCu0gTdcws0lthqJLhkqZ0mIV3FwPI7ReH7XKh
         oD/HwjjZZ06zbiXhDhrhRChfTGM+Vx2h8yZ1FcD2hM2Cb7/JqhMo8GjNZP4x3DCRJkQY
         E5FsW3MDf7izyx5w5iOvsyn2RtJbduOf+CPJsFLLPdx5U8xNHGLLgbCU2Z64hS+j1A9g
         vg8CcHMDklYdVnBHq6wFsn9CLy+dFPb1eex/vHpWduIBoTpu4MTulpkniqjvbRlgHaes
         PT8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702388997; x=1702993797;
        h=mime-version:user-agent:content-transfer-encoding:references
         :in-reply-to:date:cc:to:from:subject:message-id:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SKCoI3Z14PMDWcBeZWOED9ULYXLkoHexXMA063HaNhM=;
        b=TygCvJRr9GxBt7j1WPwBUZC7qP5zF36M1x9nurpN9GdyBx0y70ZoGgoMCxVjuif29V
         YRQTcqgEuyyQdQePhMaYZGoQ8prgv9Ixl0yxH/BXCBhB7FvmS/004hh4EP+9IPQtOHqc
         f6fNRDd3WXNwLFVEOUgidbL4/dPeYWOpZ/p6UpSQ15c0ctWjJEiJM4fN4VVNNyHW7OJ0
         7C/p9uigIJeHg7ew8ht/APwJTZVqRNXfDn/vbme04X1Yag5IGVKwf/Sz4X5WDc6ckfNA
         fKIi4Xrx1hC7uni8cjwPRnnj+vRYztt4qwX1BJL9HJu80RwQZlnqy54GWOTvoEsGovmp
         ODmQ==
X-Gm-Message-State: AOJu0YymA7Ix2RTY2J8vCbk7RmxhRXSjCjjfkFEXt0cHmjq0rUYTcRb9
	naTf7gvO7B+OiMSgk7BiwFg=
X-Google-Smtp-Source: AGHT+IH/expu4WThuyDgGnB7BZ1cOvTWQKCjCxwbeZirIbU1Ye7mHzV9czSmswpa2qM2d8dm88q0Vw==
X-Received: by 2002:adf:ee43:0:b0:333:4156:2763 with SMTP id w3-20020adfee43000000b0033341562763mr2326920wro.140.1702388996912;
        Tue, 12 Dec 2023 05:49:56 -0800 (PST)
Received: from ?IPv6:2003:f6:ef1b:2000:944c:cbc7:1e1c:2c47? (p200300f6ef1b2000944ccbc71e1c2c47.dip0.t-ipconnect.de. [2003:f6:ef1b:2000:944c:cbc7:1e1c:2c47])
        by smtp.gmail.com with ESMTPSA id s12-20020adf978c000000b003333a0da243sm10994335wrb.81.2023.12.12.05.49.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Dec 2023 05:49:56 -0800 (PST)
Message-ID: <af8fa90004157fa6b464b5f74335d9cbfa667675.camel@gmail.com>
Subject: Re: [PATCH v3 2/2] hwmon: ltc4282: add support for the LTC4282 chip
From: Nuno =?ISO-8859-1?Q?S=E1?= <noname.nuno@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>, nuno.sa@analog.com
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-doc@vger.kernel.org, Jean Delvare <jdelvare@suse.com>, Rob Herring
 <robh+dt@kernel.org>, Krzysztof Kozlowski
 <krzysztof.kozlowski+dt@linaro.org>,  Conor Dooley <conor+dt@kernel.org>,
 Jonathan Corbet <corbet@lwn.net>
Date: Tue, 12 Dec 2023 14:53:00 +0100
In-Reply-To: <7a6a0517-47f8-47df-9e61-44adb60f6135@roeck-us.net>
References: <20231205-ltc4282-support-v3-0-e0877b281bc2@analog.com>
	 <20231205-ltc4282-support-v3-2-e0877b281bc2@analog.com>
	 <7a6a0517-47f8-47df-9e61-44adb60f6135@roeck-us.net>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.50.2 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Mon, 2023-12-11 at 07:41 -0800, Guenter Roeck wrote:
> On Tue, Dec 05, 2023 at 04:22:56PM +0100, Nuno Sa via B4 Relay wrote:
> > From: Nuno Sa <nuno.sa@analog.com>
> >=20
> > The LTC4282 hot swap controller allows a board to be safely inserted an=
d
> > removed from a live backplane. Using one or more external N-channel pas=
s
> > transistors, board supply voltage and inrush current are ramped up at a=
n
> > adjustable rate. An I2C interface and onboard ADC allows for monitoring
> > of board current, voltage, power, energy and fault status.
> >=20
> > Signed-off-by: Nuno Sa <nuno.sa@analog.com>
> > ---
> [ ... ]
>=20
> > +/* power1_fault */
> > +static SENSOR_DEVICE_ATTR_RO(power1_good, ltc4282_status,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 LTC4282_POWER_GOOD_MASK);
> > +/* FET faults */
> > +static SENSOR_DEVICE_ATTR_RO(fet_short_fault, ltc4282_status,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 LTC4282_FET_SHORT_MASK);
> > +static SENSOR_DEVICE_ATTR_RO(fet_bad_fault, ltc4282_status,
> > +			=C2=A0=C2=A0=C2=A0=C2=A0 LTC4282_FET_BAD_STATUS_MASK);
> > +/*
> > + * Fault log failures. These faults might be important in systems wher=
e
> > + * auto-retry is not enabled since they will cause the part to latch o=
ff
> > until
> > + * they are cleared. Typically that happens when the system admin is c=
lose
> > + * enough so he can check what happened and manually clear the faults.
> > Hence, we
> > + * provide an attribute to clear all fauls at once while still capable=
 of
> > + * checking individual faults in debugfs.
> > + */
> > +static SENSOR_DEVICE_ATTR_WO(fault_logs_reset, ltc4282_clear_faults, 0=
);
> > +
> > +static struct attribute *ltc4282_attrs[] =3D {
> > +	&sensor_dev_attr_energy1_input.dev_attr.attr,
> > +	&sensor_dev_attr_power1_good.dev_attr.attr,
> > +	&sensor_dev_attr_fet_bad_fault.dev_attr.attr,
> > +	&sensor_dev_attr_fet_short_fault.dev_attr.attr,
> > +	&sensor_dev_attr_fault_logs_reset.dev_attr.attr,
> > +	NULL
> > +};
> > +ATTRIBUTE_GROUPS(ltc4282);
> > +
>=20
> Ah, now I see what those are for. Please move all but energy1_input
> to debugfs, including clearing the faults.
>=20

I'll reply in the other thread. Just wanted to make it clear (not totally s=
ure
it is) that all of those attributes are status stuff and not fault logs. Al=
l of
the fault logs where moved to debugfs and I kept this one in here. If this =
was
already clear to you, sorry for the noise.

- Nuno S=C3=A1
>=20
>=20

