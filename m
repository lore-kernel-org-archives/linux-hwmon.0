Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B217343230F
	for <linux-hwmon@vger.kernel.org>; Sun, 27 Sep 2026 19:22:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790536968; cv=none; b=txLDG7ueYR8cYn+yymLAUhxC51aSlEWck6Sm5hHqyaXN51lqBgomC8Z2GWLQZNTmAnhlX5ZPAJpyxGnKbVBikLwU73oXdwvgUln/10EY7VtdP5ynas4jsh7qx/OoJ1ce+Fs7cpGYW2OjQNQ+aidtM9Nhm1xJNVAKBHFs5Q7nArU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790536968; c=relaxed/simple;
	bh=gINKRMpZ1myZM7YGFLH7V6ITRtfa7kiMlruHvbOHpQs=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=GEiugxTGEHRPesz/Fp6UZPNnCHd3mSG9nmxTlSoAzlIeN+kBNgD1fp10PxDtEM7qpEHHI4tlQsSEdsbhticOIEh2B6hiwHZa9MPdTt3rG6KOb9dF++seC5ndauQc+PdrbmN5kBHgkIlqUDyoOCEpW5+cHGBs4sre2rOkiHlwSkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=HwdRBrA3; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="HwdRBrA3"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1886A1F000FF;
	Sun, 27 Sep 2026 19:22:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790536967;
	bh=gINKRMpZ1myZM7YGFLH7V6ITRtfa7kiMlruHvbOHpQs=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=HwdRBrA3zpQsHtk4w3dsO26IZLWl2TA4M07aXLrId+DPbTo4k+HREs456wueKLsRX
	 hqeJ/xdy8nmSvBEuat8KZLyM4iKgkUN7Gtn+fQQBFnIGdrTj7fEnE53gi/nWpVMXHM
	 luQG3W9Wez0Zdc7EnGy3A/+WT2AW5FEf/NeAssXWjG+c9J80a2xwzJ/cthni1cwx/J
	 mgm8JC+35sHJAVs2JPw7w1UE5JFpqgSfmsR6Im6w8yd5dmrshghqDJxAP/kEDhkv8K
	 Vuv/D8x0ZPIiSNw3+x+D07qIcaSSM4jSGuKKNPTJVuyDuixsGBjHIRGQRAEDLqyqJG
	 uI6BpVZAHu6iA==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v5 3/5] hwmon: (aquacomputer_d5next) Validate incoming
 status reports
Reply-To: sashiko-reviews@lists.linux.dev
To: "Vas Zayarskiy" <contact@vasily.cc>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260927191316.4137752-4-contact@vasily.cc>
References: <20260927191316.4137752-1-contact@vasily.cc>
 <20260927191316.4137752-4-contact@vasily.cc>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sun, 27 Sep 2026 19:22:46 +0000
Message-Id: <20260927192247.1886A1F000FF@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> The raw-event callback runs before HID core pads a short report. Check
> that the report is an input report and that its length matches the HID
> report descriptor before decoding sensor fields. Otherwise a truncated
> report can be read past its received data, and a feature report with the
> same ID can be mistaken for sensor data.
>=20
> Apply these checks to every device using the shared raw-event path and
> check the report ID byte before updating the cache. Legacy devices keep
> using their separate feature-report read path.
>=20
> Assisted-by: LLM sparse
> Signed-off-by: Vas Zayarskiy <contact@vasily.cc>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260927191316.4137=
752-1-contact@vasily.cc?part=3D3

