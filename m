Received: from mx0a-001b2d01.pphosted.com (mx0a-001b2d01.pphosted.com [148.163.156.1])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 066161A9F87;
	Thu, 25 Jun 2026 16:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.156.1
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782406043; cv=none; b=W4+lkHFlVwIgyJ0RIPAl7944aAFyeiOpuS0frkpgnzkwF6O1OXZ2bCFKYPoPigDDEa1QQXhPObarTbiiV0N1LAVt246ofFYu0y07J4BWvVjLKP58a0UmBHrUnYlVDzi9gSL6PECU2ipxDlFn9Qp7WJeliaew3rhCwP7iEnAV0eg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782406043; c=relaxed/simple;
	bh=CNS5lnxrF1UxTeAeVAO4vafSNJKHqDLrqOcxDZI/9oI=;
	h=From:To:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jYukWCXlNQ9KPsw0m3iM7sjzKxMFfEn6Qfoik8igb7YGjFIrnZEWSb/UMPSSOxNQGc1zvYgdRZHTsb6cqXVl4yhphxvmaKyMP3On13OihypahHBMPywV8PdRdbSlRT7PQIklCI4TdhdvTNRcDqqb0q2MbdD/W59fnqLKIjTRs44=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=rVGF3vJ3; arc=none smtp.client-ip=148.163.156.1
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="rVGF3vJ3"
Received: from pps.filterd (m0360083.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFmOEe486684;
	Thu, 25 Jun 2026 16:47:07 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:in-reply-to:message-id
	:mime-version:references:subject:to; s=pp1; bh=UkWQt6Z8aR8puNgIW
	vyj5aMgFGkNXcLMEEVb9XubUC4=; b=rVGF3vJ3m94x3wesJxknqvZMSkahRSHA7
	B+HbMyQTvTWCobc4LygP2lfrBQKxUdrlVGzJuYftdhO/udHrfrj3MU1iKhxQyA6H
	nC5/9cOlGSGINhCM/XpsIL+zp2vyU2lZFOMcVoc21WpHMENrUonCVcxAJNP3UOLL
	Se5YRoiPzvuA20AGoTw+CkcDbPneNSCEWb47P6q23aGfvz7yfK8WDvFcGn1IAQLd
	Fi6O0FmGJBMvdpkf8Hzp4b3BwN/NDJXMVLrcHaKvPHdvM0aDCyW11SHttNszpMkK
	GyjdkLnoqn78Hv+Gvx7yARrBqel9IOPQXUc9YPUeoVsMJRfPulviA==
Received: from ppma21.wdc07v.mail.ibm.com (5b.69.3da9.ip4.static.sl-reverse.com [169.61.105.91])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewjc3tyfw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 16:47:06 +0000 (GMT)
Received: from pps.filterd (ppma21.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma21.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PGYgns016405;
	Thu, 25 Jun 2026 16:47:05 GMT
Received: from smtprelay04.wdc07v.mail.ibm.com ([172.16.1.71])
	by ppma21.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ex66kf3gw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 16:47:05 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay04.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PGl4YI39060212
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 16:47:04 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 4260E5805F;
	Thu, 25 Jun 2026 16:47:04 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 9580958053;
	Thu, 25 Jun 2026 16:47:03 +0000 (GMT)
Received: from pfw153.pfw.tadn.ibm.com (unknown [9.5.7.52])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 16:47:03 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: eajames@linux.ibm.com, linux@roeck-us.net, psanman@juniper.net,
        arnd@arndb.de, ninad@linux.ibm.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 1/1] hwmon: (occ) Fix sysfs device unreg deadlock
Date: Thu, 25 Jun 2026 11:46:53 -0500
Message-ID: <20260625164700.2797362-2-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260625164700.2797362-1-ninad@linux.ibm.com>
References: <20260625164700.2797362-1-ninad@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Authority-Analysis: v=2.4 cv=X4Ni7mTe c=1 sm=1 tr=0 ts=6a3d5b8a cx=c_pps
 a=GFwsV6G8L6GxiO2Y/PsHdQ==:117 a=GFwsV6G8L6GxiO2Y/PsHdQ==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=iQ6ETzBq9ecOQQE5vZCe:22 a=VnNF1IyMAAAA:8 a=PO-QMXBumzaoU13EfK0A:9
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE0MCBTYWx0ZWRfX2gYzI6fNfRXp
 kBh0MtQADi7a8CQrs9b+8aaxtW3GV/xGDYFnCNN8A8SeyJvhG0k3rlNa6/5e7VsLXz9ef53HQbg
 9RdTMual6MOOxUCBivvorI/1FWWcy7Y=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE0MCBTYWx0ZWRfX/93yR2PoLStd
 awyzEjzjo7NO5TPAxK5DmSk8patP/dTap3BCgqE5WeK9xUmKYTUrWvTS1y9qGUQZCPNyqZ9W5Xo
 IDzV/XiNhueJHhJEhVBgN4gCWCb5v+Le2w6o9RtEb25zM7gTV8BTB6Gqcl5xl0hgwll0Mi/qSXw
 9MUxQx7nCoVejj94AMimWI32FCusl/P9Tpw48HC/5EBewtyF1UjLxEO1ZJRjrt9HQ6/ZAAFFxY0
 PgqCHjMo8BR9Z5sjy6wwEr0qeTWg/r0Sv6qsuUjyX1Zl+P0zAvKt6u0YItzlNcUaAb2Wkrx1BCp
 MGJsLaVKPjZlf/pgce8qO8IqQFp+s2w6Wa7uRdODgzu/tAvr7WUJCCLKIabzsAIxFI1IiyAQZbw
 zxEPycISw/J/QGwdN/r0Sq0xAiJuFTcmIXOf4IV7YN8bcjz6eDcuXPza8h4nYPvd7MJdd1NDGyU
 MJz6nw5axEjGN8hmQjg==
X-Proofpoint-ORIG-GUID: xh16AkkNjfoKkHqqDM5qVU6o33PG2rJ9
X-Proofpoint-GUID: xh16AkkNjfoKkHqqDM5qVU6o33PG2rJ9
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 suspectscore=0 spamscore=0 priorityscore=1501
 impostorscore=0 malwarescore=0 clxscore=1015 adultscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250140

Release the driver lock before unregistering the hwmon device to prevent
a deadlock. The device_unregister() call can block waiting for sysfs
operations to complete, but those operations may be blocked waiting for
the same lock held during unregistration.

The deadlock occurs when:
1. Thread A holds the driver lock and calls device_unregister()
2. device_unregister() waits for sysfs operations to drain
3. Thread B is blocked in a sysfs read operation waiting for the driver
   lock
4. Neither thread can proceed, causing a hung task

This was observed during power system remote restart operations when
concurrent sysfs accesses occurred during OCC active state transitions.

Kernel log excerpt showing the deadlock:
  INFO: task openpower-occ-c:1430 blocked for more than 122 seconds.
  Call trace:
   schedule+0x28/0xfc
   kernfs_drain+0xc8/0x174
   __kernfs_remove.part.0+0x138/0x21c
   kernfs_remove_by_name_ns+0x7c/0xcc
   [...]
   device_unregister+0x1c/0x5c
   hwmon_device_unregister+0x58/0xb0
   occ_active+0x6c/0xe74
   occ_active_store+0x54/0x80

Reproducer:
  Run these two scripts in parallel:

  Script 1 (continuous sysfs read):
    while true; do
        cat /sys/class/hwmon/hwmon14/power15_cap_user
    done

  Script 2 (OCC active state toggle):
    while true; do
        echo 0 > /sys/bus/platform/drivers/occ-hwmon/occ-hwmon.1/occ_active
        echo 1 > /sys/bus/platform/drivers/occ-hwmon/occ-hwmon.1/occ_active
        sleep 0.2
    done

Signed-off-by: Ninad Palsule <ninad@linux.ibm.com>
---
 drivers/hwmon/occ/common.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/hwmon/occ/common.c b/drivers/hwmon/occ/common.c
index 42cc6068bb08..a5641dbbba2f 100644
--- a/drivers/hwmon/occ/common.c
+++ b/drivers/hwmon/occ/common.c
@@ -1149,15 +1149,22 @@ int occ_active(struct occ *occ, bool active)
 			goto unlock;
 		}
 	} else {
+		struct device *hwmon_dev = occ->hwmon;
+
 		if (!occ->active) {
 			rc = -EALREADY;
 			goto unlock;
 		}
 
-		if (occ->hwmon)
-			hwmon_device_unregister(occ->hwmon);
 		occ->active = false;
 		occ->hwmon = NULL;
+
+		mutex_unlock(&occ->lock);
+
+		if (hwmon_dev)
+			hwmon_device_unregister(hwmon_dev);
+
+		return 0;
 	}
 
 unlock:
-- 
2.51.0

