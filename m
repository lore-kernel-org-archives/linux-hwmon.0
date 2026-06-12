Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBC2A3148B4
	for <linux-hwmon@vger.kernel.org>; Fri, 12 Jun 2026 22:00:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781301657; cv=none; b=MDpq9K/uRiSczwOx2JQqOGspR5xDxik0SEVkYyoXjwQujOda5QcDsk028Thnw6uswtN7LB/Z4hvap+QtIvK9TFFNjZ41Ag8Up1z/73tf/nwYOhAHoTnQ2YXLyvYAaHviLQxCG3zl+mJDuXO62Rv4sILZQ6vqGXHWyoW52bhZf+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781301657; c=relaxed/simple;
	bh=YJdhnlHaseq2tq1KB9bDNtdwOCq9wRKXSUyd8ZljjGo=;
	h=From:Subject:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=KwGo5zXFh3//2kBgy8vF/0FbPwL7ajY+gz2EAJ0fCBozyKy2E3KmGdxGOVtuqEylqtrmHtROcipT28VVTfgVRiBRMfbndQnDiIjBS0tYKcUoalwP84Nv6MHW8ZjtUGAVVlz8PZncPBag/37ylww+hJFaps/TF0HvxIYjqReWJlQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=DucpL08m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="DucpL08m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4E5671F000E9
	for <linux-hwmon@vger.kernel.org>; Fri, 12 Jun 2026 22:00:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781301656;
	bh=YJdhnlHaseq2tq1KB9bDNtdwOCq9wRKXSUyd8ZljjGo=;
	h=From:Subject:Reply-To:Cc:In-Reply-To:References:Date;
	b=DucpL08mUkCQUB/qoFOMx0vAqAOw6XBcYotstalGSy9Jtp5BL5Dknv5KTrAXLoJ/S
	 dBzwYDYsoFnBPaIhjVDfvSwiXb3ceKbdcHNhNb1YRI8gbk5a9N1qdZk9czDTTK0K2W
	 UMHquSS1kVRoKu/73BcFqm7hcrlHVJbBuqyUs7tD9CUDNodlw4RmAnoSqy1sKSe9Ii
	 L0OGOouWrVC8yQ0f6ol3uk45w/zkupYTk4SRLSfepmxB0jvI9qo2Zglnq/VvFayq/t
	 /AOH40MWB+nvGzZZ+ohRh642HkxgXtDVoAUTVLRhdpO8J0xV8XvWuSocirAgZuJeVw
	 PnBWeXr5deCLQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH] hwmon: tmp401: Read "ti,n-factor" as signed
Reply-To: sashiko-reviews@lists.linux.dev
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260612215332.1889497-1-robh@kernel.org>
References: <20260612215332.1889497-1-robh@kernel.org>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 12 Jun 2026 22:00:55 +0000
Message-Id: <20260612220056.4E5671F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The "ti,n-factor" binding and examples allow negative correction
> values. Reading it as u32 makes the helper type disagree with the
> documented signed value and hides real schema mismatches.
>=20
> Use the signed helper so the DT access matches the s32 value stored by
> the driver.
>=20
> Assisted-by: Codex:gpt-5-5
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260612215332.1889=
497-1-robh@kernel.org?part=3D1

