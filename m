Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11EE0503BCF;
	Tue,  8 Sep 2026 09:24:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788859453; cv=none; b=Ik9Ay/jadx3vNU4imNoPtr9GMQwvuXoRgZcoxhH0RlKyFJxwFrlQDcrrO3Qe4csA0/APEB5L81Qt9cq4fulcQ87NHd2/6PQhP9j5OO2EJcbzj4E41B7++dsfp5i6CIgwz0naZ7ndyVKWxzklrwm/QhXhTPOyxVoE57kWGHlqMfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788859453; c=relaxed/simple;
	bh=uDkHi0IbTUGlJD2+gkzbGcoCBYFYZ05lsh0hLjW7kj4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ic/NvhgxnaA2YK0v7gJx6eyrTY00gKi/yKA8gvwQvRmYtJfr/kIiftKmN53jKvRzDLsiTYmQCP/nrBPmnHGya8rTdzbKsMo3Gf7Slch4CwGRvSe4XBNQDVu47A4bNKlRoVpxbrUxS0IL9w0+2paw7K9JGcNwMHK9ANLMIcyhv34=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZT0SXNgD; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZT0SXNgD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3CC1D1F00A3A;
	Tue,  8 Sep 2026 09:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788859450;
	bh=uDkHi0IbTUGlJD2+gkzbGcoCBYFYZ05lsh0hLjW7kj4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZT0SXNgDpGEzERL55CLqSHFN0ZC1/VUYdz+r4gG+0UP6CFbgXh0N5JAfaBe15kE+b
	 gDGIbYgiB4UC53JUHqDwMtBF3YOmAMM7NiHRSXHnBDNPBieECBNj+aGnRLaqTc1Zyy
	 hXvH2oPsnkfNnrceZiq4wvXkBH4BdSWV6MCmbjKlXKFhuzv/rXoa0XIlACFwLNsmpz
	 MV740bQyU9qA3ip/xMkE5AC/oVLn5kBDutkQOGTCUveucKzWPeK0GQpgBdJqOc76q+
	 mckGxbtHOVue/yEWku3KiHNJfhZD+TIVn7w1l0hBD6PeiDw7ybTrrvwJ2BrEhiitCx
	 uNY1o98sieq8Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: embedded-controller: add Lenovo Yoga
 Slim 7x Gen 11 EC
Reply-To: sashiko-reviews@lists.linux.dev
To: "Oleg Keri" <okerixx@gmail.com>
Cc: robh@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260908091752.5508-2-okerixx@gmail.com>
References: <20260908091752.5508-1-okerixx@gmail.com>
 <20260908091752.5508-2-okerixx@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 08 Sep 2026 09:24:09 +0000
Message-Id: <20260908092410.3CC1D1F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Document the Compal embedded controller found on the Lenovo Yoga Slim 7x
> Gen 11, a Qualcomm Snapdragon X2 Elite (glymur) laptop. It sits on I2C at
> address 0x70 and is distinct from the Qualcomm reference EC that the
> reference designs place at 0x76.
>=20
> Signed-off-by: Oleg Keri <okerixx@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260908091752.5508=
-1-okerixx@gmail.com?part=3D1

