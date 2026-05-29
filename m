Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B871A2E737D;
	Fri, 29 May 2026 06:00:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780034459; cv=none; b=UxjS919tMe0mVrDSnU0GOTwN5xU8dFXj0HOoTpH5y/rb9ypgyAbrmCzAM7eHNabjkAj72Y4oJ9T11ZfxqFb5bg09h8dn2EcU3J/uP/Pa/m4xTQIhyHl7yUY2UDDIZ/BbMSo623ylh0pM8QfMfX5axgWBy6V9Z1xzY3YTo5sjGnU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780034459; c=relaxed/simple;
	bh=30kZcIkWvCg+tw6tuTpdPIcxAAVJWdc1rQ1+cL9/Nxc=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=f0hbMGWLb6/tStvlNI/kq4KNCzOntCRdbQTQYG17MIuOo6VYw264iZ97MQfSBuUQxJ/xQHAQXCiZnS2q8zDC0P2H5TOS3j8kP+8mT1BjMzXqhdjC4I4XK0xLjfzpmH8kbMtsCnXtWFdYiWrnfYCw6X//r+c3Soc8HEav6NmIK5Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=UQswQ1TV; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="UQswQ1TV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C82B21F00893;
	Fri, 29 May 2026 06:00:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780034458;
	bh=30kZcIkWvCg+tw6tuTpdPIcxAAVJWdc1rQ1+cL9/Nxc=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=UQswQ1TVPF/hdiyOKsYDM/h2HcdaLfDbp0ictSdOFBbSkhFBPBOYoFIA/csyd2+FJ
	 aSw01oA7h8kH6bDgMTw0rnzieZtsV/BaYTAYuR3ic4t2gIWqq5LN49W9Kz3EexC+MQ
	 G+j/lyvoWGQfJoEDRIOR6aCJlmOCDuX3sZtAbACizeZr4LWThQjn3KcP73vlPrcrXZ
	 xd3i6j2xq8XbjAdsDrhKw3qKTb5UZ5vckBWho7Jux4Lxompn/iXjqzToumu3bJA01L
	 xl3porAwXnQbgOVamodgTAbvFve4fT0y8llwLq5TB5Y1h4ePQS1WQLVU2IMYrhXC8F
	 rYSilInSFStwQ==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: hwmon/pmbus: Add Infineon
 XDP720/XDP730
Reply-To: sashiko-reviews@lists.linux.dev
To: "ASHISH YADAV" <ashishyadav78@gmail.com>
Cc: devicetree@vger.kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, robh@kernel.org
In-Reply-To: <20260529054218.5184-2-Ashish.Yadav@infineon.com>
References: <20260529054218.5184-2-Ashish.Yadav@infineon.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 29 May 2026 06:00:57 +0000
Message-Id: <20260529060057.C82B21F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Ashish Yadav <ashish.yadav@infineon.com>
>=20
> Add documentation for the device tree binding of the XDP720/XDP730
> eFuse Controllers.
>=20
> Signed-off-by: Ashish Yadav <ashish.yadav@infineon.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260529054218.5184=
-1-Ashish.Yadav@infineon.com?part=3D1

