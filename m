Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3526A4071E8;
	Mon,  7 Sep 2026 06:58:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788764331; cv=none; b=qrrGXsDBhSnMJTteTKqJYUzUZDR1+2pL44qx2aBmIFvnYrX2XGYL0v2KOrDPg4LwfYDG0Q+68nn8DNXl5fn+MKzIivMpDsRlGSy5u8BxKTSDudE97nDmoRXznMlahcTPzLSCLo81xMjGXPP4H1YzZt+nzMAH8/e1uoQA0vmHPpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788764331; c=relaxed/simple;
	bh=FPFwqtQOW/UA1ce9Ss2fN/qaKfzXXeC/vIujgkLM0Z8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=qADnsbOocMj9b9zDRVaMk/cLQPP7mxrYwA/PuEXwsMPm4JmPi+dA3UYrniVU/iiFj/9+1QC5SeH3Pg6rpJJGPLZMm3S4C405ZMUtl5gnhB+JGpBW2G27/uN57r+6pWlue09y5esYXWpKqFjVSBmGWaGy+uzZIGARf446KPQEX44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=g01pUNI6; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="g01pUNI6"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5F1CB1F00A3D;
	Mon,  7 Sep 2026 06:58:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788764328;
	bh=FPFwqtQOW/UA1ce9Ss2fN/qaKfzXXeC/vIujgkLM0Z8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=g01pUNI6fJHT8ZfJkvobCx7zXUM8rL56WWgE29xv8F28AVzzc7VcG7QxZFBuTRZuy
	 49cuRMmvm39fVRCHUreMjwnLCXEfLNqLYzYi0HbwB4iSRZPxQx2FWXYZJeCDrAbrSr
	 JDCujrP6PPLeck0wR/GO85AWqAIqzUGJ16+KObHs6UYcfQfSGQrZ6HGtNCkAxct3W/
	 VQJZle+G47gsoEq7ZeEJZAoqhdqkbNIERm59a5IaZCfo89hVtmzZrYcHiNn8wrQm7F
	 VeGB6OpWRn0pvat95BCnbozDeMhVm2v4lCs/KLRQqBSqiFdJaAAHIOycgYnxAQb+U3
	 r6f343Q/v7S1Q==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/2] hwmon: (pmbus/tda38740) Add driver for Infineon
 TDA38740/TDA38725
Reply-To: sashiko-reviews@lists.linux.dev
To: "Colin Huang" <colin.huang2@amd.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260907-add-tda38740-and-tda38725-v2-2-1d051d63aa01@gmail.com>
References: <20260907-add-tda38740-and-tda38725-v2-0-1d051d63aa01@gmail.com>
 <20260907-add-tda38740-and-tda38725-v2-2-1d051d63aa01@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 07 Sep 2026 06:58:47 +0000
Message-Id: <20260907065848.5F1CB1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Colin Huang <u8813345@gmail.com>
>=20
> Add a PMBus driver for Infineon TDA38740 and TDA38725
> single-voltage synchronous buck regulators.
>=20
> Signed-off-by: Colin Huang <u8813345@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260907-add-tda387=
40-and-tda38725-v2-0-1d051d63aa01@gmail.com?part=3D2

