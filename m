Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769753;
	b=xc8UvoLlGLM5ok/FCzVjh5qoxb8EHPJ+WWI/oW0wBCqGKSb0Ldqy7GKK4TQy3in8se8e
	 0Igux/FeuIQtxTMsKf8LLpV1+uVzlQXTy0lGIcwyTilpImhc5A7ftUpm283B/qTXGocIR
	 LRClMngC7FOvMnISJA92SJuqV/BNVk+4Y73BD5dScOK8EGlmUc6A5BuW2IfE9DpQ1Zdtz
	 KfjmqUZ64rVeTtWWun3G7gra1PgnDZiT0JhwokoFQOTp0hanT7JUntOSEYh9ginGa75uZ
	 ll4eNxE7LxIH36ZW2wktjGHutAOJZKQeld8XdVrXXMycR81/vhLjx7E6VL1YyovKJnw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769753;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=y+TKmWem85soT+k9aHjz2cic7kNG+pO00qCXpm5hJYU=;
	b=Z420FPeo8AIZLXu76Wan3JI1XiGVX0oUyFGuEIHfl/Hfr5/0f6ll4bviebG0xqrqj30e
	 7cenGc7vmfMPz+ECeLdX8QE2PrSaZVxRBeIcBtFP36YeoSwPcoOr+99Gf5HQTuQot1PKb
	 zLCXRpaoldmX/Rd3uv86/owo3aDu00NT8BLysMyITkcLOXuEPGyKS/N1uuxqDgWeHYcVN
	 +TjYN3ARzO/F500Ll34e31xGCgBxJiDs+Te2uEL6bionmFFENGx+8DU/FqkT/gYdXyl6K
	 1GPsvXRfvg1t+3hPcoGUpm4NcSiUgpPVnzTmzDi/YSGhiryRMtCe7krelzTENvhHX8w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a4Ac3qQQ;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4468606A324
	for <linux-hwmon@vger.kernel.org>; Fri, 27 Nov 2026 08:55:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=a4Ac3qQQ
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CE821F00897;
	Fri, 27 Nov 2026 08:55:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795769753;
	bh=y+TKmWem85soT+k9aHjz2cic7kNG+pO00qCXpm5hJYU=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=a4Ac3qQQFGnkdm7l9MUQv7tTUfEf38p5rsv+dADud8jPMbrDo+dstyFZqZe5TfAzS
	 EKV9hegBd1bLu68mQQSlidg4swxfkXZf2vKoz3C7PvTKBqnxCiHyZh5VV0TSppERiU
	 PR6Jb7ETRdJAigstNcfnFVAcRf1kE7LkrKhl4R171A2QP2S91D7UDqTDI61Lbl1O42
	 pEtlRWCJsR2u87fv2f0TiOn0+PPXQWNRsfAZ68rEq7vRo88W885hdv4xh4V4mhqpRu
	 Rl9iF9Zy73Y431fH4j+p3MS6/+nwhtcCdG2+ryrSOlZYmsEAVm16L+7mSWVuD+3c1+
	 gDpIbm0tTS5Qw==
Message-ID: <sashiko-outbox-236924@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v4 0/3] platform/x86: dasharo-acpi: Add fan control
Reply-To: sashiko-reviews@lists.linux.dev
To: =?utf-8?b?RmlsaXAgR2/FgmHFmw==?= <filip.golas@3mdeb.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261127084910.3355833-1-filip.golas@3mdeb.com>
References: <20261127084910.3355833-1-filip.golas@3mdeb.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Fri, 27 Nov 2026 08:55:52 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 3-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261127084910.3355=
833-1-filip.golas@3mdeb.com
