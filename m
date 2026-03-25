Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E2EF30E0F5;
	Wed, 25 Mar 2026 08:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774428382; cv=none; b=NntSjz5/C+5GnRwAnw8YFC5zd0xSUwHH/1ObufEeQ9t5Ha0iInh4huELgc06GjoeJJDCtdn8xpWowSjufM+S8p27tKDTcJPTYEeHT1C9pJxHipLF2MhrQDaEVReZ6HkEbcv7XBeu4XKXU+oujIDoVqY1aVB1uk9fEn0V1pP3s/0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774428382; c=relaxed/simple;
	bh=E2NP1amvmTMmHBgDk46zjcTyXHebf5t6moG3MOEqpg4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ShAyozfursmkDDV6lolKifFSbPYRZeD0+OZleQ9WGyj1B5sojSV5MG8Vc7PwPMmliIyBFC+AAYC1ccLr81O8s6NLaJXfumBI/B6BRDgaGWOPIri0VZuTTYmsYT/Q95SGqBB/05rgyrtB3ot916BHEiRZT08cfjvFF96Ei0Y+tkI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=dyjCAdhH; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="dyjCAdhH"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 64EDBC2BCB1;
	Wed, 25 Mar 2026 08:46:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774428381;
	bh=E2NP1amvmTMmHBgDk46zjcTyXHebf5t6moG3MOEqpg4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=dyjCAdhHlxjpJhy4b6g5RtlaB7iZEe8i48n8yvAaSCPYzntY9WCjx4fmUFRsDOTj+
	 Wz2X00iTB0d+BN03psl7sqh0lEUxrAZqgp61o1WcM3jHyVGZDcoEFZMYwaLeeYPHTY
	 KXvDUAALCWZrILBG4YKGht0/1pcUI6B2CLYQbSsITJWJm0Xr48+1PV54angU+BpDKn
	 h1pcT699dKGUS8io8V5htQzNVAN2VkUOOK2Cfvy9aTGoubDo0S82Lkv1MQW3sqF8eS
	 ZrueukkybvmD+hPGC5BLACLVbhAxkGIeJH8hOvoAd60dtt2XrcWZWalI52pIQLMtoI
	 9/tHzZrQImvRQ==
Date: Wed, 25 Mar 2026 09:46:19 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Zaixiang Xu <zaixiang.xu.dev@gmail.com>
Cc: linux@roeck-us.net, robh@kernel.org, krzk+dt@kernel.org, 
	conor+dt@kernel.org, linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add GXCAS Technology
Message-ID: <20260325-flawless-squid-of-attack-ec4bb3@quoll>
References: <1774354869-119736-1-git-send-email-zaixiang.xu.dev@gmail.com>
 <1774354869-119736-2-git-send-email-zaixiang.xu.dev@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1774354869-119736-2-git-send-email-zaixiang.xu.dev@gmail.com>

On Tue, Mar 24, 2026 at 08:21:06PM +0800, Zaixiang Xu wrote:
> Add vendor prefix for Beijing Galaxy-CAS Technology Co., Ltd. (GXCAS).
> The prefix was confirmed from the manufacturer's website:
> https://www.gxcas.com/en/index.html
> 
> Acked-by: Conor Dooley <conor.dooley@microchip.com>
> Signed-off-by: Zaixiang Xu <zaixiang.xu.dev@gmail.com>

So my tag you ignored... not that having that tag matters, really, but
the fact of ignoring actually does.

Best regards,
Krzysztof

