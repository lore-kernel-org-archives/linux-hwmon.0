Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B54C84FB9DD
	for <linux-hwmon@vger.kernel.org>; Tue, 13 Oct 2026 13:02:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791896526; cv=none; b=hwh3R52tamu1O0Ji4TddRRE25bU/wiTnkXHVHwbgdmc9bE+brzSmBWhn9lhNScclcoMS770vC+WF0LQIZTHddpmNCSEfIzfshY+OyUKnfW8+/32RKUO6hFIKlHLdvTBFT8LReHIsJ+VzrL057LEvDLtrSjD+tIdtLneaDhy08oQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791896526; c=relaxed/simple;
	bh=WAPvlOE2G+1lV+5+XRcjpaBbmVXwSbsMl/w5LSE4MPE=;
	h=Message-ID:From:Subject:To:In-Reply-To:References:Content-Type:
	 Date; b=sZXKUdb17WmfIZtekAFxZoWuBnv+P96GxopwnxLSqhiKkoa3MY0gRIz/G97afrNT84dOcfNiWbA9GQCCMCtfwgMdQccPtLwZoGyalb5HDcxmFKUTJio1x5YwVz+puUV8JhZ1BGYY11QUQC/LtX2+i9i9LGUrs7mMcJhKMIyQJkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KCiVKXak; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KCiVKXak"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24DDE1F000FF;
	Tue, 13 Oct 2026 13:02:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791896525;
	bh=WAPvlOE2G+1lV+5+XRcjpaBbmVXwSbsMl/w5LSE4MPE=;
	h=From:Subject:Reply-To:To:In-Reply-To:References:Date;
	b=KCiVKXakI504S2mK7qRzJi6C7w6WJeAT4ZkOGeqOFBB2MhaxmgQCL+fdQuTFVsQ06
	 Ii8mer41Ul7mp1mfBl1YpwvpfzNQEUT+wnxQtK5g6YuekfhPtGcG7TM9i9Ih3foc62
	 M64ct9mx9xx+MzBYa15PONfCD1+DZYmLvGd3FQh6tUhRDQyqcxsEIptG1pYTMN/mKY
	 BMLC5F98t8L//+RusOhFLljXIXIyAJ/rWqilsrLNySxkP1xV6wU4cae3KJsKY0YFhN
	 FHksXx07hkrB6wTDdO4GODSw8y0uXLdbaAgutlJIRFuEkC111vY4WbhoWKOSYCCqY+
	 aZfHgxuMrxl4g==
Message-ID: <sashiko-outbox-169766@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 2/6] hwmon: sparx5: separate temperature reading from
 sensor dispatch
Reply-To: sashiko-reviews@lists.linux.dev
To: "Robert Marko" <robert.marko@sartura.hr>, linux-hwmon@vger.kernel.org
In-Reply-To: <20261013125735.1542349-2-robert.marko@sartura.hr>
References: <20261013125735.1542349-1-robert.marko@sartura.hr>
 <20261013125735.1542349-2-robert.marko@sartura.hr>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Tue, 13 Oct 2026 13:02:04 +0000
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Move temperature conversion into a helper and dispatch reads by sensor
> type. Preserve the existing temperature calculation and error handling
> in preparation for adding fan monitoring.
>=20
> Signed-off-by: Robert Marko <robert.marko@sartura.hr>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261013125735.1542=
349-1-robert.marko@sartura.hr?part=3D2

