Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB19C155326;
	Wed, 18 Feb 2026 01:20:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771377621; cv=none; b=lM166mInkaLlEZ8Q4aewqQiG33ptW2S0WWhQpEjJVV/M/sNAqv8mZG2ZN1t9DNfS1uFWhbFOKy34nZTnj1eMw7X5vII3vY12YBHMRDldzda5wA/5HGNgRrjgYaaMxtlNLHdBb/JZl7M0N0R4k/KytKzLqrYEfs2t50MVvgIGwfw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771377621; c=relaxed/simple;
	bh=qy52ZIlQspZJancDuphZlxvhIVb7+ZS4+OIYJWabm5Q=;
	h=Content-Type:MIME-Version:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc; b=qjib55rHz7W5KeuGDZh8sTBVa422IU5Q5oQDbO+GL+vH0DUJRt95dKrjIQQ8Ufze8pqr7/kLcmuX1rQdjUmSWRFpIdr++5+k6CZOqpDjeoVgKqfzwPMfyRmRe4tvVHu6tMGjuMQ4nHlk8+3Be6JmkUvNcq6vQ9/f+/AWIRrixb4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=WFvkNvD8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="WFvkNvD8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5AC7DC4CEF7;
	Wed, 18 Feb 2026 01:20:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771377621;
	bh=qy52ZIlQspZJancDuphZlxvhIVb7+ZS4+OIYJWabm5Q=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
	b=WFvkNvD8fQQqBcMaU2vrgBptl9eSucPp7jeqnNnFxks9RU++Ua3nIzwJPNcalWUrp
	 cXUiG1nuXSznOVfQPTMFSePkVEhX8desxEYgPYceCCkrqEzXoV7RbHOmVDRXl4sfBy
	 LJ8tD2XRpeL96YzHh/TmrLhTeEWi45qzEbvCzjOPEijw9bYLDqWAvoKiS0r8Ks/yyk
	 cOXz65dqe9mp/Zk03y83SFzDVs4sUOe3XCJ2nmYtcb4VYIKJkIBus78jMWjZia/sP+
	 D35gd+RjP5VxWyC7g3mK1hVF3dTZdNT4kRvD3R5SNMM2AKI2edwJETGA1nqhLjqvmw
	 pgNDal5f9taoQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 4803C3806667;
	Wed, 18 Feb 2026 01:20:14 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] net: dsa: MxL862xx: don't force-enable MAXLINEAR_GPHY
From: patchwork-bot+netdevbpf@kernel.org
Message-Id: 
 <177137761308.765825.17628642888135903777.git-patchwork-notify@kernel.org>
Date: Wed, 18 Feb 2026 01:20:13 +0000
References: <20260216105522.2382373-1-arnd@kernel.org>
In-Reply-To: <20260216105522.2382373-1-arnd@kernel.org>
To: Arnd Bergmann <arnd@kernel.org>
Cc: daniel@makrotopia.org, andrew@lunn.ch, olteanv@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 linux@roeck-us.net, arnd@arndb.de, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org

Hello:

This patch was applied to netdev/net.git (main)
by Jakub Kicinski <kuba@kernel.org>:

On Mon, 16 Feb 2026 11:55:17 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The newly added dsa driver attempts to enable the corresponding PHY driver,
> but that one has additional dependencies that may not be available:
> 
> WARNING: unmet direct dependencies detected for MAXLINEAR_GPHY
>   Depends on [m]: NETDEVICES [=y] && PHYLIB [=y] && (HWMON [=m] || HWMON [=m]=n [=n])
>   Selected by [y]:
>   - NET_DSA_MXL862 [=y] && NETDEVICES [=y] && NET_DSA [=y]
> aarch64-linux-ld: drivers/net/phy/mxl-gpy.o: in function `gpy_probe':
> mxl-gpy.c:(.text.gpy_probe+0x13c): undefined reference to `devm_hwmon_device_register_with_info'
> aarch64-linux-ld: drivers/net/phy/mxl-gpy.o: in function `gpy_hwmon_read':
> mxl-gpy.c:(.text.gpy_hwmon_read+0x48): undefined reference to `polynomial_calc'
> 
> [...]

Here is the summary with links:
  - net: dsa: MxL862xx: don't force-enable MAXLINEAR_GPHY
    https://git.kernel.org/netdev/net/c/458c95de5c55

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


