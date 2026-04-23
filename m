Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D62730EF94
	for <linux-hwmon@vger.kernel.org>; Thu, 23 Apr 2026 19:35:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776972916; cv=none; b=gbj/AhrNG4FmSXNSV0YJU02N3q22d29iTbTcy9X5lTTZml5UiBsdGurGewG1mLxw3O/6aA3XKMUDRyQFWWuDarV4eD5nZyvS3MfepIkn5jyxAFnP+SS8gbk4ppcdrydvXrOWmuKGP3/aTmF6pcTAyV2segsuidfex5xloFRu7HY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776972916; c=relaxed/simple;
	bh=FJrXtECOFxbDgWmYjAtGZoJysQ0ElhhOE9O8hxLfMvk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HC26Q14bjUY94rCvokArLZ4SFcKYVEx16LoM38SBHeRdlauSOQbb/taAs21HBxhwO5AaKHoqkTesgCPrzNrNpkL6FlrA2k5YFm8FUAg45oNaA207CTyS/thf1ywAuAVZJLbLO2CfrNAKCvzbPg+ke8SMUFm55/PD4taNRhJfsKE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=hxZXYciE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="hxZXYciE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE3E6C2BCAF;
	Thu, 23 Apr 2026 19:35:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776972916;
	bh=FJrXtECOFxbDgWmYjAtGZoJysQ0ElhhOE9O8hxLfMvk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=hxZXYciEDiyMy6xHGgJ9yhXyLed4+3ey6aJeo4YFQssV3MJwSjpFVfxjWtOHVnJPY
	 EfLnRyn/dU1WW2C+c4Y5WnyaQWY6mj6UTV5LcKbD5M7vf7SnFcCqLrKkZt4oGiNemW
	 N5vGe8NFPoxrpvvst7Vat14CMVTM71dQm6qvXqtBzYQsBDQVWxRS4bUECaLkKkQzrI
	 FYhBZMtZPhfXcAMQRIz2FtZlAy+FPoVa8jzNDIOUKJmeUVNY/ij/L4lh8avVFbKBOc
	 2qZOZIqsvarW5j81m6xScbfQmg7pGml+1at+cjnL6KlY1Wzptm5iOS5MaxqIveONal
	 Q3ZmJ2q1HbD9w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 02/13] ACPICA: Read LVR from the I2C resource
 descriptor
Reply-To: sashiko@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260423085718.70762-3-akhilrajeev@nvidia.com>
References: <20260423085718.70762-3-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Apr 2026 19:35:15 +0000
Message-Id: <20260423193515.EE3E6C2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Sashiko AI review found 1 potential issue(s):
- [Medium] The newly added `lvr` field in `struct acpi_resource_i2c_serialb=
us` is omitted from the resource dumping mechanism in `rsdumpinfo.c`.
--

commit 06f9727bd6ba574a252f3ac9267b0193a2f50dd1
Author: Akhil R <akhilrajeev@nvidia.com>

ACPICA: Read LVR from the I2C resource descriptor

This patch updates the ACPICA I2C serial bus descriptor handling to read
the legacy virtual register (lvr) data. It adds the lvr field to struct
acpi_resource_i2c_serialbus and updates the conversion info to map it.

Link: https://github.com/acpica/acpica/commit/70082dc8
Link: https://github.com/acpica/acpica/commit/b3c38dc9

> diff --git a/drivers/acpi/acpica/rsserial.c b/drivers/acpi/acpica/rsseria=
l.c
> index 279bfa27da94d..c06e918ab8895 100644
> --- a/drivers/acpi/acpica/rsserial.c
> +++ b/drivers/acpi/acpica/rsserial.c

[ ... ]

> diff --git a/include/acpi/acrestyp.h b/include/acpi/acrestyp.h
> index 842f932e2c2bc..38a19b1d19ace 100644
> --- a/include/acpi/acrestyp.h
> +++ b/include/acpi/acrestyp.h
> @@ -423,6 +423,7 @@ struct acpi_resource_i2c_serialbus {
>  	ACPI_RESOURCE_SERIAL_COMMON u8 access_mode;
>  	u16 slave_address;
>  	u32 connection_speed;
> +	u8 lvr;
>  };

Does this newly added lvr field also need to be included in the resource
dumping mechanism?

Looking at drivers/acpi/acpica/rsdumpinfo.c, acpi_rs_dump_i2c_serial_bus
lacks an entry for this new field:

struct acpi_rsdump_info acpi_rs_dump_i2c_serial_bus[14] =3D {
	{ACPI_RSD_TITLE, ACPI_RSD_TABLE_SIZE(acpi_rs_dump_i2c_serial_bus),
	 "I2C Serial Bus", NULL},
	ACPI_RS_DUMP_COMMON_SERIAL_BUS {ACPI_RSD_1BITFLAG,
					ACPI_RSD_OFFSET(i2c_serial_bus.
							access_mode),
					"AccessMode", acpi_gbl_am_decode},
	{ACPI_RSD_UINT32, ACPI_RSD_OFFSET(i2c_serial_bus.connection_speed),
	 "ConnectionSpeed", NULL},
	{ACPI_RSD_UINT16, ACPI_RSD_OFFSET(i2c_serial_bus.slave_address),
	 "SlaveAddress", NULL},
};

Without a corresponding ACPI_RSD_UINT8 entry here, will utilities like
acpidump or acpiexec ignore the lvr field when disassembling and printing
I2C Serial Bus Resource descriptors?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260423085718.7076=
2-1-akhilrajeev@nvidia.com?part=3D2
