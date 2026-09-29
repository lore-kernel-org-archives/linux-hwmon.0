Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8304A526A82;
	Tue, 29 Sep 2026 13:17:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687841; cv=none; b=umbd8RxIIblMkA4G8dQsPezKvMWnOqn9RyLyE/bu1zqBK89ZkwjiAaJjwbT+63z6wHcstDjUId8mHUcJj0zGIr9gGTrFMO8uEJGrFJ9IShdlhBUsh+bUq2ysV+vXdvKD8dQoH5/G0RqNjTcv42ry8QKys6WoEJac2jatdzAOpjk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687841; c=relaxed/simple;
	bh=x9/VsMubYpEpfVukvSHw9SkgiKka+HhHAdDaFZo8/c8=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=iPLlnkQm2ngnU+wMiiX2rjjPZZhL1a2L2Kk9zFcg6Ickk/ycEuoUqgSmFEBq/DDJBQ8C8aHyBjP+PwJ3uPoI9W5+UPaYIO5GdNKMBlKiC8OPAsjIELOszh2Q8D0GFI6yv0q69cWlK6J/2CGKQJGSNCownfn+ZIZ7NykT2vH9pKs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=FwO87NgU; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="FwO87NgU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E68681F000FF;
	Tue, 29 Sep 2026 13:17:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790687840;
	bh=x9/VsMubYpEpfVukvSHw9SkgiKka+HhHAdDaFZo8/c8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=FwO87NgUQ6+anXV2tJ6/7hk0FbOc0VkkzN5LPDZLmlKJ+qW57SERBHcHCxE4Y1sqW
	 Vr5N1Y6ve6CL/xBiD+Fa/ZgJTjEPIxKOxydYT5v40BnglpGMbiPIvhy4T0EO8TbHd3
	 4F4F9MiFM/CueEasEeeYtOCmnpab7WskJvdsGWbYszQhs6EEnvu32Wb7bY+QOjHqp1
	 kNQ6fOBmiUkJxfOlt2T6n5ZsDYBcJkVe+rToe/o0Ugx+/4HJYlAkq8oqL3taHl0XXv
	 E130x1PiBsYBkqBktwpfNU40bHJriiF5mbpQcIu4WPHBThDZFiGbtbpwVhQOWUlT1V
	 Z7pv3N5c7pWRg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 04/12] arm64: dts: qcom: pm7250b: Enable BCL sensor
 node
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manaf Meethalavalappu Pallikunhi" <manaf.pallikunhi@oss.qualcomm.com>
Cc: devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org, lee@kernel.org, robh@kernel.org, mfd@lists.linux.dev, conor+dt@kernel.org
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-4-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
 <20260929-qcom-bcl-hwmon-v3-4-f5ca00889cf7@oss.qualcomm.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 29 Sep 2026 13:17:19 +0000
Message-Id: <20260929131719.E68681F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Add Battery Current Limiting (BCL) hardware monitor node for pm7250b
> PMIC. The BCL monitors battery voltage and current, providing hardware
> interrupts when configurable thresholds are violated.
>=20
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qua=
lcomm.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260929-qcom-bcl-h=
wmon-v3-0-f5ca00889cf7@oss.qualcomm.com?part=3D4

