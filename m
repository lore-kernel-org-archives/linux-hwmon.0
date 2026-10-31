Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.35
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793460934;
	b=0GxO6mK3VYxAD9tW9tkxy/f4zkCBRu+Y8klD9SWTsW3GwH0IS3TADoybvR+kEo/1iohb
	 4b6OHIarszxdm9cV78hERjOWJ+oJzy68TL1vaaPyg21OyVm49sIBxjyMVy4AdrH2Zfy8K
	 Ld0i/eqFyl7raHXWtsN7AJifGp2mEqShUCDjOrfebxM5ZffQDkfKqJnRjN5gZf/mHi44E
	 i8CN3mU+ZPBxmwNTGIv9Vz8CfFQ9Jjxr5rWUtdMiftnH1T5okVFMHlM/VFyTbmP9g9SOg
	 dNexinEleDolPcYPruM7aAM2sTGB0ijl/k7U2Gm7OCqrdroi3cHKnA5fDzn7aa55LIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793460934;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=PN2S/8V5Yn9vzBCuWmx1BFpfzIlJOJMmzNcLAz2GyhA=;
	b=ViSD/xySNsF0Dx4W5hkdUKwLsIl27rP6cK2sgt8cJ+tczYFeorI3r6cObRK91tI15zue
	 AG2JIOMUaqd+jlW2rhhQHXT1+iagcyjULr7VbCblPQuH7EOVGElnOD9lek6gEkdnMM32v
	 AnKgHcPIGkjcen/SL2/PoJBsElUacHTXQu7V5znpVh9iIt7+FbZ4DDmCnE3yJ5pTF3UQh
	 4R86V7rm+NpdAo9WD7ZZHe/c2IkQxN/oKTEl+aje0A8uc9IgvPKY3/ltYgFRIx5ixwKoj
	 y8/giNHiEegSHqdgj1wdZiNILA7VE98shO5s7EqxkawhrMdV6xWhq+V352bwxJd1RyQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=b1YJ9KwO;
	arc=none smtp.remote-ip=35.89.44.35
Received: from omta36.uswest2.a.cloudfilter.net (omta36.uswest2.a.cloudfilter.net [35.89.44.35])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3E434606A31A
	for <linux-hwmon@vger.kernel.org>; Sat, 31 Oct 2026 15:35:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3E434606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=b1YJ9KwO
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id N6Pqx5wHausRSNB7Gxe8RQ; Sat, 31 Oct 2026 15:35:34 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id NB7FxEsvqkE4RNB7FxsCjx; Sat, 31 Oct 2026 15:35:33 +0000
X-Authority-Analysis: v=2.4 cv=LuaSymdc c=1 sm=1 tr=0 ts=6ae60ac5
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8 a=_jlGtV7tAAAA:8
 a=B5VQPU4ATUc_0ivqAV0A:9 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=PN2S/8V5Yn9vzBCuWmx1BFpfzIlJOJMmzNcLAz2GyhA=; b=b1YJ9KwOO1Rp
	DPMY0Bkqx7Lx597ruGkAZm6NS1IzdtvTdSXsjLzPkN7ZpvPPHaIRB7yn9NXuUoh1t+keELHo8Nm3n
	A+TpVDQTl0YmVZzC5a6k8YY04TGmNt/J5+HLALzq6l/kXsrs/FGrMaY/jwVDV6zzC8qxTYqh4/oeG
	7RJaMyXNibAIuTfRCeBesfWmeTtch40WHe2n0fZ0RDHr5b4MiqSjLnDmq43w+8IxruueygQHxIDId
	ATurWi0KHEuBRMZXP5RvrHYANQuXE0y9agqMmiYMxcJ2UDFWmgCFc2h8yM/N+VQDv1jKSyNtlsz4r
	udZY+Ge2YvayChDDqz4btg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:35816 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xNB7F-00000001q3n-0X5o;
	Sat, 31 Oct 2026 21:05:33 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: linux-hwmon@vger.kernel.org
Cc: Guenter Roeck <linux@roeck-us.net>,
	Sashiko <sashiko-bot@kernel.org>
Subject: [PATCH 2/3] hwmon: (coretemp) Set nr_cores only after core_data allocation succeeds
Date: Sat, 31 Oct 2026 08:35:27 -0700
Message-ID: <20261031153528.3195123-3-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261031153528.3195123-1-linux@roeck-us.net>
References: <20261031153528.3195123-1-linux@roeck-us.net>
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
X-Exim-ID: 1xNB7F-00000001q3n-0X5o
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:35816
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 10
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfI/QprOHIQ5a78BWFiZlUPJNnlatjdSfBDBkjDtKpbcwgntP2wFA8hMnd3NokiPX0cIrLbFDAUB9LCTVSWzE2ZUA4wDRbOGWQyUh5xxgOgYWPpvDJ12P
 oM5cPmL4Fx0zKP3QWHvgee2HNuo+COBYM5nlMi2Tl8gk8ukihn2G9JQE1Dqa4GVGIdC6zGe+rY6v7Pgm7JJcuSXQWPjRTYSH6+gHR+KLm5Alp0pYXBxpI1Xc

In init_temp_data(), pdata->nr_cores is populated from
topology_num_cores_per_package() before allocating pdata->core_data. If
that allocation fails, init_temp_data() returns NULL with
pdata->core_data still NULL and pdata->nr_cores set to a positive value.

coretemp_add_core() logs the error without failing coretemp_cpu_online(),
so the CPU still comes online with pdata->hwmon_dev registered. When the
CPU is later taken offline (or the module is unloaded),
coretemp_cpu_offline() calls get_temp_data(pd, cpu), which loops up to
pdata->nr_cores and dereferences the NULL pdata->core_data pointer.

Store the core count in a local variable and assign pdata->nr_cores only
after pdata->core_data is allocated, preserving the invariant that
pdata->nr_cores is zero whenever pdata->core_data is NULL.

Reported-by: Sashiko <sashiko-bot@kernel.org>
Fixes: 1a793caf6f69 ("hwmon: (coretemp) Use dynamic allocated memory for core temp_data")
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/coretemp.c | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/hwmon/coretemp.c b/drivers/hwmon/coretemp.c
index eb74ecd12310..7fced0e2abeb 100644
--- a/drivers/hwmon/coretemp.c
+++ b/drivers/hwmon/coretemp.c
@@ -491,11 +491,12 @@ init_temp_data(struct platform_data *pdata, unsigned int cpu, int pkg_flag)
 	struct temp_data *tdata;
 
 	if (!pdata->core_data) {
-		pdata->nr_cores = topology_num_cores_per_package();
-		pdata->core_data = kzalloc_objs(struct temp_data *,
-						pdata->nr_cores);
+		int nr_cores = topology_num_cores_per_package();
+
+		pdata->core_data = kzalloc_objs(struct temp_data *, nr_cores);
 		if (!pdata->core_data)
 			return NULL;
+		pdata->nr_cores = nr_cores;
 	}
 
 	tdata = kzalloc_obj(struct temp_data);
-- 
2.45.2

