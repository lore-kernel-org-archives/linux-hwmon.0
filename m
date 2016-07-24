Return-path: <hotran@apm.com>
Content-Type: text/plain;
	charset=us-ascii
Mime-Version: 1.0 (1.0)
Subject: Re: hwmon: xgene: Add support for X-Gene hwmon driver
From: Hoan Tran <hotran@apm.com>
In-Reply-To: <02814a96-c620-c4af-e278-40432f6f701f@riken.jp>
Date: Sat, 23 Jul 2016 20:00:52 -0700
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>,
 Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
 Jassi Brar <jassisinghbrar@gmail.com>,
 Ashwin Chaugule <ashwin.chaugule@linaro.org>, Duc Dang <dhdang@apm.com>,
 lho@apm.com, linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <9D204F6B-7C99-4543-87BF-4D9FC3F6475C@apm.com>
References: <02814a96-c620-c4af-e278-40432f6f701f@riken.jp>
To: Itaru Kitayama <itaru.kitayama@riken.jp>
List-ID: <linux-hwmon@vger.kernel.org>

Hi Itaru,


> On Jul 23, 2016, at 16:51, Itaru Kitayama <itaru.kitayama@riken.jp> wrote:=

>=20
> Hi Hoan,
>=20
> I've been testing your patch set on a Rev B0 system with ACPI, in dmesg
> I see:
>=20
> [    1.546444] xgene-slimpro-i2c APMC0D40:00: i2c mailbox channel request f=
ailed
> [    1.570062] xgene-slimpro-hwmon APMC0D29:00: no pcc-channel property
>=20
> what other packages or subsystems do we need to make this work on ACPI-bas=
ed systems?

You need the new firmware and BIOS which support ACPI PCC mailbox.

Thanks
Hoan

>=20
> Itaru
