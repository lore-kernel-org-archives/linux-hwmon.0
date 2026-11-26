Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795690799;
	b=hk5auFp0j2qWZZ6v/DzEomD9zMwXRL90WbbwfGrxbBC7WnleanVnKW6kBmORlug52yxc
	 QG1ybdwwT5iOUmDpkuXe9SmJnKdY6+rwFhQ5b6jgs7frSHJVp64Yj8WSJzuXFwXG/arqC
	 0PBhOJOoTMRgNAJ5sJ95BZ300vF4i3buPOKBcZa8lC1yurWydYU2Y70ZwcK4rO89MRPM6
	 6f6Apkz/CF/qr13MkZNE5ONN8lSq8NoWVXyL0ENXsruJHWBmniax3ijFUClej3nUYAj4u
	 wqpkHi8dYsXnY6pLgRNw3Mjcjq/Vt2iqr4s0mdFzh3XAJwr0P9THOGgX7ev4Ufsd8iQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795690799;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=nt/y4tpXoOZaTS3JSAK4nYPPCJB3G7kX5XrsN9d+MJ8=;
	b=ZrMRtkHDjXiyrQsUDFW3JnBewVGoSSWJuaPlI5Zd9Ay6HDBBa7UUYcUlV/vRtMdmD8JW
	 IUeDJ5qObzKlPRW2v+MiEKer7bPAuqrp7Il38ArsAWHt49Np38NZhqf13Kkg9fxayq0Tu
	 huYwVVZadGNwPaw37b90NrmDgC3YkiRhOfxRvEFMcphzjsDR0ZkjtZpSUwvrpI+pIAdYL
	 MugiuyLte50IRvqe9i85Qu43TGrafYBpZPRMVoJWeqJhXeInzwqUiY3ci4XirEVIRCVzF
	 MUpwEMRootTDTgmr84MQ3KgHWQtKxwB7Wgj5n5Os0HGQmhbLu7HQtAknpGvt2NRjkIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KngKRaUi;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 566D1606A31C;
	Thu, 26 Nov 2026 10:59:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=KngKRaUi
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09DE01F000C0;
	Thu, 26 Nov 2026 10:59:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795690799;
	bh=nt/y4tpXoOZaTS3JSAK4nYPPCJB3G7kX5XrsN9d+MJ8=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=KngKRaUiDwghkr4QqfuI7fVLIICtCzP0+NLJ8qkOaS639mzP9bYtsbn81mcyLFl97
	 2wKyJwbU94NQcYW5rCW6/SSbLtsRhPOTIgrE2J5A5nebTEpwLnrQWDj1DAP+GVmAVm
	 1+s2y0Iw8ZZnBsx9VJCO6C1jxP/kpKEKweCI7O4DCjalqO6RZFP21i6rj3gTR0jSdI
	 0r1y865yU9WE8KRBC5yTaxdc+ivzAjAhuQNuOtD/ihfCE8rAClMnLeVqwXP+gAPLo8
	 HTTt5a81k9JJK6FlpTwYltEELVDbT/zmNRs/zkAHZrp1wSh9cXnCRhg/NQg85DWuyv
	 Aon1iYZm84hZg==
Message-ID: <sashiko-outbox-235321@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/2] Introduce cros_ec power monitoring
Reply-To: sashiko-reviews@lists.linux.dev
To: "Daniel Balint" <dbalint@google.com>
Cc: mfd@lists.linux.dev, linux-hwmon@vger.kernel.org, lee@kernel.org
In-Reply-To: <20261126104757.2860272-1-dbalint@google.com>
References: <20261126104757.2860272-1-dbalint@google.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Thu, 26 Nov 2026 10:59:58 +0000
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list

Sashiko has reviewed this 2-patch series and found no issues.

--=20
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261126104757.2860=
272-1-dbalint@google.com
