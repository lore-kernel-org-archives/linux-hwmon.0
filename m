Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=35.89.44.39
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795310738;
	b=AasfdYtcsCI8qML+lqumCCSYoOkkP3kmrj20YbZd2cK7Nj9Dp5QeBsGYTbXp01ecnKJm
	 pYvBZ1HC8QevDmw5Q7AVqVcnqOA2GtOli6l/luH+VT3D1UBgxGMkjt5aHNWoBBT8c/n8+
	 Pq2joMaoMlRMw7ROQaqVEBzgfecMu8iyAyyzp/4Fy5Hp8aIa6aP0IK6hMgRrOpglZzigw
	 rVr5XGel6p2N1DNAUCmhOT+YBy3pJ4Tw5SQrnQK0MFCGf3NsJF9+lSPmK9hYe+bkjAQgO
	 oV7OjZULm7d2zhshN+CY23B61MSd37IC6bdQwMbuj4/opAAvMtJiCbzUhCEf5v08GXQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795310738;
	h=DMARC-Filter:Received:Received:X-Authority-Analysis:DKIM-Signature:
	 Received:From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-AntiAbuse:X-AntiAbuse:X-AntiAbuse:
	 X-AntiAbuse:X-AntiAbuse:X-BWhitelist:X-Source-IP:X-Source-L:X-Exim-ID:
	 X-Source:X-Source-Args:X-Source-Dir:X-Source-Sender:X-Source-Auth:
	 X-Email-Count:X-Org:X-Source-Cap:X-Local-Domain:X-CMAE-Envelope;
	bh=bO8di3oMDQAshMMKcOVJYz4x6GQ2z0kml5CkFPsBus0=;
	b=wG3meqsZ3sRABH+lNrypR8YQSwP2do+7itAJH8TEIyuuCAsPeGT49KY0cCZv78NqpHLz
	 5nHbDMSYpSmhWn8RxIg4dhivtZVM6BPp1YpF0O7/4idLOkydx6KTDvaGIbrhZiaz2fdTo
	 QnUrZyqZgWHmdO2KMIQyA9RMuqYm0SZWKBZ8cJ9XEJgXreLwb8kNT8QBjzoJ9Vqe5BqnO
	 H8uCaZPXd1i6s+NFvRVas8HDWZgxkuOJFOXSr3PMb04trxxU678sAoKGJg4ANnI41MPLQ
	 2ZLiLnPGFox7NMa5/f46GiAl9BhkahSr2A26+YA/9HCxztfphylWcjvbMiMKJLLKZMQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=none header.from=roeck-us.net;
	spf=fail smtp.mailfrom=roeck-us.net;
	dkim=pass header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=umkPzafi;
	arc=none smtp.remote-ip=35.89.44.39
Received: from omta40.uswest2.a.cloudfilter.net (omta40.uswest2.a.cloudfilter.net [35.89.44.39])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6E266606A320
	for <linux-hwmon@vger.kernel.org>; Sun, 22 Nov 2026 01:25:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6E266606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=roeck-us.net header.i=@roeck-us.net header.a=rsa-sha256 header.s=default header.b=umkPzafi
Received: from eig-obgw-5001b.ext.cloudfilter.net ([10.0.29.181])
	by cmsmtp with ESMTPS
	id UZSWxB1TYyb4YUwKhxgyfl; Sun, 22 Nov 2026 01:25:31 +0000
Received: from 162-215-252-36.unifiedlayer.com ([208.91.199.152])
	by cmsmtp with ESMTPS
	id UwKgx3Zazxmi7UwKgxnypH; Sun, 22 Nov 2026 01:25:30 +0000
X-Authority-Analysis: v=2.4 cv=KuFN2XWN c=1 sm=1 tr=0 ts=6b02448a
 a=QNED+QcLUkoL9qulTODnwA==:117 a=2cfIYNtKkjgZNaOwnGXpGw==:17
 a=zJRp6_cAMcgA:10 a=M0FbrtG7MMAA:10 a=VwQbUJbxAAAA:8 a=pGLkceISAAAA:8
 a=mK_AVkanAAAA:8 a=_jlGtV7tAAAA:8 a=ioUuQICwKvBjnHqD2hUA:9
 a=3gWm3jAn84ENXaBijsEo:22 a=nlm17XC03S6CtCLSeiRr:22 a=KPbNTLLc3YvdawN95zVk:22
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=roeck-us.net; s=default; h=Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-Type:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Unsubscribe-Post:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=bO8di3oMDQAshMMKcOVJYz4x6GQ2z0kml5CkFPsBus0=; b=umkPzafim6EyaDMN/kDnxQ5AAZ
	bIJuvKbbIjJ6RTAM+SR2IQcrgitCGbH182Z2TSl0ee+jOINo9HR8ZAV0Y99qvInLiOPzW/D7EHmWO
	HfZONYZoL/8vwYMGWz47zQ5osQo4rmZoVab2Hlrq8FMX6jJ924u2w0/l9AnsjBp2X4D9Q40B8KBx5
	LOel1oWEthYs7Bj0fellPh/LFq+nni3wHX3YSnEnfxF76GK+oyWQH2nFCOZDgF5XTc6IrDiAQaUZ6
	R+essWgCIWSMbZ/65DiGaPts1V52GgPL4HxVAMOJb7eNDjtpq95a7j8VKjBeBJdv1y3InASorUevm
	2uCQJGqQ==;
