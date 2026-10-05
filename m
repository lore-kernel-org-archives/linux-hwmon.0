Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D81047F3C9;
	Mon,  5 Oct 2026 12:38:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791203913; cv=none; b=ppT5KOwAJruWZ4IciPPN676ApBE4MJ2BpzdFfWGfXTSTYWayYbOdQbO8/j/bRkBRv8iM+ynYAHQWfTmUigmc6j7ywgvMo0nO6fP/fhszFdS5k33KQnTLioCZdyZJb3DwgFZOQ5ssz639Dv553sfQ/6TTfQ9tpNE/u/ZiGGKiFpk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791203913; c=relaxed/simple;
	bh=FgZ2YAMb7rmjurpa71IA8Hvz2EuDJo0PdBxxYTgCuNk=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=sacn6tGJyIhZZe0jlqVooE/Iv0w6hQUTi2uhriIQZ6KA6gVufHkWMA+bY8neIl9Qcb2t02FnbTV0H8ARdfmHK8vW/v3oFHU+w1V8IfaC4xgHewFGOviRpECmFEx2dQja8M6UDuSnhtLADtkzmqK5mAfadu/XpPU0GyzPc8HwTZQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=RavI4QjI; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="RavI4QjI"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B70201F000FF;
	Mon,  5 Oct 2026 12:38:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791203912;
	bh=b+4AGPgXz2Ejl0t7B7SduNvlTzyPXxGmYd+U0k34dUs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=RavI4QjIUyUYkldL23ubC9aM47dy7phZGYVHw0+a1RzLOdbLsFhWKKbARxJqcQw0A
	 Ek+2cRirD3U1BM4oOBpzAxz9ItSifPhiAcXMyYtBVqRd48vcwyCj5E4F850yJ673cp
	 22KrJ2sigZJnytKac1AAj62JbsiNa8E0qfzan5VJo+BLQxYZFRThpYLFkWHS5jTLj+
	 xf/zgerhdIh0+psZDAddJ0/q9YalSncf4l8M6vz1s64ib3NfUhMUTQFkVKt157/yH/
	 JQojhx/wQywhIJpQJDi+GWU9v5tkVf1LHjGOkSkepIyZngq2QTQ6rSs1svhqlFYJNy
	 3XmQxfsIUfM0A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 05/12] arm64: dts: qcom: pm7550-eliza: Enable BCL
 sensor node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: lee@kernel.org, robh@kernel.org, linux-hwmon@vger.kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20261005-qcom-bcl-hwmon-v4-5-50b9a8c730b7@oss.qualcomm.com>
References: <20261005-qcom-bcl-hwmon-v4-0-50b9a8c730b7@oss.qualcomm.com>
 <20261005-qcom-bcl-hwmon-v4-5-50b9a8c730b7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 05 Oct 2026 12:38:31 +0000
Message-Id: <20261005123831.B70201F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Medium] commit message contradicts driver feature support (no current mo=
nitoring)
--

commit 8447c9c53d332d6bf1a3b16dc8c50ad9c4dc3576
Author: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>

arm64: dts: qcom: pm7550-eliza: Enable BCL sensor node

This commit adds the Battery Current Limiting (BCL) hardware monitor node f=
or
pm7550-eliza. It configures the sensor at 0x4700 and its associated interru=
pts.

> Add Battery Current Limiting (BCL) hardware monitor node for
> pm7550-eliza. The BCL monitors battery voltage and current, providing
> hardware interrupts when configurable thresholds are violated.

[Severity: Medium]
Does the pm7550-bcl actually monitor current?

The driver definition for this compatible in drivers/hwmon/qcom-bcl-hwmon.c
explicitly disables current monitoring:

drivers/hwmon/qcom-bcl-hwmon.c:pm8550_data {
    ...
    .curr_mon_enabled =3D false,
    ...
}

Could the commit message be updated to accurately reflect the hardware's
supported capabilities?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261005-qcom-bcl-h=
wmon-v4-0-50b9a8c730b7@oss.qualcomm.com?part=3D5
