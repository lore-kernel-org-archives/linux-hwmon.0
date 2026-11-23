Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795442636;
	b=QvU6sWrBSzOliZMbw/jCK9SdMP9koxqbgoyT47M+giCkegZwz3UVyIMT5OAwqwxNy1S3
	 T//d55IyyZkyzQvhnxiFUiONYwDu3OzSsw5uOM7XkBsHSuVZtIw1eokCshX58i9uGaeF7
	 3LkQS8N7T5qx6NWW+KGXIHnRNyLTAVhWYhqM67Pofd0Q0z1DAH96K4jp/fFTyJh1adEeF
	 Mh8QjFQw2CzK3yT1oJQSfgh2h8BmHCs8N2mIcUt+H/6EiPmf9DajajuYHyjuiQSeuVYor
	 hPQX/UsCk5WYiIVsxKstH5eiwEcpc9yH53oo19adGOhG6YSG3s/fmPFZ/wen+iwoqxg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795442636;
	h=Received:DKIM-Signature:Message-ID:From:Subject:Reply-To:To:Cc:
	 In-Reply-To:References:Content-Type:Content-Transfer-Encoding:Date;
	bh=FjZ1UWLnIE0ubzmHkqLncZMlMbZr9UfqkKmNBO2bO30=;
	b=QWHLSIINxP9ohznm7RHrlNGw1dZ/P3a7O06N1ZCEKyvLdHDUkdgUFGw8TRgAIIi8yVe7
	 tLWzVaQgEuKk2WWsPwMFbkrU/BygpMeMHovPDm7ZXPyK26S7yIQanWoeocp6pcfmbPUO/
	 CkBSJnVR0yBDmta2ZUHJxMo/udfkfcQ/CAQxAnfzMsuQSoOAqNyISNnwIJJW6c+ZHLmmQ
	 RWgJ1WOg038maH8STXSotGUXqMn3JgPEbKWHXOxlUahTwrYRdI0U6omGo8CGJvN5YD9FJ
	 8Lm3WfT+MDkyGYCsU/aOEsKZokrrjuXvqVPoot8dVID9b3ZC5/JD8HYR/oHkb5RPOPw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eetowv19;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13DA1606A31A
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 14:03:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=eetowv19
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6DA0A1F000CA;
	Mon, 23 Nov 2026 14:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795442635;
	bh=FjZ1UWLnIE0ubzmHkqLncZMlMbZr9UfqkKmNBO2bO30=;
	h=From:Subject:Reply-To:To:Cc:In-Reply-To:References:Date;
	b=eetowv19mVyBwM0Fu2c3pHHctRKlJbyvzSec29bYJ+wC18MbRra4+d9UvFIQvDqjc
	 T4wqLCdUCNwUmod/2DIJqLN2iJtRoPOtcN7dxusepP/XNyAh3bnjWbIaP0VIp23dVO
	 gkv5WA8U6B2GTLZcYRNzsqQ6MB14jLvClF8bI2Z4BlzGBVewZNH/nSgXtWNECEvuon
	 qRAmUXyjWmPnL5SW9La+XGi73EhvAhtDpO4M5AR8yx2Mr4pJThAiGuRycKXRflh6OT
	 hcPqsQeXmTnx8Y8oODVg35cfBaFj0RrHshkhTHMa21HD7BplV834KFM3wxvpVoG5Ba
	 p95WfsVKq2pyw==
Message-ID: <sashiko-outbox-229366@kernel.org>
From: sashiko-bot@kernel.org
Subject: Re: [PATCH v2 0/2] platform/x86: Add Emdoor Intel EWMI platform
 driver
Reply-To: sashiko-reviews@lists.linux.dev
To: "Ziqiang Xia" <xiazq123666@gmail.com>
Cc: linux-hwmon@vger.kernel.org
In-Reply-To: <20261123-emdoor-intel-wmi-rfc-v2-0-3f4a03095f2e@gmail.com>
References: <20261123-emdoor-intel-wmi-rfc-v2-0-3f4a03095f2e@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
Date: Mon, 23 Nov 2026 14:03:54 +0000
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
Sashiko AI review =C2=B7 https://sashiko.dev/#/patchset/20261123-emdoor-int=
el-wmi-rfc-v2-0-3f4a03095f2e@gmail.com
