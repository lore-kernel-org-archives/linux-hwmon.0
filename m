Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793695458;
	b=wbPGQHEabhOFSMHpDtrnmm0Q4eaX7Gbm9SFWB9+2ujG/oyr3aemlhMeSbAuodNeDriGJ
	 VXfBBUzsImcpr1sD7AIv8qff2X1mvHymn8CMPP3VbAaC57ptbJ5eiAlCvf6cSggW0nUw9
	 CipECrP7EopzDq864C/PJQlPIGzjAFTUkDTsqkdB2UPh9ffUDm9VB6rKpZmO/kLynz4Nw
	 OLZGKCyHYnTYNB6LC9nAcz9CdRBYO60Esz0oc+Bp3s22L3AE9eLtIv/wFP6T3LZIFj5Km
	 j23rmvzb0yKLup7RQbelawzzbLf71znb8KZQI4SpzZ1QwWCziopqZo6/ugDibVQp+bw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793695458;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding:
	 Content-Type:X-ADIRuleOP-NewSCL:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=qH+9VB91yGujslX4/B+w27Wt11xrCpYQjbXWFLhGVG4=;
	b=LW8y/eg9VRX2pstcC+0H6G4rUDmu33oN3BbXv4NgecawP9l4jTfvEba4oql2lSv+QBjE
	 AejeRj66kwleykj9P6mR7ZbukR9/f3b+mYESl7fNDvxl3m+mZufbhBPkUaAhkX1k+iu83
	 CHbDlm9lu/+PwuFHyoho6tM5tjVgVigQl2IYUCQu8E+KHVBiidUBWTek/NsNtb5S0AekQ
	 6sjJecCh12mr5LAhFlQogSkgS2OLTojz++U+gbQrS6ZnDbyLwqel3jRBzxHHFuggvQ3BH
	 APaL28z23qHMoAXf6kwakeAeBhckuB/DR73W03kQI7QoN7bIp55DWT51KIj0DCwVciw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=JEPZbqVT;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=WXNj7Zgp;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7380A606A324;
	Tue,  3 Nov 2026 08:44:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7380A606A324
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=JEPZbqVT;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=WXNj7Zgp
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6A37WkN11275413;
	Tue, 3 Nov 2026 03:43:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=DKIM; bh=qH+9VB91yGujslX4
	/B+w27Wt11xrCpYQjbXWFLhGVG4=; b=JEPZbqVTF3/lXQ3isPSxLCBRCo5OXAZ7
	JpOzlL2xteqRfuJ9CnBH9Xg+NOZO+eGOyZ3R5wMzpKn/nnYysFlZJUb0K4dH/AXf
	nEbaUHQ9Vtk+xR9bsn0JnuDkwcupa0ndZGH41RZCC2gJhc2EtNn49jlS3jRVP+6Y
	idHj/NonV2GQiRP0lQgxCOx/nY+SkFha0VVfPd5Q10MkpD4njJqKgLFUfVlXdZZi
	wwAv1KQfZk0Vzwks+iAaMWx9gi4SBHz0EzQBiyDedbvf+5fq6XFXOPaed+CYKHdQ
	yqqitGcBIOdPOZlcoSeq2gsDkLfw4xKitkj4/CnpJ2YAJCQrmLR+VQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=qH+9VB91yGujslX4/B+w27Wt11x
	rCpYQjbXWFLhGVG4=; b=WXNj7Zgp1SluMFfwXNTLtT65Zj6qDs526cr3gweanOI
	zHR8aOYM+qvuhJAsezNTEvmvYikqrGcSIgvlM5kEP/K6SQn94NbG5Focf8bjVHl5
	6sTWQpK9JmKkj+SBwuqtISxOYYHFjZbX43DxTIn+4R+4DtNmZiOz9822jGOCYDY0
	qbsM8WjtzBfVmnU8e7FAr6VxS+gmwSkYt+Tezvdx4etopD3nzQNGAjGAOk6H5ReZ
	Zbt5ZMlzqMYqgsIwcz2uGBm12PZ7GCmvNRnJYwB2LF3UlNSrNxG1tY7vPeGWgCpq
	aK5ue5h/ICjwANuphXnPeLDsTovp+j3WrAcqZumFjSA==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hq0truqwg-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 03 Nov 2026 03:43:53 -0500 (EST)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 6A38hqb7005055
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 3 Nov 2026 03:43:52 -0500
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 3 Nov 2026 03:43:51 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 3 Nov 2026 03:43:51 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 3 Nov 2026 03:43:51 -0500
Received: from CJONES7-T01.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6A38hdTY027828;
	Tue, 3 Nov 2026 03:43:42 -0500
From: Carlos Jones <carlosjr.jones@analog.com>
To: <linux@roeck-us.net>
CC: <alexisczezar.torreno@analog.com>, <robh@kernel.org>, <krzk+dt@kernel.org>,
        <conor+dt@kernel.org>, <linux-hwmon@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Carlos Jones Jr
	<carlosjr.jones@analog.com>
