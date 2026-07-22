Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 736DD3793CC;
	Wed, 22 Jul 2026 01:30:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1784683815; cv=none; b=A2+enAB5137qqO83nh/0GpVwRv7BW6kFlKuphkknJmdzX8bw52yjZ+JI9F44emyKNxD/inHH1EYP4ZxlhSdY62YMRT88AAWukN+9n5GEVJ7q0W997oh3CQPPXMgyz5MuFxPvYRtnnXS01Yn59Ob7UqgOYDWGLGQpBe8WLvPN9jo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1784683815; c=relaxed/simple;
	bh=3841kedHGeo0OWw7xy7rFboLyST/n3PvEfzZB2YAtHI=;
	h=From:Subject:Date:Message-ID:MIME-Version:Content-Type:To:CC; b=HUf9xgQESC7VCcppy8CQfa6iznjXwxPggaDQkNwWdgP65UgwiyCY7laUrKKB7WmZw7u3hCbvdpYAVzSldfVCennvf2drwVd1tGSYnXW6yHeYdAE5+BsDh2we1aRxg57aOeGQbhoPwkjsDzlFTnA6kqECz0uEBfggZdGVYMAEhHk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=e6i4sOip; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="e6i4sOip"
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 66M1DDHK1779102;
	Tue, 21 Jul 2026 21:29:55 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=HgzenWrm4M86tE2MG++SyPEcfWE
	iozyxMoFd0ihDP4U=; b=e6i4sOipfEhVFE/rM5IO9GyViyUAGmq/S/mhVGA6OOp
	WqE28gnuaBeF4FrwDZ7t4PV7o463/+S0FSKTifkiFs5ZYmdPbQrHK/xnswmxrNb2
	O/dfFtBGMUv/F0iZ4jfuUDapiaQBfPYQ3qL9p6nGevPACutipc88Oe0IZrH2oOeR
	wLe7zcrQNwD/VY+CMAropV3yFNH6jxsZeU1nUN4mkvgCAASTW5N0jz+SfkM7bczN
	eAMyONGZCejFlqgDIHthR/R3bXNlt+7NS7nGmoohdnxhQcOkxHQ9QJ2AdmMiXIen
	lKCZyk01frlSmMj+Ll2ydB3HSK38p+4+NkBtrOFwhCQ==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4fj6vquarj-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 21 Jul 2026 21:29:55 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 66M1TsLt003270
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 21 Jul 2026 21:29:54 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 21 Jul 2026 21:29:53 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 21 Jul 2026 21:29:53 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 21 Jul 2026 21:29:53 -0400
Received: from ATORRENO-L02.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 66M1Tc8B017211;
	Tue, 21 Jul 2026 21:29:42 -0400
From: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
Subject: [PATCH v2 0/3] hwmon: (pmbus/max34440): Bug fixes and supporting
 new device
Date: Wed, 22 Jul 2026 09:29:28 +0800
Message-ID: <20260722-max34451_fixes-v2-0-bbddb18ec1d6@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPgcYGoC/3WMwQ7CIBAFf6XZsxiWIlRP/odpDLRrS2LBgCE1D
 f8u9u5x3svMBomiowSXZoNI2SUXfAVxaGCYjZ+IubEyCC4U16jYYtZWyhPeH26lxHTX0WiVaBE
 VVOkVaT+qc+srzy69Q/zs/Yy/9W8qI+PMnCVaocnQYK/Gm2eYjkNYoC+lfAERUKzHrQAAAA==
X-Change-ID: 20260716-max34451_fixes-788edb623116
To: Guenter Roeck <linux@roeck-us.net>, Kun Yi <kunyi@google.com>,
        =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>,
        Jonathan Corbet
	<corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>
CC: <linux-hwmon@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        Alexis Czezar Torreno
	<alexisczezar.torreno@analog.com>,
        Carlos Jones Jr
	<carlosjr.jones@analog.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1784683778; l=2109;
 i=alexisczezar.torreno@analog.com; s=20250213; h=from:subject:message-id;
 bh=3841kedHGeo0OWw7xy7rFboLyST/n3PvEfzZB2YAtHI=;
 b=ZZwz4aRT5iegIbm5cDpfTeWGktTGMLTWmOCFzP4Y+gVFGQhw6QpZlHWCEJyi2xY5uhTtbNkJZ
 jE+PZqQClagCLLd+IRQ2BZi6phi+zGn0T8AWSHBjp4mW6RNFvktmuBD
X-Developer-Key: i=alexisczezar.torreno@analog.com; a=ed25519;
 pk=XpXmJnRjnsKdDil6YpOlj9+44S+XYXVFnxvkbmaZ+10=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: oVI5WKIs5N1kxkpHjZIHTF1a6byP3i28
