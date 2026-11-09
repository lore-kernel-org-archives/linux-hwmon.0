Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794240167;
	b=Zl4v8KdkAHYfXQiPJ/lGQvvdv2+zeFgSEaX2MoOzAGd10U8bcJ3VkKbAMyG+GhH+fajW
	 aUnuFz05oFLULQoD62ZoYI9mTYb/pEqraDiGhJpFUiDsIQ/xf62gPLVC5QrtwDHaRH+6s
	 aA1XVICy/InuN6BpwwkIrUX1nZeufDAya5gOv95joAju9sWiTXebSVn1x5/9g7L9cAf/I
	 SB0VH4QdFQxIT8VpnzvmNUADADtUqwrdLxzkrX2XkTto8ool3i+VhQu56hnyHJtBcXfPv
	 +bQVx1XNZCK3/w3IdYhaX7w0zqi6hLGc75Qsq0ARoIU5z1RwtKMVToKq6hYLBI7XJvQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794240167;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=5zrQmTjbIe6ltMv++62pVBuVkksxWkIRQSc5YZO9sWA=;
	b=PBQf/Bt7V/3KeAznaDhKeiCN/5h9OFHWWEQTW2tscrG/IdmVuFzBMwat/GnT5dhQH1Yd
	 1ZM0shO0706xYxu/NrDIxwtKuHYfQ/sVRrb+sYEDXlpyyoVcdBuJunCV73NVDMKPI/hKh
	 Z346LKfJXVHtbE8tO2eLBrjd3N3Cv2e98M7YBTGPukiDKzgQgdfSAbJ4HYbH1XdgeTc9W
	 OJ1/KuKk0Imc8oJyNlRoxGDLWgPDf7YCzrADEfpt09I0RwuEi3+Dgc1Z5tqB9eM5kgJkE
	 r8EMMLqBA7D3mg16lMzn6YG2az8+mvoX0l+1fqrI+4QX1VkUkcKwQxiCRuHTDxuLWog==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=gNrCuT8w;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73169606A321
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 16:02:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 73169606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=gNrCuT8w
Received: from eig-obgw-5003b.ext.cloudfilter.net ([10.0.29.155])
	by cmsmtp with ESMTPS
	id QO2exAy2Uyb4YQRpRxlsG7; Mon, 09 Nov 2026 16:02:41 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QRpPxdK5oSgq1QRpQxTI7G; Mon, 09 Nov 2026 16:02:40 +0000
X-Authority-Analysis: v=2.4 cv=c8KrQQ9l c=1 sm=1 tr=0 ts=6af1eea0
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=b5QGJjtLcb-mCnj7-7AA:9 a=CjuIK1q_8ugA:10 a=-9iV-VeuuNk-bLVfMm8F:22
 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=5zrQmTjbIe6ltMv++62pVBuVkksxWkIRQSc5YZO9sWA=; b=gNrCuT8wDX0ic8+Vm7Ro3PG1NL
	GoyPcKiWGdPBRQL5IrPot1oXmfS2cqGqFv8uLD2RuVfEsgk4zhmdsk2IgUM4Ujorl+78bc08mw10u
	rafix2or/SM3SsgvIl2yzHlxeZUifUlZKaNqN8VDNqnr/PLqCxA/U66N+omlTlDkRdjiCV1JaRK7l
	P8ghk5TERz3iOFwNIiTGSLQZqbOmENHiTb8l0PqnqXFQsIP1/VrY6r9tYDUNdgIMF9kClSTg6Qj6h
	bfWG8nKovj9O7HX3EX1JTdDBShTKuicPKZrr6YHEBBjfobGY0i9X/P+HBxOA6raq4KL4W4YBJtV1H
	zFZSLqCA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:58626 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQRpP-00000001Y0u-2f7C;
	Mon, 09 Nov 2026 21:32:39 +0530
Date: Mon, 9 Nov 2026 08:02:38 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Anton Lundin <glance@ac2.se>
Cc: linux-hwmon@vger.kernel.org, Zev Weiss <zev@bewilderbeest.net>
Subject: Re: [PATCH v2 3/3] hwmon: (nct6775) Add support for NCT5525
Message-ID: <eb2d2018-35bb-413c-ae4d-20fa6a63eb0c@roeck-us.net>
References: <20261109082511.851377-1-glance@ac2.se>
 <20261109082511.851377-4-glance@ac2.se>
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
In-Reply-To: <20261109082511.851377-4-glance@ac2.se>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQRpP-00000001Y0u-2f7C
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:58626
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 5
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfE6wuGCju9W2hFwfOLRL9nBAMEWGPZuscQ7sg92Nu3U3SYfNz/EtE4uhCpxS6RH0DIhEo1QWXVl/LYLLMvffpWVCOAV5k4N1wIZ82lz1vYzSn61snNc2
 3rKREVmYWMz6FZ1O1VwHPCm/Qjn/+2+d5trru7030Do70j+Ctu8XnkRTmEcmA5/N4PT/zRFuk64m8TZDcf0SDKvyoVVfeK93Z5HDzi/8PRmJshDL7GiYTudi

On Mon, Nov 09, 2026 at 09:25:11AM +0100, Anton Lundin wrote:
> Extend nct6775 driver to support NCT5525.
> 
> Signed-off-by: Anton Lundin <glance@ac2.se>

Applied.

Thanks,
Guenter
