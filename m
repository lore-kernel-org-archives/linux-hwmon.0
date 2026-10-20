Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792496794;
	b=kHI2hJh410CgqYitqnjA9IqisKJQ6K6I3971tpP1yX4tSOTkKTkm/bBX+fX7nAv04YsR
	 u+oi2Bdfy10AyvvQlGiXmgZxJJ1hKKske36LRDOsI6C7gU3iF8kmiP+jOYdg0xuL08ze7
	 4ftNDMdB3jkhOtqUy/10UYF3+kQ2o1bwbsZ+5r70vdp88H3scbTRqELrRmv5Q9nR7qXZw
	 W+Rsq++QQEc03NDBUeo7D/fCHjkJ24vUg9WePuf9EHt2IW2ivhSV8PtSkmyAKfKdrftCl
	 walmKV3612JXP1urejZ78ZiI6VShqHMHtzDth5DXolSvhVZ1Ln7BHGbQj+OOhQcfQGQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792496794;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:Received:From:Subject:Date:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 X-B4-Tracking:X-Change-ID:To:CC:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-ADIRuleOP-NewSCL:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=fErcrlnM/YaJTAWy1uFy6lQ3TX1o+cz9nnx/CkWWgyU=;
	b=wUPBe/NofwKspsfFd++lSPTaGclyhx75Ksl57DcwuRp3XEzZgbvOXB1OGDHhZ53HJWCh
	 Ge5OXh5HgaQ5BFQxkWoZ1poFqmLXsLJsbPozRe2U8ToiKdhAHi9ZNe2kJydU6h4RFR8Ri
	 XfG8qAzfTC6/g096yJiriV4pOv95+7iwbL6h3qwOYSn9q8bJGPhsyG/yW1uzAeDo4SBvF
	 l/VBg/Lm/EJKaYOtwqlYpPlg30GRE+VjM9LNNcyObwymZmTL6yDDBotdX0v3Z3oLTpxZv
	 OHjmD9i2iZvRWX8BqvbErVY4GAUv5Vf8Pi1VBUI3/y5W5VOZMXbEISNurRUC4grCrbw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=mWafaeLo;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=YN8Ftl8d;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6DD6606A31A;
	Tue, 20 Oct 2026 11:46:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A6DD6606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=mWafaeLo;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=YN8Ftl8d
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69KACVCC2341473;
	Tue, 20 Oct 2026 07:45:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:message-id:mime-version:subject:to; s=DKIM; bh=fErcrlnM/YaJTAWy
	1uFy6lQ3TX1o+cz9nnx/CkWWgyU=; b=mWafaeLoWpkI9DF/CLUkkHk0LE8v4SyO
	WtAw3M5uAVe6+8DLryBygvfraGysUFtxAzu+4n9UJ8KvAvJWVx6RK96UkihStsze
	hEBC8m23dj6a82dtrR7C7t8diSsuPXk/QSXW62sumJNaXouDX5zCWShV3gZ8HK+9
	DYjKCIxeLSzIfBZrdo1m+EQ7tgXz5d/WjMYg4OFiuv+WrEursIFcGKWaCQxt3rvS
	wfpXMZQWCy0zGWfWOl/LdEkwWEDgCtMYH7ydnnO+7hwDNnPGBhR4+oPBG9WyyN0c
	iV+TRsgvQ/KiJr+kV3rHhcW51WT6+azsm/F9V8dTHkoHS++9mda2Eg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:message-id
	:mime-version:subject:to; s=DKIM; bh=fErcrlnM/YaJTAWy1uFy6lQ3TX1
	o+cz9nnx/CkWWgyU=; b=YN8Ftl8dqaCxgUiB0aMvBY8d/PGnXMWRwEvdZ3dqqzd
	TydV7JMddvFeHIwcS27HkLfoyXBHbqX2b5bNiLlfr33tMHiFEw2Cuu33C0o7XiPa
	gvJx0QqtSd0QhaJLpymkI5Kl/FVEkTLO0mC4cbklHARMoF+LaZfu1do+iSqyvdE0
	2vBWI/c85QKCIs57ykUDaaSiD8Tisk6lypXKDaNsPwGNVKk1wNjXsGEinL4hx3ek
	5b6SnEYmHlBQl3oAGrkDnY7NeoD4AagCVbSRrom9AkR0NRK62vA07gHL5rVhXsQV
	j/I+gBC87KPMDaf76TZ93+sYpFtiHA20bl0vs2WWTxA==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hdw68u9dw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 20 Oct 2026 07:45:57 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 69KBjuqk027417
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 20 Oct 2026 07:45:56 -0400
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 20 Oct 2026 07:45:56 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 20 Oct 2026 07:45:56 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 20 Oct 2026 07:45:56 -0400
Received: from HYB-GHaNx595DZ2.ad.analog.com (HYB-GHaNx595DZ2.ad.analog.com [10.117.116.216])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 69KBjZVi012172;
	Tue, 20 Oct 2026 07:45:37 -0400
From: Christopher de Guzman <christopher.deguzman@analog.com>
Subject: [PATCH 0/3] hwmon: (pmbus/ltc2978) Add support for LT7175 and
 LT7176P
