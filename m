Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4A47040F757
	for <linux-hwmon@vger.kernel.org>; Wed, 22 Jul 2026 22:18:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784758683; cv=none; b=EU5QQnWVCWPIbR0bqTZKVj4pVVOtgEplpyjeKtlN6gObyOFwKtbQY8jpx4xUX2BfI9KT0VbYHKMubOvkeHOWeKvjPla1nYVGjRbzXr6kWJHtYgHcdHx7eh76rnNGeBnAwjFhtmCQgAQDQdcxPNNznY6u/QKEKQz8g14+05BiQNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784758683; c=relaxed/simple;
	bh=4IrE95aUDxi+iMpaVEt0RZn7X72DY20EhheVU+A+VCI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=RHuDUxHdX681Lo+9vZHQqzPXmU2YwMIBy9YaqF06mNb+oKjy9s4TJVHEFNaZONKCYv08ma5GEAvthNK3IxbyfMi6EQEm4uynvfWNT9ZfxmUqFTz9+9lmQ5N9uM7oZiYMs3K2tREbDQ1sO753C01spevfwlgpVqCu0s8PLSM2AeY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gE7pUwKx; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gE7pUwKx"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DEAE01F00A3A;
	Wed, 22 Jul 2026 22:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784758682;
	bh=4IrE95aUDxi+iMpaVEt0RZn7X72DY20EhheVU+A+VCI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gE7pUwKxQ/drQ7RGBi+OxHrKl1mAgLW4f+jcnc/ULifjH+4VMTAGbBrm1fIW17CmX
	 hQ+6pAmUdTx2xepxd9YBSNvKANOa6+FB7nBTY+dzRB4eQQWUmZm2eylzFiORex5v+5
	 j8j+LzDZlEgQBSYj5+aGitpaS+Ex2AWR/S0/0aryRzlPOLsrFpJstOZoYngSsFAxGy
	 rOg2Bo+auD3uC5NRGWYKkY9LDw4xiYXfDC9CJYzvz/OR5xgQuJILG14uQh7OoqcZf8
	 eHEPwrtgvOjcTKMuIeWBRBSHL3psNpRLrtkdxfUkG67JU269r9RLoZeALL6yDUVC30
	 i3qaoF6uNicYQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next 2/6] eth: fbnic: expose all hwmon attributes
 unconditionally as read-only
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260721221540.648272-3-limzhineng2@gmail.com>
References: <20260721221540.648272-1-limzhineng2@gmail.com>
 <20260721221540.648272-3-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Wed, 22 Jul 2026 22:18:01 +0000
Message-Id: <20260722221801.DEAE01F00A3A@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> All fbnic hwmon attributes are read-only and always present, so
> fbnic_hwmon_is_visible() can simply return 0444 for everything
> instead of matching on the sensor type and attribute. This also
> prepares for the threshold and alarm attributes added in the
> following patches: they are exposed unconditionally and reads
> return attribute values.
>=20
> Signed-off-by: Zinc Lim <limzhineng2@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721221540.6482=
72-1-limzhineng2@gmail.com?part=3D2

