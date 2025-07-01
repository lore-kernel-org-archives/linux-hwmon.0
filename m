Received: from outbound.pv.icloud.com (p-west1-cluster3-host10-snip4-10.eps.apple.com [57.103.66.103])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A430F27EFFF
	for <linux-hwmon@vger.kernel.org>; Tue,  1 Jul 2025 15:25:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=57.103.66.103
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751383555; cv=none; b=HK49+IeZCwORQYafrukgv+sQnrFWmpmAaoFlSdk0y2YVEegOerNmmg4cQ9u4c4yzOase19B1bOzAmCGbh07CA0nbdqCsE9lxW+Wglyc4tobcLTiq3XDqKp9DrULMxrudl1c9mWm1YcSZqM0MuFrwWGM+jOG0FaFoibpGvve5pm0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751383555; c=relaxed/simple;
	bh=772AHxo34d+5R8nYtMyLmqSAXi7BfYHTfqb9YvzEvJc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u+A8bGiFwS6eG1BSy56SYZfA1h7+0h7UMli0vebZfaHvsclrUcbH5s8Gog0z3pHON4jaVJjYuY8my/lzBXUahos5Z9epRZF1B8KilJwzOHyNcuYjZC2s3Zl0S0jGS6BZJNCLO6b9p1353c7ZdPYMcjcxp2uQKBaYzS4NVxZD+Ho=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com; spf=pass smtp.mailfrom=icloud.com; dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b=B+8QEkSZ; arc=none smtp.client-ip=57.103.66.103
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=icloud.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=icloud.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=icloud.com header.i=@icloud.com header.b="B+8QEkSZ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=icloud.com;
	s=1a1hai; bh=N68iTZhVLnXxKDyqKngfBwKlCKSy1yb29iAlSAAd/vM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:x-icloud-hme;
	b=B+8QEkSZIw8O7tNMxOsgjqyXO7y+8gwj6Tkv6SBSzHV/2/WQh053Y7CimDPVFSV0R
	 K4vssldmHTCwQC4xPUFZL33awKCarVQVERuamtM/F9m9UhfwueVvUZowXqnUrmX07J
	 ugwE52biVQssoMjeN7ljIDuI7E4JWPBIHmFuRvAlr0MogxIWVpfTfhnM8biJ+aT3UT
	 KlGEOwoLd6FCN+Mir5j+6VTQhAEwSjoCLrBwyShYV3vxMAn7ahkjQpXwJmTMlObJzJ
	 BxGhehIfCHrIYGLfoAu9BUkIsg4PFqa3qO3F180Ta8EC8Ok1gzPBZSmFMaK7XsUssX
	 +WvMusJj0XLEA==
Received: from outbound.pv.icloud.com (unknown [127.0.0.2])
	by outbound.pv.icloud.com (Postfix) with ESMTPS id E8A4418000A8;
	Tue,  1 Jul 2025 15:25:49 +0000 (UTC)
Received: from [192.168.1.26] (pv-asmtp-me-k8s.p00.prod.me.com [17.56.9.36])
	by outbound.pv.icloud.com (Postfix) with ESMTPSA id 5EABE1800155;
	Tue,  1 Jul 2025 15:25:45 +0000 (UTC)
From: Zijun Hu <zijun_hu@icloud.com>
Date: Tue, 01 Jul 2025 23:24:43 +0800
Subject: [PATCH v2 5/9] char: misc: Make registering dynamic device reentry
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250701-rfc_miscdev-v2-5-3eb22bf533be@oss.qualcomm.com>
References: <20250701-rfc_miscdev-v2-0-3eb22bf533be@oss.qualcomm.com>
In-Reply-To: <20250701-rfc_miscdev-v2-0-3eb22bf533be@oss.qualcomm.com>
To: Arnd Bergmann <arnd@arndb.de>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Rudolf Marek <r.marek@assembler.cz>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 "James E.J. Bottomley" <James.Bottomley@HansenPartnership.com>, 
 Helge Deller <deller@gmx.de>, "David S. Miller" <davem@davemloft.net>, 
 Andreas Larsson <andreas@gaisler.com>
Cc: Thadeu Lima de Souza Cascardo <cascardo@igalia.com>, 
 Zijun Hu <zijun_hu@icloud.com>, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 linux-parisc@vger.kernel.org, sparclinux@vger.kernel.org, 
 Zijun Hu <zijun.hu@oss.qualcomm.com>
X-Mailer: b4 0.14.2
X-Proofpoint-GUID: TT2HF4qHnhqAbWyev-ZQKXjH7hIgC7gP
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNzAxMDEwMyBTYWx0ZWRfX0Ya5ejokYAEE
 u3sv+NIJQZi/JQSLsHdqi3HXbOTgJhLZS3zagwQItjdY+re5y3O5rDNX4YzyaK25c+4+c0yl6VN
 naTR8d9CvHobALgDKSIBNEYi4QOcXPAv6Arcmp7AZIL4QiNf7LWJQ/Mx3EkCbeDGJTb5VkMuCI/
 n6xdD9ErV52snpbyni1tV4U0AFtMnt2LR/YMforvVw6AjIeZpP4beACpF0cgpMlGrx/Sfsk7JO9
 wc/ozOzSx4IghfMxDHG/BdDaeN+lPJrRNosEIH7MQoOVE4ZkoWbJgxUuwiiucNSuiTBZ65XqM=
X-Proofpoint-ORIG-GUID: TT2HF4qHnhqAbWyev-ZQKXjH7hIgC7gP
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.1.7,FMLib:17.12.80.40
 definitions=2025-07-01_02,2025-06-27_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=notspam policy=default score=0 bulkscore=0
 clxscore=1015 spamscore=0 malwarescore=0 suspectscore=0 phishscore=0
 mlxscore=0 adultscore=0 mlxlogscore=999 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.22.0-2506060001 definitions=main-2507010103

From: Zijun Hu <zijun.hu@oss.qualcomm.com>

misc_deregister() frees dynamic minor but does not reset @misc->minor
and cause kunit test case miscdev_test_dynamic_reentry() failure:

| Invalid fixed minor 257 for miscdevice 'miscdyn_a'
| #miscdev_test_dynamic_reentry: ASSERTION FAILED at misc_minor_kunit.c:639
| Expected ret == 0, but
| ret == -22 (0xffffffffffffffea)
| [FAILED] miscdev_test_dynamic_reentry

Fix by resetting dynamic minor in misc_deregister() as error handling
of misc_register() does.

Signed-off-by: Zijun Hu <zijun.hu@oss.qualcomm.com>
---
 drivers/char/misc.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/char/misc.c b/drivers/char/misc.c
index b8e66466184fa21fb66d968db7950e0b5669ac43..96ed343cf5c8509a09855020049a9af82a3ede95 100644
--- a/drivers/char/misc.c
+++ b/drivers/char/misc.c
@@ -288,6 +288,8 @@ void misc_deregister(struct miscdevice *misc)
 	list_del(&misc->list);
 	device_destroy(&misc_class, MKDEV(MISC_MAJOR, misc->minor));
 	misc_minor_free(misc->minor);
+	if (misc->minor > MISC_DYNAMIC_MINOR)
+		misc->minor = MISC_DYNAMIC_MINOR;
 	mutex_unlock(&misc_mtx);
 }
 EXPORT_SYMBOL(misc_deregister);

-- 
2.34.1