Date: Tue, 20 Oct 2026 19:45:31 +0800
Message-ID: <20261020-upstream-lt7175-lt7176p-v1-0-86b9b728b95d@analog.com>
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
X-B4-Tracking: v=1; b=H4sIAFtU12oC/yXMQQ6DIBCF4auYWZcEaBT1Ko0LwLFOU5Uw2JgY7
 y7W1cu3eP8OjJGQoS12iPgjpmXOUI8C/GjnNwrqs0FLXSmppVgDp4h2Et9klCnvqYJwDT6Nd7Y
 edA/5HSIOtP3Lr+42r+6DPl05OI4T2lUU6XsAAAA=
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
        "Christopher de
 Guzman" <christopher.deguzman@analog.com>
X-Mailer: b4 0.16.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792496735; l=1263;
 i=christopher.deguzman@analog.com; s=20261020; h=from:subject:message-id;
 bh=M29vA8Poq8F3ShdfV/snQ0hH3/MtTdttMjmZ+XGcnFQ=;
 b=QNp6Z1vUsokNJlR706GULT9xlgfTsnlgnKcZbIHjb7WS0jDB07xTOd5J/qlQ1dokQ6Nk8uODQ
 ZI6g579Q0aRDj+uW52qSzPlgDUIqMjmIPY8RGMVQJhHVMTCNQlpxlJs
X-Developer-Key: i=christopher.deguzman@analog.com; a=ed25519;
 pk=nSwfp91RWULY/zCnrDkBvXulgnpfKy+5C6/Gh3ecLwo=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIwMDA0NiBTYWx0ZWRfX2dtY866hUaE4
 Ksk1ui4W06LlP1R7SiTt/HM8825UVXseyZ/QlcWLVTRFqll+Fa1XRRPXrZ9fAVMiJBTicq6D37K
 27uhvcd7CiAhGqlEpeNzTK3K1Y6ogghdNiMdoC/3ilXU0xgYj4dO
X-Authority-Analysis: v=2.4 cv=aJ9lOr9m c=1 sm=1 tr=0 ts=6ad75476 cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8
 a=HlF1pQe189kL6BT6uesA:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: cYjl7Eh0OCXTb6sBGDzkLA88fyncKRA7
X-Proofpoint-GUID: cYjl7Eh0OCXTb6sBGDzkLA88fyncKRA7
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIwMDA0NiBTYWx0ZWRfX6rhxW9O7Au0z
 aaPocnrVJ7MB6KpLHf/RUiMWEHyB1KmxQWhHhu9ZSaw9XFu4BtKmf0lTSU0FnqlzlqsitTAYArh
 LLJnfJJr/x5LS53c9FOpyGyMxCV+1wEIIZdbcn0LQ/VevUUQXvF/wHe+GOGdPNJ5ROtNHgQgwAE
 +iGXoxQkY9qsb+bsfr/HfBQ/HTkykaQGdHhCs5ioVTlOQMx4+Gpq4zrTDqTFKKy+EKcCnm9F3+X
 oqXti7mqhujtFUozkBr2Qg3gzJRXpYBKN00dTKmhx71COmHPVaPFBS4crxaOz2H+npsA/cwgCn1
 um51d/5LjpQy4jXuNQzPNLOj6YOxXae8uRxmPmKk1LgKzpW8QhI+fqWZMnRDehIt9ia+6RPofo3
 mmwQOHgunAVS8rQv8HOC60ZC+H+bUWQYLa0dHoDS8jsObyLPDqHoo61eLjjePm2WxgJlDw0a86j
 oeYDdSO5U65OAd79Pag==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-20_01,2026-10-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 priorityscore=1501 suspectscore=0 spamscore=0 impostorscore=0
 lowpriorityscore=0 clxscore=1011 bulkscore=0 malwarescore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610200046

Add support for the LT7175/LT7175-1 and LT7176P/LT7176P-1 PMBus buck
regulators to the existing ltc2978 driver. These parts share the LT7170
family MFR_SPECIAL_ID (0x1C1D masked to 0x1C10) and use the same PMBus
register layout, so they reuse the existing lt7170/lt7171 probe path.
Variants are distinguished by matching the PMBUS_IC_DEVICE_ID ASCII
string, following the same pattern already used for LT7170/LT7171.

Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>
---
Christopher de Guzman (3):
      dt-bindings: hwmon: ltc2978: Add support for LT7175 and LT7176P
      hwmon: (pmbus/ltc2978) Add support for LT7175 and LT7176P
      hwmon: ltc2978: Document LT7175 and LT7176P support

 .../devicetree/bindings/hwmon/lltc,ltc2978.yaml    |  6 +++-
 Documentation/hwmon/ltc2978.rst                    | 32 +++++++++++++++++-----
 drivers/hwmon/pmbus/Kconfig                        |  6 ++--
 drivers/hwmon/pmbus/ltc2978.c                      | 28 ++++++++++++++++++-
 4 files changed, 60 insertions(+), 12 deletions(-)
---
base-commit: 0b6eda22f9ab67ddb2a872b0c3fc578ad9f4e27e
change-id: 20261020-upstream-lt7175-lt7176p-b9e37cba8f2d

Best regards,
--  
Christopher de Guzman <christopher.deguzman@analog.com>

