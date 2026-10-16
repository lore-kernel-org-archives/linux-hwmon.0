Received: from mail-106100.protonmail.ch (mail-106100.protonmail.ch [79.135.106.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A97CD1E260C;
	Fri, 16 Oct 2026 11:44:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=79.135.106.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1792151077; cv=none; b=FzcOIeUynh50lz7Xz0BO4AvBTnq/G18oHVFo4rI4Al2y1PVSZwuzU5qfqBwCIcL6aE/b8w5QDqVSTmGo6Ebo93SGqV1r/5QY369iYR4CRP1WbEJ5sKpTNXml6KdI1uDqZ1FobsLwO62Ib+bRiUUv2p9ymHvcFwzW+kcY6bwQ4cs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1792151077; c=relaxed/simple;
	bh=FViMjI5X4R4+An5gbut2kAXLO8XNnnS5Kr2ghGnb4t0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=LvZ9iG1hE29+nIS6KJ0m+9hHumoBAHPGKBYdHpP/SlqBQUrdrv8PDOpgyU/BSwkes9yL6F83rzvlR7h3XMXQCJ/dw3X+QzSUJSjY7YtyDnkNb8inN+vtw8/g8WdTBiF6JFLZkVPu4UGlJfgwK+DmetqqYpC6rBG0o8VOGhfKohk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc; spf=pass smtp.mailfrom=vasily.cc; dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b=gO8Os1I6; arc=none smtp.client-ip=79.135.106.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=vasily.cc
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=vasily.cc
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vasily.cc header.i=@vasily.cc header.b="gO8Os1I6"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vasily.cc;
	s=protonmail3; t=1792151067; x=1792410267;
	bh=FViMjI5X4R4+An5gbut2kAXLO8XNnnS5Kr2ghGnb4t0=;
	h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
	 Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
	 Message-ID:BIMI-Selector;
	b=gO8Os1I6CmmqFMDy9qbX1jNXuL56AK7JUvoUmWcH+Z1i5ny8dOHAqGnYxRfBjyIl6
	 oRWw8muO6Io8HFcFQE+J0U8H5Kh/2s/s3VjDwgRYgpiQtImZdpRVtF28Xz+603ZiDa
	 bdHt96nGFA5n197jiYAhwCnFPhGnHW7HLIky1x5JbKOou5VYlMjyeOccMnJVvxibsC
	 hMYZskiIYJWsi6FwjPZqS+vNYXxZvfjaQ1DBtZ3uVwp2IH5MVvN7Vb4uzNyHhdtXwP
	 IIVuKrhcDdRRJObnuD/YD5czR2wPsgFcb2L+DVFAoDpIxqkw+X1E8jkrfhaDMEdq9b
	 tcGoeAK3hpzLw==
Date: Fri, 16 Oct 2026 11:44:22 +0000
To: Guenter Roeck <linux@roeck-us.net>
From: Vas Zayarskiy <contact@vasily.cc>
Cc: Aleksa Savic <savicaleksa83@gmail.com>, Jack Doan <me@jackdoan.com>, linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v5 0/5] hwmon: AMPINEL telemetry support and shared fixes
Message-ID: <179215104901.3671753.17855362953462142874@vasily.cc>
In-Reply-To: <20260927191316.4137752-1-contact@vasily.cc>
References: <20260927191316.4137752-1-contact@vasily.cc>
Feedback-ID: 162318860:user:proton
X-Pm-Message-ID: 1c384780280e70cce90a1131bf316fb111bef493
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi Guenter,

A quick follow-up on this series from September 27. Is there anything
else I should address in v5 before it can be considered for inclusion?

V5 includes the power-cache snapshot fix and has been installed and
validated locally with stock hid-generic. AMPINEL support is limited to
read-only telemetry, as described in the cover letter.

Thanks,
Vas

