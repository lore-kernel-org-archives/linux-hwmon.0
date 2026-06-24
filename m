Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBDA429ACDD;
	Wed, 24 Jun 2026 10:49:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782298160; cv=none; b=UJhsRxYHzcqFMKnIPRzqC5Mb1ivQGJi6WkYsH3OUcN1iKXoPViWp3qhI2uMwQ7ve6feKpcVm/MXwfPGqTGliR+5V5VnHVmUOk7gKBQQUQyU/YnfyidWu3IywTdAxY92hhrcC8+59kDRFfAZgd4MHQ+adNCSu8ACFwcVYOrn5Ab4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782298160; c=relaxed/simple;
	bh=N1wcvNlV7wus0UKNanavi25TVCxydBp7LLuxwb6HvsQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=UX30eFfs43I+g+G6B6yJim2rYsYEC67zn2WZ9qr/tfaDXArGqKWdCrEEfVh4+f4eMxnn1Jfb+tjT8mmdQi5EZknS7FX/DV2hcAlD8btKaYFvqB++TwWL/4mJCWTLyDCOmubWLtM4ZP0TYjv0cofhHENtJ3XNKiD2HndN+rk+SDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=d/OE/u1t; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="d/OE/u1t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 14C1F1F000E9;
	Wed, 24 Jun 2026 10:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782298159;
	bh=N1wcvNlV7wus0UKNanavi25TVCxydBp7LLuxwb6HvsQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=d/OE/u1tJu8B3NTtzTxIW1HPOcRHOqkR5hCrvjl4lWsffmOF9xtRPsNl5kk7YOzGU
	 8nqeyivqYbn7gb8jTEFfuazXmrSkeoMKS/l2RlVa+zJE+WcHrTV2QbBV9gH65hIFdT
	 PmnRnTDojbYEiR0z2FKnD7UFggXQFFgY63bOyQHM39couup5OPw5pBTZVfaKsDEkb9
	 HL4FS+9eHTvCgavMZdOq5drKHhEQNx6sGF5A60ajSOzhBbjcME1zG4dX1vcfKB6m77
	 sEJQrKvO8oMfdu9OXqFN13SQsC+u6SPiflEP09G9G18om5xtsuhFTG/QSB49i5vhTM
	 TVT8MRrArXCIA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 11/12] hwmon: spd5118: Add I3C support
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akhil R" <akhilrajeev@nvidia.com>
Cc: devicetree@vger.kernel.org, linux-i3c@lists.infradead.org, linux-hwmon@vger.kernel.org, robh@kernel.org, Frank.Li@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260624102153.1770072-12-akhilrajeev@nvidia.com>
References: <20260624102153.1770072-1-akhilrajeev@nvidia.com>
 <20260624102153.1770072-12-akhilrajeev@nvidia.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 24 Jun 2026 10:49:18 +0000
Message-Id: <20260624104919.14C1F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add a regmap config and a probe function to support I3C-based
> communication with SPD5118 devices.
>=20
> On an I3C bus, SPD5118 devices are enumerated via SETAASA and always
> require an ACPI or device tree entry. Device matching is hence through
> the OF match tables only and does not need an I3C class match table. The
> device identity is verified in the type registers before proceeding to
> the common probe function.
>=20
> Acked-by: Guenter Roeck <linux@roeck-us.net>
> Signed-off-by: Akhil R <akhilrajeev@nvidia.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260624102153.1770=
072-1-akhilrajeev@nvidia.com?part=3D11

