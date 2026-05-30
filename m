Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4F95F2BD0B
	for <linux-hwmon@vger.kernel.org>; Sat, 30 May 2026 22:17:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780179431; cv=none; b=Y19FJeYK4zrh/movqM8ZO4wZ8jwD8RJlNeIzTfEp3wVMrKgKUTL/CHuPszFA9gr0U+Z8iZxIPc6mqUqqiHJrJUXO2XYsXZcZYp5dmcD0itFCTs1bRBP3tVIj24DOhjlYl2fAwsO/atuyVSa6VA6iNoUecUUA4TLaFZ+lPQO+Hyw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780179431; c=relaxed/simple;
	bh=PKKYhKjdG5AMR8tXhOyaO/RqW2LSVDiYD6Ns0GgTevQ=;
	h=From:Subject:To:Cc:In-Reply-To:References:Content-Type:Date:
	 Message-Id; b=hLEIrdO97rPBQQE4htuahUpNxpLA/P9WjvoiaY8TjA486z6Lg8U48LapqHEqVtLt6MWPVTDAAEAnh2a+9B+X7+6W5yiM4qziLCDhHwneFqDf0hcVPma5ZhdBDrmV0VzPfVEylI3LyQKGm7MvZhYcx+RanvakUXG8Ut4DLQ3oinw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gLyMj06O; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gLyMj06O"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CA0DC1F00893;
	Sat, 30 May 2026 22:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780179430;
	bh=PKKYhKjdG5AMR8tXhOyaO/RqW2LSVDiYD6Ns0GgTevQ=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=gLyMj06OwPXBwpYqtYBOgfkKIv+MSSwy3lgM2vH/yB9mLTal2nS3EcyW6H2dO8Cfu
	 PDflMMxDfubNMSqG7CBBjaijbaYGCEFWXfLF/xXEbAtO6yiRyVKDI8gz7U778M6fzD
	 fn+ItHPnw/xad+Lpygx1X2/RLhT2bJdlOXIxXP4yHjFnlPygJiH7OuFS5zRKc7eHQ4
	 +7Rw7fYEEE1pu9aq7fIE3oUT6Zaxi3LpzHE/qmDV/HvQnzeBPKL29A+M70I63xAC7W
	 AwOY8avH1EmF+XckNqOhzsQd6TY4UaoCojOlBauhUE+OYzuh+kpl8/GTG7mo+1icA0
	 Eo46IxwbZqIEg==
From: sashiko-bot@kernel.org
Subject: Re: [PATCH 1/7] hwmon: drivetemp: Use zero-initialization instead
 of memset()
Reply-To: sashiko-reviews@lists.linux.dev
To: "Manish Baing" <manishbaing2789@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20260530221353.159461-2-manishbaing2789@gmail.com>
References: <20260530221353.159461-2-manishbaing2789@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Sat, 30 May 2026 22:17:09 +0000
Message-Id: <20260530221709.CA0DC1F00893@smtp.kernel.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>

> Use empty brace initialization (=3D{}) instead of explicit memset()
> to zero-initialize stack memory to simplify the code.
>=20
> No functional change.
>=20
> Signed-off-by: Manish Baing <manishbaing2789@gmail.com>

Sashiko has reviewed this patch and found no issues. It looks great!

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20260530221353.1594=
61-1-manishbaing2789@gmail.com?part=3D1

