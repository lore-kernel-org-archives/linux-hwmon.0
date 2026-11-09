Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794268439;
	b=h0DrNRdJedWRC6SqUK5u/ZmBf0Zz1s+tQuGtnaKksP0Hwp01QSEPIVlJbA7U+H0++lwV
	 v7APdNSBYttJm3rmwVdFwq9Nie+fDKjOcGGaFio9SEErcZe92gO38W1ZqYPty5/m8UFD6
	 p/pJRsQze/9NRMkGJIuNimc6d9NXqc0FJOVdFIA41B+qPWPQWTTzctQsgfZ5adeh2FgYQ
	 4pUUKiUQOhlvGRH8pzqQQiNu7et7rYZrlTax0wp1KKbLP8Z+gSRIJlBKAfjQbm5RX7N9y
	 BlmMXCyFH94fwGb3rwNGlk2PKPVmjtXP7p9TkEI9abOECvxN9J1iuVLWramkqC1dsEw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794268439;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:
	 X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=Iexm6f7c/MXG0Uw85sM3bVZ4URBsUSd+I0OCtwvBuW0=;
	b=h6R0uWimtKI0IgEaZpQ9SYqSE5Fq3F3myoiev6wxkeyARxUmONhSi1FlRSNkZ71GnWQi
	 8s6Sm8nZuAa90umbcoCnK4mzTHpddRw2QT4XjicQlsUPxHnVqwaiUVnjCCaYolJum/8YF
	 OkVqQ+Nd+wjW6DWa4r12lZB+h+W4nRuwQDZoczfyTJUMbEdJHc5dHeX+0oqfXrxIJzOgH
	 ZDMk4hCoaJOtqKI43KRDx9+GyZEo1z0U00r+JSQO/zZL2CYvsSHaZW4lokHIs6IzRjxVZ
	 HBo8EDXZsTLcBVDfrRSt/tw8C356yZ6epqKvDl5kDMi4Q5qD5KZMZbJrXG77CEPmF2Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=4z0o2rmd;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55CD2606A321
	for <linux-hwmon@vger.kernel.org>; Mon,  9 Nov 2026 23:53:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 55CD2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=4z0o2rmd
Received: from eig-obgw-6006b.ext.cloudfilter.net ([10.0.30.211])
	by cmsmtp with ESMTPS
	id QUb6x6vXFOOJnQZBWx7Ug4; Mon, 09 Nov 2026 23:53:58 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id QZBVxGxgIFhzrQZBVxaF5q; Mon, 09 Nov 2026 23:53:57 +0000
X-Authority-Analysis: v=2.4 cv=JY+8rVKV c=1 sm=1 tr=0 ts=6af25d15
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=kj9zAlcOel0A:10 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10
 a=K6s_-0DHPOfA-GDsQU4A:9 a=CjuIK1q_8ugA:10 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=In-Reply-To:Content-Type:MIME-Version:References
	:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:Content-Transfer-Encoding
	:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=Iexm6f7c/MXG0Uw85sM3bVZ4URBsUSd+I0OCtwvBuW0=; b=4z0o2rmdTbOkgIKMh5CP2MOSl4
	rIslZ8KKnnFACTint1YjzsLRoNLjsh9aPdTUEt18u43MGBOR7QHIufawvqRRyNAX4G23hTl5o3ayR
	svbDdYVUwcIGcdyo2yTUV2+Sg8/0O18nxFpAAW7r6s/Ywp4LooY4eGcF/ADWM3vYK7dyZEHP46nOC
	6oaOJBFP3h/kz/UuCcAjUB4wquE4KGTlix4tOwX1s5kHIvgMAUUCccJCsZPIiaffe951cnzDZUHPT
	YPaqlXz5sKMsPfeeRYfDTcw7asE86tWPtX4pxj6OQ0nltWGFcuAFfEGrAX5y1eZk46e9BdzTDpz29
	Z2GselAg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:40558 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xQZBV-00000001CWs-0vfp;
	Tue, 10 Nov 2026 05:23:57 +0530
Date: Mon, 9 Nov 2026 15:53:56 -0800
From: Guenter Roeck <linux@roeck-us.net>
To: Vincent Jardin <vjardin@free.fr>
Cc: linux-hwmon@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] hwmon: (pmbus/core) Add a vout_command debugfs entry
Message-ID: <16ba027b-4f29-434c-86c3-18aa9635cbe1@roeck-us.net>
References: <20261110-for-upstream-pmbus-vout-command-debugfs-v1-v3-1-e3a261fe4342@free.fr>
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
In-Reply-To: <20261110-for-upstream-pmbus-vout-command-debugfs-v1-v3-1-e3a261fe4342@free.fr>
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xQZBV-00000001CWs-0vfp
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:40558
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 119
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfGkvR1/vIPBb7QrzHfR0DHb//CTKO4FmMqLHW4wBrel2IMrnIW8/WoVT11q8xOISSrTgPfoBhZxLybaQ9t/vGsHQSh0s96irYcn1xBY2I49hwGVh23Qz
 G7LVm8wzFaI7FfdCv8aVUjTInH5ESjP7K4nsYHD6DphKOsg4drITQTl0i0QgxBXNEWj7490o7i+DXlyrY5TqdC0JrtV0Rz557xBRMh26ha87Wtj9+NnB/zLA

On Tue, Nov 10, 2026 at 12:48:05AM +0100, Vincent Jardin wrote:
> From: Vincent Jardin <vjardin@free.fr>
> 
> The vout hwmon attributes and the regulator get_voltage() callback
> both report READ_VOUT.
> 
> On a regulator whose configuration applies a load line (droop),
> READ_VOUT sits below the setpoint under load by design, so user space
> cannot see what the regulator was actually set to.
> 
> max20730 already exposes a driver-specific vout_command entry. Add
> vout<page>_command to the PMBus core debugfs, for every page with VOUT
> and a readable VOUT_COMMAND, in millivolts like the in*_input attributes.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>

Applied.

Thanks,
Guenter
