Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BC7ED36EAAD;
	Thu, 11 Jun 2026 07:50:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781164228; cv=none; b=fnfKjO7dPtYKByv9F6pcYCnwFu5J7xdfgppALnFx5F4tzdF9LH7vB84HeV+TFHXDhlS6yO2yOQkL5Wn/YlGYyt+noJLHmCbsETTtMQKkGywZNx0Jh1SPD/beCzZJLBH684uOvO34U/shiLUn0JKQo4klaNUsy4P80QFpMHaIA0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781164228; c=relaxed/simple;
	bh=vn0S3RJZEo9beXmiKqFTCgLVnRmNtNsXuJ9FXJwgYwg=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Mp8rxmcmZ3OO3ZH7utP+bKFhTfFB7hW4hdiJyOS8hdT7s2BvZq2bC6pFZA27G8D+IFqHF5kkRybTQiAlgvFCgD3BdFpf3acPePjTAyS1bKE/tvQUghNp9SYPxL0AuGqBPeOa9FVgDKCEs3jKDEg4+AA0wEDUeajYpDLDK8sEkw8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=m199VZ6l; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="m199VZ6l"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27B761F00893;
	Thu, 11 Jun 2026 07:50:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781164227;
	bh=vn0S3RJZEo9beXmiKqFTCgLVnRmNtNsXuJ9FXJwgYwg=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=m199VZ6lLawFFI9qnzJz1kNoIZx2nbhft7bNRANRIQ0hRoeNLyC5iAW7IlnvfZf8X
	 3IFxY/uosXZoZatqXWla3ws+pU9cNToFdtty1r/ABinuMWa+Fv7MywUe3NhSypkNn7
	 BjJsvy2nAz5gV4eTxSV8LG6JnOs4X8peUlw3NR4lTO2L32HsGSajo0tmsgqa7K/kC+
	 nsZnDB6T/67nDWkZe2v1LGDGyPFUdFbZrXxw4pehdPJYiw8UUIQT94gdC6/dAVTQGU
	 o+O95vfz6viG0YtLntXj7j1qNbWBr0syonUCes+2Ra8PUNj+MgnFi7KQeWopim1CEV
	 UNCqwTQt4fC4A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v3 3/3] hwmon: Add documentation for SQ24860
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziming Zhu" <zmzhu0630@163.com>
Cc: robh@kernel.org, conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org
In-Reply-To: <20260611074335.4415-4-zmzhu0630@163.com>
References: <20260611074335.4415-4-zmzhu0630@163.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 11 Jun 2026 07:50:26 +0000
Message-Id: <20260611075027.27B761F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Ziming Zhu <ziming.zhu@silergycorp.com>
>=20
> Document the supported sysfs attributes for the Silergy SQ24860 PMBus
> hwmon driver.
>=20
> Signed-off-by: Ziming Zhu <ziming.zhu@silergycorp.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260611074335.4415=
-1-zmzhu0630@163.com?part=3D3

