Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795538909;
	b=MIVTEfYOs5c3J2+cgjQGPsgSAZiTRth/hvImHjU+Gy7WT1/3GA2twn0rgXFL3QXlXES/
	 zx65fsUzu/SyCiBxGWrYmSFBRvOaOLMe1dhQFc6NytxW0z3TIvRztXyofobNJFjW5bYwc
	 9+NiZpXxf/g24Dn4T/SiHNp0wHj5QpsYNVcnv23vTqqjTGp0NNI2aWBIhkYmgy3BkSYYi
	 tmD/oNx6f66F8goGwvy+M2GottTNYzDjQ/dzAGjDl9xjVNc4gnL/WVB0TJYxypiLAu835
	 tD3TRCchsNHcndhJl/iSFIO50G7voOBzP8SvVdaM5LeGoC/g0ZLgtJPiA+xIyp5ndSw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795538909;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:From:Subject:Date:Message-ID:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:X-B4-Tracking:
	 X-Change-ID:To:CC:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-ADIRuleOP-NewSCL:X-Proofpoint-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=0ciIMHEO6Tw9DykCCDloXXqHwvT6j+8iSiYW9SEd6Io=;
	b=otpXTYIK/LZJfCKoHkiWjZorxg/Tn3t8oI4UWerHEyK24pPdWSC1/smGIIZfNRgL4L4Y
	 70moiRN1Uo4HJEtb3kdXoV2T4Rq+L2WYnZs2O1s9ZzP67nNk3F7iE+NGGB10C90a61ymx
	 MWJe1N5WVQ4uKKd/nw8Z5/KmMZeUt+cxuaP+DywHPqKgaf7athnRxSMrT9WiSFomPCDXf
	 UFwjd+wfk06BKHD57sNntxwSoaCxOmcxDXZJp8leWimVgZraeu9fF3WdPd/wLVESUh6iW
	 XuJlcMEmh23iSpg1Gs4xBDRcC85ydCGDoF07VA71tfcm/8I5ZuEcaQxFf0sZ85Vl0vQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b="TEjSxr/5";
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=zBOvZxp3;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EB9D760A262C;
	Tue, 24 Nov 2026 16:48:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EB9D760A262C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=TEjSxr/5;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=zBOvZxp3
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AOFXmGt3728106;
	Tue, 24 Nov 2026 11:48:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=DKIM; bh=0ciIMHEO6Tw9DykC
	CDloXXqHwvT6j+8iSiYW9SEd6Io=; b=TEjSxr/5w3TEMrZbyS10pIpZIhR88JxB
	dPQuDVSv6eNv5RBIGc0ZiiKA0uBRSBEdl01FEnfOk4Y/EQtxXb2EGgxy28bNC+gE
	J/1tn8n81DtEHjTChmq0IF4xtF/vbh4WP+dOnz6BXuFj0TNfufM+ZGpwJMoJn2fS
	68V1iIMxdOHNoAYLFq1O4beHYDxqAxEm3LiPAo8glfw/YbSMZmrFLwAFnwRqIC3j
	gr0uM7FdCyTS92yAiNr4cQxyfkUGMB8m4wW/mLEmEDSe6vkz6GgMbOMs7EYE8p02
	UFhLQSNfVyJOPvbqKqZXMSU/o6NyGQRBUqPH8a7N0cPGhk6FCmoWwQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=0ciIMHEO6Tw9DykCCDloXXqHwvT
	6j+8iSiYW9SEd6Io=; b=zBOvZxp3lewQ7ww60yZCRr1/1jX3oT1LcrI+IdOP1pE
	TK6D+Tqkr1w8nin9mvAVrWu/3MZEzJIITlSQZeqYRT8m7yWF+Qnj9AYaemRtS4aJ
	ahdlGdB6QlbXYuF0J2mkQhaN6akNVuuVPUecXft+SchhrSmRvnLSHEyU6sGDg7Oy
	t9OyG2nFD25fvdD9pEWjSvYSwttQ4ch9tnJx2pmAszXoKeiQMReWAuTWtn781q8a
	yLwpUSKkgcqyrrRiheZluSbie782YDFZkqIKnyoJfEdWQXdH7/0HOrijG9iruqth
	DhBQ23uV/ZMWjnC/OB+/RPTEBJQ0AjY1ni6JHCRWi7Q==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4j5db68fvx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 24 Nov 2026 11:48:02 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6AOGm1Yq035737
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 24 Nov 2026 11:48:01 -0500
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.56; Tue, 24 Nov
 2026 11:48:01 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.2562.56 via Frontend
 Transport; Tue, 24 Nov 2026 11:48:01 -0500
Received: from HYB-GHaNx595DZ2.ad.analog.com ([10.66.6.191])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6AOGlfXd028468;
	Tue, 24 Nov 2026 11:47:46 -0500
From: Christopher de Guzman <christopher.deguzman@analog.com>
Subject: [PATCH 0/3] hwmon: (pmbus/ltc2978) Add support for LT7170L and
 LT7171L
Date: Wed, 25 Nov 2026 00:47:34 +0800
Message-ID: <20261125-ltc2978-lt7170l-lt7171l-v1-0-7b8d0d5f4266@analog.com>
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
X-B4-Tracking: v=1; b=H4sIAKa/BWsC/yWMQQqDMBAAvyJ7biAbsUn8SvFg4rZdCSqJiiD+3
 ainYQ4zOySKTAnqYodIKycehyz4KsD/2+FHgrvsoKR6I6pKhNkrq02mRi3DQwzCdNZZY2zZOgm
 5niJ9ebvPn+bxtLie/Hzt4DhOT5bvRHsAAAA=
