Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF63C4195B6
	for <linux-hwmon@vger.kernel.org>; Fri, 10 Jul 2026 11:25:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783682743; cv=none; b=KUNnbyOYq3fPa8Z+nJkCDSs/OEhFGqxX2VfYlE8QtBFtmsBD0NWyBuBi+tJa6DRknVWzjKtkjgrH0fMgGimM1N7jav+W7tAX321ux30sh3Q1osbXy9ZlwEvB08ZMksouHoCZS8fOZSNB9a4Egmn4edj95jYaxQwI0Avkr4tQmsg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783682743; c=relaxed/simple;
	bh=M7Wp676Qyb6cidJuJTOVCd8cSHnTfDU+oWOKitAyotQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qGsMPOaH7kzAo9Zm/PclxOotXB51tE/ynxFwrg7HhulVKlId2lw9bi+vVgge42agDSzWe4PvSI6QSFh0Zo8fmKf5ezWPod/thwosp5qO4dGkHfGuVTe1LCGE3LDD4+B9EY4SREmxlKzTGy7NfnHRXLlInAIj3gqW1/1wwZ6fF9s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=XLZ2jpKh; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="XLZ2jpKh"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3B3341F000E9;
	Fri, 10 Jul 2026 11:25:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783682737;
	bh=M7Wp676Qyb6cidJuJTOVCd8cSHnTfDU+oWOKitAyotQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=XLZ2jpKhF53WUwcLzVKwABzEJUeJjhVF69GWJJcwYhpBH9fgqmm5Q69I6/absXI+V
	 IzJx9UhreM8YlhVkwNv11zHcnGZM/knbK7v+5AsIrM/bqLS5xYeT+fc+XkCqDFlhs6
	 xZmT6gv2qGTGBCVl/rlvfkCGdMfNKTAgwYfwAt00XsrkCl6PEqj5TQqlMMOjQpoknI
	 ajLjXFJ5c9Sq2KcBrp74gYYSXaYBYoE3sVozzzTSfTtQaZfTS6dc7MfIqcvd368E/A
	 VwFSEYyc/TygDKVaUHxO9rQK2ehJsYg43eECampr+fLLpWBlH+R6gTqfgZCV98J5YK
	 T8J1ZOkVn1yOg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 3/8] hwmon/misc: amd-sbi: Move sbtsi register
 transfer to core abstraction
Reply-To: sashiko-reviews@lists.linux.dev
To: "Akshay Gupta" <Akshay.Gupta@amd.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260710111642.850022-4-Akshay.Gupta@amd.com>
References: <20260710111642.850022-1-Akshay.Gupta@amd.com>
 <20260710111642.850022-4-Akshay.Gupta@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 10 Jul 2026 11:25:36 +0000
Message-Id: <20260710112537.3B3341F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Prathima <Prathima.Lk@amd.com>
>=20
> Move the I2C read/write byte operations from the sbtsi hwmon driver into
> a common sbtsi_xfer() function in tsi-core.c.
> This decouples the hwmon sensor driver from the underlying bus transport,
> preparing for I3C support in a subsequent patch.
> This patch does not introduce any functional changes. The updates are
> limited to code organization/cleanup and should not affect the runtime
> behavior of the driver
>=20
> Reviewed-by: Akshay Gupta <Akshay.Gupta@amd.com>
> Signed-off-by: Prathima <Prathima.Lk@amd.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260710111642.8500=
22-1-Akshay.Gupta@amd.com?part=3D3

