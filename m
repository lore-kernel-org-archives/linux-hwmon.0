Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794749644;
	b=SOlq/dwCI81uBJS9SHv6EoaZsmVSRtQFwJ/2C3frRR6cZbSjxUJTzv2orrc12tOdrvxu
	 ks4BFN2vTnDNSoud+h08fpVoOMYTVK9G+s4KOw9vO5xz7VtHk9fx+M/LO8gzjYRBxvsMI
	 6cI4vsxnnzz4bmzFXgxpIeNEkvl+Fjmmvpn3wEviAw3u8pv4gVHSa28BKZ+D7RkrV2EOB
	 w6wlLW9HTijAvOnV3eJg+rrA3/k83mfvAH/Frq+ntK63TjRnWJKBIkjWqzqc9chajgYW8
	 8fU4x1Kzffc+C+HXrksLo7B2sl1hKYOgLe84BZtedG7DTy2xQ30LKybb7ouBkcvz6Cg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794749644;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=1bytFfLq5CGOzx0IILJ9a2zDeD4jxyW+w7M6grr9Vbo=;
	b=CXTAL8Hzd03O2GibYGdnT1pFfEWIEOq8zY0knyIyDnk4XbZqcLeyoqKJUZaWBrBhymPu
	 JP0wOYiE5Fq0ZFTs9ntvsneCoTv+ch7Stq2euCWAJm3D+k9wNm2stWWZ1Svp/8RjwOS2J
	 arbVD+KLMkRb3Lw/TuDzP6xXS+hpalfqMG6wnDMMlma8btnT0/LHNibH7nPRoHTRTL3u3
	 5qG+MSQwb/CPetQwsHw1r/4ODcMDXDqSIg0rexCNE2sy6pTw9IX/HdW6MkJg2kRCxgQGS
	 OipcRjj3TKSaEPwA9I/JKA98G7cFEqmOHeAa/ECwxyd85acX9bCK0LTTB7AP6QicELg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ivjNaf1K;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38D03606A323
	for <linux-hwmon@vger.kernel.org>; Sun, 15 Nov 2026 13:34:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 38D03606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=ivjNaf1K
Received: from eig-obgw-6002b.ext.cloudfilter.net ([10.0.30.203])
	by cmsmtp with ESMTPS
	id SAYGxZqZiOOJnSaMtxz761; Sun, 15 Nov 2026 13:34:03 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SaMsxwUjk8cn4SaMsxSIeC; Sun, 15 Nov 2026 13:34:02 +0000
X-Authority-Analysis: v=2.4 cv=Qrde3Uyd c=1 sm=1 tr=0 ts=6af9b4ca
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8
 a=9rJA89_LAy90xbHUIIMA:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=1bytFfLq5CGOzx0IILJ9a2zDeD4jxyW+w7M6grr9Vbo=; b=ivjNaf1KxWWujcDDlIw1IFhw9q
	c12fT6PRPNN6AWQO+OWFIOvQ4HLG2eyaiucc2sDJ641rQOsat9Q4b70Lt30wpM1u0tOLxdZIbT64U
	0lQN21M6dDNLhdH/cjMbElnRXncvL0GW0MkIGdBBzKs5qpN9LiJYZ0O4t82rPd5mZV6J1cRt9wJ0Y
	duGCdY92TN3XBAV2SQsTgucq/X/0NxymSuU7quU+RwdSaJQJonmB8gYi/L+vux8hycEb5p4cd3YB8
	edA7u0AMaTCUn2HbsDh6XJSJFLs/6KK39L7dRmuuUleop5OLDQJFl52yFVuYyhoCWOb4Q/VwN5u4m
	WJaOCFwQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:52946 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSaMr-000000011FV-4AWY;
	Sun, 15 Nov 2026 19:04:02 +0530
Date: Sun, 15 Nov 2026 05:34:01 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Niloy Meharchandani <niloymeharchandani@gmail.com>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] hwmon: (pmbus/xdp710) Use dev_err_probe()
Message-ID: <908a05e8-a1f7-41c2-82e3-a6713d89f93c@roeck-us.net>
References: <20261115022053.32321-1-niloymeharchandani@gmail.com>
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
In-Reply-To: <20261115022053.32321-1-niloymeharchandani@gmail.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSaMr-000000011FV-4AWY
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:52946
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 2
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfNvExc/lwHujhsRIe2atqg+zD79zZWfCaCMc+Cwik1ZMnPT8yVFxHZKy6GUW1TVJX6n+R0jWr/In6g+aP4CIQHlQJggRRBHhbA+5nYLhX8x0RvPeRy4H
 o5lZa8XEpD17YZhspH7r/tTcirGJREeCNQFbKgYqyEDTG3JtUhaae+Av2okG+TqHtihFfmhuAldOBuKFyNzswu1E5Y9mT0ZehlCGqFj4Cy4vYUt2KGoRdKEU

On Sat, Nov 14, 2026 at 06:20:53PM -0800, Niloy Meharchandani wrote:
> Use dev_err_probe() in xdp710_probe() instead of dev_err() followed by
> returning the error. This simplifies the error paths and prints the error
> code in symbolic form.
> 
> No functional change intended. Compile-tested only.
> 
> Signed-off-by: Niloy Meharchandani <niloymeharchandani@gmail.com>

Applied.

Thanks,
Guenter
