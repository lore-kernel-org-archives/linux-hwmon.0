Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB3553F39D1;
	Tue, 14 Jul 2026 08:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784017425; cv=none; b=Suq7zYNwRtPP8JfXnk2Sw+XGiyvhY1C49P4fsyNlP0DRK4Ze1/bts6mGx+sWGOXuRwbXdZQeLeC24FWcc9hHEeg0VF8w2GXW5lju4t0QPka6Dt5IkUNDJBhINVjK/pWPw1F89eDzp8FNR+9Hed3PlpKhtLrPyWpcBuhms/4vTQ0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784017425; c=relaxed/simple;
	bh=Y0Qv4GmyCJwBPyPoOznnbiyGTDCnJfg9OpK6ExuHzPY=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=eep3+6DR3nSU3vtm+j2mCNBNiid3LvTBwgtyTxRTXi+3x/y3XBNPAheYtrU2ZJKymVTrJlz4+AMHf6l/Cu+wu2JRKhoMrTLee+/PH2FLyVdqXRQY29NH/fmIWj8jbUSyLrtf/t8Sr5labkosIbFLEMh2iOi18tvA4HfTQDbpHMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jrdXMzLm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jrdXMzLm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BA6C41F000E9;
	Tue, 14 Jul 2026 08:23:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784017416;
	bh=Y0Qv4GmyCJwBPyPoOznnbiyGTDCnJfg9OpK6ExuHzPY=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=jrdXMzLmrHG5F6EBOMdASjbDqngj6N8RUEE6ESknve7LOvxVo1LyzmYCDVedgkfQm
	 wucsyLBz6UCfI9ZeNDBXbT55Smi7zaEF1620lWyCwiSU+3vitffad318/zZu4VVEf1
	 1P16aGNlPWw3E0ziN//teUa615C6yT/bURuW0+3AVdDHeYWT5tAt3ajNnL0VcYqI8K
	 rzcTEZ0jRzXsznKRs9DQrOXlcqLZCkbndOYO5x5L5gQqZpjjAa2cjfIlnGRmY1uxLZ
	 TKM4toXCEEPrwPMj2PWJiMEMOIu8YUUqXVXb/ijCmqSluDJaobxz+J7SZmRuaBXLPN
	 qawA+kGOZ7I2A==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: Add vendor prefix for Kandou
Reply-To: sashiko-reviews@lists.linux.dev
To: "Andy Chung" <Andy.Chung@amd.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260714-kb9002-upstream-v1-1-8fd2f0b135d8@amd.com>
References: <20260714-kb9002-upstream-v1-0-8fd2f0b135d8@amd.com>
 <20260714-kb9002-upstream-v1-1-8fd2f0b135d8@amd.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 14 Jul 2026 08:23:35 +0000
Message-Id: <20260714082335.BA6C41F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> From: Andy Chung <Andy.Chung@amd.com>
>=20
> Kandou Bus, S.A. is the vendor of the KB9002 PCIe retimer.
>=20
> Signed-off-by: Andy Chung <Andy.Chung@amd.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260714-kb9002-ups=
tream-v1-0-8fd2f0b135d8@amd.com?part=3D1

