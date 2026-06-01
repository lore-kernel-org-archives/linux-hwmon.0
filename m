Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 21C15357CF9;
	Mon,  1 Jun 2026 18:52:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780339932; cv=none; b=i8AKJupcsv5kiK3dbXf3T4+aciLvvKOVhRn6JZwuTjJ6ctC3Q/aJC9zDne834i8GGRiiHxPIoQMxgN8tyHojL8l5V8QF8R54GRb7pXRV9DVLatGg0c7WFBIHxlTZdlE7mtpApU7wNGFw4CSp97fHE70Uluk7DtDZq+MhfQcVEUg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780339932; c=relaxed/simple;
	bh=LCPeUyDd9+D4Ima8HdU5lRtkFu26ax14f9xucwbMGcU=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=cvFAo5qdCi4EnsSaPhGpCxFhLvTUuuOmrUymTIoKFlWYkjpWXQ2oUrSoWvusyJvg6/26CRo9Igx6XvAnzbACnRxUVJkHgUBWh7tLf5UhvrHVOnnGX/GIyW16sph00oMjBfdehyX1kodHmMvtWCcEsEsNOdWHkQOyFRC79vVGXHs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Nh5QKfES; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Nh5QKfES"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7964D1F00893;
	Mon,  1 Jun 2026 18:52:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780339930;
	bh=LCPeUyDd9+D4Ima8HdU5lRtkFu26ax14f9xucwbMGcU=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=Nh5QKfESYFaZhAAjUbPZxnJabmqsOBPj60Y8Uhpgu9kuNIsBCjNDAk4x/UHyXXWOL
	 PJxrEEHTV9GjLXTZ5Ys+qrsW0MBz3a56I2+JQrRrZw/5razE2tCG5q/rR5mq8ReDKp
	 U1Bx4d6k80KiY46QrHT6347X210gEhFrb9YeVtAAa70hBr7SmQCMESGelATNrqswPK
	 P4IZVQWElkttg4cfw+8iczAga/cuk0TnMZowk0co6u17JuQgz/6gmkpfPsP18CKRj6
	 w81SK2esn2b+CLidMB6ukkNLEFileMVP1MeKNL25lKJkgqAEgj1VdO8XHMHNhFxZc9
	 C83yx8mMxFs5A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon: pmbus: Add Analog Devices
 MAX20860A
Reply-To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260601184516.919488-2-sanman.pradhan@hpe.com>
References: <20260601184516.919488-2-sanman.pradhan@hpe.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 01 Jun 2026 18:52:10 +0000
Message-Id: <20260601185210.7964D1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Sanman Pradhan <psanman@juniper.net>
>=20
> Add devicetree binding documentation for the Analog Devices MAX20860A
> step-down DC-DC switching regulator with PMBus interface.
>=20
> Signed-off-by: Sanman Pradhan <psanman@juniper.net>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260601184516.9194=
88-1-sanman.pradhan@hpe.com?part=3D1

