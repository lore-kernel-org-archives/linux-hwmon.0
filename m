Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=204.220.183.29
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793677278;
	b=RndkLuGEsktrRoWAwpuKyS2K9DLdFr67GPI7iSVlDsHjAsfGQ9MrOIjLAVwlp6GdZ5jZ
	 UdTqSZI+acW5c12qkqdKA4vbkWGqC4O06O6kxVvUzn8B+fzTw4e/dv8TkF6jlta51eFaX
	 jbVqrCO1ygRTxg392w2nSZMBVj1JmG47JzkQr4nZnAICpuw/QUI7BCvLLEgBTMh5phZ8K
	 QAoizjh83aWIKlqqJZJKtzfEiFDsvV0ebV1IPvDtAzhZp6zm2Zj9QWSlEEwcmaYfjaimX
	 PpXHp9DNnGcnTupp1gzNaiWhogme0RlEZzRsut44rP4tK15wWG0F3VSm+5uAhXLow9w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793677278;
	h=DMARC-Filter:DKIM-Signature:X-Mailgun-Sid:Received:
	 X-Mailgun-Sending-Ip:Sender:Date:From:To:Cc:Subject:Message-ID:
	 References:MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=CrCUDNBQvlLMO/5iptQ7jAGy4gjoxcBGsytX33vr5LE=;
	b=qteAcDBROMz7VMJh7spmgk6bK7qVDA2G0TLjq2AdyEOFYhqK68l+qAxLHRvE451pc4ZT
	 Dogxmza8fBi6ahNzNWGH15GEa7bYGZUMR883at89NqG1gPNy4lVK2nHLSTx6E3VDoUfik
	 uwilPpNrOdqugyFfViEWEukdAl9bvfsk/U9oCzw9NRX7sl60burUlCPXLWTEJBM0UnoNE
	 JO+R/jT+6qS1g3AxaRRvnABgtFc8px8/pilAIQUXCGEvcOEh+LSJ/ic4Y02HTwJKeuLo6
	 OjAtgl67NYdJZyUe842pB+l8Hswf94e9PBJ4CZ8EWEU54BS7i7kMpG3kuTVb6BRG5Cw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=equiv.tech;
	spf=pass smtp.mailfrom=equiv.tech;
	dkim=pass header.d=equiv.tech header.i=@equiv.tech header.a=rsa-sha256 header.s=pdk2 header.b=Vid89GfU;
	arc=none smtp.remote-ip=204.220.183.29
Received: from k29.k3ae2098.use4.send.mailgun.net (k29.k3ae2098.use4.send.mailgun.net [204.220.183.29])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with UTF8SMTPS id A510F606A326
	for <linux-hwmon@vger.kernel.org>; Tue,  3 Nov 2026 03:41:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A510F606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=equiv.tech
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=equiv.tech
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=equiv.tech header.i=@equiv.tech header.a=rsa-sha256 header.s=pdk2 header.b=Vid89GfU
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=equiv.tech; q=dns/txt; s=pdk2; t=1793677276; x=1793684476;
 h=In-Reply-To: Content-Type: MIME-Version: References: Message-ID: Subject: Subject: Cc: To: To: From: From: Date: Sender: Sender;
 bh=CrCUDNBQvlLMO/5iptQ7jAGy4gjoxcBGsytX33vr5LE=;
 b=Vid89GfUzrbIlXhu6l/u6lq8+UGraFkUSTAVh0yIgbyKbwcdEEzukPkGo2UERPoXkFJLYW9tdtFGMUICVFfSintH9zT7OdarA3q+Cdnq6sBW9l6HIQIoWZ1JTQgqYDK1/+67fJPCRRKhZEizLP4y9VtbchaSROyjgVUvmagLtY+BOfISFWFfurJXxOkbmP1LeWiy2akskQYeEg5m3L8TvWcEiHASmtGD4rACUHhwq4NVRpO+17u050aW8u9xme/ZlN2TaxNErUEwPc1Uv3U7mdViiYLcsZq9hKoEUqFVJtWpcsrxwANr6GFR0ROoxIISzAY+JXJWYZ/CsJT9/d72Zg==
X-Mailgun-Sid: WyJkOWUwNSIsImxpbnV4LWh3bW9uQHZnZXIua2VybmVsLm9yZyIsIjkzZDVhYiJd
Received: from mail.equiv.tech (equiv.tech [142.93.28.83]) by
 19d21fda00d455137b31455048cdf9b84c0b6ea52ed6b0fadf5f99a872591934 with SMTP id
 6ae957dc1d1ada6ce8f48e38 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 03 Nov 2026 03:41:16 GMT
X-Mailgun-Sending-Ip: 204.220.183.29
Sender: james@equiv.tech
Date: Mon, 2 Nov 2026 19:41:15 -0800
From: James Seo <james@equiv.tech>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org
Subject: Re: [PATCH 038/102] hwmon: (hp-wmi-sensors) Use 64-bit jiffies for
 sensor cache timestamps
Message-ID: <aulX2_YQfnFnuHCl@equiv.tech>
References: <20261102225235.334487-1-linux@roeck-us.net>
 <20261102225235.334487-39-linux@roeck-us.net>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261102225235.334487-39-linux@roeck-us.net>

On Mon, Nov 02, 2026 at 02:51:31PM -0800, Guenter Roeck wrote:
> Convert last_updated to u64, use get_jiffies_64() and time_after64(),
> and acquire state->lock before checking info->last_updated so 64-bit
> timestamp reads and writes are properly serialized on 32-bit systems.
> 
> Fixes: 23902f98f8d4 ("hwmon: add HP WMI Sensors driver")
> Cc: James Seo <james@equiv.tech>
> Signed-off-by: Guenter Roeck <linux@roeck-us.net>
> ---
>  drivers/hwmon/hp-wmi-sensors.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>

Acked-by: James Seo <james@equiv.tech>
