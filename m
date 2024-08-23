Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A1095347A2
	for <linux-hwmon@vger.kernel.org>; Fri, 23 Aug 2024 04:03:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724385803; cv=none; b=X0Kb826uscvVIpnScPiuun4BLZRjOmvMeMWVDdhgbPIanF2eAwK7q6TLLX+KoF9a802QI2FlS7xPgZFGE/EKkiZjqIwMNqHtXN/RklDGre7Fyqi3Amal3debqLGXc48VtvD5/TPKihM6PR6iXPM9vQbxwXOb577FJX+j4f5vasE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724385803; c=relaxed/simple;
	bh=0BGNICJbwFRbFS1gHm/2X9vvhx5Sb5WbrQh56cS3mT4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=OvELPrqNYn8Vxmp+W+H00L7sg1VOExQ3YmVyW7c+ljUk6ycRqSW0viDZrTCNaom8rDPvhGpz2/Xog+eZJiP8X0Q901vnmNvDeoPj6K8QyMTUSoIas6LCv/Pemzvf8m+XWeCEUT2tIeCyEQJEnurftKXAc4eu+CclwPgravp+iwA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=EpS4J3qO; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="EpS4J3qO"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1724385799;
	bh=0BGNICJbwFRbFS1gHm/2X9vvhx5Sb5WbrQh56cS3mT4=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=EpS4J3qOG8AIoVI/yED1bcJKnNprbzYLbrKb73q/lfFL1BUT7S1m2VYmW++cSywrq
	 ZAJXDW76vV7TF0oFromTCUrCFvxCINSMoKSmWBxnlsieUgYNrib3M2mrJrVaSzgCZH
	 v2zYjq0L6G4CKQ5RJms+bvDREGc+HVGewgPcCG9PrKsa2a/HTuE+yrRo1J1H/DCCvR
	 W4glXL5RWHvvYS9AIP8If+vBgnDfeveL44OGYCpW8XAZmgJFXGzwyioEj6184CLkP1
	 eMbnHOxHCcLNSxlpo+xNoHX9LYpDUS923VKVYNinrVfJ02x8n8QRxsawzelMZ6OzK9
	 7gJvWL6EsrteQ==
Received: from [192.168.68.112] (ppp118-210-185-99.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.99])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 1569C64FDE;
	Fri, 23 Aug 2024 12:03:19 +0800 (AWST)
Message-ID: <703d486dc1d268aaad03d916aef12a031473139c.camel@codeconstruct.com.au>
Subject: Re: [PATCH -next 2/8] hwmon: (aspeed-pwm-tacho): Simplify with
 scoped for each OF child loop
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jinjie Ruan <ruanjinjie@huawei.com>, jdelvare@suse.com,
 linux@roeck-us.net,  joel@jms.id.au, linux-hwmon@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Date: Fri, 23 Aug 2024 13:33:18 +0930
In-Reply-To: <20240822062956.3490387-3-ruanjinjie@huawei.com>
References: <20240822062956.3490387-1-ruanjinjie@huawei.com>
	 <20240822062956.3490387-3-ruanjinjie@huawei.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.46.4-2 
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0

On Thu, 2024-08-22 at 14:29 +0800, Jinjie Ruan wrote:
> Use scoped for_each_child_of_node_scoped() when iterating over device
> nodes to make code a bit simpler.
>=20
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>

Reviewed-by: Andrew Jeffery <andrew@codeconstruct.com.au>
