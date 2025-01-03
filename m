Received: from mail-10696.protonmail.ch (mail-10696.protonmail.ch [79.135.106.96])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 52ABE1BF7FC
	for <linux-hwmon@vger.kernel.org>; Fri,  3 Jan 2025 20:36:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.96
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735936619; cv=none; b=DUfU8KjCyueiEGnxE5FQt396kC4Fw1XM4ujq0BQwqZAFRw9SOjEfuEvL24Gs0PtFkH8dDkysH6BwjT2tnIfZIMS6ZWjG2mEqS6/bbhW0cPpepaF8ywYcw9HCZg+16hYE/si6NQisxY/qJfJrvwq0RvDsMkXQM8sDFEb7lqsR2BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735936619; c=relaxed/simple;
	bh=NpMfUD3rbufTon0mpCjQXpP+tAC6YmCPba3xtU45yXA=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=COXWcsSMjeleE7izPJHZ2jhkZR5hbuqcy7DBKnQiPMmTqqbCxUSvTXKkigtSCEuKrigL0m1mTrqLg+8cq0Jxpj0nPBbvpoSsYLYVAgjCFOpq4TmKpg18WOLslm21XI1wHaJ3sTwFzUz1+UkqYI31Fu9/g5bZhDNnw3CkJ98wev8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me; spf=pass smtp.mailfrom=proton.me; dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b=gIFFQNaC; arc=none smtp.client-ip=79.135.106.96
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=proton.me
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=proton.me
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=proton.me header.i=@proton.me header.b="gIFFQNaC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
	s=protonmail; t=1735936609; x=1736195809;
	bh=9Aw/7Gr2gKA0GqU7eBi8Lfy6pUXCYLnb0C8w8ngBWGQ=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector:List-Unsubscribe:List-Unsubscribe-Post;
	b=gIFFQNaCsDthykPdORp0SGhQLbaxS/aDFwbZIaylpwIWH3Jjru9r7zzvtk11LjQdD
	 EqwxxV47nqTBkiGdmbGYko5N3zKON83tjbf8GgCt3ss4t0KHkHm24v5vCeDasUNGBL
	 tGG2veEo8g13TtG8KsX1gQAgaTx6B1lQFYwMHqD4AE66r/e+QMo9vQ3gkYafMCOkw1
	 5f19GnRhBCcueX7Ibjxn3TJt8LELTNzdAYXuo5hmV4QmYF6PPM069Erm4/Na0aIbcF
	 d/eoZst0+sj/0MpM4sp7JXPocTrU2rGSxoZCpJbTJK3dywlS+1DoZ7Tc3hg8Hw0Fby
	 YyDmEacAnYZVg==
Date: Fri, 03 Jan 2025 20:36:42 +0000
To: "linux-hwmon@vger.kernel.org" <linux-hwmon@vger.kernel.org>
From: John <therealgraysky@proton.me>
Cc: Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Subject: Re: [PATCH] hwmon: (nct6683) Add another customer ID for MSI
Message-ID: <osBkHg4_PFiGtQwiWQ34uHfcA4ayicZKiIOzI3D61mX9EsCfG1Phg5ew3chSSxlpPKU1n1l-n6wrxwyECWYxmKz2m3PFs0hhdiPu_OJgOZ4=@proton.me>
In-Reply-To: <J6wtEBUs2mxxQ-ukKB5Ql6WHZfim5gKZZ6wxrLXYirJd7vTPBdeNRslkl3EXf4ufG8SHdfrDz_gkuWkllDo3oRHZMG5ohbzCSHnzPlGyH-E=@proton.me>
References: <J6wtEBUs2mxxQ-ukKB5Ql6WHZfim5gKZZ6wxrLXYirJd7vTPBdeNRslkl3EXf4ufG8SHdfrDz_gkuWkllDo3oRHZMG5ohbzCSHnzPlGyH-E=@proton.me>
Feedback-ID: 47473199:user:proton
X-Pm-Message-ID: 39ee5caa05bb868b811b9945e13ff90f69d93264
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

I see now why that sensor gives a values of -40.  The board came with T_SEN=
1 which is an extra connector for use with a thermistor cable.  The driver =
is behaving as expected with the patch I submitted.

On Wednesday, January 1st, 2025 at 10:15 AM, John <therealgraysky@proton.me=
> wrote:

