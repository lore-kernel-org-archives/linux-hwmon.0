Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6889727B4F7
	for <linux-hwmon@vger.kernel.org>; Mon, 20 Jul 2026 06:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784529645; cv=none; b=IqlmXTFKoLg1c/nZoUpLoWlHU3jwBIgIXZBbJ+74we4orDnc+Bzx1UH5wuG/ubNCV7IdruEDdv2quJfdaGIFBXFoqWDKfQTgghbidUEMVp648DNdHSzMF7MIduY6LaCyMfluvfSPRHCulqkuiCPRXYF/uRqvoytLyrS347kR5PQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784529645; c=relaxed/simple;
	bh=EsSZzDLlFN18gK0RDaqKsPEEM5JQ0GnlGCiE1IY82u4=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=a0mLbocAA3OtvjupcmNFgJMaB0gN8ZzkQl1hNdAFuyNXuLe2CXqTB2U0BwgI610Nq/j8almQ/Mi+pIScn4WffQf/ZEUTOf5ejrkb1zNMPgwkjZS6wjuTp2OVBoW9LkTeQ9yiouOwyeba7jMUywvX9vl/EGkSdXxKT3rLY5+qNp4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GDvrt2IP; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GDvrt2IP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C92041F000E9;
	Mon, 20 Jul 2026 06:40:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784529644;
	bh=EsSZzDLlFN18gK0RDaqKsPEEM5JQ0GnlGCiE1IY82u4=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=GDvrt2IPLKaBWFpiK65huMt9ouRzVNhOgKrtRpcbWThZMH1G/8xbC6lUyqeCsWSPT
	 xGEeRzQA4h7bFtBK9R4gRpGXiBsnxwcKBP2CHLTYmENR2XG+hdb8LM1AI4NrdpRkhQ
	 3vlSekQktQgupL7rkfPzizVoY8QfXIWa+Ad8DXXuWGHFyfTdxcztCZUXy8snc0GnUg
	 IEniEkA7JgnYwpH3RnQTg29HrNjPFcS0ZYMvESKJOzNyi+H3UFKpwW8yjWjqoYXd0N
	 xJ22CO0OChvZJdPrHj/xtKC009IE9W3W4fHBtccOhhWQ0NaRTTxVeRZxC3YoQFf9Uq
	 mxHvpnMgSp8Mg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 2/7] hwmon: (da9055) Remove redundant dev_err()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Pan Chuang" <panchuang@vivo.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260720063745.309331-3-panchuang@vivo.com>
References: <20260720063745.309331-1-panchuang@vivo.com>
 <20260720063745.309331-3-panchuang@vivo.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 20 Jul 2026 06:40:43 +0000
Message-Id: <20260720064043.C92041F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Since commit 55b48e23f5c4 ("genirq/devres: Add error handling in
> devm_request_*_irq()"), devm_request_threaded_irq() automatically logs
> detailed error messages on failure. Remove the now-redundant
> driver-specific dev_err() call.
>=20
> Signed-off-by: Pan Chuang <panchuang@vivo.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260720063745.3093=
31-1-panchuang@vivo.com?part=3D2

