Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0031A4A07
	for <linux-hwmon@vger.kernel.org>; Tue, 28 Apr 2026 21:52:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777413125; cv=none; b=Z1+DWhXHEt89xrTAgoXlyPyyZmC1qoZV20hiJDNuxqhHu0z/HL7JZlOALK+i14/puOdO9zLbrpb/8LBYk6VVlTw+uge0jWAXeKiIo+CdVr1iMg8kcwHORfa3d/0tEBTma3YEKxj0A5mvK9tfi3+6X2U5HrZZqyxU2yFkt5htWVo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777413125; c=relaxed/simple;
	bh=Xamjdjwb1tDNPn9ltWGYSL0PzZqw3+MZ6USIBxoTCZE=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=CR3Z93qOjCOg0Rk/ND/QQ5ha6nMlz6rvLiCNQJwR1cHWmRgakrH+y+j9jRYObPRR2HzvzW1WUfHJnwfRHBXy7EL0GVRhkxCpuUgtZR2ahOvV7D3/QQrQxgassKpPrz1p4QT++QyVDo9/wiXaK7m6JSHtUSum1TrxQXLELmif/yM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=lym87kUH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="lym87kUH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CBE6C2BCAF;
	Tue, 28 Apr 2026 21:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777413124;
	bh=Xamjdjwb1tDNPn9ltWGYSL0PzZqw3+MZ6USIBxoTCZE=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date:From;
	b=lym87kUHrxN6/t2GjbtFi6Ehv8fFlutYJBSM1uK0jzwMalqzZ2x3uwHB8/cxCbBnJ
	 DWl/apvOLOUkFLGG4l9BskF3lq4zKyn7Wf5zgMDd6fYA9CXFu6g5CRBjtAvHkb2JAE
	 uC5PaH43UmaCnJnfS9KnniJHtukvGum8F1dPUxpiqIluveBAmXnq1w9Wks01w5m7G0
	 J0y6CmXByjJ7XB1Rv6MVITYVoaMnKIf0jyo6XnG/eIONBFVwEBM++gOv5Pm7Qg+t3r
	 blHwxvS/4ntm5tBpWA2kNTNCxcqga0Mr0HEVaAHfw/XLgbKtbbkqVyDaXueN00YWub
	 r/DNFZk82/0vg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v6 2/4] dt-bindings: hwmon: Add Sensirion SHT30 series
Reply-To: sashiko@lists.linux.dev
To: "Zaixiang Xu" <zaixiang.xu.dev@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <1777374569-59233-3-git-send-email-zaixiang.xu.dev@gmail.com>
References: <1777374569-59233-3-git-send-email-zaixiang.xu.dev@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 28 Apr 2026 21:52:03 +0000
Message-Id: <20260428215204.7CBE6C2BCAF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message fails to document the addition of the `reset-gpi=
os` property.
--

commit 525f467a79c77fd6f91d6d35fc10f95495902569
Author: Zaixiang Xu <zaixiang.xu.dev@gmail.com>

dt-bindings: hwmon: Add Sensirion SHT30 series

This commit adds the YAML devicetree binding schema for the Sensirion SHT30
series and GXCAS GXHT30 sensors. It establishes fallback compatibles and
introduces several optional properties for the devices.

> Use fallback compatibles for compatible chips and add optional
> interrupts and vdd-supply properties.

This isn't a bug, but the commit message states that interrupts and
vdd-supply are added as optional properties, while the actual schema also
introduces a reset-gpios property.=20

Could the commit message be updated to also mention the addition of the
reset-gpios property so it matches the changes in the schema?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/1777374569-59233-1-=
git-send-email-zaixiang.xu.dev@gmail.com?part=3D2