> This value was found on an MSI MPG X870E CARBON WIFI (MS-7E49) with an NC=
T6687D chip.
>=20
> I do not know why one of the sensors it reads gets reported at -40.0 howe=
ver. Calling sensors multiple times shows that -40.0 value seems to bounce =
around from "Thermistor 0" and "Chipset B."
>=20
> Feedback is appreciated.
>=20
> For reference, I attached a sample output of sensors for the new chip wit=
h this patch applied:
>=20
> nct6687-isa-0a20
> Adapter: ISA adapter
> VIN0: 1.01 V (min =3D +0.00 V, max =3D +0.00 V)
> VIN1: 1.01 V (min =3D +0.00 V, max =3D +0.00 V)
> VIN2: 1.30 V (min =3D +0.00 V, max =3D +0.00 V)
> VIN3: 672.00 mV (min =3D +0.00 V, max =3D +0.00 V)
> VIN4: 1.01 V (min =3D +0.00 V, max =3D +0.00 V)
> VIN5: 2.03 V (min =3D +0.00 V, max =3D +0.00 V)
> VIN6: 464.00 mV (min =3D +0.00 V, max =3D +0.00 V)
> VIN7: 1.52 V (min =3D +0.00 V, max =3D +0.00 V)
> VCC: 3.28 V (min =3D +0.00 V, max =3D +0.00 V)
> VSB: 3.33 V (min =3D +0.00 V, max =3D +0.00 V)
> AVSB: 3.33 V (min =3D +0.00 V, max =3D +0.00 V)
> VTT: 2.03 V (min =3D +0.00 V, max =3D +0.00 V)
> VBAT: 3.18 V (min =3D +0.00 V, max =3D +0.00 V)
> VREF: 1.79 V (min =3D +0.00 V, max =3D +0.00 V)
> fan1: 747 RPM (min =3D 0 RPM)
> fan2: 745 RPM (min =3D 0 RPM)
> fan3: 0 RPM (min =3D 0 RPM)
> fan4: 0 RPM (min =3D 0 RPM)
> fan12: 0 RPM (min =3D 0 RPM)
> fan13: 0 RPM (min =3D 0 RPM)
> fan14: 0 RPM (min =3D 0 RPM)
> fan15: 0 RPM (min =3D 0 RPM)
> fan16: 0 RPM (min =3D 0 RPM)
> AMD TSI Addr 98h: +49.0=C2=B0C (low =3D +0.0=C2=B0C)
> (high =3D +0.0=C2=B0C, hyst =3D +0.0=C2=B0C)
> (crit =3D +0.0=C2=B0C) sensor =3D AMD AMDSI
> Diode 0 (curr): +56.0=C2=B0C (low =3D +0.0=C2=B0C)
> (high =3D +0.0=C2=B0C, hyst =3D +0.0=C2=B0C)
> (crit =3D +0.0=C2=B0C) sensor =3D thermal diode
> Thermistor 15: +52.0=C2=B0C (low =3D +0.0=C2=B0C)
> (high =3D +124.0=C2=B0C, hyst =3D +34.0=C2=B0C)
> (crit =3D +0.0=C2=B0C) sensor =3D thermistor
> SMBus 0: +56.0=C2=B0C (low =3D +0.0=C2=B0C)
> (high =3D +0.0=C2=B0C, hyst =3D +0.0=C2=B0C)
> (crit =3D +0.0=C2=B0C)
> SMBus 1: +56.0=C2=B0C (low =3D +0.0=C2=B0C)
> (high =3D +0.0=C2=B0C, hyst =3D +0.0=C2=B0C)
> (crit =3D +0.0=C2=B0C)
> Thermistor 0: -40.0=C2=B0C (low =3D +0.0=C2=B0C)
> (high =3D +0.0=C2=B0C, hyst =3D +0.0=C2=B0C)
> (crit =3D +0.0=C2=B0C) sensor =3D thermistor
> Thermistor 15: +52.0=C2=B0C (low =3D +0.0=C2=B0C)
> (high =3D +124.0=C2=B0C, hyst =3D +34.0=C2=B0C)
> (crit =3D +0.0=C2=B0C) sensor =3D thermistor
> intrusion0: ALARM
> beep_enable: disabled
>=20
> Signed-off-by: John Audia therealgraysky@proton.me
>=20
> ---
> Documentation/hwmon/nct6683.rst | 1 +
> drivers/hwmon/nct6683.c | 3 +++
> 2 files changed, 4 insertions(+)
>=20
> diff --git a/Documentation/hwmon/nct6683.rst b/Documentation/hwmon/nct668=
3.rst
> index 2a7a78eb1b46..2302b1ac95b1 100644
> --- a/Documentation/hwmon/nct6683.rst
> +++ b/Documentation/hwmon/nct6683.rst
> @@ -65,4 +65,5 @@ ASRock X570 NCT6683D EC firmware version 1.0 build 06/2=
8/19
> ASRock X670E NCT6686D EC firmware version 1.0 build 05/19/22
> MSI B550 NCT6687D EC firmware version 1.0 build 05/07/20
> MSI X670-P NCT6687D EC firmware version 0.0 build 09/27/22
> +MSI X870E NCT6687D EC firmware version 0.0 build 11/13/24
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> diff --git a/drivers/hwmon/nct6683.c b/drivers/hwmon/nct6683.c
> index f71615e06a8f..e1f2736ee3d2 100644
> --- a/drivers/hwmon/nct6683.c
> +++ b/drivers/hwmon/nct6683.c
> @@ -175,6 +175,7 @@ superio_exit(int ioreg)
> #define NCT6683_CUSTOMER_ID_MSI 0x201
> #define NCT6683_CUSTOMER_ID_MSI2 0x200
> #define NCT6683_CUSTOMER_ID_MSI3 0x207
> +#define NCT6683_CUSTOMER_ID_MSI4 0x020d
> #define NCT6683_CUSTOMER_ID_ASROCK 0xe2c
> #define NCT6683_CUSTOMER_ID_ASROCK2 0xe1b
> #define NCT6683_CUSTOMER_ID_ASROCK3 0x1631
> @@ -1227,6 +1228,8 @@ static int nct6683_probe(struct platform_device *pd=
ev)
> break;
> case NCT6683_CUSTOMER_ID_MSI3:
> break;
> + case NCT6683_CUSTOMER_ID_MSI4:
> + break;
> case NCT6683_CUSTOMER_ID_ASROCK:
> break;
> case NCT6683_CUSTOMER_ID_ASROCK2:
> --
> 2.47.1
