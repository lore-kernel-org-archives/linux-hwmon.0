Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AC8F2DB788
	for <linux-hwmon@vger.kernel.org>; Mon, 29 Jun 2026 19:22:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782760955; cv=none; b=Gq5zhbhq5MPLJoBXpW1j4eg13UbgXtCn8aHsa533PAupNUuRXlrogo+CybDrNZyPwGo7iRL/MxFboLOD8lNWRurRefapVvijYxxvJP7oHA9baXG5j+z6CZIPL7agM3Kmn5SDnTOWjRBs9O0YaXEMElkRzcGPq7Ph3oltfZ6KdOc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782760955; c=relaxed/simple;
	bh=cFu6hbfjL4JDQ5Jr0yK16VMYJJ+PACDaw//qPWQJ85c=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Ak1tyRuC4FDEx95tVYexXduEMr6qeaEVihAtZkEy9PSYEAJyKGTecYSGSqyiBXxB0KU1mOxndmCuPwwWDxPmbKnVnwkByNk/pa88ckDu0NsZG6m9IGj0exPK40VEgfccK5Lr/toUnLvqSl6mXHhu/v/pEqvVArM82Tx0Mk0bjsg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nY7DaSor; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nY7DaSor"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F169F1F000E9;
	Mon, 29 Jun 2026 19:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782760954;
	bh=cFu6hbfjL4JDQ5Jr0yK16VMYJJ+PACDaw//qPWQJ85c=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=nY7DaSor+FHZcsj7NvzrTfuTQ06PhW47GV2nBgzilZtfPaV2ZNsrWCQCwy09EWbGB
	 FVcDYtitjQ1EtiRkzcrH1skDLfzhy+cDLF1Dv3WvfBr9Au/ZNS9c0IR3A2Re+5P/1Z
	 n5ghgZTx2BjgH4YJkriVMAsEVlm3ZM4YPLO4ay/xZYa92wXemSQpQ5RB5Z4Rr0214n
	 I0YWRk1ZpDtQ678swsDU9tWz8HrD+bti39EInkm8LLPqyvTYb8pwn20b11PougBsTh
	 awZNXmseGkq48/oYn/iy9z3L86pyq76tQZ4knvYJu7KSzDTbWr6znbwAORbPdugH+v
	 ZjVkPUKN4unSw==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 3/3] hwmon: (max6679) add missing 'select REGMAP_I2C' to
 Kconfig
Reply-To: sashiko-reviews@lists.linux.dev
To: "Joshua Crofts" <joshua.crofts1@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260629-add-kconfig-deps-v1-3-8104df929b1a@gmail.com>
References: <20260629-add-kconfig-deps-v1-0-8104df929b1a@gmail.com>
 <20260629-add-kconfig-deps-v1-3-8104df929b1a@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 29 Jun 2026 19:22:33 +0000
Message-Id: <20260629192233.F169F1F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

Thank you for your contribution! Sashiko AI review found 1 potential issue(=
s) to consider:
- [Low] The commit message incorrectly references 'max6679' instead of 'max=
6697'.
--

commit 232f529a8bd06a5a57ba2d3974e729ff7df2ae67
Author: Joshua Crofts <joshua.crofts1@gmail.com>

hwmon: (max6679) add missing 'select REGMAP_I2C' to Kconfig

This commit adds a missing REGMAP_I2C selection to a Kconfig entry to preve=
nt
potential build failures when regmap has not been previously selected.

> hwmon: (max6679) add missing 'select REGMAP_I2C' to Kconfig
>
> The Kconfig entry for the MAX6679 sensor doesn't contain a
> `select REGMAP_I2C` parameter, causing build failures if regmap

[Severity: Low]
This isn't a bug, but there appears to be a typo referencing max6679 and
MAX6679 in the commit subject and body. The code changes modify the entry f=
or
SENSORS_MAX6697, and the Fixes tag also correctly notes max6697. Should the
commit message be updated to max6697 to accurately reflect the configuratio=
n it
modifies?

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260629-add-kconfi=
g-deps-v1-0-8104df929b1a@gmail.com?part=3D3
