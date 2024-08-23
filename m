Received: from codeconstruct.com.au (pi.codeconstruct.com.au [203.29.241.158])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A67D8849C
	for <linux-hwmon@vger.kernel.org>; Fri, 23 Aug 2024 04:02:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=203.29.241.158
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1724385726; cv=none; b=ZDccNaea4vYP5XWQlr8h4B23LOkJAcfFNnBZs2Q4uGoElLV4rL3rpKAUN1asL/rs0B4yp7zTx+BKOc1VUWIJII+o6d10hfg7az5DsxNRoZNJaqYRBhsge8JV8R/YSXJWtttBVUxu2DqX37LiT+hIMTO54za/7BTgtXvJEqBEWgI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1724385726; c=relaxed/simple;
	bh=0BGNICJbwFRbFS1gHm/2X9vvhx5Sb5WbrQh56cS3mT4=;
	h=Message-ID:Subject:From:To:Date:In-Reply-To:References:
	 Content-Type:MIME-Version; b=cEPEFA47FgIfNxcszkxS059UqJsz3rqu4wKnzHqi/2u960Nl/tXPzm8wfR7GNInsDcBMg93l8+HmSF6OwbHXEYUAlkJP5fXDruLYSwtqr1EMpI6vSJOOAs9K1WpxATvueqEuSKU8A5bKDjaamtTrQJ7dpaLZdW+ZFMTZTp7Y/Dc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au; spf=pass smtp.mailfrom=codeconstruct.com.au; dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b=j+MFA5fJ; arc=none smtp.client-ip=203.29.241.158
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=codeconstruct.com.au
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=codeconstruct.com.au header.i=@codeconstruct.com.au header.b="j+MFA5fJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1724385722;
	bh=0BGNICJbwFRbFS1gHm/2X9vvhx5Sb5WbrQh56cS3mT4=;
	h=Subject:From:To:Date:In-Reply-To:References;
	b=j+MFA5fJ9hUgfFIylGi9G9nMVRforRkgUYH5GYm69oSw6hyruhEDiqao4cfVm/+Ew
	 o3+YI0nTXOGpKMqQeVYfS+x+akKjmE2k8wWeNsCA1v+cyKDar9umb+TUlJxoTwzieL
	 tylfz/E35l0qBRLNmjpTipPVpXYeh5HNSq5ilIKGfmJv9k91s4lEVlrOUJYkFMsUc6
	 wjTTHEYNZ31HsaNfE4i6VPSXyxzrGGO3hYLKceb58ZmyhQGR+lN8d4/6UvQKOcP5R6
	 8x/4klW1BUGz8ymAg67AVzbMI1K9fym4PKCu/iprQV2mfdISg7NCMPybjzgDKn9B3D
	 QuAi8c4FAA6sA==
Received: from [192.168.68.112] (ppp118-210-185-99.adl-adc-lon-bras34.tpg.internode.on.net [118.210.185.99])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id 7ABB564FDE;
	Fri, 23 Aug 2024 12:02:01 +0800 (AWST)
Message-ID: <d3f26b403f8a281ed44c70bc04bbe42c4a9c29d3.camel@codeconstruct.com.au>
Subject: Re: [PATCH -next 1/8] hwmon: (aspeed-g6-pwm-tacho): Simplify with
 scoped for each OF child loop
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Jinjie Ruan <ruanjinjie@huawei.com>, jdelvare@suse.com,
 linux@roeck-us.net,  joel@jms.id.au, linux-hwmon@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Date: Fri, 23 Aug 2024 13:32:00 +0930
In-Reply-To: <20240822062956.3490387-2-ruanjinjie@huawei.com>
References: <20240822062956.3490387-1-ruanjinjie@huawei.com>
	 <20240822062956.3490387-2-ruanjinjie@huawei.com>
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
