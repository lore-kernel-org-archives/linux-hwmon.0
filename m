Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6BCA26B0A9;
	Tue, 30 Dec 2025 02:22:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767061362; cv=none; b=Zylo3R5nm37gI8bZ6MA2tXL42e1/ol6PR4Fi8RqhBMInoFumFYk2Ge3KfcRTf7dyt9f2s/YYqYygcOr1tpomJe55I0zxZawd4+rnnEigPpW0snQnpk9OuQYLNdyd9ohz6By5gnntp3Wu6NvRl72UYY3D+ZJ6EGdMjnymVa8D04w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767061362; c=relaxed/simple;
	bh=/psuR/3hwPcJXh/QxQDIWHYcRBOf2JQDF0tA2oZ5EE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ZJZK8+J/ky1Dw8iJR5aSjS5kO1xW1Sy4PvKV1r6riOlK966LNUVhB88Adzbgtai6c6tJI3X+7SqGxr/zO37OnUUsJffBoHQTbQ8Le+yf16cCbJI68Iy1mBR3FaUCIZzPUmoprO4AKh9fpEiBaSlJKEP5kAgvt3qa3W8j2WJenjw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EAkkOMjt; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EAkkOMjt"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00C03C4CEF7;
	Tue, 30 Dec 2025 02:22:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767061362;
	bh=/psuR/3hwPcJXh/QxQDIWHYcRBOf2JQDF0tA2oZ5EE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EAkkOMjtE/NFwqwLKKAWdE4xg1Nr453fHrv9QVVH43Hg5+P3MubD75i3BHxBcSSZX
	 foTwDCvNTSAAB9tLotyetesFJWYUIhfxy44jZxEV3EFR7cbCr9GBluN7WzUpWTSuKa
	 CIrAiqGq6c4JPcTFQOssiyfDelYfsv/O7b8EsSxJwZP5csbmWGb05DDkOFBW118XlQ
	 gPvfZfHAG7DhoGBBuoD4+XsWrZJt3F0iEP4Tmf4I3pVDMo6M6RXAW+Mo+CNKidWHh+
	 iAwD9Qfsqp8L6OcJsTbop8CxB3j4XTgrBjP9N96E4JsZRuR2LakMa4SjYdJtc8tzWO
	 sP13ghCLyxpmQ==
Date: Mon, 29 Dec 2025 20:22:41 -0600
From: Rob Herring <robh@kernel.org>
To: Akiyoshi Kurita <weibu@redadmin.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] docs: dt-bindings: hwmon: aspeed-pwm-tacho: fix typos
Message-ID: <20251230022241.GA3214066-robh@kernel.org>
References: <20251224083845.2727976-1-weibu@redadmin.org>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251224083845.2727976-1-weibu@redadmin.org>

On Wed, Dec 24, 2025 at 05:38:45PM +0900, Akiyoshi Kurita wrote:
> Fix "upto" -> "up to" occurrences and add missing "be" in one sentence.

This is in the process of being converted to schema. Please review that 
patch and check these issues are not copied over.

In general, don't fix .txt bindings. Convert to schema if you want to 
improve them.

Rob

