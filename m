Received: from mx0b-001b2d01.pphosted.com (mx0b-001b2d01.pphosted.com [148.163.158.5])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F8221F1534;
	Thu, 25 Jun 2026 16:47:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.158.5
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782406044; cv=none; b=TdmXevBeF2VB1nV9l2oyOdB+0tE/Bdg7vBKRdaIJzI8WopLsilBBYxhQwwABY22lbOO3r/OgEtOsJIC1d03f+3ImcVBR8P2J1DVr9u6/ILuUP1QR2u9LimptrufD1aWGXFJeoaiQfZ3PWes4k1BpsKpAZ3lVZYDApH950/QoyXw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782406044; c=relaxed/simple;
	bh=l2eKcj9yOvAlPePBWGdTTxgBNyrL1Mn+l4/P1WENf3g=;
	h=From:To:Subject:Date:Message-ID:MIME-Version; b=cwXFEkJOIDZbBBm2ZsYnc5Anj4TmIYeEPzP3F+ugQGZfhE373BtOTwjNHW+Kmm3PQJMIi21daAI/BYQ0yD45Sm0a85zw1uHpsr8rtAsVaFtgDSo3KN3V4LrDWGUGExx/yg7Dz2Km0Pae7atkofUEFSO6zn8zSzoFoYhah2JDaoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com; spf=pass smtp.mailfrom=linux.ibm.com; dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b=Azc3K9Wz; arc=none smtp.client-ip=148.163.158.5
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.ibm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=ibm.com header.i=@ibm.com header.b="Azc3K9Wz"
Received: from pps.filterd (m0353725.ppops.net [127.0.0.1])
	by mx0a-001b2d01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65PFmSmO378724;
	Thu, 25 Jun 2026 16:47:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ibm.com; h=
	content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=pp1; bh=VRZkdulMwHtmebzR8E0un/g91g2Knlijy1cbfZ6uh
	MQ=; b=Azc3K9WzA/tSNzYMy0XkWQ9pQj1l2BVKyV9zOD0d3PBO0suYA6eqYMLd2
	95xeBLrz00aujx7an1kIEW+4tglk6VbiUzzNbTuF24ra+S/wAIzz0m86uLfY+ekT
	7vWZKizndxh+qtjZOo4UfhWmK+4+LZsTYxChn3FaHQkphZcyKgYyj1Ec4YK1XJNC
	s0C9/pk63ZJE7O8hQJWAPbre2o27VZgI8/5Vumo2NnQQ0mWsNjiwfzxJlvBWk0oA
	BNTFBxSOlytrOXeE1s02CHPypNqPS915awrgnJseIQP6Iu9Dyh3dzI+ZAF5TIweH
	h00Sza9W3eQ7AgsiG6+SZFfBcBO4A==
Received: from ppma23.wdc07v.mail.ibm.com (5d.69.3da9.ip4.static.sl-reverse.com [169.61.105.93])
	by mx0a-001b2d01.pphosted.com (PPS) with ESMTPS id 4ewh9gtjhy-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 16:47:05 +0000 (GMT)
Received: from pps.filterd (ppma23.wdc07v.mail.ibm.com [127.0.0.1])
	by ppma23.wdc07v.mail.ibm.com (8.18.1.7/8.18.1.7) with ESMTP id 65PGYeRu022159;
	Thu, 25 Jun 2026 16:47:04 GMT
Received: from smtprelay03.wdc07v.mail.ibm.com ([172.16.1.70])
	by ppma23.wdc07v.mail.ibm.com (PPS) with ESMTPS id 4ex6phq0xf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Jun 2026 16:47:04 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (smtpav05.wdc07v.mail.ibm.com [10.39.53.232])
	by smtprelay03.wdc07v.mail.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id 65PGkVmk24314512
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 25 Jun 2026 16:46:31 GMT
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id 7255A58043;
	Thu, 25 Jun 2026 16:47:03 +0000 (GMT)