X-Proofpoint-ORIG-GUID: oVI5WKIs5N1kxkpHjZIHTF1a6byP3i28
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzIyMDAxMSBTYWx0ZWRfX7KPF086/Zgdj
 Jsi4e/NvW1eHVswihNvMs1c7NbxRt1YQ+wHkaU4cNa5rrXOp4QXKuItDeyORmx1VCje+ae2S9Jj
 oGaB4n7Btw2vbobzfXAVPXRR04U8pnU8ZA0Iu9Zrxr1Du1ibgyyo
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzIyMDAxMSBTYWx0ZWRfXxW7faXBKsB3y
 IpAa1faOZSYtacffnix9DL3bLwTfV+2fFa+sUC53WgTYomi7U/VybvXfLi5p2Psx60WEiyrWZtF
 2v7cT/simvkojfqR9XOgIj4wWPNCXlKIMkMQdfaiuI6C4OWxERF/LCp2Y47BoBXuEsrSATWdocq
 JQXgnUPGnMTQVFhzFKwIYczC8pUpDhbNWlLREsYUHr05Ygx9AluL5RzlxHXA+VlvUPW5N2QBo/r
 1Rud1lmcVR0WIInZYNwFPVVECf0U881d8wxV6KCa9a8PNo1EBcUk8fnr0hAK4VaAsW7t/AXD38o
 8kFxeQNKrLBXdpcXIfZs+sV0pnpP1+/n3hHKQd6h+mloqSJpcMxLy3OOt1lIWib5ktLHEFPcRXd
 G8NkZA9F1az99k0WXw5/RQ6tEenX+LLt6FhfV51S4RMjQ7D2yQ81lbyKPXCBXZQt2KvNqlSPyKe
 aWVa+lgS46d+qM/UfSQ==
X-Authority-Analysis: v=2.4 cv=WIpPmHsR c=1 sm=1 tr=0 ts=6a601d13 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=RAioF0-LDSMA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=VwQbUJbxAAAA:8
 a=gAnH3GRIAAAA:8 a=lAPpY2re-nV465j7mocA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-22_01,2026-07-21_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 adultscore=0 lowpriorityscore=0
 phishscore=0 spamscore=0 impostorscore=0 suspectscore=0 clxscore=1015
 bulkscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607220011

This series fixes register access issues in MAX34451/ADPM devices and adds
support for newer MAX34451 variants and the MAX34452 device.

The first patch addresses an issue where the driver attempts to access
unsupported registers on MAX34451 and ADPM devices, causing CML errors and
triggering ALERT. 
NOTE: Patch already applied to hwmon branch as a fix. It was suggested I
could simply carry this for the meantime to easily submit new versions
of patch 2 and 3 which are dependent of patch 1.

The second patch adds support for the newer MAX34451ETNA8+ silicon revision
which uses different direct format coefficients for voltage and current
measurements.

The third patch introduces support for the MAX34452, a 16-channel voltage/
current monitor that shares a similar architecture with MAX34451.

Signed-off-by: Alexis Czezar Torreno <alexisczezar.torreno@analog.com>
---
Changes in v2:
- Patch 1/3:
    - Accepted and applied in hwmon. As per suggestion, carried this
      over to simplify submission of patch 2 and 3 as dependency exist.
- Patch 2/3:
    - Replaced ETNA8+ revision check from == to >= for future proofing
- Patch 3/3: 
    - Added MAX34452 to unsupported register check
    - Added explicit MAX34451 id check in ETNA6+ feature detection to
      prevent applying to MAX34452.
- Link to v1: https://lore.kernel.org/r/20260716-max34451_fixes-v1-0-a941b27eaecb@analog.com

---
Alexis Czezar Torreno (2):
      hwmon: (pmbus/max34440): block unsupported VIN and IIN limit registers
      hwmon: (pmbus/max34440): add support for newer version of max34451

Carlos Jones Jr (1):
      hwmon: (pmbus/max34440): Add support for MAX34452

 Documentation/hwmon/max34440.rst |  26 ++++---
 drivers/hwmon/pmbus/Kconfig      |   5 +-
 drivers/hwmon/pmbus/max34440.c   | 152 ++++++++++++++++++++++++++++++++++++---
 3 files changed, 163 insertions(+), 20 deletions(-)
---
base-commit: ec5dac32f359168b90f5361a4de16dbf7f258031
change-id: 20260716-max34451_fixes-788edb623116

Best regards,
-- 
Alexis Czezar Torreno <alexisczezar.torreno@analog.com>

