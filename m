Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F0CDE3BF676
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Apr 2026 11:07:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775732863; cv=none; b=GWgbi/Z+O5ao03A5PJyimOg63jYYOgxin0BDcXNb9B4blqcN4RF2UwIAAzmS9PKYId+G4tFIgWJYJsVCcNWh21AB8cUw0ZCbNsZYF/zYkHRvt6ovx85YUjD3QYYf13rcSSqd3Azu5QRhYDoMqcRkivn3F5Pq6/XDMrkqz9yBf+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775732863; c=relaxed/simple;
	bh=AwjrzL0fh5CEgp6ILuxORU62HOKwb9P8MF8D4O9oX30=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=A+9Q9GN/8LWnxF5GfstNXGfHga//U0WSQxixPRa9nMA0RHEjqX00o0BVBK7yQdCeJNnz2aeRQxpf9sHkxu+Utz1bzRS9MXuaPSgkRY8jxQhI69sb9lo3vEpih1SxUM0qSnoHykisTbZe6ANTFTzep2XBChMjrX4wmN6ygi83AAI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Vk2WBH75; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Vk2WBH75"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2D2BC2BCB5
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Apr 2026 11:07:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775732862;
	bh=AwjrzL0fh5CEgp6ILuxORU62HOKwb9P8MF8D4O9oX30=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=Vk2WBH75rBQxC/rySOUlJ3r+B9mC0vIwFek0r48g+ZonAR2VWYz0pq0yMr+d90VmJ
	 DyRzj9M4KrHDy+BXKa8sunve22IKi3mmHD96UFn6+dF+8GY516m+b6mvg428nMeAZv
	 buoUeWkjxPPxcPmeBWXzkbfH93htPNsqzEFeaPVzYSNiVHL9ffrK5VCiu0797B2w7G
	 UgBut3mqOU45kl96CXw0bO1Erx851OhBk7WQPPBDL8B0KFnUeCyJ2snIe7jCBYMVe4
	 byEsxj+bOGTmnwY6rLP8m5Oi+6/CiSFYCEGWaYjR3vfDGiO/p9dgfBe3usBgKMito9
	 uqBck0c5AtKnw==
Received: by mail-oi1-f170.google.com with SMTP id 5614622812f47-47018d341f8so545634b6e.3
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Apr 2026 04:07:42 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXXfA2irrFhrylxmjgP4obGbaMesI67nSFdO7HLEPEprZQGmMN+hGtmedWmrtlqNi+EguqaSoQI3mkTfw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yx9rzR1oYM1FMms2QmCXI47hmIUigoYQPNSJYAxtjuZGT1SCebH
	0KpB0pZHfe1g+gg3e09Rt5uRweZg9N4XkLAhdWZIy0AhRRaFlEvrPLN0Bg9LliwBvxnL02yamCm
	nPIbQgHCRrJxensY7gvG4Z3zrW1KA1dY=
X-Received: by 2002:a05:6808:c2a1:b0:467:70eb:36ae with SMTP id
 5614622812f47-46efb1cf097mr12520225b6e.29.1775732861791; Thu, 09 Apr 2026
 04:07:41 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260409105747.48158-1-akhilrajeev@nvidia.com> <20260409105747.48158-3-akhilrajeev@nvidia.com>
In-Reply-To: <20260409105747.48158-3-akhilrajeev@nvidia.com>
From: "Rafael J. Wysocki" <rafael@kernel.org>
Date: Thu, 9 Apr 2026 13:07:30 +0200
X-Gmail-Original-Message-ID: <CAJZ5v0g1-gyReMo4AvtBfth2bDhxJdr+o8rTozJJ0q28RTDGMw@mail.gmail.com>
X-Gm-Features: AQROBzDNvyu9QpULO0jlYjq4hyvVVIYN8TZ7GG9yU-t4nZ37LiVlTgpbMoONhDY
Message-ID: <CAJZ5v0g1-gyReMo4AvtBfth2bDhxJdr+o8rTozJJ0q28RTDGMw@mail.gmail.com>
Subject: Re: [PATCH v2 02/13] ACPICA: Read LVR from the I2C resource descriptor
To: Akhil R <akhilrajeev@nvidia.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, Frank Li <Frank.Li@nxp.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Rafael J . Wysocki" <rafael@kernel.org>, Robert Moore <robert.moore@intel.com>, Len Brown <lenb@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Eric Biggers <ebiggers@kernel.org>, Sakari Ailus <sakari.ailus@linux.intel.com>, 
	Wolfram Sang <wsa+renesas@sang-engineering.com>, 
	Miquel Raynal <miquel.raynal@bootlin.com>, linux-i3c@lists.infradead.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-acpi@vger.kernel.org, acpica-devel@lists.linux.dev, 
	linux-hwmon@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Apr 9, 2026 at 12:59=E2=80=AFPM Akhil R <akhilrajeev@nvidia.com> wr=
