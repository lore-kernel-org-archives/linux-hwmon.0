Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C839314A8D;
	Fri, 24 Jul 2026 04:53:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784868782; cv=none; b=k9sCmg9vfxowUKE+/flICLN73dnGfJ7cnOcM0PRGp47KYin+Oq32lYjO4mxrHZbUkjjs6SsjN5wDKPOu2f8Tnh9habQc+JX1Fo2XcSuILFuazk0vVIJqHbea9w9k889vqeYki8Uum+lFvcveAAb90FKils//cYXpIRw8HyFLioI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784868782; c=relaxed/simple;
	bh=ha4Tx4X4/eZTSxczRl7ius6xEiXyC2U/gXUWj1FgSB0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=D4Zq1VqZn10y/Kn7SCqfIHYiWpSG5LakEDXG6bh1Uo16YZFy9KIsYut/B1lfImouX5ln7jRVxR7h5cST1+PpQDOQq6KspU1klfQM7VsVBtc3iOKd0axsbY+rKhaMIomwrRtIQLuQC5+LtZVZi+X5Fgyq2KnD7EnJ9chf+VqXUSE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ZcuwcYRW; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ZcuwcYRW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6CEE81F000E9;
	Fri, 24 Jul 2026 04:53:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784868780;
	bh=ha4Tx4X4/eZTSxczRl7ius6xEiXyC2U/gXUWj1FgSB0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ZcuwcYRWWGfSU2jiPNqpPLQ9xNPF8PXNtJ0DwsglV/jIKr9/nGCEJcpDj/W03ESnZ
	 yWz0sPwcyGRN2qWxn5ybEA6J9FIZCeqkoCOAgqZyLi3jbjdYpKC7FiWaJ1/J/skHFl
	 buDLuVC+wk00VGjMEoZghC+LReP2z93E6ApbLj579Z0QqxJiTw7f84X0Cq3r1PopK7
	 QxfpfbCw72SQOhJnSUHSknvM2b99acRB01rXPt3NCHwPaTKJ193m285ZEt2UB0nj1H
	 aysLEv60DBhbXR4K0BCq9WqGsHQLBlBhzspXyR/JMfdwuETzJMeoZ0ap3jU++s9kfB
	 uACLkgu1PEaXQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 4/4] hwmon: (kb9002) Add documentation
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Chung" <Andy.Chung@amd.com>
Cc: robh@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20260724-kb9002-upstream-v5-4-9523c3ffe83a@amd.com>
References: <20260724-kb9002-upstream-v5-0-9523c3ffe83a@amd.com>
 <20260724-kb9002-upstream-v5-4-9523c3ffe83a@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 24 Jul 2026 04:52:59 +0000
Message-Id: <20260724045300.6CEE81F000E9@smtp.kernel.org>
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260724-kb9002-ups=
tream-v5-0-9523c3ffe83a@amd.com?part=3D4

