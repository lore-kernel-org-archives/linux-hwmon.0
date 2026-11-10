Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304893;
	b=HEFNo0ifdvZFKYG/ioPfOb5UMn661b2n7pYKjA4BwTq9l7yXJ59EKP6WyO9ZshlRdFrq
	 pl1+RnEJxqtHTTFLiQuAfahn0PZdv9UPw1+RASvvdvOxLhzCiesEz1DUgQGhX/R8jje3h
	 SWbw+VwH4bpJsR4owjwh90OQg0O9Nt8siQJ8vERSG1lUy4BfjtI95ZDSm14/O28exJ+dT
	 TDRfqE91FFiedPfxhJX8FluVKPS//qv3sT+qnHhK3Ohr21tSDdBSanEfl8YVOwi2kXmGK
	 7rz17D2gKRalzeDmikML1qZum+jfNHoZt2qqWe7nGYIGSWBA9LufPOy9qhj/4Xj2ztg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304893;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:From:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ADIRuleOP-NewSCL:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Pcf79JCJAWHbiN6Vn4/htZhJapEM9Xf8xgTLcJyZEcE=;
	b=eQBjrv0SxIG98OkejaqxQTFKXR+fLWHeXkVNxeqfsnNieOId1nMtCI49vL4BxDjD1+kE
	 rD7Y8iss0rGU1+HfsLUUxiDnloLlRrmILEJtACULJJtd98tdHD8YRcCRgjL1LpD6yimZG
	 w6jfjYIhtUkj14RYoq8jceDHe7i4VQaQaMFxffjRphWyGTYbhsnP1bb4den+Hr+O+9L/y
	 D0T85D+/DCCSaow1D/hA3YVgcEyHwbpUF3pJajJ3BENSWcJ6B4OGQDkB3J7iO4tIG29KM
	 Cv/3b/YSa/TKCfyZ5Vr9/JF3jD8GObsP786eb/BFPqda5JRfHBvFEf/z09HyMiPNGRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=rQMnbe0t;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=UyFzQBOG;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A29C7606A33C;
	Tue, 10 Nov 2026 10:01:32 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A29C7606A33C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=rQMnbe0t;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=UyFzQBOG
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7lHuo3216554;
	Tue, 10 Nov 2026 05:00:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=DKIM; bh=Pcf79JCJAWHbiN6V
	n4/htZhJapEM9Xf8xgTLcJyZEcE=; b=rQMnbe0tR1P12PChTNuf6RLu2Eqsqt3H
	XcfAXgt+QaIMbUqOSUiR74tBu/n3dkVT/5xTV7yrFwvLhA8iRSdHHuCDc640gBDr
	wa4kj2ff31+i4OE0OZED4QW9DoFqbwffs4DyZQgRzdajAScL1CiYOjyzL8t7F3Zk
	lwqViPnBi2BsuBSyn9QHTahiONSloAXkUsfwVb5Z9Ftjy2vypb2HcnUv2facACWZ
	VLId3LtIyLPU8gCYdai4O9aVjT8wDAWgIMyowb3lycH8jf7Y8XuDh4b4PRzxT+nY
	x3tvUJVsdBSd5/4Ccbs1VklMuXAG/LwAT+LkrDfKV1yfDf4RnOJPKA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=Pcf79JCJAWHbiN6Vn4/htZhJapE
	M9Xf8xgTLcJyZEcE=; b=UyFzQBOGfJJzc2WziCMovN4whtbapVxhmcyv/KeJruX
	NVdtpcfvcOjxscGrDWqa4Wuj5AvlL96CrlAiBr4OgidG2POnuKVO1pvTRKBhNsLd
	lPlJeR/O6PL4IhgiO+JTn7gVE/Ab8UABj/Cq1P35hFVifkAoQ0djJGW5TjSSVy/r
	UFr2/POnR1ThFOBO4yhNSs+nqySTSDn1UwV1MpTuWyPXro0YTeaOrLW6gJl5fu3d
	v0YrYqQDK12xF2YaXmUCdqjKkc/JSz6JUWRblmmF/SYOq1enDansABPyflXBRwc1
	pnS6nysEMSh5Om6kiM05sG8LuLMScuAi4ruOvo28C1A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4huwenhffq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 05:00:59 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6AAA0w1a021107
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 10 Nov 2026 05:00:58 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Tue, 10 Nov
 2026 05:00:58 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 10 Nov 2026 05:00:58 -0500
