Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.171.202.116
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792503815;
	b=1CwSgizi2V0jZDuzba4ODAkhTGvDjgPIGo9H8+lPBG8Z10cG0++OFUOjJ6vvpbQNcDBD
	 /vWNh+J+8YwhySNK5jHZMONuab1bCfOoSfKQtS64M0T2bLGe4SYvfAJrJ/kDP/w65DajR
	 +Zfl1ZhvSr9vBJ38tCK1XAgRkJgMzOp7pDezondlgFTevAAeoCk0FyFRE9paoNQQpeD0F
	 AFkBVtKW8M/e7f3LtBhZEerPO87l8ohKRdJBceZtq5ze38oLsKE73ZM4Efa/TyvLKZx4X
	 dXl9mNXzt14XsZxUsAc93RUZThILANirdOnVD+6Gp+8VY10jkv8QPnPChuwRiNMcb+Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792503815;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To:X-Last-TLS-Session-Version;
	bh=a7evs3c83W1K0F5zxXLeZ2sMhNgoUa3W9M3ODO/7lLQ=;
	b=1anrU9fcxohhRcQAszkQgFRFPOC2hfzYm+2lcFDydHFnsZtBqtGxJ0z/BnXr1mZ1bTt5
	 NJ5ecBN7Odl3GnopODtTnBe2AWo7OUCx2alQNKZ2boobS9B24LglD14pkb0djT2j2pcqT
	 osm0XZG72mbqL5SWStDr6I9cpEMBU4MIXehmrLmTK+Uze9Wx8y0dLwk8kAlxR05GwBEzv
	 TN2hiBE1jeQsTBt4TH4wq4klLobnoqad63gyfZUTxoeMQJxsevazGHGChWrl4v3xq1mIi
	 Fv4I4HIxx0WIixnpgRtaAXmybI7GMJB9RlohrjD0G2rI7Ph1Hk24KHsTl7DaiUuRqsw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=eiyfybd+;
	arc=none smtp.remote-ip=185.171.202.116
Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC4F960A260A;
	Tue, 20 Oct 2026 13:43:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DC4F960A260A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=eiyfybd+
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 99A02C63455;
	Tue, 20 Oct 2026 13:44:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id EFC6860393;
	Tue, 20 Oct 2026 13:43:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 76C6210328DD2;
	Tue, 20 Oct 2026 15:43:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1792503807; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=a7evs3c83W1K0F5zxXLeZ2sMhNgoUa3W9M3ODO/7lLQ=;
	b=eiyfybd+X2pk32UqSIsmjeuQkMNAyn1C43i1jHY9+4kFLJdeoDlggreSvd+5vcMkXl39iW
	iLLNJex4YdZGn17yHAlSqd5o3I4wOR/IMu1nGk/tq4tOTx3XybVBz1U5ujwFH6MSKRD9sF
	NqJP8pVV6pMBdGmx2MPd+vskXq/Nj/cuC6dUbtpkliYL1FVHw34t3DaiZZ+yLkgC4W6fGI
	9+kgdZ64ns+/vKP/GFVmjCrT3WZ9P/cnLIgBLwwacQtxgQg/a0mXyTJx3j45ZejpnP+fUf
	tYdSpSIOKpNLLMsPfMcSiTM5twNqauwBorU1eLPJpDCZWvYDc+8dfHXvJZPgOg==
Date: Tue, 20 Oct 2026 15:43:21 +0200
From: Alexandre Belloni <alexandre.belloni@bootlin.com>
To: Eric Liu <liuer@nvidia.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Avi Fishman <avifishman70@gmail.com>,
	Tomer Maimon <tmaimon77@gmail.com>,
	Tali Perry <tali.perry1@gmail.com>,
	Patrick Venture <venture@google.com>, Nancy Yuen <yuenn@google.com>,
	Benjamin Fair <benjaminfair@google.com>,
	Guenter Roeck <linux@roeck-us.net>, Mia Lin <mimi05633@gmail.com>,
	Medad CChien <ctcchien@nuvoton.com>, linux-rtc@vger.kernel.org,
	linux-hwmon@vger.kernel.org, openbmc@lists.ozlabs.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] rtc: nct3018y: report chassis intrusion through hwmon
Message-ID: <179250379387.320906.7689435596822345237.b4-ty@b4>
References: <20261001054108.3346426-1-liuer@nvidia.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261001054108.3346426-1-liuer@nvidia.com>
X-Last-TLS-Session-Version: TLSv1.3

On Thu, 01 Oct 2026 14:41:08 +0900, Eric Liu wrote:
> Add an hwmon intrusion alarm for the chip's chassis intrusion latch.
> Reading it says whether the chassis has been opened since the latch was
> last cleared; writing 0 clears it and re-arms.

Applied, thanks!

[1/1] rtc: nct3018y: report chassis intrusion through hwmon
      https://git.kernel.org/abelloni/c/c1c260266abf

Best regards,

-- 
Alexandre Belloni, co-owner and COO, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com