ote:
>
> ACPI 6.3 specifies byte 8 of I2C Serial Bus Connection descriptor to be
> used for Legacy Virtual Register (LVR) data as specified in the MIPI
> I3C Specification for an I2C device connected to an I3C Host Controller.
> LVR will be read by I3C host controller drivers and it provides details
> about the specific speed and 50ns spike filter capabilities of I2C
> devices.
>
> Update the rsconvert_info to include this field. For I2C devices on an
> I2C bus, this field is Reserved and unused.
>
> This commit is the result of squashing the following:
> ACPICA commit 70082dc8fc847673ac7f4bbb1541776730f0b63e
> ACPICA commit e62e74baf7e08cf059ec82049aeccd565b24d661
> ACPICA commit c404118235108012cad396c834b5aabe2dd1b51a
> ACPICA commit 7650d4a889ea7907060bfce89f4f780ce83e7b28
> ACPICA commit 014fa9f2dbcc6b1bd42a4a4a6f6705d9cf7d460b
>
> Link: https://github.com/acpica/acpica/commit/70082dc8
> Link: https://github.com/acpica/acpica/commit/b3c38dc9
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Acked-by: Rafael J. Wysocki (Intel) <rafael@kernel.org> # ACPI

> ---
>  drivers/acpi/acpica/rsserial.c | 6 +++++-
>  include/acpi/acrestyp.h        | 1 +
>  2 files changed, 6 insertions(+), 1 deletion(-)
>
> diff --git a/drivers/acpi/acpica/rsserial.c b/drivers/acpi/acpica/rsseria=
l.c
> index 279bfa27da94..c06e918ab889 100644
> --- a/drivers/acpi/acpica/rsserial.c
> +++ b/drivers/acpi/acpica/rsserial.c
> @@ -315,7 +315,7 @@ struct acpi_rsconvert_info acpi_rs_convert_csi2_seria=
l_bus[14] =3D {
>   *
>   ***********************************************************************=
*******/
>
> -struct acpi_rsconvert_info acpi_rs_convert_i2c_serial_bus[17] =3D {
> +struct acpi_rsconvert_info acpi_rs_convert_i2c_serial_bus[18] =3D {
>         {ACPI_RSC_INITGET, ACPI_RESOURCE_TYPE_SERIAL_BUS,
>          ACPI_RS_SIZE(struct acpi_resource_i2c_serialbus),
>          ACPI_RSC_TABLE_SIZE(acpi_rs_convert_i2c_serial_bus)},
> @@ -391,6 +391,10 @@ struct acpi_rsconvert_info acpi_rs_convert_i2c_seria=
l_bus[17] =3D {
>          AML_OFFSET(i2c_serial_bus.type_specific_flags),
>          0},
>
> +       {ACPI_RSC_MOVE8, ACPI_RS_OFFSET(data.i2c_serial_bus.lvr),
> +        AML_OFFSET(i2c_serial_bus.type_specific_flags) + 1,
> +        1},
> +
>         {ACPI_RSC_MOVE32, ACPI_RS_OFFSET(data.i2c_serial_bus.connection_s=
peed),
>          AML_OFFSET(i2c_serial_bus.connection_speed),
>          1},
> diff --git a/include/acpi/acrestyp.h b/include/acpi/acrestyp.h
> index 842f932e2c2b..38a19b1d19ac 100644
> --- a/include/acpi/acrestyp.h
> +++ b/include/acpi/acrestyp.h
> @@ -423,6 +423,7 @@ struct acpi_resource_i2c_serialbus {
>         ACPI_RESOURCE_SERIAL_COMMON u8 access_mode;
>         u16 slave_address;
>         u32 connection_speed;
> +       u8 lvr;
>  };
>
>  /* Values for access_mode field above */
> --
> 2.50.1
>
>
