Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 51F0144A3F1;
	Mon,  5 Oct 2026 12:31:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203495; cv=none; b=cZLJ4zHZksYONOAMmp8Z0/j4FuLjrhXCE1zLKdJ/EmAzmqhwKHD3PRrl7rbfPkzlVkjGYE+QS2LPVPzLZJ1tKVVRvci0fCs4E1TSjeLY3efyV5v6ig/0Nfo2gliLZtM/sDUMWacArL8+ACZAJsy3xHJ6xVFWgL0OxCPSeHJsA58=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203495; c=relaxed/simple;
	bh=p3BXWsQEEeDyT9c1Z06l+S7KentoIp6c2XoQAmh2ccE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=t8enUJR58cwJIckIn6Lh+DLxgp4jgnv2lJx5Qly7dJHLFTZwJE4rQLP4gBtBwKDwKCpuIOc0hsjOP2zEnyQZhFEJ/JQ1Zv3p/a2bnHhKVd/fHmZceBf5xkCQOIDJUN09TzEzsl8BFjkRXYcqtmfUpzWJDW7WIZzWkvC1vSXZn5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dVpYVFkm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dVpYVFkm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 325511F000FF;
	Mon,  5 Oct 2026 12:31:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791203492;
	bh=p3BXWsQEEeDyT9c1Z06l+S7KentoIp6c2XoQAmh2ccE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=dVpYVFkmvi2bxso/8c2nwHO8ovPuJgCUxCXp0fKcjYYF8C1cb++oMGNdM4peSJczm
	 SEeDeuANfNIrX4n+sVstqvKFy7JRmtcNd3OWgQjSvFhOg4/ZnWqBbMC6m/Hwapku5d
	 BfNdqVHIBVpUPUHOVUrXlX+ll2LayeJgega+w79JDKyKP+lj7yRSQSli4eMYd3MEtP
	 WUQuai8bjwAismIp3wxIymLLgxiM9xhsoeXGJUykcazvSDTVtNHoD343tS5yWfcUS9
	 nQFeODQNwV9OtBaAbaJAY6BU2PdJjKFCDrA+3rIxH7IrGsXQWtflIPT7giVn0ajd6s
	 L28dIEzu3YZKw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 03/12] arm64: dts: qcom: hamoa-pmic: Enable BCL
 sensor node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, lee@kernel.org, robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-3-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-3-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 12:31:31 +0000
Message-Id: <20261005123132.325511F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Battery Current Limiting (BCL) hardware monitor node for
> hamoa-pmic. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
>=20
> Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-qcom-bcl-h=
wmon-v4-0-50b9a8c730b7@oss.qualcomm.com?part=3D3

