Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793571369;
	b=1+mX+prkf3JaXO+VQ6T3Qy8Ya+XrKdfBAnje8l0H9uPy2yDNMeXKDdMT1BEzatClq6E9
	 FkToUXoROcGUyiDeh/xvOUNeP4JjGgwezGZzgjsl4xD7+LU+UMdhiMCKNZh2flasA+6eP
	 ab6H+yf3PwVZ6R2jsP/fed1XQLfJro/QwZioe/qb9eWp0a/LpoLb37yKMOUf7vP3+3iMA
	 uT/LW0La4woPHOPz/tkYi70HpK3odLvOWg1Tz3IbfIwOQ9gbG31AAs6VWUKFMV5cc/gLT
	 athvhCPnt4vLFIE7pyfKjPiSFTGA15hMnOJudzoCDfWt/FXrbRAqYkvEGvELXIcPyaw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793571369;
	h=Received:DKIM-Signature:Received:Content-Type:MIME-Version:
	 Content-Transfer-Encoding:Subject:From:Message-Id:Date:References:
	 In-Reply-To:To:Cc;
	bh=vCDTgXmNdZpXo/0XlosOEnTra+3QhReNszYgcwXHnsI=;
	b=jpLfT6CZu0B9VYcxFJxOAUtvPsPQILbJKYeL6gowZmeZB0TIAwA4+ZHvEAgCsPNGSbSC
	 eVtMMoXw3CdWk4pMIg2OhrnzNCKwi8LqUp3feOn2SAAm2eU1dmv3GYjwJ4wsOUwAWtb+x
	 ZR87KH6YV9DM911sBlPBD2qmwnqfrkcgidtLAORhj+5e2ZR1S4R5k+BlttkpTvZ2lj3Ne
	 28lluE4s+L+ZUik5iUi4542yO/uy4j9MCYUH77Q/R3Rgx3g1X+EOlvoV6vd5/Zavc67pU
	 ZZWTCrNTAizlGegoaYdMRX0kNGRccfFZDItbbt3/jROCa8k57gtaqkfJnKTvqgVhanw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cK0nCkLM;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B11860A381C;
	Sun,  1 Nov 2026 22:15:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=cK0nCkLM
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0CF6B1F000C1;
	Sun,  1 Nov 2026 22:15:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793571359;
	bh=vCDTgXmNdZpXo/0XlosOEnTra+3QhReNszYgcwXHnsI=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc;
	b=cK0nCkLMsfGPqd+i7ERdVzoSOgNLU7IQkd5eoySBGe8A5to+Hp8KyJpVnD1akztH7
	 w43njKBPU/Q4mVVCU8yqwe52m1EaP0EOhTJsWw6FNX1tDifbzMJAwfjITY52iY4mNb
	 Znj4iOlBjyq3OSfgRRFxB9a5BLWg1WV/5/0Y9kq8XisCQhlo5nluQa0xUC2zJch1Kn
	 Qkf7dkNTp8ffTwCFjIfl1lbCgDDafX2QSekT3rvIkeJr8mCdHB2vBEVLXwvezWFZ5R
	 EBmO8Bjp9c32zUjTXm0wQZ2AZDZ2WiG5m4C6ySvoVQlMxCJOE4fv7giCAGffuE2CpT
	 XxWYnQ1IfDeJQ==
Received: from [10.30.226.235] (localhost [IPv6:::1])
	by aws-us-west-2-korg-oddjob-rhel9-1.codeaurora.org (Postfix) with ESMTP id 0325138003B8;
	Sun,  1 Nov 2026 22:15:59 +0000 (UTC)
Content-Type: text/plain; charset="utf-8"
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v5 0/6] hwmon: (lm63) Add Sensylink CTF2301 support
From: patchwork-bot+linux-riscv@kernel.org
Message-Id: 
 <179357135755.2624073.2853911342168711547.git-patchwork-notify@kernel.org>
Date: Sun, 01 Nov 2026 22:15:57 +0000
References: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
In-Reply-To: <20260914-ctl2301-v5-0-b44b81cd2c3c@linux.dev>
To: Troy Mitchell <troy.mitchell@linux.dev>
Cc: linux-riscv@lists.infradead.org, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, linux@roeck-us.net, pjw@kernel.org, palmer@dabbelt.com,
 aou@eecs.berkeley.edu, alex@ghiti.fr, dlan@kernel.org, corbet@lwn.net,
 skhan@linuxfoundation.org, rdunlap@infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
 spacemit@lists.linux.dev, linux-doc@vger.kernel.org,
 krzysztof.kozlowski@oss.qualcomm.com, jdelvare@suse.de

Hello:

This series was applied to riscv/linux.git (fixes)
by Yixun Lan <dlan@kernel.org>:

On Mon, 14 Sep 2026 16:03:52 +0800 you wrote:
> Sensylink CTF2301 is a system-level thermal management solution chip.
> 
> The CTF2301 is an I2C/SMBus compatible device featuring:
>   - One local temperature sensor with +/-0.5 degree C accuracy and
>     0.0625 degree C resolution.
>   - One remote temperature sensor for external diode-connected
>     transistors, offering +/-1 degree C accuracy and 0.125 degree C
>     resolution (temperature range: -40 degree C to +125 degree C).
>   - An integrated PWM fan controller capable of operating in two modes:
>       1. Direct-DCY: Open-loop direct duty cycle control.
>       2. Auto-Temp: Closed-loop automatic fan speed control based on
>          measured temperature.
>   - A 1-channel fan speed monitor (TACH input) for RPM measurement.
> 
> [...]

Here is the summary with links:
  - [v5,1/6] dt-bindings: vendor-prefixes: Add Sensylink
    (no matching commit)
  - [v5,2/6] dt-bindings: hwmon: Move LM63 family to a dedicated binding
    (no matching commit)
  - [v5,3/6] dt-bindings: hwmon: Add Sensylink CTF2301
    (no matching commit)
  - [v5,4/6] hwmon: (lm63) Add Sensylink CTF2301 support
    https://git.kernel.org/riscv/c/d7f7e577c837
  - [v5,5/6] riscv: dts: spacemit: Add K3 I2C6 pinctrl state
    https://git.kernel.org/riscv/c/97bd8165a3f7
  - [v5,6/6] riscv: dts: spacemit: Add CTF2301 on K3 CoM260
    https://git.kernel.org/riscv/c/ad17d98848df

You are awesome, thank you!
-- 
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


