Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3EDE44FE2C7;
	Tue, 29 Sep 2026 13:15:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687714; cv=none; b=ojifaNN8VJdMoc5hePxMMOqdbI4i2eSA8GuMRpqnQZ9sb+fz3wNbboIbI44ldtXK5IpFDw2saf5bJhvbtOjrzP0A5WuLX9HYG75toKpTfHARES6GZWCEBxJqZDuYA+jHek1CIY6XFR7kAuxvasIx8l0ck1sGo+HiMmz60oqtoAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687714; c=relaxed/simple;
	bh=oidDvYfrWPRCm5YiVQUZ+jje/UxBYX+kjA4pSLWAQxs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=QtpnqXbjAnWJWCp+vvVSgfNCbynIADwmp0Yei+qoI4DkhfwJyqQEqWpWTCdeztisT2UWgPcjo2dj+58hi2h0QICH3GOHrmVTJxMxz9t5+Bw5lKeRzKoT3fRqfUWoEjpZ+Soq461stOZAABXfcQKPYWgRX9ZOQ3ctxq9JNXC4xGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=NGz5VmhL; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="NGz5VmhL"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF5E91F00893;
	Tue, 29 Sep 2026 13:15:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790687713;
	bh=oidDvYfrWPRCm5YiVQUZ+jje/UxBYX+kjA4pSLWAQxs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=NGz5VmhLj49KhtAyb+cwzDnySpsDZDRyRYvk48900yPEq1Y++kqs0gykqveJ7ELP/
	 0917ssT+ilkUcYTlSiYlc3vfKVYp6Ddtv2mwXyQq3m5UNibrliTfV8IdRDafrSGpG7
	 W3HMub4FhOW/0Du5RK0ZvXONqrBoLvD9/qNYP735y1HC5q9zz1JOsjp9sP82ztucP6
	 izxLENa5smWa5FzOQUvQaepyvzEKdVulejvzAtnmqD6JcK3vBZmaZ/9MhqWQ1azuZJ
	 QjLZB8f2YL0CxAa3r5zhROiMH0Zt0nQIGh9lCyJlZ3VrMTZjB3r0NrkZOvhGhI9hH7
	 yg6gIMMo7S9Wg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 03/12] arm64: dts: qcom: hamoa-pmic: Enable BCL
 sensor node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-3-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-3-f5ca00889cf7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 13:15:12 +0000
Message-Id: <20260929131512.CF5E91F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Battery Current Limiting (BCL) hardware monitor node for
> hamoa-pmic. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.
>=20
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-qcom-bcl-h=
wmon-v3-0-f5ca00889cf7@oss.qualcomm.com?part=3D3

