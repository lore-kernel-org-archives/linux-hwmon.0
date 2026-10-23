Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792747001;
	b=hze9VTrMZwJDZf8hYKwtL3zSIHBGqxqejJLr01jdMZbrqKLgXGRl6vBp0LhXb5adiMVT
	 Vt6cKcna14CUCJa+Y6jWYyBx/FYGgbXgXkHZqskJPcEgf0GV+TwjwRucNLXVlRYD17zyZ
	 4bQHO3gH7fEhsUv4tcGNOo5xipAxM5eNMTREjS35LyBOTOAfeGCCNPrtQ7WnnqNIzPKic
	 mHZF7EyaSAnLOjy9uLvvZ4Hhxp1s9JgKxxCJW77xCKSRb2irXrgAQBeQTIIgw3KCS7s8p
	 +PQ+g7jKREDX8vy0LiiXSailUEq2msxbKfnT12fwBszLIJgaPdsDp1v/p8vOYWg/ohQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792747001;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:Received:From:To:CC:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding:Content-Type:X-ADIRuleOP-NewSCL:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=GTCaiiWo7vdfgo5ulyrCoN2ht088VtTmr0kbl71rCMo=;
	b=osch07RDGNfV1m21aVvBTfweYPW2XUIChGxpq5yPUEUt9gQaAvcER5+HTnbvkdhMW94Y
	 f41S1CwBCNyiWllJ8JdQ88Y/8pjuJrF8rRtwvjnNDo2yUDaUam/capgPX90chvl45ZJXc
	 Sb6iFEgl4E3THHBbE9ZfDFOHoH0jwyjVKu3l16oE4nPOlu242Fg4Y6k8Ywtex1eiVwxI6
	 +lzgUQXJdB6Ah3ATrE8BkelQdzGetCXxv6ffGJlWBxQoWvbOdC5brOgOj1mThR6ymXBhV
	 nRsG7V76Gidss3gATWHuEgn0pTW4nxDwhr8awiEpxwFtl7QeCmnCUZTGVC6WhibhqdQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=RRpuev+r;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=imBmMk8d;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0b-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93576606A31A;
	Fri, 23 Oct 2026 09:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93576606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=RRpuev+r;
	dkim=pass (2048-bit key, unprotected) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=imBmMk8d
Received: from pps.filterd (m0375855.ppops.net [127.0.0.1])
	by mx0b-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69N7GqKw3543044;
	Fri, 23 Oct 2026 05:16:20 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=GTCaiiWo7vdfgo5ulyrCoN2ht088VtTmr0kbl71rCMo=; b=RRpuev+
	rlNNUH9ac/8Ok7utPqJGQTlQ1df7pZ0YFmZWQeXNxQAWU4U8N7USgFnoV6l1+3vA
	rHb6c2RQ0fGY2RuXrs3+IKA2j32oJPKWvDifqz9b3278D1GIHsIfmVa8rgTSvbeU
	yizMp09iKPoQPeOvmFDWjxdG78AwyxqczLdnQNZXTGcF4XEavHCXAe50D8CQ8MnD
	44T+q+CF4CYNxpfDwNz8vGA+f2h/LKhh+s1sjrS3gxlnJzws98VrKviIxXSEuOS9
	gAy2KaKGHaHkhJdPCsBK4mf4GkYYgpKJX8hSz/6qchcmOaxIPXUe31LyRDZtZk57
	zC7qorzZusIBNwA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=GTCai
	iWo7vdfgo5ulyrCoN2ht088VtTmr0kbl71rCMo=; b=imBmMk8du9SDiv0TvlBtC
	0fSyomQgH8WFJqiBBasErHdDrLTfbN5SlEiaOoshwTfXL6x2ggiAEJBnxyofKEFO
	N02raGnF12GbJ+NJtahJhWWkWYbwd6pmAbOZUvLEWBriqhBPenZmaJTq9C8crbuy
	JrmvBfEeC95yofGf+SCqs0pom33vA5R9JsRdyZJ5ESpTEBBKtlvs6JpCNuocJLvf
	PxRjrgSbvLefU9un8cPBhu2luczax+cnMa45U7g3nyZILKMQP768lkw27tzNJD2f
	zC77HIMMRKbCF2/VkxnOW1OR2DgSgvax8bApff/KIpBhNYgaav74HfpGW6y8XI9V
	Q==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0b-00128a01.pphosted.com (PPS) with ESMTPS id 4hfvnntnqf-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 23 Oct 2026 05:16:20 -0400 (EDT)
Received: from ASHBMBX8.ad.analog.com (ASHBMBX8.ad.analog.com [10.64.17.5])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 69N9GJHc049053
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 23 Oct 2026 05:16:19 -0400
Received: from ASHBCASHYB4.ad.analog.com (10.64.17.132) by
 ASHBMBX8.ad.analog.com (10.64.17.5) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Fri, 23 Oct 2026 05:16:19 -0400
