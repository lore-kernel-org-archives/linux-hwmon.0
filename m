Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A2242E004
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2026 12:39:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783341595; cv=none; b=TbZEs7uRuUk9E4DtxsSe1B0lL2lX4+JGmXOU7q5VjxQIEVi5V2YvtHJ12wAdNJsBA0tdpA8JR7fXEU6PkMOttB5Vo7C0sdcxa7ugSVdyDGUU0ok0P7/ePrKBCt16vqn5GVHsQeLu+xRZ3sK8eb3eY50nkOgqjMRaw1AbAmVG7Vc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783341595; c=relaxed/simple;
	bh=ZoyES4kyED93edkPUl75SdDiR7767GMDaTl9elxUJkk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qyvrpBKqnzSKQKhnB4f8UxXK6xBW0tFkQ5wJIhIPjA90K0dZvO0eS/aQqIwLfo00g0tbSIbBeKbjPj6o3EJqX9vj4L3BSBaiT42AM+CVLZ+4Y2xhl9oojCuSnylZ76rzit7jUwOW7fHmhic4HHOOSXnVv+rxGM6qv8HdMs6f7YE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=I490RH46; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="I490RH46"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9DA9A1F00A3A;
	Mon,  6 Jul 2026 12:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783341593;
	bh=ZoyES4kyED93edkPUl75SdDiR7767GMDaTl9elxUJkk=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=I490RH46nlwfkytDcloFiqX73ynpiJgi544xQKNAdzAcqUGrxX15Dsky0nDDBdv4q
	 OTw5akswpPJsx6UCB+j8FB4Vu/wVR9aVy8B6cPFss3vCnIPmooTFU8xbrmFWYr06Yr
	 g1DFNDsb8cQSFnDmrs1i36XP+qppKP6lWPu0w95mySZ3pcrbLgITtOLimEMcKiKFd7
	 RbDHueyUkLbthhpAm8xBwk2PbjWCtRzmnvZE2K5pcG4M70CiC2HP/MZsUR1Ki8WS4Q
	 IDFPB0U2ksgljH1ic40kqT60vjR2Zsd/xnxUPBz/VVZdcDEOkDwRyJaB/9G206W0NE
	 g/3zBvPiqOcMg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v1] hwmon: (acpi_power_meter) Stop setting
 acpi_device_name/class()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Rafael J. Wysocki" <rafael@kernel.org>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <2297496.irdbgypaU6@rafael.j.wysocki>
References: <2297496.irdbgypaU6@rafael.j.wysocki>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 06 Jul 2026 12:39:53 +0000
Message-Id: <20260706123953.9DA9A1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>
>=20
> The driver populates acpi_device_name() and acpi_device_class() that are
> never read afterward, so make it stop doing that and drop the symbols
> defined for this purpose.
>=20
> Since ACPI_POWER_METER_CLASS is also used for generating ACPI netlink
> events, use the "pwr_meter_resource" string literal directly instead of
> it for that.
>=20
> No intentional functional impact.
>=20
> This will facilitate the removal of device_name and device_class from
> struct acpi_device_pnp in the future.
>=20
> Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/2297496.irdbgypaU6@=
rafael.j.wysocki?part=3D1

