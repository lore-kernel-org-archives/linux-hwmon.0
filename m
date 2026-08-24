Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4D5BA28B7EA;
	Mon, 24 Aug 2026 20:02:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787601742; cv=none; b=q0M4Upjq055S6Ed3Db7V07sgP+bUkhSPFycmaCjnBtGrssgjYH7MPsX1dAwfap+tbmiUDJJKToXnYk0N9+dnE1IAQO1JXpbYvv5doygIqOH/avkfK6XCyNzODE+9RehCtxYy7X/mee/46HS/exZ4TtYx2K0Ft2un7lP/Ow5fuHk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787601742; c=relaxed/simple;
	bh=xKJz+PQxSx8PTdh8sLsmCRbeI+HXMRgSsKNcEwPiK3I=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=jsZGn+htlbbR2PecgpHPfgLqTSPBgGiJaBbXgrnJjU8Wy1rVZAKQalCT8w/AZwJjRz5JjPjhjWhDmgtlg6Xtr2n+JDO6G1HFl11Uma1O2NqAZMCM3T3HLidfbUXaX1hXYVbuIAIOr0kNh+HAy+MWdBtKlvn2fNNpuVsW+olkfyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aR0mb7vZ; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aR0mb7vZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7CB2E1F000E9;
	Mon, 24 Aug 2026 20:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787601740;
	bh=sFnH+3VKErIZ+o8rx4T9vx9UiWFuKqm3kbz0pdXScLs=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=aR0mb7vZMj1cKeHD9wEyyZFokuo7imDSR3ml4RvnVkwKSQ+6l9OfyrDr3CQ4Vxcmi
	 TWrMQPNyI3XtoZZYpkYi59kECqSv1hcflqEI4MwrKVEyq+YfnUpLYtN3hGruG0aCZO
	 rHbFC4RLkdnKIF6mOpdUuRSpMCVwBJcmMQfepmEnxvxCmIB24BIbe2LOW/0FsOeWFc
	 tv1HqDpyJLEfN+ezOxbqwvju37N3kP27NFJC/KuNGoMOJ8rn3azsNNUMcjFs0IlNSz
	 zjiMyz09pFV1rPu6voC3vtTE1H7xresyMA4LrmgoTTZqCtoK/Odtv8VeDD5nz+wUns
	 b6VKJhOl4Pr+w==
Date: Mon, 24 Aug 2026 13:02:19 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Zinc Lim <limzhineng2@gmail.com>
Cc: Alexander Duyck <alexanderduyck@fb.com>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S . Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Guenter
 Roeck <linux@roeck-us.net>, Simon Horman <horms@kernel.org>, Mohsin Bashir
 <mohsin.bashr@gmail.com>, kernel-team@meta.com, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org, zinclim@meta.com
Subject: Re: [PATCH net-next v2 0/6] eth: fbnic: expand hwmon sensor support
Message-ID: <20260824130219.3985297d@kernel.org>
In-Reply-To: <20260824175059.2485048-1-limzhineng2@gmail.com>
References: <20260824175059.2485048-1-limzhineng2@gmail.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Mon, 24 Aug 2026 10:50:53 -0700 Zinc Lim wrote:
> Subject: [PATCH net-next v2 0/6] eth: fbnic: expand hwmon sensor support

## Form letter - net-next-closed

net-next pull request for v7.3 has already been merged, and therefore
the net-next tree is closed for new drivers, features, code refactoring
and optimizations. We are currently accepting bug fixes only.

Please repost when net-next reopens after Aug 31st.

RFC patches sent for review only are obviously welcome at any time.

See: https://www.kernel.org/doc/html/next/process/maintainer-netdev.html#development-cycle
-- 
pw-bot: defer
pv-bot: closed
