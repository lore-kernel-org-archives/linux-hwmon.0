Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2BB0642DA53;
	Thu, 17 Sep 2026 12:03:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789646623; cv=none; b=XsZjE9Bv8NpP7mHWWaP8VmEnhSso0SvhBhJkC8Qd4QbL42URVgO00VDqoCQD/xDcnM9z82PWcDnYRhecG1hKr5Jrt0KbXpBW0FJ+r421wfJeR0mi0ElW3yyaQ8POGIpJeB0wpv/8ZpAS+aXocFaqqp88Yc+OhwyjfisAp6ezOvQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789646623; c=relaxed/simple;
	bh=XRB6FGxq0H0Tv9JNC/IhVMkr+Rd4RE6GQedCvZC6g9M=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=fKJ03tH9H8aQNzhSlif1R823pRaE5A+ew14jt/US8JDgglnQ9acPunFece86DcbvPFHQLC4UNlyudYf6clH+IIwXvEdZGmxrzTjX3mLyKjkr1PhzZ361edpmzGjVmozxLTTmubsV0Y+742oDIFbqSsEgspF/V2la0DuSB2yLleY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=C4q0ZQbd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="C4q0ZQbd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F0FA1F00893;
	Thu, 17 Sep 2026 12:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789646595;
	bh=XRB6FGxq0H0Tv9JNC/IhVMkr+Rd4RE6GQedCvZC6g9M=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=C4q0ZQbdoRV+XPSlRn+GJjmqC56BeYDQzKQQj3HAucXrtD0DtektHIxFQSMmSB54K
	 J608K/tyan1iQhL0N8F7wAYEO4u0Ic92FlTRF7jTedbrEESa+4/fY8qXT1+5VwmYQB
	 sUfPDpgoeCuo4xa66YszRTCVEW4XIrPSVbaH0Uds0yh7ha+Uy5XsH6CvTh2cBUHnMD
	 1K2ieUuThna303TWyvLAZeYHbGnAAUpSetsA9FXwB0q/wq6Dx9rT5J//ws9nzaGFBP
	 EPOaRB+4X4r4PFCzfRStKvoGzz0gR7jU7tDrAB4sP4pTH8JLAbvEqdxpSO1YtpDmzV
	 bPcGufvha4FOw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/2] hwmon: vexpress: point the DT binding reference at
 the schema
Reply-To: sashiko-reviews@lists.linux.dev
To: Quchaosheng <quchaosheng000406@163.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, robh@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260917115818.540344-1-quchaosheng000406@163.com>
References: <20260917115818.540344-1-quchaosheng000406@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 17 Sep 2026 12:03:14 +0000
Message-Id: <20260917120315.4F0FA1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Documentation/hwmon/vexpress.rst points at
> Documentation/devicetree/bindings/hwmon/vexpress.txt for the device tree
> binding of the arm,vexpress-volt, -amp, -temp, -power and -energy sensors.
>=20
> That file only restates the compatibles and the label property, which the
> arm/vexpress-config.yaml schema describes now. Point the reference there.
>=20
> Assisted-by: LLM
> Signed-off-by: Quchaosheng <quchaosheng000406@163.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260917115818.5403=
44-1-quchaosheng000406@163.com?part=3D1

