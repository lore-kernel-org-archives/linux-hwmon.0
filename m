Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793386389;
	b=XRKCov29U/02vddgNBU9o/77FVjwLwlWCz2ESTkRAwejOFgHIWHP7ouOWnCo1reyVQYv
	 c8LvOUSiulkM1qpYCvhFB4retp7ADVA4JFrX56qmCOBgaZxUwPFuWh8GUa4GmCLjpe26W
	 /XDReTO9yPdVUUQqwXnHw606mEahU1gZwCmnB45VZAkTcNl8iyWyGhGXuypI6dBIwnBNE
	 mhdAN4oT4ofSe/BAIQLEt2NouFWs3Lhss9CN7VHYA0Y+bP0dwKrzgIQQZfxDxnAnzA16F
	 XwNs4qGAYUP3xhZTgNXHt+FPXp7IeMLAN2yoesZrhHUPgw0CE3ejn2l4uC1vSrJaCkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793386389;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=CTpyUvKJfnibZntAOValzAtbc0vWXZM7peQMmJkbMC8=;
	b=MYg85GtyZ7H5KUtMcmm0jS45KpjowJlLtEIQA6TxQJOmMfitNkwO23BVwO3FGcncXpWo
	 SSc3rl/m48dQjw2yJvZblega2yzosQlAFH1IF78qd6vAONRxwvUnnpN6FK6u/2AKgTumQ
	 GSzX8EavJqUC5Md735wE1yXwmuu9JTSn5DqywzBKAAwUlmrrDE2t/NTtjRJd/pb4XkogG
	 K5ygiXrd8s6CuQKgc58aIz8QwOYH2R7HWJm+3IE6Hqy748y4184nvM0TwYbQFwv5EbdMm
	 Fk4uiaJRTUhW3cz+5HBbUzhNH2RdOurwAnrIPDP3rCA/dW3BJLBCtBZzMxFmzWh7pUg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Tzafd8QB;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5254606A31D
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 18:53:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D5254606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=Tzafd8QB
Received: from eig-obgw-5006b.ext.cloudfilter.net ([10.0.29.217])
	by cmsmtp with ESMTPS
	id MgapxTlq7c3XsMriuxDgtY; Fri, 30 Oct 2026 18:53:08 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id MritxujsSNSXiMritxSisG; Fri, 30 Oct 2026 18:53:08 +0000
X-Authority-Analysis: v=2.4 cv=JvXxrN4C c=1 sm=1 tr=0 ts=6ae4e794
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8 a=W7o7ocYhAAAA:8
 a=VeVZoRYdAAAA:8 a=QyXUC8HyAAAA:8 a=TVLCZSLGyijLZdGFpcYA:9
 a=9uIKRcg7Gvwk8o89M4RL:22 a=TKXEY2ph7vCcqc0JNG1P:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=CTpyUvKJfnibZntAOValzAtbc0vWXZM7peQMmJkbMC8=; b=Tzafd8QBEZzgY+m4UbDHQ7kPCs
	BI6fR9AXgsIPTt81C9XuZkQZs3jjafNJtOONL4ciqItpE11aJS0upx/HXPj/WsB08XGftHcthgstM
	3eE9cUwEPHZVfY+SXItVyXxXyea+AtLPvsEa2kuRUSl2RITWp9meycnv5sG2M/FxUVd1kz1XQGtw/
	F+i69Q3AvJNyhjPVR0UBfs+KFxNf0/MKFvQQXvKyO5leo/seRXbr8t2Ol7paeoRiMliB5YhXY4/sc
	sbiEvOy5Die3nAlGrGGC0/XCZ76qgcET2SZhYPaoHOksRtpeyy1L/NDz3ybau+FjvlyUHf4IfBSE7
	EO+avY3g==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54924 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMrit-00000003RDn-10JI;
	Sat, 31 Oct 2026 00:23:07 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Aleksa Savic <savicaleksa83@gmail.com>,
	Jack Doan <me@jackdoan.com>,
	Ed Brindley <kernel@maidavale.org>,
	Denis Pauk <pauk.denis@gmail.com>,
	James Seo <james@equiv.tech>,
	Iwona Winiarska <iwona.winiarska@intel.com>
Subject: [PATCH 0/11] hwmon: Various fixes
Date: Fri, 30 Oct 2026 11:52:45 -0700
Message-ID: <20261030185256.976255-1-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - bh-25.webhostbox.net
X-AntiAbuse: Original Domain - vger.kernel.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - roeck-us.net
X-BWhitelist: no
X-Source-IP: 108.223.40.66
X-Source-L: No
X-Exim-ID: 1xMrit-00000003RDn-10JI
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:54924
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 10
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfJSCx2zMC2Xyp0U5zqwSEuI6c4OmN2GCtIc6jXB1P54Lz468jWotbHe+RHpfkP3G892ZDS1bY1pjWegjt/u5t9qMxwaHIYHYUePDobtR6BQr82Oe6jzv
 DPN++g9SvyT9LL3nt1UAwXGiSfE5GmPsWBNVEy0+UCH3SiXmB65mVK0Jhn+A6j2mV22sQMQcMNFoo6xKn4psMdS3DDgqoyw9O2xP+3PgJ+8IVc+G1hxMaucx

The patches in this series fix a number of issues reported by Sashiko.

All but the peci/dimmtemp patch were written the old fashioned way,
not using LLM. I used gemini-4-carbon to implement the peci/dimmtemp
patch.

All patches have been build tested and reviewed by Sashiko.

----------------------------------------------------------------
Guenter Roeck (11):
      hwmon: (aquacomputer_d5next) Check maxcollection when probing AQUAERO devices
      hwmon: (asus_wmi_sensors) Avoid global struct mutation
      hwmon: (hp-wmi-sensors) Avoid global struct mutation
      hwmon: (hp-wmi-sensors) Fix unbounded loops in scale_numeric_sensor()
      hwmon: (lm87) Fix drvdata type confusion in vrm_show() and vrm_store()
      hwmon: (nct6683) Fix incorrect struct cast in show_pwm() and store_pwm()
      hwmon: (peci/dimmtemp) Fix devres leak and UAF on concurrent unbind
      hwmon: (pmbus/q54sj108a2) Add missing NULL pointer check
      hwmon: (pmbus) Check return value from pmbus_thermal_add_sensor()
      hwmon: (pmbus) Release devres allocated memory after devm_thermal_of_zone_register error
      hwmon: (pmbus) Fix return value check from thermal zone registration

 drivers/hwmon/aquacomputer_d5next.c |  2 +-
 drivers/hwmon/asus_wmi_sensors.c    | 13 ++++------
 drivers/hwmon/hp-wmi-sensors.c      | 29 +++++++++++----------
 drivers/hwmon/lm87.c                |  7 +++--
 drivers/hwmon/nct6683.c             |  4 +--
 drivers/hwmon/peci/dimmtemp.c       | 21 ++++++++++-----
 drivers/hwmon/pmbus/pmbus_core.c    | 51 ++++++++++++++++++++++---------------
 drivers/hwmon/pmbus/q54sj108a2.c    |  2 ++
 8 files changed, 75 insertions(+), 54 deletions(-)

Cc: Aleksa Savic <savicaleksa83@gmail.com>
Cc: Jack Doan <me@jackdoan.com>
Cc: Ed Brindley <kernel@maidavale.org>
Cc: Denis Pauk <pauk.denis@gmail.com>
Cc: James Seo <james@equiv.tech>
Cc: Iwona Winiarska <iwona.winiarska@intel.com>
