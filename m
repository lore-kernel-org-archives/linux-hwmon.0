Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 552303C3F41;
	Thu, 30 Jul 2026 21:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785447324; cv=none; b=ayAAorK9kQmQ8IGzVzB0geUMCEqVwSVkmKLQ6tf98/QKM+E8Z1fJwSKCpCZR7OcbNm2Te4V6H3WxHfrDsdCymREj67idKZaaAPfPNCaXsZHqJ1ggBemdE+hhnbbuDn25C6Dmg6ytBV3zPIlJExHzDw2sB9iuEPlnWYjU2+qQZUs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785447324; c=relaxed/simple;
	bh=JAYpMxRnVR2GVUbCPJxzomuiciriqtAQxZblo6Eb7sI=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=AFItImWrwx/21+mMU5ds2N1q/jGVw+ye38Jn99erS4mV+y4ymQ1zLXKNVdUUHZm3ht71lapmeQ2SArgtA3ywsZ8xraj+WfTUZ5QxJv1Tw2vICBaMxIncOkrM+WRg5sEMthuvW0eMy/bo4IX/YtPhbxPkziotXlt604e2ncwlc3A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=B72RxFfm; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="B72RxFfm"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D5751F000E9;
	Thu, 30 Jul 2026 21:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785447323;
	bh=JAYpMxRnVR2GVUbCPJxzomuiciriqtAQxZblo6Eb7sI=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=B72RxFfmA7vDaRzcDyr0TaUP+0DDgBynUSu7netlvRaxujrvqeHkqOJW2Z6sHxRkI
	 p4h4zB9oEtkqHUQyxUpDz7INNaeQxl6OZxP5Xrsl7NDXVvHF7F0Duxc/u+/14A8fHU
	 1/xzutQxEHpwrkTspq765mx+gITuEzI46ke8ymfcZUaun0xGsdjtuFiBHxQ6QNkUqo
	 OJOyiLYQQY5Yna+OibE8mIrRbump8RUlwKoszHVNgHiHFUctyl+uRK3L8h6I/taGet
	 Ud/N0IJnF+f0Y7neTz7PzAuCKyln1XsKjJWtkVf6nLGhzHnxBcQYrZHEkvlSqmPL+G
	 9bYaAbpVQbY0w==
From: sashiko-bot@kernel.org
Subject: Re: [hwmon-next PATCH v5 2/4] hwmon: (adt7470) Add ADT7470_PWM_MAX
 macro
Reply-To: sashiko-reviews@lists.linux.dev
To: "Luiz Angelo Daros de Luca" <luizluca@gmail.com>
Cc: robh@kernel.org, conor+dt@kernel.org, devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org
In-Reply-To: <20260730-adt7470_thermalzone-v5-2-42995a6bb8c5@gmail.com>
References: <20260730-adt7470_thermalzone-v5-0-42995a6bb8c5@gmail.com>
 <20260730-adt7470_thermalzone-v5-2-42995a6bb8c5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 30 Jul 2026 21:35:22 +0000
Message-Id: <20260730213522.9D5751F000E9@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Instead of a magic 255, use a macro to refer to it.
>=20
> Signed-off-by: Luiz Angelo Daros de Luca <luizluca@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260730-adt7470_th=
ermalzone-v5-0-42995a6bb8c5@gmail.com?part=3D2

