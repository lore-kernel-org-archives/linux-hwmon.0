Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.148.104
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794388439;
	b=CkOYUdD9be09keCvlXACbQmZwaO3Ni72XUUADTuCDknhHK4m+e68QOo1++ukoovCj2++
	 6xe6WMGTrTa9ZL9M3MVQtXE5oBk5KkOqiO8et/Ya7SSDGtwvrGsahN1/YJhvcfEZ1gypw
	 Cfoz+IIeIEYfivCdS0reqNow73/+w4JnUr4DRp1I1JNXLq13Jp6Z5DbLIjwvXaYAi7cw0
	 fxZhAtUNI7pEcvbpXxCmkp/ePwyEPNc2x3XDvA3Ukbpw7XCpNAlv75mfN5dWrzrhsdHFV
	 LF+B2ktrR3POTAH+wc/wBRiXChKvNWECiBFz7OAhNWAGRrcqTw5htUcGzJEJPOUvzpg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794388439;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=ntTR6a/mrAf2Oann8hQryHuhvROe7mQgWuGeWfzmEek=;
	b=IVc4ZiDHv2WRtKFwNPmlxRiDAdRR8YbHUArKnVszPLmEjaYeVpeJd6VomN5IVY1GGqB/
	 j5c+kWpjSldRk6xpKlB8VWoTjraB7BiIHMy0e4RDNMMwQ9vpuiJUlXzD/xahlAsYsvKV5
	 YmYneUSsQbogLerSJbnvavGccHNk646yhb6Cbr9Sd5QqMrBTqJBKsU9zqRt7ewpxr8e0M
	 SqmSS7vCyr+UAtDo+YP4ixuQUsTx4QBhN5f7Q0yOGGmQuyejnI9R7dkYLOiy5YdpsRu9x
	 SLjqEZr0DzsakIIi0lmUrH3YOO0FDLZLeqXF45nwk7F0KvjloGt+d/hwReFYUwQ7nSw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lenovo.com;
	spf=pass smtp.mailfrom=lenovo.com;
	dkim=pass header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=DKIM202306 header.b=Hm3bG80W;
	arc=none smtp.remote-ip=148.163.148.104
Received: from mx0a-00823401.pphosted.com (mx0a-00823401.pphosted.com [148.163.148.104])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A89C4606A321
	for <linux-hwmon@vger.kernel.org>; Wed, 11 Nov 2026 09:13:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A89C4606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=DKIM202306 header.b=Hm3bG80W
Received: from pps.filterd (m0355087.ppops.net [127.0.0.1])
	by mx0a-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AB5MqKv3134335;
	Wed, 11 Nov 2026 09:13:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=DKIM202306; bh=ntTR6a/mrAf2Oann8hQryHuhvROe7mQgWu
	GeWfzmEek=; b=Hm3bG80WDn5tbkrgTli+UEH9Ntyv3YyEY6HrbvqAAST+GJcdRa
	G31NxgU3XwMlFSMyLDk5Kq2/UiS06w8/NhaRSKxHXAiAxHcMuXdDFcwMMy+qCQar
	iHoQoUpi4uTxyv2hCOJxYUbbkoxVg3kxompoub5kbUGOOEc0ZhWkzRySKuMH1Zd6
	MrcYWMpi1ane2NQCL34t9C52Z/BFTtlGfc7cq+i0yzyQJMtwel/15glPyPx0DDq3
	FknzOMk0GWrUD5rtwWA9QZqJECwwKb4PIy4+0Ow+KINoBX0dWF8NWQi4SqqJXyrn
	2r4vPo/TGsepvehTWYxQyieMnchBs4nOb1ew==
Received: from hkglppfpool1.lenovo.com ([103.30.235.218])
	by mx0a-00823401.pphosted.com (PPS) with ESMTPS id 4htguf5eyx-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Wed, 11 Nov 2026 09:13:40 +0000 (GMT)
Received: from shelppfpol2.lenovo.com (unknown [10.122.146.24])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool1.lenovo.com (Postfix) with ESMTPS id 4jPd8S5Hd4z9vWkf;
	Wed, 11 Nov 2026 09:12:40 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by shelppfpol2.lenovo.com (Postfix) with ESMTPS id 4jPd9Z4yl5z4yGy;
	Wed, 11 Nov 2026 09:13:38 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net, jdelvare@suse.com, lijq9@lenovo.com