X-Change-ID: 20261125-ltc2978-lt7170l-lt7171l-8d9b98893ab0
To: Guenter Roeck <linux@sinkhole.paloaltonetworks.com>,
        Rob Herring
	<robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
	<conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
        Jonathan Corbet
	<corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap
	<rdunlap@infradead.org>
CC: <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        Christopher de Guzman
	<christopher.deguzman@analog.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795538862; l=1481;
 i=christopher.deguzman@analog.com; s=20261020; h=from:subject:message-id;
 bh=LeuZTB1tBYg7gNH8DknGYXXwc1iOhAxWegHIe0mOWJg=;
 b=R9J03aWyWwy6hVPEoz1Nba/DsFrHpu+GgUKehvGqvbs+BujNB6RNMuiAZ3tKqacQWaS0dHRBM
 5le9tTBvXvFCGORLd4ZQWbXwVvZqHtVx5W2wY8P0WP1P/oLsb7yL9Il
X-Developer-Key: i=christopher.deguzman@analog.com; a=ed25519;
 pk=nSwfp91RWULY/zCnrDkBvXulgnpfKy+5C6/Gh3ecLwo=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-GUID: fbC8jfd0M0M4u4Zdn94OpqQQHldsujsB
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfXxv21OkoaUVK4
 e+QhOsAmk5yk40dbh2OCDKRVrtOEGdlj4J8FND/TARTNFmnG/+2PSTHK2C6z51ptXoKhMRnmKlH
 LZjNPOCdfcSNxhiofl9b6Me4+SvjO+V6yW+AcCWt+tSO809ir7lrrUeLFOpy6RinNRwiC1XUbvv
 uCc87ssZX3QqaDDKE7QiW7qcH5JzGedtmQebV3vo1cUs4EzXx+scNBMory2uTtqUGr30NMKbd6x
 TJkicCka6EPtQxCSmfDM62692vV6Ovfq6PMC7RERJRYnpsY1TqkZPZgEnv7W2JjHbame6/bgeMf
 tS14d7SzfkORcmC64KXEM5DKZ9KPFhD6SUxWuOjwn3HOELFz0GMPXoqduuNb8fekXOaCDLtnM1s
 Z1L56skOCFfcxb56sAuWMnkRwoFCWc3UkkjMSopOL1/S2CSLilA1AEcznZ2a/HRMAEKyOUu8vG8
 4JXlzjfjDQ/xBUOKiJw==
X-Proofpoint-ORIG-GUID: fbC8jfd0M0M4u4Zdn94OpqQQHldsujsB
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTI0MDA2NSBTYWx0ZWRfX+/7nJLs8Gsn+
 ZxIDEm/JdioFQyD0Xx4un9twR/cevffd1MxJm38HHEwvmRuBKRTmReNpJi2Cce+7Sa0hK/vsXX+
 BELoMx4m/zN/KuEAieX8mdlvbz8LIaeaupf/KCQRnfnqu5etRpX4
X-Authority-Analysis: v=2.4 cv=H99OUOYi c=1 sm=1 tr=0 ts=6b05bfc2 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8
 a=RV0HS6Ou6FJYiY6bC4oA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-24_04,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 priorityscore=1501 bulkscore=0 adultscore=0 clxscore=1011
 impostorscore=0 lowpriorityscore=0 suspectscore=0 spamscore=0 phishscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611240065

LT7170L and LT7171L are pin-compatible variants of LT7170 and LT7171
that add a pulse-skipping mode for improved light-load efficiency.
Telemetry is identical, and they report the same MFR_SPECIAL_ID and
IC_DEVICE_ID as the base parts, so this series only adds the names:
i2c device IDs, OF compatibles with lltc,lt7170/lltc,lt7171 as
fallbacks, and documentation.

Tested on an LT7171-1 board on a Raspberry Pi, instantiated both with
new_device (lt7171l) and from DT ("lltc,lt7171l", "lltc,lt7171").
LT7170L was not tested on hardware.

This series is based on hwmon-next, on top of the LT7175/LT7176P
support and the IEEE-754 peak comparison fix.

Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>
---
Christopher de Guzman (3):
      dt-bindings: hwmon: ltc2978: Add LT7170L and LT7171L
      hwmon: (pmbus/ltc2978) Add support for LT7170L and LT7171L
      hwmon: ltc2978: Document LT7170L and LT7171L support

 .../devicetree/bindings/hwmon/lltc,ltc2978.yaml    | 73 ++++++++++++----------
 Documentation/hwmon/ltc2978.rst                    | 29 +++++++--
 drivers/hwmon/pmbus/Kconfig                        |  7 ++-
 drivers/hwmon/pmbus/ltc2978.c                      |  4 ++
 4 files changed, 73 insertions(+), 40 deletions(-)
---
base-commit: 12c53b6b6e5ac3723b49de3e4ea0742200d06d05
change-id: 20261125-ltc2978-lt7170l-lt7171l-8d9b98893ab0

Best regards,
--  
Christopher de Guzman <christopher.deguzman@analog.com>

