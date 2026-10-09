Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E25F4A1E03;
	Fri,  9 Oct 2026 11:57:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547034; cv=none; b=LfAChOzRVMltv258uJdcacahgg7mkOF+Cc1EkW4kuA2OEzp4YT6Gh7HdB7c/NpNU5gWi32Z5s2/fs7zYYCSYtMwHnOfW0lS3I37FTWQR9KgM9yeF1xyTN9Ud+X1ncKAVaq1sYcHe1iLJrAC3vNuijtRLYcCO/Ow+UczpfSPmMJ8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547034; c=relaxed/simple;
	bh=AdVjJtMr3CdW0ZqM8NrNjacg8opX03HD359+gAsE3Wg=;
	h=From:To:CC:Subject:Date:Message-ID:MIME-Version:Content-Type; b=Mep9M06vGNtoN25YDnqnR8pWLMhxJ/iqQVmGy5HkYrdg394sSx05d0KAbdoN/9nLc8eDnUSr+gLCRqGPfiE60djebYa4n1rA0Xdxjkj4XliYrwnfizaunaC9CUIPrYAkuxZ/D/KnxXN3vrxped1taVz6/mzloW3k80pO2XD4EcQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b=dIUUAACJ; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=JkBctpau; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b="dIUUAACJ";
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="JkBctpau"
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699BEjs12961361;
	Fri, 9 Oct 2026 07:56:41 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=DKIM; bh=+GlFYMdev83mDOHc
	Rma9fW8wGWKwwqqrqRyiXPG/IkM=; b=dIUUAACJYctI7mSBaBHRQWgWZglcfQQF
	W1fcYUd7pQ/OepIRYUUJ6PzHc8wVq6snGt78MHaCwHuYXFv3KBRsACyGFZjVOPGx
	Xo0QobjVfeI6WAphxuGCtJAAPhIns/0emfFv6FJ5hCjfrbQ0KuTk8l/R/L8ekitM
	cVeFb0zDRZPYewgXdBwxCCN63AoP+qFVLOoABb4GbrUbwrRXkbuJK48paTxjuMlT
	Bqd0lbdfDA3FFWSiykuFTURHQx2aM4ZwkGhTqVf/srYqWnGl+AceXmGyTR4riJb8
	57N1dIOcmnXITjFwxXwmJhXwia4SrSptkMxs2hBdafqoJn7FmDp+hA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=+GlFYMdev83mDOHcRma9fW8wGWK
	wwqqrqRyiXPG/IkM=; b=JkBctpaumWWAYsgBS3EvA+SEVO8HEIM8H/AJsV6wZq5
	C4lQHO62S/ncOLuTsSljxKUf35TcbgEU2zUJzhihrwM7wlQx95STMDOe0HCykJsL
	7e2ubyd4SQsBfT2ZdweuKe5OR43neD/rTxFlU1u4fIMs/bD05D0D2AHoH+OTVn0A
	tWoqhnCVhvi2YAvJ/PpahpQ5sNAC44fXH6r08UGAuw/Dd1SSIYLO3y83EWJGsDt0
	TrJ1WxCREBAN0fViWKbrsC1mkz9v/RlG1J8xH05mDHbGrMUgglz2zHC4JkR/WfD9
	DjtCQTkMJ7OUzdiTMqCEdOhz5fNSZqJ6KeiF1MPxFnQ==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4h6y7p06q9-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Oct 2026 07:56:40 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 699BudlV041937
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Oct 2026 07:56:39 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Fri, 9 Oct
 2026 07:56:39 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Fri, 9 Oct 2026 07:56:39 -0400
Received: from JGERONI2-L01.ad.analog.com ([10.66.6.190])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 699BuPt7014045;
	Fri, 9 Oct 2026 07:56:28 -0400
