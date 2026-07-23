Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6BAD13E00B3;
	Thu, 23 Jul 2026 21:45:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784843131; cv=none; b=itNMzKNMnhJqnTgPIxwgnEIWdWdsOos+olXqltZE9hjbAnymFkwch7qZHcV3BR3glr/nKPCvCCUfO8e/G4+gALSyd0SbpwgsC6IxVRMUuAfSWb8CNrUr2vWW7FddcPgplzdh3IX2cpOOc0S2d+kxsVCj6onjnoGCHuHY5yVAJ/U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784843131; c=relaxed/simple;
	bh=v7PsjcbM2tACbv3/A1qMOtXvkvKK++UBKbA6kqxMOMU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UoOqMeMTZfED2r+OGR7KjeJ5m6GqaAJoD8gsZlCvQDrM7ovm3LZp5L55lukaXOxPWGaOZb4NplzCl+LfDcSFxcYuTHFtUkwCwNMrNqpcZvrqx4PCD69xNXI5mbCKA8uzfyhqYCImMqMTTvA3MG86Oct0HWq5uWLm0fhHAHhoI4Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=VuXi7cxu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="VuXi7cxu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C97A11F000E9;
	Thu, 23 Jul 2026 21:45:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784843130;
	bh=v7PsjcbM2tACbv3/A1qMOtXvkvKK++UBKbA6kqxMOMU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=VuXi7cxuz/3HAFBGZhY7w2wuAiW3wVROVEVU13VuGj5y/pJv4RhgdkNlu4TIWnXoZ
	 kif3s4egHjTdMQwcIyMj3oMrHjyaEJ8l+qOY3XzBQnLc8vO46/uX6oZt1cvcFftePH
	 SuEARR/b8sVwmWpvHo+gJUTnR7IE+QLOKZfQpF7nG9NK8DpMs82jOqsTnk82R2h/MW
	 0bQSgSckmfNZSPQWNJq6Q6kWRyEJoe4SgP/rhyr4go6ETuxb4S1pf336L/35cpahFe
	 B2KU1/JHKYyy58EusuepGRsTVT/Gp1tI/A/rJMCp83kCNCucY3DK38HIx6JDkKnXFe
	 IZSUPxjdL5Q6A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 2/3] dt-bindings: hwmon: pmbus: add MPS MPQ8646
 binding
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vincent Jardin" <vjardin@free.fr>
Cc: conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260723-mpq8646_v0-v4-2-b6323d5fc524@free.fr>
References: <20260723-mpq8646_v0-v4-0-b6323d5fc524@free.fr>
 <20260723-mpq8646_v0-v4-2-b6323d5fc524@free.fr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 23 Jul 2026 21:45:29 +0000
Message-Id: <20260723214529.C97A11F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Vincent Jardin <vjardin@free.fr>
>=20
> Add a device-tree binding for the Monolithic Power Systems
> MPQ8646 step-down converter as a PMBus device.
>=20
> The schema is inspired from the mpq8785e:
> same mps,vout-fb-divider-ratio-permille property (maximum: 2047),
> and const: mps,mpq8646.
>=20
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260723-mpq8646_v0=
-v4-0-b6323d5fc524@free.fr?part=3D2

