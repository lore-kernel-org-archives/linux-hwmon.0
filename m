Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=44.202.169.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793386389;
	b=gsmHSoN9Z6QUbE1PXXlFySu8kG97VkXRxrMGBzefxsOZpDZZHt8L7UiL5gygTHC4YGe3
	 EEitgNEDnIHzSfuWpn7KcTNkeH6mSg0uvB+LaLhzwIpKby8zeENXu1HF/EKJ8YNgz6ToP
	 WkQJX1AT/B4XfvPzU8ao/FvHbYlX/M1tZcxv/XvfdoYet+oacEAYe/gSMh1nLnpCvyt6f
	 FnYMHKinN57KUosNYjqVeGjjMA3YdBGMKxFth7P3dS31F127XfXAadhUXTDSVaxc61g2X
	 ModW/H4AgvHKqlIVzCyNZ3aNrpHtKMG68BxVxXDNEXgA8nD5Ut3+fkY+ULySPE5CDBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793386389;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:
	 References:MIME-Version:Content-Transfer-Encoding:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:X-BWhitelist:
	 X-Source-IP:X-Source-L:X-Exim-ID:X-Source:X-Source-Args:X-Source-Dir:
	 X-Source-Sender:X-Source-Auth:X-Email-Count:X-Org:X-Source-Cap:
	 X-Local-Domain:X-CMAE-Envelope;
	bh=BwycUcCJglBnwW44a0uKxPK05tls2ytWSAKTWwXxUI4=;
	b=rMogq/AIS3d/lBqpyZGHJjEtVZzYGBdqil9ZLZkFhevoTQmxsFEKAx1/YLKJWBaikjYs
	 0vRU8RkpMqdSilX9/khD2WrOy99dg3vuvD1epgQFKn3K2M/ATqibWCDXFH9CWXPs7pASV
	 8Jfs+P8wQtoLOTrswdma1vdTOCCLM1a+T5PprWDFReFJBK3A91JobV318iKR0vXNvOEGi
	 sGdFle5kbkyQp0O96bbvPzF3sNwukzJBvS21SS+z1Y4n3DGsYl2l2p4XOWX6IBrlFyJDQ
	 bWPa0ku8bV5IFO9UsngDOXaTl6zDY5VexYX/XRlvy3NJ3WZ0m4OnnOKORBolfq1saPA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=lZfsdIkY;
	arc=none smtp.remote-ip=44.202.169.39
Received: from omta040.useast.a.cloudfilter.net (omta040.useast.a.cloudfilter.net [44.202.169.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 690F1606A31A
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 18:53:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 690F1606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=lZfsdIkY
Received: from eig-obgw-6007b.ext.cloudfilter.net ([10.0.30.166])
	by cmsmtp with ESMTPS
	id MY9cxCpUtMylkMrivxhnRp; Fri, 30 Oct 2026 18:53:09 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id MriuxkgpykE4RMriuxRodG; Fri, 30 Oct 2026 18:53:08 +0000
X-Authority-Analysis: v=2.4 cv=LuaSymdc c=1 sm=1 tr=0 ts=6ae4e794
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=660iZSQnnn4A:10 a=M0FbrtG7MMAA:10 a=pGLkceISAAAA:8 a=W7o7ocYhAAAA:8
 a=_jlGtV7tAAAA:8 a=tbbDLPJ8OxLx_v7SEQAA:9 a=9uIKRcg7Gvwk8o89M4RL:22
 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:
	List-Archive; bh=BwycUcCJglBnwW44a0uKxPK05tls2ytWSAKTWwXxUI4=; b=lZfsdIkYAvlu
	tcRETN2pZFK+erWZ4kQNmjRgnmE1Sm+PkpJcz8a3EOKWVQYBsfNQQd69HLK+T70qlKAE4FwIovxvE
	qYYpGvaB+xUQztgGZipucy67TFugdS+aeIgqN5xpQtbpgGz+rkZxS4vV+rMjzEcwuLGnbEhyrO4cq
	ig8N+sAMsGBj+GXUM4QTanr300MyLRlnvTWtH18VLCN8b3pINdXNP8xMPFlHrr10TdA9s0lxOYrT1
	88nL4ptHLDM6mV8keen/lNOlyTNjBbfS6FegQATqdDrV+VElp+n2oFJA9lZ5ACJR15uHxgWX5rvTA
	1tC5yR5FtAmWZAfwE3ZGRg==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:54934 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xMriu-00000003RGQ-0C76;
	Sat, 31 Oct 2026 00:23:08 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Aleksa Savic <savicaleksa83@gmail.com>,
	Jack Doan <me@jackdoan.com>
Subject: [PATCH 01/11] hwmon: (aquacomputer_d5next) Check maxcollection when probing AQUAERO devices
Date: Fri, 30 Oct 2026 11:52:46 -0700
Message-ID: <20261030185256.976255-2-linux@roeck-us.net>
X-Mailer: git-send-email 2.45.2
In-Reply-To: <20261030185256.976255-1-linux@roeck-us.net>
References: <20261030185256.976255-1-linux@roeck-us.net>
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
X-Exim-ID: 1xMriu-00000003RGQ-0C76
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:54934
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 13
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfOr20Qv9SIJGfbD2YKGXTtTBZ2zcWYuL5gvzmtTJNqbPMeH7+aQUh4tsHyBFOaaVnLq35v/Z2Ent8npO473hzml9lQNnpf/f0+nW+LZYbRNf3gRuZk7b
 Rqe6HDUnJLXjPFXeMhUANQRko5A3M2o3xX27gFQCJD06h2u5XpKeFGZp9AHdn3//aDCyF+0UX+0RUPShGs/++QOfapGLAvteD6eSOvX4gj6QJf8CS7YDMpck

When a USB HID device matching USB_PRODUCT_ID_AQUAERO presents a
malformed report descriptor, an out-of-bounds array access occurs in
aqc_probe() due to an unchecked index into the parsed collections array.
During device initialization, the driver distinguishes between the
multiple logical interfaces exposed by the Aquaero device by evaluating
the type of the second element in the collection array. The driver
unconditionally accesses hdev->collection[1] without verifying that
hdev->maxcollection is greater than 1. Because the collection array is
dynamically allocated by the HID core based on the number of collections
found in the report descriptor, a crafted device exposing fewer than two
collections causes an immediate heap out-of-bounds read or NULL pointer
dereference. This leads to a kernel panic during the device probe phase.

Add the missing check to fix the problem.

Fixes: 2c55211104b4 ("hwmon: (aquacomputer_d5next) Support sensors for Aquacomputer Aquaero")
Cc: Aleksa Savic <savicaleksa83@gmail.com>
Cc: Jack Doan <me@jackdoan.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/aquacomputer_d5next.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
index 341cce4347e2..6565731b0e71 100644
--- a/drivers/hwmon/aquacomputer_d5next.c
+++ b/drivers/hwmon/aquacomputer_d5next.c
@@ -1570,7 +1570,7 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		 * they present. The two other devices have the type of the second element in
 		 * their respective collections set to 1, while the real device has it set to 0.
 		 */
-		if (hdev->collection[1].type != 0) {
+		if (hdev->maxcollection < 2 || hdev->collection[1].type != 0) {
 			ret = -ENODEV;
 			goto fail_and_close;
 		}
-- 
2.45.2

