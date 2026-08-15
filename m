Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB6282D594F
	for <linux-hwmon@vger.kernel.org>; Sat, 15 Aug 2026 23:46:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786837573; cv=none; b=B+gQKHZ988fj3FRTDNWiAvY/dCTuRxCtAUPxky4ltz1j32G7TaaWYjyfmSnLvFsv88KMnP8xQUin30gE+acMRQ1IRagITi3uTST9LBzNPnj6s6TjQXhsQMlv7RD8DNedTm3+/vI8DzVEWjjZzPsJEkXg3pMmfcVeO6bmTaA2F3k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786837573; c=relaxed/simple;
	bh=0pczDcEmwKxnc2YESrtAJRv+bTuwpJ/0jX9kXBL3dBU=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=jdpP57OO2NCCvVn4DzBQh8ZRKyElAIShE+PQie+GpXCg1YrEuMhKjMNQW8DStEgDea7yHeZwitv4GaaY6jOBzXTtnkWV54L80dBHdf42rpKqOceZvyougxQRhdSFzngSiNynide0fPGG/aG3XRGPnJqbfDeSvlKY+Gj1xi6ZzTU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZZqCqowy; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZZqCqowy"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 747FC1F000E9;
	Sat, 15 Aug 2026 23:46:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786837572;
	bh=0pczDcEmwKxnc2YESrtAJRv+bTuwpJ/0jX9kXBL3dBU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZZqCqowyU/Tx1otpigvU9WYPpY7uAvu0L5n8QJSzyoFX5j9nLz8+1syIPQhpTF+nN
	 OMQvea4oTBNGbXagW9T5jv4cpgdNeCG3bnICmDJLVj23hqFtMrH5/xH9I/Fa5rt6QR
	 ypxgmj1AmkeSD4HRc/46tH6JHgBkr6FjP/xfdOB2TRgdjen0Zbjir+I++gYvHZGnzR
	 iOTS0okfpwjSW7sHdRS9Wy674xBhpmffxlXnmlP4KuRnMcVic4FVj2GjTiNWxxuep0
	 O73AMqCNEXFhgPJnTQ6+slYWgwD+KCW2+VYK/3ckm/x8yzKIMgpXZXaA1Iq9Y83+tV
	 IcXrqmfw80FNQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4] hwmon: Add fan monitoring support for HONOR FMI-XX
Reply-To: sashiko-reviews@lists.linux.dev
To: "Nikita Dubrovskih" <testname142@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260815234041.2262291-1-testname142@gmail.com>
References: <20260812192242.859307-1-testname142@gmail.com>
 <20260813091411.1186193-1-testname142@gmail.com>
 <20260815232405.2107574-1-testname142@gmail.com>
 <20260815234041.2262291-1-testname142@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 15 Aug 2026 23:46:12 +0000
Message-Id: <20260815234612.747FC1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The HONOR FMI-XX firmware exposes a serialized \\GFNS ACPI method.
> It returns a status byte and a 16-bit fan speed in RPM for either of two
> firmware channels.
>=20
> Add a DMI-restricted, read-only hwmon driver using that firmware
> interface. The driver deliberately exposes no fan control or direct
> Embedded Controller access.
>=20
> The interface was validated on firmware 1.09 with fan channel 0
> reporting approximately 2500-2800 RPM. Channel 1 is readable and
> remained at 0 RPM during idle and a short CPU load.
>=20
> Signed-off-by: Nikita Dubrovskih <testname142@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260815234041.2262=
291-1-testname142@gmail.com?part=3D1

