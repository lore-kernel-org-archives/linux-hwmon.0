Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1533FA5C8;
	Tue, 21 Jul 2026 06:43:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784616224; cv=none; b=unogwKwhPZbOKJcpE+Pm/iJD0upKimHtVdd3QBBV9UPbY/9OGzOZTtoCKOz4r24Yc8kudGWKhpkFAMRB5c+uG5sKCkpcdJkD6QWSyyydw5M8rZEMlygIOWLhzUTs7+ttTQ9oAKd/KmTnx6KlIps4CvRnE8HVsGg8x4kN0rXm9Cc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784616224; c=relaxed/simple;
	bh=TSX4g+LZ6CARyCi9T45KKbeRQ9OnaLdU/oQMlr2qaS8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CiQvWYRoSdyqB3DUVlXs9seG9V+vbbG6XvIu21c8xGqjgg7KALpJr6p3ELN/aLRrbEfpsPgyVW5Rg3SOxdj1AxgWZP16sU4qWCrZ2zuh/zBg7zKsq0LEleX1scELattSfnCwVs+eNWO8IAqV+vQrFs+CRqROhOqy1qb+dK9zo7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jep94fKW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jep94fKW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31AA01F000E9;
	Tue, 21 Jul 2026 06:43:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784616223;
	bh=TSX4g+LZ6CARyCi9T45KKbeRQ9OnaLdU/oQMlr2qaS8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jep94fKWaL4zYiI4FZWdIy+/2OcvJEVMKAoFSQ0uBVKhG+Rus/K63wFGuafYwpJDn
	 YeuK4W8u0adxfQPCvHHvB5HerveoL0fM/I3kE4rbee0GtReEMym19jC2pU2KyFmhsG
	 /8Oox9WUaVi6MQOnu8iSp/GaGRZA21lbWWe2JdYS6MiHBj82NPIoom5qoPY9/yrvao
	 4azWs5ANBvHKlG2VdKjBGAkiyYc4lTqcPJxELpDNf98/S10d6VQf3Pv+Uo1h0T1rOa
	 i+A7PPYikvDHKCokHSU9ysGBFSCyLHFF+JBHpc4ZM+N4NugjaZK8eBrKmPKenfCRpj
	 ThHwucf4zl2ZQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 4/4] hwmon: (kb9002) Add documentation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Chung" <Andy.Chung@amd.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org, conor+dt@kernel.org
In-Reply-To: <20260721-kb9002-upstream-v3-4-70563922be8d@amd.com>
References: <20260721-kb9002-upstream-v3-0-70563922be8d@amd.com>
 <20260721-kb9002-upstream-v3-4-70563922be8d@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 21 Jul 2026 06:43:42 +0000
Message-Id: <20260721064343.31AA01F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Andy Chung <Andy.Chung@amd.com>
>=20
> Document the sysfs and debugfs interfaces of the Kandou KB9002 hwmon
> driver.
>=20
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260721-kb9002-ups=
tream-v3-0-70563922be8d@amd.com?part=3D4

