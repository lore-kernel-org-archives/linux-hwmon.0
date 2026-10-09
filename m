Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99FA821FF25;
	Fri,  9 Oct 2026 01:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791507768; cv=none; b=uBqf7I8QhftWbAGu8/TBUwrcFbdVu3CVaSt/Pf73KX5dc5md8NvIEZjLUABd6CIuWgZlkqkfrMk3SmErja5AG56TjSPlrqIqdtu9TLTTaSGiI/4n73ZVe0lbJjKyg1/G+SkZPvu1OGWiyKTG6Rjn9aBodxjr6yjsGOeuD5C+Wm4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791507768; c=relaxed/simple;
	bh=f3hsDkn3q3GLR103Ty5mEaKbwJSiI2QYFcN63LcZi2g=;
	h=Message-ID:From:Subject:To:Cc:In-Reply-To:References:Content-Type:
	 Date; b=N6fkD00olQdrRTOmitlQjw6k6kT0TKe0uFALOLThfrL2dFwSeA16MUTy2S25CxpeuDWKm6yO2RyXKsXKBMV3dfYdME8FhQtbN83qgRs9ddEAQYvA8ij8vL0TUNdhbht1TXgS/1cIJpZDRV6nJpiyTehUCAs+5SeLPihZbNxe6i4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J01HyTwN; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J01HyTwN"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 073DD1F000FF;
	Fri,  9 Oct 2026 01:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791507767;
	bh=f3hsDkn3q3GLR103Ty5mEaKbwJSiI2QYFcN63LcZi2g=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=J01HyTwN74hU4s8seSqaup1LLV13S4Y1n1F2dwVkFXQZmAqbUPGF8lQfiL2DpMAm/
	 jY6h2tNTDITqSmQ86G4riHZOkJJ9bdTn0VugJzm3A6lgQvp2goLV7UspQUjX/SirbL
	 8F8HSqpifWoa2Fi9wBG00vSxgrHRKEQpspr7Hl3WGtMl2mpdEIpH4V21c+xuhP7KpB
	 aRcZgMKzV41fXTy696IPNrjUXn3eIKmA96IdzdwDDaMPqffm6NNMCGLrHZufDYOJAg
	 z24rIfOrBXGN0O0HD7t0b7q8mtetkVIVp9VjVQjR61waJaFwjhkL+C/T4/MsNAtnsZ
	 C2e8klZu1QanQ==
Message-ID: <sashiko-outbox-164693@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hwmon: (pmbus/fs1412) Add TDK FS1412 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Abdurrahman Hussain" <abdurrahman@nexthop.ai>
Cc: conor+dt@kernel.org, devicetree@vger.kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20261008-hwmon-pmbus-fs1412-v1-3-0ae7e5ee4e41@nexthop.ai>
References: <20261008-hwmon-pmbus-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai>
 <20261008-hwmon-pmbus-fs1412-v1-3-0ae7e5ee4e41@nexthop.ai>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 09 Oct 2026 01:02:46 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The TDK FS1412 is a 12A uPOL regulator with PMBus telemetry for input
> voltage, output voltage and temperature, plus the matching status
> registers. It has over-current and over-temperature protection with
> programmable fault limits but no current telemetry: READ_IOUT is not in
> its command table. Its MFR_ID reads "KDT", which the driver checks
> before binding.
>=20
> VOUT_MODE reads 0x98: LINEAR mode with exponent -8 and bit 7 set. The
> datasheet defines the output voltage limits relative to the output
> voltage with a resolution of 1/256, so 0x0133 against a 0.6V command is
> a 120% over-voltage limit. The PMBus core takes bits [7:5] as the mode
> and rejects the device, so the driver reports VOUT_MODE with bit 7
> cleared and converts the four VOUT limits to and from absolute voltages
> against VOUT_COMMAND.
>=20
> OT_WARN_LIMIT is not in the command table either. The register answers,
> but the part has no warning threshold and reports OT_WARNING at room
> temperature, so the driver hides the register from the core and only
> the OT_FAULT_LIMIT based attributes are provided.
>=20
> READ_VOUT reports the voltage at the feedback pin, so boards that set
> the output with a resistor divider scale in2_input in user space.
>=20
> Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261008-hwmon-pmbu=
s-fs1412-v1-0-0ae7e5ee4e41@nexthop.ai?part=3D3

