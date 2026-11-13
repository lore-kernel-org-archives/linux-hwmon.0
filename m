Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.152.46
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794565568;
	b=O5Dt8eqEuJBa1NJIn04Al4luJxkedaf7Eot7mxKvzN/5rmuEZ4fEG+Kp1BgoEzDe0jnN
	 McmkHqaGu0lRBNUZmaMiHpZgLoWhFUl6FmceGf3TW0mg9ez7J+lR4FgGVc6DUpdZhyRn2
	 QdWy85Rx1jGGfnF6vtLQLHaxE3/U6w3D8e1PVK0rJJghOSG4KBrQgPBe7fxNmnVwC1rvW
	 I8GSt+wpxWKwZko1Jc0FfDjqmsE9hVgimzwufO5P61PY4XvDHQeVLuvBsSH/BZCc64n92
	 RdONJLf25O8u8vLgACfSgtYC6HjPzpiMgO4PQby3/Y25azk3OtBWvmG18nrBjvtYLtQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794565568;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:Received:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=M+OSgcbjWvoZ2YLGqtriC49+bnJNgZwKzMe/Z/vbpT4=;
	b=Jou+z1/aqZxBhutNbhfPt10QKhPzykmJsFlljPL4+2FEtV8fKowFYxUNOCZkukbfZPEk
	 VPOEauyKGapJ2nGR/wja0T/67sGSoAEb8VJrYXE95WwIHcswlGIy+6+gDcMTIi58Gorq9
	 f5bAtdQFGKrlZIdTXk7aLnez17MtLPnTnhSK0jvtStteJ/N7jbPOSMmsJaCvY76Uvur+p
	 MDr9cjp+BmT6SiN2Iftgb2Pct9cbr13x2tBVfHuJVDnCVU+gN6fikWgU/7NzuA90TAxMZ
	 AEY995XuV/Zbd7V8rsr4Re7ZUHXEFKJq0RD+2GSZD6Lj5/Ff+Q9JvCuvytwY78izMOQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lenovo.com;
	spf=pass smtp.mailfrom=lenovo.com;
	dkim=pass header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=DKIM202306 header.b=UboW8kIq;
	arc=none smtp.remote-ip=148.163.152.46
Received: from mx0b-00823401.pphosted.com (mx0b-00823401.pphosted.com [148.163.152.46])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7FD89606A893
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Nov 2026 10:26:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7FD89606A893
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=lenovo.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lenovo.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lenovo.com header.i=@lenovo.com header.a=rsa-sha256 header.s=DKIM202306 header.b=UboW8kIq
Received: from pps.filterd (m0464639.ppops.net [127.0.0.1])
	by mx0b-00823401.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AD8X7UU2289570;
	Fri, 13 Nov 2026 10:25:47 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=lenovo.com; h=cc
	:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=DKIM202306; bh=M+OSgcbjWvoZ2YLGqtriC49+bnJNgZwKzM
	e/Z/vbpT4=; b=UboW8kIqK500h/tmZ2V63qOpKniEudgA6Ya0dIFkKsrFf5ncFT
	FQhOWJPr9wC2C0P4XsmDk4NfRKMogxTkbFly7YxexGk1RcfOexB58XEwphZnhX/y
	vUF6nepX2UjvLIxMVOV+nAO0MztkM8mheT+xjsJGnwiwfR7T1njmd23tJMSM1EQ/
	WdxeMLlGk0obaNQkDBcGqeOGWNN/BdCe3ka+cSHLsQyGpTMoTVLXOGPkwey1vJAr
	kkZLkoOVwRV6i9R9DiHeonvAFIsyO5pB9ayhP1GSA3/FLr+JwHlLaZybjJ8nVNYB
	J5ePHmk4JA/ZQsAhLqphS6dhzxAMOcx9r1QQ==
Received: from hkglppfpool4.lenovo.com ([103.30.235.221])
	by mx0b-00823401.pphosted.com (PPS) with ESMTPS id 4hth76arcg-1
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 13 Nov 2026 10:25:47 +0000 (GMT)
Received: from hetlppfpool2.lenovo.com (unknown [10.196.132.72])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hkglppfpool4.lenovo.com (Postfix) with ESMTPS id 4jQtgs5H3xzpMNR6;
	Fri, 13 Nov 2026 10:25:45 +0000 (UTC)
Received: from lenovo.com (unknown [10.119.171.213])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by hetlppfpool2.lenovo.com (Postfix) with ESMTPS id 4jQtgs1fK0z18W8nW;
	Fri, 13 Nov 2026 10:25:45 +0000 (UTC)