Received: from smtpav05.wdc07v.mail.ibm.com (unknown [127.0.0.1])
	by IMSVA (Postfix) with ESMTP id BC84D58053;
	Thu, 25 Jun 2026 16:47:02 +0000 (GMT)
Received: from pfw153.pfw.tadn.ibm.com (unknown [9.5.7.52])
	by smtpav05.wdc07v.mail.ibm.com (Postfix) with ESMTP;
	Thu, 25 Jun 2026 16:47:02 +0000 (GMT)
From: Ninad Palsule <ninad@linux.ibm.com>
To: eajames@linux.ibm.com, linux@roeck-us.net, psanman@juniper.net,
        arnd@arndb.de, ninad@linux.ibm.com, linux-hwmon@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH v1 0/1] Fix sysfs device unregistration deadlock
Date: Thu, 25 Jun 2026 11:46:52 -0500
Message-ID: <20260625164700.2797362-1-ninad@linux.ibm.com>
X-Mailer: git-send-email 2.51.0
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-TM-AS-GCONF: 00
X-Proofpoint-GUID: 8EkwjBCPXoDBtR9PQMk3ROxESp64WM20
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjI1MDE0MCBTYWx0ZWRfXwspZZzR54BYJ
 PpXbPrk3lYQe/Jmyj89ApErVYVFfmk+cb4N12JZXt45OaZ+gcrXkLplOkzpAjx3UG/+bRl9BLUd
 j1RaSWkHZl71VfvGY7ZYJbmICR/tInU=
X-Authority-Analysis: v=2.4 cv=c62bhx9l c=1 sm=1 tr=0 ts=6a3d5b89 cx=c_pps
 a=3Bg1Hr4SwmMryq2xdFQyZA==:117 a=3Bg1Hr4SwmMryq2xdFQyZA==:17
 a=FelO9ux0wxsA:10 a=VkNPw1HP01LnGYTKEx00:22 a=RnoormkPH1_aCDwRdu11:22
 a=V8glGbnc2Ofi9Qvn3v5h:22 a=MDdrSkxlTI22Go2xdIMA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjI1MDE0MCBTYWx0ZWRfX2Iqiq45Z8tom
 al/5dcsorpchn7NulXzAqL+exkkrrwiTDT7oHFDx/BF3gIQY9qV2mDGCyxRos04rAhXEMl96Pnt
 A2JYREPaWoQ1vp8tiVJ2f9BDV+2rWRZLfYZ+QyFa2xI3hDvzFwZRJkEuT/i4N7YX7rn/o4WC00m
 dEYg8TnUh0Bgcf3X2fjxJVZ4BVI3oW4zArnaRaoQRqpyRsIOZ0sHxDgp+CsBVNWJV3i8ymwuhuQ
 ceIA6Bym1P3Mkos6DsQfgCM0PufT4uFzpzBqQu1pxRk3ss5DPMEdnrCnWKyruc5xQ6lavYqBITV
 eOBHq3EduL/a5swnw+NSW2OiC7FZ8RpBaS7D6FXozXnZ3ZHBdzUKmJWzrKoM3Me5hfyXW/qDGMn
 PtNVjXY8saV235/rPjEUHPZHVlsEAaktVzE+Bz4tLGatn7jo7H12WE/OxVKSFFOcp2XL3nTXDNP
 HiyjdDx+pboMOcLmlbQ==
X-Proofpoint-ORIG-GUID: 8EkwjBCPXoDBtR9PQMk3ROxESp64WM20
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-25_02,2026-06-24_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 lowpriorityscore=0 impostorscore=0 adultscore=0 clxscore=1011 suspectscore=0
 priorityscore=1501 phishscore=0 spamscore=0 bulkscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606150000 definitions=main-2606250140

Hello,

Please review the changes to fix deadlock in the occ-hwmon driver. This
avoids kernel crash due to hung application process.

Ninad Palsule (1):
  hwmon: (occ) Fix sysfs device unreg deadlock

 drivers/hwmon/occ/common.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

-- 
2.51.0