From: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
To: <linux@roeck-us.net>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <skhan@linuxfoundation.org>, <jdelvare@suse.com>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>
Subject: [PATCH v3 0/3] hwmon: (lm75) add MAX31875 support
Date: Fri, 9 Oct 2026 19:56:14 +0800
Message-ID: <20261009115617.1976-1-johnerasmusmari.geronimo@analog.com>
X-Mailer: git-send-email 2.44.0.windows.1
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0NyBTYWx0ZWRfX9netB78osWBQ
 YJTVYPpRCLgYOjO5vWkISCOH8GHM2COvGWWlSbbvif84t/A9Qo3NDq9rZP4vFz/LpOZ6gnMoPqF
 D4jYYEviDts4QBnmq2mTXOkFGZaBxfRXqB2INECWfJdR0uRpeXCI
X-Proofpoint-GUID: IwRi8EF7OfDqMu1wBZSyAYBwy1uxIoTG
X-Authority-Analysis: v=2.4 cv=GtfXaU1C c=1 sm=1 tr=0 ts=6ac8d679 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=uXIjobp8t2wMuQ0fPvqm:22 a=GK3B-LJJXsG6dUpCVUAA:9
X-Proofpoint-ORIG-GUID: IwRi8EF7OfDqMu1wBZSyAYBwy1uxIoTG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0NyBTYWx0ZWRfX9ZBbB/LOAhmS
 2xSSf8lE1SIi7FwRXw5nND+JwlzqXpBYufvEen8KDte5Tn2juxtO104OF+vqMvI28iuLVIGENZb
 Z+2G3U5i4I2Sc2ht12WmDlBSDX1p5bccIofSdh7NSdSldKvj1En9xZagLc+9hytcUAx/h5IiG0P
 I2n9ldBW1pam1+jRl2I17zgslY/PL2NXSLESRVryrhXjmT+hvI2PJt+ApYmZwA+XvJlzzteCMJn
 Uhad9WAUJAobXElBxS3NK3BGIB/yFYaLzh2HtUI7v2yuManEdsayqyWZSAtRPt8rLn2LYcoFHiU
 rffIkHcxw8XRJikWicnrEEs1/MQAzsUL357MbzAXIk5o309LorkekMR13wkp7h5RNe95ggshZsE
 9Mf48WqEHZKvREYZC5ykN198yFFvfqC5PREFChev9HCYOvZU0FR2rGooYXZ7MaIi+nbb+RQmr05
 enUUj2lq+F5XN/Ek9FA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 lowpriorityscore=0 suspectscore=0 priorityscore=1501
 impostorscore=0 adultscore=0 clxscore=1015 malwarescore=0 phishscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090047

Add support for the Analog Devices MAX31875 I2C temperature sensor by
extending the existing lm75 driver.

The MAX31875 provides a 16-bit configuration register, selectable
resolution of 8, 9, 10, or 12 bits, conversion rates of 125 ms, 250 ms,
1 s, or 4 s, and an alarm output.

Changes since v2:
- dt-bindings: expand the commit message to explain why the MAX31875
  needs its own compatible string instead of reusing an existing
  lm75-family one, and pick up Conor Dooley's Acked-by given
  conditional on that fix.
- driver: drop the bogus .resolutions table, which incorrectly tied
  resolution to the sample-time index even though the two are
  independently configurable on this chip (Guenter Roeck).
- driver: use the BIT() idiom for the alarm bit read to match the
  rest of the file (Guenter Roeck).

Changes since v1:
- Rework the implementation to use the existing lm75 driver instead of
  the previously selected max31827 base driver.
- Add the MAX31875 Device Tree binding, documentation, and driver
  configuration for resolution, conversion rate, and alarm reporting.

John Erasmus Mari Geronimo (3):
  dt-bindings: hwmon: lm75: add MAX31875
  hwmon: (lm75) add MAX31875 documentation
  hwmon: (lm75) add MAX31875 support

 .../devicetree/bindings/hwmon/lm75.yaml       |  1 +
 Documentation/hwmon/lm75.rst                  |  6 +++--
 drivers/hwmon/Kconfig                         |  2 +-
 drivers/hwmon/lm75.c                          | 24 +++++++++++++++++++
 4 files changed, 30 insertions(+), 3 deletions(-)

-- 
2.34.1

