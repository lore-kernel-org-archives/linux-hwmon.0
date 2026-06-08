Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C97E370AD4;
	Mon,  8 Jun 2026 06:22:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780899752; cv=none; b=Nwn0SSpMhRL9to+4iMGd9PrcIUwxGkA2DGmdAhwhv3it4GuCzqR4wsEhKzOp6H6+L9rrLCFKuu7LeYZmrrSKbXy0cUsfLQq1pEA3AxmqSwebJmJ+9BRAjRi7NjBMdxMdCB6bmZURAKtQujywkCJzFS3yOrQ4MRgblkkvVNXR2xA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780899752; c=relaxed/simple;
	bh=LuvTEA0n7iP2nsv9gI+EIdsXrd7VzB5J/PgcsUR+D/c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=BKSRWS40SGnzhO5k4keieMgGIOioqUucDXkkF1Z5s70nbiKstRILGR8zL3PA+xTvsM0kr7exKYIPPXl4l1OJrpCvcSjyIiBJUxqC8h6/du/CHzq1/Wqc4V8YJzwv4+JunBAz7XJyxcu6XpsVMYbH2mA12nSEvbEkXIzrxQibc+8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMS6DMA1; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMS6DMA1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B96091F00893;
	Mon,  8 Jun 2026 06:22:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780899751;
	bh=LuvTEA0n7iP2nsv9gI+EIdsXrd7VzB5J/PgcsUR+D/c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nMS6DMA1qgNxfL+uUMwx/kVjvdbd2pYOMfgJpNUaZ+g6U2nxVaSkRkE7BKJwYNCwO
	 fPHJ9DbhO7nMrU7HUBCyQxy63aq8GelwTJwlS++8EncKfMnh3seWdk/Ps7VkjN7Zgz
	 MkuNYL3vdDO0mki0u9/+mR5502d94nX20pjYb8cp20T4AkA+xx0eW4e/RcVoepC90S
	 lQ0v1RCqCueuXnBhpp4jla8yBxwOoLEihQyIiLJK29eD+TeBNgVjiVeMxjI7K2Hab8
	 2bwLuuG4boZ2xLUpSzAnMLWaq/oAnZ0NCgCYulrMN/7mfTcIQVOmxrkSW6D9Rao1Hv
	 fjeM0DtFFbi2g==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 1/2] dt-bindings: hwmon/pmbus: Add Infineon xdp730
Reply-To: sashiko-reviews@lists.linux.dev
To: "ASHISH YADAV" <ashishyadav78@gmail.com>
Cc: linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260608061544.5613-2-Ashish.Yadav@infineon.com>
References: <20260608061544.5613-2-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 08 Jun 2026 06:22:30 +0000
Message-Id: <20260608062230.B96091F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Ashish Yadav <ashish.yadav@infineon.com>
>=20
> Add documentation for the device tree binding of the XDP730 eFuse.
> Rename node to efuse to accurately reflect its hardware function.
>=20
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260608061544.5613=
-1-Ashish.Yadav@infineon.com?part=3D1