From: Jiqi Li <lijq9@lenovo.com>
To: linux-hwmon@vger.kernel.org
Cc: linux@roeck-us.net, jdelvare@suse.com, lijq9@lenovo.com
Subject: [PATCH v2] hwmon: Add NCT6801D EC sensor support for Lenovo workstations
Date: Fri, 13 Nov 2026 18:25:43 +0800
Message-ID: <20261113102544.893158-1-lijq9@lenovo.com>
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
X-Proofpoint-ORIG-GUID: HYK1Ep1Ru0LSRWAcag09Qge2TjhC-vl1
X-Proofpoint-GUID: HYK1Ep1Ru0LSRWAcag09Qge2TjhC-vl1
X-Authority-Analysis: v=2.4 cv=Or3aWC/t c=1 sm=1 tr=0 ts=6af6e5ab cx=c_pps
 a=kYoHdcNGVJUooFJAQZl1vA==:117 a=kYoHdcNGVJUooFJAQZl1vA==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=2RTuljz969oO5usasWGy:22
 a=tZVLdjz43cR2fSHv5-fA:22 a=qYyBFI0LXN302s6qaD0A:9
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfX/bfVJIzextar
 rlVSG+nvIpjHL3JCae1nuUKwfvu1DTc+4I0xE4wEMlHx/FnI4kjp3aZGa4poWuIFvcW20Ne2FDZ
 8X757E4bE2iFDHmgfWFtRKrj29bmPa8hTo+86fShnL6KUZN+7CShfqIHBj4W5Erxz9iU6mXBlcs
 PgcV4MptnWIQ1xqeiVsEiVTgoTdI4bgDO7ieFPpskpsm31BjUMmtR/C5x2QPjhNl30Szwr96UsN
 eLl7HtQVLWeCFt4oK2u+kOkCokeYBfaIVlb4IhYtXidm2EL5VK+9yxr6xqHPym3mqkr8qcD4iKY
 0CgRgcTSY5Xc8RJGFP8/YctFj27cTQp2WFUgLtXTeINutgvKKPJh3LkPk/DZFrYVQ+NBOnJID3Q
 7QicqMPx4DSKeeW9ujm5EdJ8wOe0J0VLKyqPE3YOg5kX4RGcNKIH1NeM6PJgQ7oGMIQgas1ISnq
 kuJVdPwjXyvK6mWmJ7g==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEzMDA0MSBTYWx0ZWRfXwS0kvOwukQdA
 ppJkLgvAsTMHtdMCQvsHO0ODGye+gV8kTx8vF/RShTRTmcTw0hnABbc6Hm5xBVOwOpXzaSIOjhT
 dYQSPD38CMfb+2bHruQq3NosncwIG8Y=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-13_03,2026-11-11_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 priorityscore=1501 spamscore=0 suspectscore=0 phishscore=0
 malwarescore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=-20
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611130041

This adds a hwmon driver for the fan and temperature sensors that the
Nuvoton NCT6801D EC publishes in a shared-memory window, as found on the
Lenovo P3 TWR.

The controller has no hardware monitor logical device. LDN 0Bh is the
ATXPGD/BEEP/DDR4 block, and the registers nct6683 expects at
0x100/0x140/0x160 do not exist in the Datasheet at all.

The window is read directly. The DSDT also defines WQD1..WQD5, which read
the same offsets under the MWMI mutex, gated by FAAS bit 3. That bit is
clear on this firmware, and the driver refuses to bind if it is set at
probe time, so the two access paths do not run concurrently as long as
the BIOS leaves the flag clear.

Testing on a Lenovo P3 TWR: the driver locates the window (0xfe500200)
without any module parameter. Under full load the CPU fan goes from 808
to 2920 RPM and the CPU temperature from 32 to 100 C. At the same moment
ACPI TCPU reads 100.05 C, TCPU_PCI 100.00 C, x86_pkg_temp 100.00 C and
coretemp 101.0 C, i.e. four independent sources agree within 1 C.
checkpatch reports 0 errors and 0 warnings.

The layout inside the window is defined by platform firmware rather than
by the controller, so the offsets in this driver are the ones the P3 TWR
firmware generates and each layout is selected by DMI. The driver is
named after the Lenovo EC shared-memory window mechanism rather than
after the controller or a single model: the same mechanism may appear on
other Lenovo systems with a different layout, and supporting one then
means one more DMI entry and one more layout table. A machine whose
firmware lays the window out differently fails the plausibility check and
reports no sensors rather than wrong ones.

Changes in v2:
- Drop the nct6683 patch. That driver cannot drive this part, so adding
  the ID only turned into a probe failure.
- Match by DMI instead of the controller ID, since the layout comes from
  the firmware.
- Name the driver after the window mechanism instead of the controller.
- Read the ACPI FAAS flag at probe and refuse to bind if the ACPI sensor
  interface is enabled.


Jiqi Li (1):
  hwmon: Add driver for the NCT6801D EC sensor window

 drivers/hwmon/Kconfig              |  18 +
 drivers/hwmon/Makefile             |   1 +
 drivers/hwmon/lenovo-shm-sensors.c | 547 +++++++++++++++++++++++++++++
 3 files changed, 566 insertions(+)
 create mode 100644 drivers/hwmon/lenovo-shm-sensors.c

-- 
2.43.0