Subject: [PATCH v2 0/2] hwmon: (pmbus/max20830) add MAX20810/15 and LTM4739/40
Date: Tue, 3 Nov 2026 16:43:29 +0800
Message-ID: <20261103084331.449-1-carlosjr.jones@analog.com>
X-Mailer: git-send-email 2.51.0.windows.2
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
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTAzMDAzNCBTYWx0ZWRfXxf9wUcTfAFrO
 Ykuez4jvvtk+PSLUepJ7RC/VeVgbxrWqOGx7nrr00x9tMFdyf8ZaKEQHrpfEL/utlk+C2myCBKj
 VteyJ2yidXSP3iNgp66nVaPZ4/R0ZQ6m0YJFLEvHpwU2MplIcOqGKKlI6f8Szho0m/KiVcCZsHm
 co/mIexpAoAqvmbOzaXJibkYxRVwjJrYExBq9hi/BmZvOk7zz3EmM3TV5m4lI440ALV3XTj2Njv
 3kgXMwy7aIA6OoqeJElHm94WGOKb/Opb8YSf5inBXr+jkUuS29JwfGOif3Z0ZW9SHwVuTSwFKW9
 xEmD4U4wHQpceRXlpoXEKp/4vx9b5rUDdQ1hzwJaOzcysF+R66mJXD8y/Q8S2rTcgM/pSET/ivp
 dTtSFTYHXOoKgribGkPAgU3oKsizfsP3WEkvJkOhFsoObq1EWojPw4c1FmH6tp0r7zn7jk5hLpz
 mCE7hG9MrLc/u7wJmvw==
X-Proofpoint-GUID: mRrApYA56AYS9Wec49LL-UCPC72PqMF_
X-Proofpoint-ORIG-GUID: mRrApYA56AYS9Wec49LL-UCPC72PqMF_
X-Authority-Analysis: v=2.4 cv=P/OvFSAu c=1 sm=1 tr=0 ts=6ae99ec9 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=N--XFCr6TIEc_64PeIT2:22 a=VwQbUJbxAAAA:8 a=gAnH3GRIAAAA:8
 a=GWNPTgfDF31ebz1laCQA:9
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTAzMDAzNCBTYWx0ZWRfXxcgKHLLDy4mL
 kCbwxXcpKw2Sj4YQNvKVgZLFdlEbJx7Jc+qh+k2ULPXTcV2IBajyZXajsy/VLJYxDyrQFXHeP9y
 mQ+CvVXl/yZp71GjTZ6+WInWHv1CQZBIZ25eVTQFHi2tHXdngDQB
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-03_01,2026-11-02_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 adultscore=0 clxscore=1015 suspectscore=0 priorityscore=1501 malwarescore=0
 spamscore=0 lowpriorityscore=0 bulkscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610300000 definitions=main-2611030034

From: Carlos Jones Jr <carlosjr.jones@analog.com>

This series adds support for four additional members of the MAX20830
PMBus regulator family to the existing max20830 driver:

  - MAX20810 (10A) and MAX20815 (15A)
  - LTM4739 and LTM4740, the LTM-series module equivalents of the
    MAX20810 and MAX20815 respectively

All four share the MAX20830 PMBus command set and telemetry, so support
amounts to accepting their IC_DEVICE_ID and documenting the parts; no new
register handling is required. The LTM4739/LTM4740 modules are built around
the MAX20810/MAX20815 dies and report the die's IC_DEVICE_ID ("MAX20810B" /
"MAX20815B"), which the driver matches at probe. Device-tree matching uses
the existing adi,max20830 fallback compatible, so no new of_match entries
are needed.

Patch 1 adds the device-tree binding compatibles; patch 2 adds the driver
support and documentation.

Changes since v1:
- Document the IC_DEVICE_ID vs datasheet discrepancy in-tree, per Guenter's
  review: a code comment above supported_chip_ids[] and an expanded commit
  message, including why the plain datasheet IDs ("MAX20810"/"MAX20815"/
  "LTM4739"/"LTM4740") are not matched (no hardware reporting them observed).
- Rebased on current hwmon-next; no functional change.
- Patch 1 (dt-bindings) is unchanged and carries Conor Dooley's Acked-by
  from v1.

v1: https://lore.kernel.org/all/20261026050241.100428-1-carlosjr.jones@analog.com/

Carlos Jones Jr (2):
  dt-bindings: hwmon: max20830: Add MAX20810, MAX20815, LTM4739, LTM4740
  hwmon: (pmbus/max20830) Add support for MAX20810, MAX20815, LTM4739,
    LTM4740

 .../bindings/hwmon/pmbus/adi,max20830.yaml    |  4 ++
 Documentation/hwmon/max20830.rst              | 51 ++++++++++++++++---
 drivers/hwmon/pmbus/max20830.c                | 10 +++-
 3 files changed, 58 insertions(+), 7 deletions(-)


base-commit: 0dd96d0d34d183866ca6daf5af41341abdfc982a
-- 
2.43.0

