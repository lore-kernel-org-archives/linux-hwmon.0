Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 481A7330B30
	for <linux-hwmon@vger.kernel.org>; Wed, 20 May 2026 03:09:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779246552; cv=none; b=fisoE5qQDw8PADxYShIrxAsAFL4z7zsXU/1PXPj31fzFl+rMrEejiP1UsA321SBRHMDqhsD6IccIYYmguH8VsGkMD5M0wl0cNs9f6rBZmvWSzvd/OUVBemZGK05Tfa5JMxF4UjsYri433nzFO9Zh0sHLp1bbhBHaUXxC+dbcU8c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779246552; c=relaxed/simple;
	bh=P/Lp/spzhFPrQrxQCqANcBomLNIFBEJt3ec+qVslbcQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=WS6AWfnfBJTfNcbGGD0TUvimk4RgN44hiyjv0OfM64DhmfHvyQLt7IqScf7aQ6s9QXB3zShk2wYU+9qTOrpjvmaQ5vADhw3O7g+S4um4QYest1FBbGFt/plO0iXLOAqR6x+amHcbd4q+nkEq1xQK+zFkmQ6sNok5CfFLi0W9p0k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LDja5aKE; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LDja5aKE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0FC0A1F000E9;
	Wed, 20 May 2026 03:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779246551;
	bh=q0/26XXskpm69pVAsNmdDdBTbyrzrjinjDJcRDMxMLA=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=LDja5aKET+qkNbMcGrLnbL0mevLQiB2uZ1nRNClL1hL89WeISa6QYOIILT4wI1aVh
	 sEaZHRIwqibYASERXaIhhSaYSdZsyEPnMVb562Lf7iIlH1AbbG2LNJ9QsFpDktcXn9
	 /vp1JPA9HdutFHdax99QoIY0KiU7bZsqqGWmQ71FJ3OaLTBSAJ9VLylXNJoIbDg9TT
	 R9Prd+H+7Zpks+1uNmpQGgowaVHrf6za/fbOhT1Lud5Dr3MzRNAAGKfVwV9ZdsVHQF
	 rBQs6XYGoKOdvJa0A4BIKyZGUmuuroXiuxAdURHyKLAnNQwkvj3n/TV6NR+ZaPWf7p
	 kkrzWpfdReCQw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (lenovo-ec-sensors): Fix EC "MCHP"
 signature validation logic
Reply-To: sashiko-reviews@lists.linux.dev
To: "Kean Ren" <rh_king@163.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260520023222.18321-1-rh_king@163.com>
References: <20260520023222.18321-1-rh_king@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 20 May 2026 03:09:10 +0000
Message-Id: <20260520030911.0FC0A1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The EC signature check uses && instead of || between the four
> byte comparisons.  With &&, the condition is true only when ALL
> four bytes fail to match simultaneously, meaning the driver
> accepts a device as a valid Microchip EC if ANY single byte of
> the 4-byte "MCHP" signature happens to match.
>=20
> Due to short-circuit evaluation, if the first byte reads back as
> 'M' (0x4D, a very common register value), the remaining three
> comparisons are skipped entirely and the device is accepted.
>=20
> Change && to || so the check rejects devices that do not fully
> match the expected EC signature, as originally intended.
>=20
> Also remove the now-unnecessary braces around the single-statement
> if body.
>=20
> Reviewed-by: Mark Pearson <mpearson-lenovo@squebb.ca>
> Signed-off-by: Kean Ren <rh_king@163.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260514011411.4167=
069-1-rh_king@163.com?part=3D2