Received: from HYB-GHaNx595DZ2.ad.analog.com (HYB-GHaNx595DZ2.ad.analog.com [10.117.116.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6AAA0eua008466;
	Tue, 10 Nov 2026 05:00:43 -0500
From: Christopher de Guzman <christopher.deguzman@analog.com>
Subject: [PATCH v2 0/4] hwmon: (pmbus/ltc2978) Add support for LT7175 and
 LT7176P
Date: Tue, 10 Nov 2026 18:00:39 +0800
Message-ID: <20261110-upstream-lt7175-lt7176p-v2-0-dd60d28383bf@analog.com>
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAEfr8moC/4WNSw6DIBRFt2LeuDRAI2hH7qNxwOepNCoG0LQx7
 r1+FtDRzUnuvWeFiMFhhGe2QsDFRefHHfgtA9OpsUXi7M7AKReMckrmKaaAaiB9kkzmV4iJ6BI
 f0mhVNNzCvp4CNu5zPr/qi+Os32jScXc0OheTD99TvbCj99+yMEJJIXSpJS90mdtKjar37d34A
 ept237KNgzd0QAAAA==
X-Change-ID: 20261020-upstream-lt7175-lt7176p-b9e37cba8f2d
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan
	<skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Christopher de
 Guzman <christopher.deguzman@analog.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794304841; l=2885;
 i=christopher.deguzman@analog.com; s=20261020; h=from:subject:message-id;
 bh=lNd3XhwiREZFjb8YSQiZAwOfJHUr5v741WXrnVtLqRY=;
 b=Agu+HOC9yGUx1vqE4ETtOEHCPsoLD9Ci82Rv4+OF8VKpRF4OfaMCsxWeI52b31R2eKU2CG+7k
 KVO36Bi28CHDLFvzauczxWifcFHi+7R9wZ0ZLauFTfZJKyA9tyu05xs
X-Developer-Key: i=christopher.deguzman@analog.com; a=ed25519;
 pk=nSwfp91RWULY/zCnrDkBvXulgnpfKy+5C6/Gh3ecLwo=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: DhpFf0MzOw6gwGEVNxo9MZ1-_B8gBm-6
X-Authority-Analysis: v=2.4 cv=Dv/Da2/+ c=1 sm=1 tr=0 ts=6af2eb5b cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=OmVn7CZJonkx5R5zMQLL:22 a=bC-a23v3AAAA:8
 a=gAnH3GRIAAAA:8 a=_jlGtV7tAAAA:8 a=VwQbUJbxAAAA:8 a=8AirrxEcAAAA:8
 a=07d9gI8wAAAA:8 a=ag1SF4gXAAAA:8 a=JfrnYn6hAAAA:8 a=LjB95_yAhz7QVSCH7TwA:9
 a=QEXdDO2ut3YA:10 a=FO4_E8m0qiDe52t0p3_H:22 a=nlm17XC03S6CtCLSeiRr:22
 a=ST-jHhOKWsTCqRlWije3:22 a=e2CUPOnPG4QKp8I52DXD:22 a=Yupwre4RP9_Eg_Bd0iYG:22
 a=1CNFftbPRP8L7MoqJWF3:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX8rFEKJI1v4J6
 t8ZMhywRB3i508Xc2suqRQ/ThwwbwNoLuMSK4ixeyxKbQcbmSDM39dqplvw6BgJdnB1zCdaJIJi
 ymT//Vz8HW43o/xqFwM006V+s1cjMliQthrNUim1Urr2qhz0BWicDx0tpJTM3ov9CSC8eSvG3Py
 aiyU/sOxSPAfTn8qGBblhFY0w9iVP/kwS8I8mxERI2cFxHYsIHgslAi951HDIkersrMIvrNmYQu
 yJDmW7Ozussjkt9STFqZo4IKV9a1u08hBDTk6kIKAZH2q7ZQXBekuUFZYd2bvkTQW8ngqPZNnYn
 ZHvDcWKkqL/S6QPJycqCJ46+nlNQ+K1+iZdO+KroFFjifW9VuLAbAFn2Fqs/zcSNUmXP/RCbESr
 UGG224rNezrvubdjylMQiZRRu+4bwzK0j1Qmbly2xlOmrr+By/qlA8tOY/lpeQEFwpRWBJ45kPp
 m7RrnfdZGpoGtOjuJzg==
X-Proofpoint-ORIG-GUID: DhpFf0MzOw6gwGEVNxo9MZ1-_B8gBm-6
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX4zDnKS5ss5PA
 z9u/3msZ7XA/z0vL0Spb5FIab+k+tm3Di3OKWsvBIAvhtK8QiizlOqXnQ6sWjHgXsM59AFhyynU
 92VYfz6B5fEakPQJ0VjzfFvHboDRR5y3nlq2QZCKv1lQtTBfO5/x
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 suspectscore=0 priorityscore=1501 spamscore=0 lowpriorityscore=0
 impostorscore=0 bulkscore=0 adultscore=0 malwarescore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100039

Add support for the LT7175 and LT7176P PMBus buck regulators to the
ltc2978 driver. Both belong to the LT7170 family (MFR_SPECIAL_ID
0x1C1D) and are identified by their PMBUS_IC_DEVICE_ID string.

Patch 2 also changes how LT7170-family chips are identified: the
IC_DEVICE_ID string is matched against ltc2978_id[] instead of using
a strncmp() per chip, as suggested in review. Patch 4 fixes a related
documentation error for LT7170/LT7171.

Tested with LT7175 and LT7171-1 eval boards on a Raspberry Pi 3B. The
chip identification change was tested on a 6.12 kernel because the
board does not run hwmon-next; the series is build-tested on
hwmon-next.

Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>
---
Changes in v2:
- Drop the -1 variants from the bindings and the i2c/of tables (Guenter)
- Add lt7175/lt7176p as case labels on the existing lt7170/lt7171
  probe block instead of duplicating it (Guenter)
- Identify LT7170-family chips by matching IC_DEVICE_ID against
  ltc2978_id[] with a length check instead of a strncmp() per chip;
  this avoids reading past the returned data (Guenter, Sashiko)
- Don't list LT7175/LT7176P under the curr1 "iin" label (Sashiko)
- New patch 4: remove LT7170/LT7171 from the curr1 "iin" label for the
  same reason
- Not addressed: ltc_get_max() compares IEEE754 peak values as LINEAR11
  (Sashiko). This is pre-existing and also affects LT7170/LT7171; I can
  send a separate fix if that is useful.
- Link to v1: https://patch.msgid.link/20261020-upstream-lt7175-lt7176p-v1-0-86b9b728b95d@analog.com

To: Guenter Roeck <linux@roeck-us.net>
To: Rob Herring <robh@kernel.org>
To: Krzysztof Kozlowski <krzk+dt@kernel.org>
To: Conor Dooley <conor+dt@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
To: Jonathan Corbet <corbet@lwn.net>
To: Shuah Khan <skhan@linuxfoundation.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org
Cc: devicetree@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org

---
Christopher de Guzman (4):
      dt-bindings: hwmon: ltc2978: Add support for LT7175 and LT7176P
      hwmon: (pmbus/ltc2978) Add support for LT7175 and LT7176P
      hwmon: ltc2978: Document LT7175 and LT7176P support
      hwmon: ltc2978: Remove LT7170 and LT7171 from curr1 iin documentation

 .../devicetree/bindings/hwmon/lltc,ltc2978.yaml    |  4 ++-
 Documentation/hwmon/ltc2978.rst                    | 32 +++++++++++++++++-----
 drivers/hwmon/pmbus/Kconfig                        |  6 ++--
 drivers/hwmon/pmbus/ltc2978.c                      | 23 ++++++++++------
 4 files changed, 45 insertions(+), 20 deletions(-)
---
base-commit: 0b6eda22f9ab67ddb2a872b0c3fc578ad9f4e27e
change-id: 20261020-upstream-lt7175-lt7176p-b9e37cba8f2d

Best regards,
--  
Christopher de Guzman <christopher.deguzman@analog.com>

