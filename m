Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5A452222A9;
	Mon,  5 Oct 2026 12:32:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203540; cv=none; b=nniQIkw1sr66aEJoAda2m9OgsLmXfwbP1x5yd4cx/xTqBQ3hPHLt8Y3/m9+AVUxJ3yrM4DIeX0AtAwMpJeaX5WHg40KkgkrtjHfXsA4m3p23E0mxzl8Ru6vrkuZC/sEku8I6ozFbPulmvcf85IpPrFtmksndnZRTXXAMidauUdU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203540; c=relaxed/simple;
	bh=RSSXI2hFmbYD+83gGgBTuwiIUh8LuKhvfuTW0fpBYg0=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=HrB8XivqD5hLVYIUcrm6umnV3fqJKveLSOX1npK6JReMugcm0dfdaQlhGQzGHqRUXNw0+5DpGZD2OJe4xseRZfgDG4tUfro+edMC/DiN2IzLW3euOW8pRDihe14OPZNVXA5sJfMDlm+o6NFK4DcNCc1QYbEvMG7UVq152Ijuwcg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=ImY34Bwd; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="ImY34Bwd"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3BAE21F000FF;
	Mon,  5 Oct 2026 12:32:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791203538;
	bh=RSSXI2hFmbYD+83gGgBTuwiIUh8LuKhvfuTW0fpBYg0=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=ImY34BwdYuMPezWMRRkmuJ2BGgq785cCTE1w76Kph62++MFICJpXy44q49Vdbwnhr
	 T/qyuMA/YnULH2J0TrjxIAsCMM/PhEJql8ur2PEXlT34W1/HJr6lXLl9W5EYPbs2Am
	 xGClZjZ2vj2p3N1DfKidgjXy7mAwLFLgwX4eI5qTpLKQaLFZVDRvPUm2tiS7h9vDMc
	 gc1bmOv7WQEaUK/IfPoi5cS1CJKb6vDM9Si4IfvUoikgzRKrT3W5jwcOyjqNjZWLxe
	 6wjwdIZWyhNOsOulrTYgzKcOD0NMzZG5CKCe5o8OUGGeNoco2EvTfBTrNK+3dOJDdf
	 DUy8AV5h2vqNA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 01/12] dt-bindings: hwmon: Describe Qualcomm BCL
 hardware
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, lee@kernel.org, mfd@lists.linux.dev, robh@kernel.org, linux-hwmon@vger.kernel.org, conor+dt@kernel.org
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-1-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-1-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 12:32:17 +0000
Message-Id: <20261005123218.3BAE21F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Qualcomm SPMI PMIC BCL (Battery Current Limiting) is a safety feature
> that monitors battery or system voltage and current to alert system
> for overcurrent or undervoltage conditions.
>=20
> It provides:
> - Real-time voltage and current monitoring
> - Configurable thresholds per channel
> - Hardware interrupts when thresholds are violated
>=20
> Add a devicetree binding to describe the BCL on Qualcomm's PMICs.
>=20
> Add sensor type to SPMI device list for BCL device.
>=20
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-qcom-bcl-h=
wmon-v4-0-50b9a8c730b7@oss.qualcomm.com?part=3D1

