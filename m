Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A00B737C10A
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Sep 2026 21:23:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788297784; cv=none; b=GDlxORIT/fJuAADp+xKJXCmznUBASwnzcyo1RSrYPbyON3GTBTJr3r1csCoT/r6scylKxIlOAWNhWfCdwgpPF6ACw/jK8g9xgPP/h3wGQFhPrDwtmzpv1ZYwBxnGZc5SXycJDkwm/sr8MI+54h3dCVeBOlKr+e5UH1cXWxn0xJo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788297784; c=relaxed/simple;
	bh=+8LyauY6Ge6/rOnwrh5hz+tXLYS2RDa0Kn3qH421Org=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=Yus+Fb9aW3Z1oEoO8HFXRDTcwmftg+kYwTOyjv5fH75NVWM32xTYzr3TYPjw2uoM+kn51/t5hBJQJgZGt9clPAujbaOJyvEXCOF3LJer0gq4uQNjqt/ufTGPofWCDjmBSsTBvfaa1rZZnMZTXLtaGDMX4wktwyC+RUSsNe/VgU0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=IL+0iqsu; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="IL+0iqsu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B1EE1F00A3D;
	Tue,  1 Sep 2026 21:23:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788297783;
	bh=+8LyauY6Ge6/rOnwrh5hz+tXLYS2RDa0Kn3qH421Org=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=IL+0iqsurciDAQZ7TT1er2iqvKKrw9eZRudEDgG/ZWWG4gt8PIYiSdNKxpD9qfPIK
	 KsKKhsRg0LZuI9qaEBxA54zpSXQBN60UvC/dEtCUBEyUL7pUOi8DUUHPXMTJ9JzQ/m
	 rCSSM+kVneRU/1VuG/S0slwIATC0/OS0nV4qwVnkXjcexOhPPlT7N9a0HaQcn/tHDy
	 07604PJY7JDeg60vumorW1pAnn1f6jG53NjptSnOtw5wyKPI+hJ6X7tebJbBiOgl0V
	 QuHb0B/cEl7XoEmhQiOmLGpgSmAjMJh+i2UQjA38fNBGvhaDKs7IyBSx7bziaG2vdp
	 ucyq7jBia8x5w==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH net-next v2 2/6] eth: fbnic: expose all hwmon attributes
 unconditionally as read-only
Reply-To: sashiko-reviews@lists.linux.dev
To: "Zinc Lim" <limzhineng2@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260831212234.1212971-3-limzhineng2@gmail.com>
References: <20260831212234.1212971-1-limzhineng2@gmail.com>
 <20260831212234.1212971-3-limzhineng2@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 01 Sep 2026 21:23:02 +0000
Message-Id: <20260901212303.2B1EE1F00A3D@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> All fbnic hwmon attributes are read-only and always present, so
> fbnic_hwmon_is_visible() can simply return 0444 for everything
> instead of matching on the sensor type and attribute. This also
> prepares for the threshold and alarm attributes added in the
> following patches: they are exposed unconditionally and reads
> return attribute values.
>=20
> Signed-off-by: Zinc Lim <limzhineng2@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260831212234.1212=
971-1-limzhineng2@gmail.com?part=3D2