Received: from ASHBMBX8.ad.analog.com (10.64.17.5) by
 ASHBCASHYB4.ad.analog.com (10.64.17.132) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Fri, 23 Oct 2026 05:16:18 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx8.ad.analog.com
 (10.64.17.5) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Fri, 23 Oct 2026 05:16:19 -0400
Received: from JGERONI2-L01.ad.analog.com ([10.66.6.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 69N9FwZD023047;
	Fri, 23 Oct 2026 05:16:13 -0400
From: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
To: <linux@roeck-us.net>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <skhan@linuxfoundation.org>, <jdelvare@suse.com>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v4 1/3] dt-bindings: hwmon: lm75: add MAX31875
Date: Fri, 23 Oct 2026 17:15:48 +0800
Message-ID: <20261023091550.1494-2-johnerasmusmari.geronimo@analog.com>
X-Mailer: git-send-email 2.44.0.windows.1
In-Reply-To: <20261023091550.1494-1-johnerasmusmari.geronimo@analog.com>
References: <20261023091550.1494-1-johnerasmusmari.geronimo@analog.com>
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
X-Proofpoint-GUID: PIl_wPIa9xcLBZvWBmPItVo5hxMWhdsA
X-Proofpoint-ORIG-GUID: PIl_wPIa9xcLBZvWBmPItVo5hxMWhdsA
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDAzNiBTYWx0ZWRfX6bol8eKX3PLi
 vH0AhM5qCoeIQ9hRpOW5WE5cTClhbF0v6ZWU+htMgTTBFsUn8b621yf4briclFXpkwAcRaK8C0W
 BbQd2BALyvYmbCRRmjDsfqkBeYAWKstXtBFDiRQKQ8+A6yziB92M7D6b0m5M02qPNUN9ZprsDwC
 kFp9KbyLzkY5MrbMCoCE1FRcnU3WSb7gzVyowiKZMhnx0FRj5OZ8ufYgFlC+f+CwusbNwJQcopc
 4QrPE0wHhKnzgg941oRnQ53HhF958SBoJ1PTevHN4NZGOtJPZNPK66XBU7+Pu7WScJ2QVKoydOI
 sjNWgABPCQdKXoIz4b7OWjYAPcfl6KEOr5hvzcdaPuwf9uBWp5CsWuaSZbfB8GWtlz3+nx7zKW6
 cionxrbxvt0Gpt236lVuIMYSqy22ZYYs2AjSwh5GPL3LAWgskOD437b0b7iiNTuYsxqw9tg7xog
 WHDHKBNOdp0geNLeXTw==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDAzNiBTYWx0ZWRfX9oNVkMyPcvsm
 Po1Dxb5kkCMT5ekIKhJPY/RcWXvi4wXNYqmgtw+wkHmxxC8xAlDlV+FjdIeYG1j+NfS2JvJL/BK
 xw0NIAusov//tz14j5IqafKJoox2lRlIQMOt90xSFpjmrXmK0xhQ
X-Authority-Analysis: v=2.4 cv=NahzRGD4 c=1 sm=1 tr=0 ts=6adb25e4 cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=N--XFCr6TIEc_64PeIT2:22 a=gAnH3GRIAAAA:8 a=XYAwZIGsAAAA:8
 a=5VwCq3e5UpyTkxNNBmYA:9 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_02,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 phishscore=0 suspectscore=0 lowpriorityscore=0
 clxscore=1015 adultscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230036

Add MAX31875 compatible string to lm75 dt-bindings.

The MAX31875 cannot reuse an existing lm75-family compatible such as
adi,adt75: it has a 16-bit configuration register (instead of 8-bit),
four independently selectable conversion rates (125 ms, 250 ms, 1 s,
4 s) and four independently selectable resolutions (8, 9, 10, 12
bits), and reports its alarm through a different configuration
register bit. These differences require dedicated handling in the
lm75 driver, so a distinct compatible string is needed to select it.

Signed-off-by: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/hwmon/lm75.yaml | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Documentation/devicetree/bindings/hwmon/lm75.yaml b/Documentation/devicetree/bindings/hwmon/lm75.yaml
index b48bf3fd7..d56f3ec29 100644
--- a/Documentation/devicetree/bindings/hwmon/lm75.yaml
+++ b/Documentation/devicetree/bindings/hwmon/lm75.yaml
@@ -14,6 +14,7 @@ properties:
   compatible:
     enum:
       - adi,adt75
+      - adi,max31875
       - ams,as6200
       - atmel,at30ts74
       - dallas,ds1775
-- 
2.34.1