Subject: [PATCH v1 0/2] hwmon: Add NCT6801D EC sensor support for Lenovo workstations
Date: Wed, 11 Nov 2026 17:13:36 +0800
Message-ID: <20261111091338.799889-1-lijq9@lenovo.com>
X-Mailer: git-send-email 2.43.0
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
X-Proofpoint-GUID: Ck-ZkEs3Cstv2NmKzwTnmTzQhQaIDGL3
X-Proofpoint-ORIG-GUID: Ck-ZkEs3Cstv2NmKzwTnmTzQhQaIDGL3
X-Authority-Analysis: v=2.4 cv=drFOmFg4 c=1 sm=1 tr=0 ts=6af431c4 cx=c_pps
 a=yIlUyoB/d3ZP/uZUHEUQoQ==:117 a=yIlUyoB/d3ZP/uZUHEUQoQ==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=qMr132F7aASziHDET4f3:22 a=0KnvMDrjGmFGMTCBdFsA:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTExMDAzNiBTYWx0ZWRfX2J9LgcSf69dI
 wcyO/4fty3vyoD6wg8Ej32h5SbJobjeXoJozuTLmgvTLN1L6DPqEVzQbHaaMXWVj8PmNwPVGlEJ
 r2hCUetMIE4kup3id5ci2oHv8X87WVyklo5KryjynMhWPocoGZ5CC7J9Ak1L7p2c6d27o3or7sl
 xNsNQ1ESNPGP7aobUXNHmWcpcWnra2l3rig9rMjrVubTEYdFkBNi0zn3lzwrGMYAa3KHje2hcjc
 W5HYn8wX9hVpnmQzrVmy928vZpkl7cxAdAGpuhTghoLdI8ogpY0J2q0KjGdM0UJh9fOscySGW97
 wBU74cLJ5jpY/EASglxeU909l7qdTDrqb1FSMRMWCKFfYJ2W3cRR2RAJHwkhDL8SfGB82lgNQB3
 FsOokEhbzv3aeZ1NDWujxdYaI1h3d+RLzR/tb/HM7DMVeB8N/zHcVip06+CN+Xfxijpfy5VQBje
 aXvMSY1ML6y3PerZPyg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTExMDAzNiBTYWx0ZWRfX1WiiAeANE+is
 wjCdUFl+PwIwBG/vh3aOx82yp9cGEKAu55Xrlw8/hy3iy1KD3LZM0dTM4vYz8WQeOeWFBifKhBe
 NG0+PSwZ9j/X4WHif3J6p6MAF8FW52c=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-11_02,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 malwarescore=0 lowpriorityscore=0 clxscore=1011
 suspectscore=0 priorityscore=1501 phishscore=0 bulkscore=0 adultscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=-20 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611110036

This series adds hwmon support for the fan and temperature sensors of
the Nuvoton NCT6801D embedded controller used in the Lenovo P3 TWR G2.

The controller does not implement a hardware monitor logical device.
LDN 0Bh is the ATXPGD/BEEP/DDR4 block, and the sensor registers nct6683
expects at 0x100/0x140/0x160 do not exist in the Datasheet at all.
Adding the chip ID to nct6683 is therefore not enough: it makes the
controller recognizable, but every reading stays invalid. This was
confirmed on hardware before implementing patch 2.

Patch 1 adds NCT6801D to nct6683 and fixes two problems found on the way.
The Super-I/O ID was compared after masking with SIO_ID_MASK (0xfff0);
the existing chips carry zero in the lower nibble so this went unnoticed,
but this one reports 0x0113, and masked it becomes 0x0110 and matches
nothing. The new check therefore compares the unmasked value; the switch
expression remains masked, and val itself is not modified. Separately, an
unset base address (0xffff) was accepted because only 0 was rejected,
which registered a platform device at 0xfff8 and exposed garbage instead
of failing.

Patch 2 adds a driver that reads the sensors where the firmware actually
publishes them: the EC shared-memory window of the SHM logical device
(LDN 0Fh). The base is not hardcoded but read back from the SHAW1..SHAW5
configuration registers, and every candidate window is checked for
plausible sensor data before use.

Testing on a Lenovo P3 TWR G2: the driver locates the window
(0xfe500200) without any module parameter. Under full load the CPU fan
goes from 808 to 2920 RPM and the CPU temperature from 32 to 100 C. At
the same moment ACPI TCPU reads 100.05 C, TCPU_PCI 100.00 C,
x86_pkg_temp 100.00 C and coretemp 101.0 C, i.e. four independent
sources agree within 1 C. checkpatch reports 0 errors and 0 warnings.

The layout inside the window is defined by platform firmware rather than
by the controller, so the offsets in this driver are the ones this
machine's firmware generates. A machine whose firmware lays the window
out differently fails the plausibility check and reports no sensors
rather than wrong ones.

Changes in v1:
- Initial submission.


Jiqi Li (2):
  hwmon: nct6683: Add support for NCT6801D
  hwmon: Add driver for the NCT6801D EC sensor window

 drivers/hwmon/Kconfig          |  17 ++
 drivers/hwmon/Makefile         |   1 +
 drivers/hwmon/nct-ec-sensors.c | 507 +++++++++++++++++++++++++++++++++
 drivers/hwmon/nct6683.c        |  21 +-
 4 files changed, 543 insertions(+), 3 deletions(-)
 create mode 100644 drivers/hwmon/nct-ec-sensors.c

-- 
2.43.0

