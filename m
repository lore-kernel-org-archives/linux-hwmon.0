Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794838962;
	b=bfmUZjkrsgKENzDowCzDQDLCzD6g0wOeupds5BpGo1Ip5C+mKhYgSedL/HcCEUSALeV4
	 RBUMCiEIBsn7qFOM2ql9HhyZ+e6Gdiq7FNtwzmRSsjFgjHe7PfohzfX6mhNJwZWMomCSn
	 PC1Z8hS2Nf4Q/J1YCFTenxssn/AiBywMvVIjf75GJEbyLXodlYgyGSPuWWinosR/v7UR5
	 sdu/NDNOOm0KNyh1i30YXrGLsvLkKf2pXPXE56atCJcTjyL4a7oH1pF1hP0gEpsircmi6
	 G4uHbTZqj+f1X6ZiYPFDLJraHL4LMIL7SLMUqqluoNUxKaRb6bij0I9Avk9141/ME6g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794838962;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=4kAMu7RSkEoS0+WfmUPvYOOUWE6DfZRbBttvNv6pFZw=;
	b=tAYTdFTdxQVZZUjhd8zHSWjxh0dcaZn6BhdLhwSVmSsfEU+Rmo7HkOSEXOI+p/csUjOu
	 2hvuEg3wfNsSzxzJsnQ2bC7IsN2BEB39vDqiyVRRe+KRqnhzcIDY+vbkpmJ1H/lSpD64S
	 +F1/6RaE/CpIgW3wk9iYAxxgJT2KaNEgv7X8ZZhoaJIoJ4rjP8Dxo5m3pW8+uJHwNEsvK
	 IuCWpp+kQ0t71TTrQrmnF4EWwD15RfU0qOqHDknmhiWGXh+e22bMmRSuyZlPuVF5iC8uT
	 7CoGggTHCRCdQqhENekGztp/aw6ke43Rc4RwUZXQKg2uqNq2uJ89ENtu9luuPqSyRVw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=rYBmsR3f;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B1C5606A32C
	for <linux-hwmon@vger.kernel.org>; Mon, 16 Nov 2026 14:22:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2B1C5606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=rYBmsR3f
Received: from eig-obgw-5004b.ext.cloudfilter.net ([10.0.29.208])
	by cmsmtp with ESMTPS
	id SxTKxiw4WOOJnSxbVx6QCb; Mon, 16 Nov 2026 14:22:41 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id SxbUxDWQDuJrPSxbUxqqLh; Mon, 16 Nov 2026 14:22:41 +0000
X-Authority-Analysis: v=2.4 cv=WLZ/XmsR c=1 sm=1 tr=0 ts=6afb11b1
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=8k6WQxmsAAAA:8
 a=roUQ66J17bC5M9zpNt8A:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4kAMu7RSkEoS0+WfmUPvYOOUWE6DfZRbBttvNv6pFZw=; b=rYBmsR3fz7iITOK2DHF1MOzNKq
	3OlTQpUr146a3YeSr+phX9bxhGcrcYH5B0VPBmeeajb3ADkGOyaMhoFNyODxHQzQngmy+WC7BiNv+
	aHhnh2dMDgGEq9rgJhMV4vtjJ3kBUncF2A9ZZMQjCr+WzasDKw8k267LNOxAu/6K3z1VVBRbFQHLB
	TFP+SWijsuBhTb/hafq9LaCbGhPKw06JFkyUkNLZ0D+QS5gFWVN2rX+abPnqy/+Qh5UiVJx5Ckx0a
	Um9lA6okMURJYkTdTQ5rueJ22WdWkWk7ceW6o3eVze6GyR292caHqnda4hodgYG0eLmjVWF8fPwBe
	xW2ZFCUA==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:43734 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xSxbU-00000003lep-1Jh7;
	Mon, 16 Nov 2026 19:52:40 +0530
Date: Mon, 16 Nov 2026 06:22:39 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Jiqi Li <lijq9@lenovo.com>
Cc: linux-hwmon@vger.kernel.org, jdelvare@suse.com
Subject: Re: [PATCH v3 2/2] hwmon: Document the lenovo-shm-sensors driver
Message-ID: <7d418fec-ac4f-44af-add6-690be3710295@roeck-us.net>
References: <20261116120411.994284-1-lijq9@lenovo.com>
 <20261116120411.994284-3-lijq9@lenovo.com>
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
In-Reply-To: <20261116120411.994284-3-lijq9@lenovo.com>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xSxbU-00000003lep-1Jh7
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:43734
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 12
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfEiVSmX/UlQBWiWpp7BdI++P2YkWGqsiYbQEmzHWhEg/ODi3uCdccFTh31op0JdY25nXDhFqru5nKl9rK/cedw7hW5cguPCujHUO4sAUMfIH8l4Nsd1P
 39abTCLMRvDdo5QEWD7y8T+DUsDJaTtOn2tz6SXlpyZoQn+SfcNkypvv9z4MFPKJ2w7jMEz2QlnUM7HjESkEjyZhgydZ4lNTIV6ZaWrSzP6IHrwD5nnauUF3

On Mon, Nov 16, 2026 at 08:04:11PM +0800, Jiqi Li wrote:
> Describe the Lenovo EC shared-memory window driver: which systems carry
> it, how the window is located through the SHAW registers, which
> attributes are exposed and in what units, and why the driver refuses to
> bind when the ACPI sensor interface is enabled.
> 
> Signed-off-by: Jiqi Li <lijq9@lenovo.com>

Applied.

Thanks,
Guenter
