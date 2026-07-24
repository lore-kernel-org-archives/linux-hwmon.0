Received: from smtp6-g21.free.fr (smtp6-g21.free.fr [212.27.42.6])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC19437F307;
	Fri, 24 Jul 2026 10:12:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.27.42.6
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784887974; cv=none; b=OVe/jDI7T710fXZ/+Ke9lBcngv4SP36wrrm8W7/fF6ohNyq705jiO4UVjcOuthZYvrfU+wLmRegUvIw5QQmjyHIsFqLGz9fvDtWMFCfmakYbcVmZa/JVbNQ/A7/mYJ/Ypk/IPKghJiAdvWgCoJKUhcjuVgsIDXDZ5yxmPkJqDtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784887974; c=relaxed/simple;
	bh=hIIvaisVUC2GY7Ja+JCVMfY8UTOeEw68ibuic5NCT34=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=i/gqJVAS4YOVB7gjzg/Y01WlvDAktTj9bGKUu/ZZm1uWiCAnBHwAfkGrDUOM8xK6FromAcR1oXI14j6jR8qnK9jA59xWNcMgFBDSh/rjP99jeQLG2uG+9GTa6RqarQbAMzGK+dK9atc2D5TP6eh5Mi0UtqxKYRRkawCsG31uY0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr; spf=pass smtp.mailfrom=free.fr; dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b=XoEpggZc; arc=none smtp.client-ip=212.27.42.6
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=free.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=free.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=free.fr header.i=@free.fr header.b="XoEpggZc"
Received: from L30177.local (unknown [213.36.7.12])
	(Authenticated sender: vjardin@free.fr)
	by smtp6-g21.free.fr (Postfix) with ESMTPSA id 107B478050F;
	Fri, 24 Jul 2026 12:12:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=free.fr;
	s=smtp-20201208; t=1784887970;
	bh=hIIvaisVUC2GY7Ja+JCVMfY8UTOeEw68ibuic5NCT34=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XoEpggZc3/CoXmn7cUmNfW80UDZ25xHha39dkIOy0/GGlo2+hefBpcXdYvqCd34Pp
	 3U5pZyHAM9+mE+2HByghFvB9WJ2KwvIbxCGYmVxW3AOmGqY9fGj08fv9eWqOf7bzGg
	 quA3SFf4pq9DPXYzrvYOxaLM9AlexP8J460D3Rae7j5w5o18kNzsZM5dSr0UPgTeqZ
	 yRgJGvaQnHR32R+Xb4/7gbDYP1fq733V3zegygfvu6HmnOP7jOpAvPbj+edl+D0Kad
	 B1qIW/SfQl35J/s6GPxqGWm9rNcYpINz+l6zrgPYF2O/P1wnE0L3/Wpg3sqW/j8x50
	 pnjGXIsD9tLUQ==
Date: Fri, 24 Jul 2026 12:12:38 +0200
From: Vincent Jardin <vjardin@free.fr>
To: Guenter Roeck <linux@roeck-us.net>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>, linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 3/3] hwmon: pmbus: add MPQ8646 driver
Message-ID: <amM6lniioiowPIPx@L30177.local>
References: <20260723-mpq8646_v0-v4-0-b6323d5fc524@free.fr>
 <20260723-mpq8646_v0-v4-3-b6323d5fc524@free.fr>
 <e3b1def9-a077-4247-b306-9c02d8de7c10@roeck-us.net>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e3b1def9-a077-4247-b306-9c02d8de7c10@roeck-us.net>

Hi Guenter,

> Many if not all of those commands should really not be part of this driver,
> and commands such as probe_page_write would be extremely dangerous and
> mess up the driver if ever used.
> 
> Are you really sure you want to expose all those to the user, instead
> of (say) force them to use i2c_dev if they really want to risk turning
> the affected board(s) into a brick ?

your wise comment is welcomed. You are right, when I check the rationals why I did it:
it was related to some bring up issues I needed to debug and I thought first that
it would make sense to keep them in order to avoid loosing it, but the downside/risk
it not a good way to maintain it.

I'll propose a v6 with a removal of a part and with a CONFIG_SENSORS_MPQ8646_DEBUG_UNSAFE
for a reduced subset of those.

Best regards,
  Vincent