Received: from 108-223-40-66.lightspeed.sntcca.sbcglobal.net ([108.223.40.66]:49348 helo=server.roeck-us.net)
	by bh-25.webhostbox.net with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.100.1)
	(envelope-from <linux@roeck-us.net>)
	id 1xUwKg-00000000lTo-0Q77;
	Sun, 22 Nov 2026 06:55:30 +0530
From: Guenter Roeck <linux@roeck-us.net>
To: Hardware Monitoring <linux-hwmon@vger.kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>,
	Nandor Lieszkovszky <spoon3r73@googlemail.com>
Subject: [PATCH] hwmon: (aquacomputer_d5next) Fix collection check for Aquaero devices
Date: Sat, 21 Nov 2026 17:25:28 -0800
Message-ID: <20261122012528.881538-1-linux@roeck-us.net>
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
X-Exim-ID: 1xUwKg-00000000lTo-0Q77
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-Source-Sender: 108-223-40-66.lightspeed.sntcca.sbcglobal.net (server.roeck-us.net) [108.223.40.66]:49348
X-Source-Auth: guenter@roeck-us.net
X-Email-Count: 6
X-Org: HG=direseller_whb_net_legacy;ORG=directi;
X-Source-Cap: cm9lY2s7YWN0aXZzdG07YmgtMjUud2ViaG9zdGJveC5uZXQ=
X-Local-Domain: yes
X-CMAE-Envelope: MS4xfENRLpQgsk6I6NG0o7cVgBbOEVJGFHX5HWKH0CNQOeYe7WkAA17i5blxhllOl3Ikrbb9T487Rq8wswO65HhaBlNztPf9KiVHoBVSdjYBdzPhRdp1lFfM
 0Y98cWKc1qP0i+1mV3gveNHJIkhS4h3g/sGmO4ye3W+uoVn/6Xk7TSVhnRXWP+TtWbb+Z33zR6cuOe+LPbPISS7zDDE2f5Kj1XawML10NStQhokJYG2sPpEP

Commit b7743c6dbe3a ("hwmon: (aquacomputer_d5next) Check maxcollection
when probing AQUAERO devices") added a check rejecting devices with
hdev->maxcollection < 2 before inspecting hdev->collection[1].type in
aqc_probe().

Aquacomputer Aquaero 5 (0c70:f001) exposes three HID interfaces under
the same product ID: "keyboard/mouse" (3 collections, with
collection[1].type == 1), "System Control" (2 collections, with
collection[1].type == 1), and "aquaero Device", which is the sensor
interface the driver binds to and only presents a single vendor-defined
top-level collection (maxcollection == 1).

Prior to that commit, probing "aquaero Device" worked because the HID
core allocates HID_DEFAULT_NUM_COLLECTIONS (16) zero-filled entries for
hdev->collection, so hdev->collection[1].type read as 0. Rejecting
hdev->maxcollection < 2 causes aqc_probe() to return -ENODEV for
"aquaero Device" and prevents the hwmon device from registering.

Guard the hdev->collection[1].type != 0 check with
hdev->maxcollection > 1 instead of requiring at least two collections,
keeping the array access bounds-safe while allowing single-collection
Aquaero sensor interfaces to probe.

This commit was prepared with assistance from Gemini based on the bug
report and proposed fix.

Fixes: b7743c6dbe3a ("hwmon: (aquacomputer_d5next) Check maxcollection when probing AQUAERO devices")
Reported-by: Nandor Lieszkovszky <spoon3r73@googlemail.com>
Link: https://lore.kernel.org/linux-hwmon/3b6ce200-ae89-4629-a05b-bcdc503871d3@gmail.com/
Suggested-by: Nandor Lieszkovszky <spoon3r73@googlemail.com>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
---
 drivers/hwmon/aquacomputer_d5next.c | 5 +++--
 1 file changed, 3 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/aquacomputer_d5next.c b/drivers/hwmon/aquacomputer_d5next.c
index f521a6142a13..884b5cf80fde 100644
--- a/drivers/hwmon/aquacomputer_d5next.c
+++ b/drivers/hwmon/aquacomputer_d5next.c
@@ -1575,9 +1575,10 @@ static int aqc_probe(struct hid_device *hdev, const struct hid_device_id *id)
 		 *
 		 * The difference between "aquaero Device" and the other two is in the collections
 		 * they present. The two other devices have the type of the second element in
-		 * their respective collections set to 1, while the real device has it set to 0.
+		 * their respective collections set to 1, while the real device either presents
+		 * a single collection or has the type of the second element set to 0.
 		 */
-		if (hdev->maxcollection < 2 || hdev->collection[1].type != 0) {
+		if (hdev->maxcollection > 1 && hdev->collection[1].type != 0) {
 			ret = -ENODEV;
 			goto fail_and_close;
 		}
-- 
2.45.2

