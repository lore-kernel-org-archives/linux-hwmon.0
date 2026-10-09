Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1A7F64D0A06;
	Fri,  9 Oct 2026 11:57:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=148.163.135.77
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791547037; cv=none; b=C7/2Ggqd1czpTjvYVEWQ+1M3QnXtUzOkfHDwMl7xX3si8vMwzg6/i5EJnUXcmMoCUbePURFoKCKesoHkTh87mF7+X+G81OZzOMCzvePYr7s63vi5dqxzHde2ScVksEGf05Vw23c4mYW4Pv1b1czwihS9Luimk+KAYdZOYFPAro0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791547037; c=relaxed/simple;
	bh=oAcPaVuokUqQ8ExPucb6jZ9/PwHbQ+eh5CyBhONMh/o=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=ShEOZzfoB0fk7kPVv9cOm2TT+Kdafna82K8A6LYro1z9c0yM+sqtKCLGkj7qhRylzUj5tB54Q3sMwl3SQcGySF0b7v1vAwKjaOrPEjAmeClrONuAODFpFs12hVl2SA87YbA9VWM6tyal3LtGDHgA1GXQo9EtLjsc4DhdqoHPEkQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com; spf=pass smtp.mailfrom=analog.com; dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b=UjfuLmm/; dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b=vJS7hbfm; arc=none smtp.client-ip=148.163.135.77
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.b="UjfuLmm/";
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.b="vJS7hbfm"
Received: from pps.filterd (m0516787.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 699ApIDU2180289;
	Fri, 9 Oct 2026 07:56:45 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=sbaoMCnvmXjUnU1hSoTApEsGtYGIurIPJjAfJt4cQW8=; b=UjfuLmm
	/On9da4KTDBOHZyGdU7XH/BmpCO1x8euYBUFXCfx/qFcLhSjZSwCuU9eY8BSkQKK
	QRWV8CHCilltmARXE5NfSUOqzjc3qn+pB8lUxE+F/d/GaHfHQDWyTebn0/VzN7Ws
	ETgnsyOWyZaSyKp4u7fIXPeUwwgRKXkjsJkzhCvwy3rLWuAywj/GDHTJqYYJ1rV9
	Hw4g8r7ujMaHml0XUOdl2FAnHLA93lTBft5YUVt8pQwEgO0SKtui3+JsFlMcr6Ed
	KEuROmYNFkmz9dv1Rvrv/0CYfi/rb6/J6mg2IqQSu7Ll20u81fsw0dCBaBh3MT/0
	at4eP4FJss7Vc9A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=sbaoM
	CnvmXjUnU1hSoTApEsGtYGIurIPJjAfJt4cQW8=; b=vJS7hbfmh3ZcNteVMeJC3
	Svpm5OtzuoY4cNwiJlz3MMFAobEge1kkTMBFuXPzcrfGgehOg5G2NQ6FczO9ABI6
	6v/tckytsONpw4vc9HAuFJp80q1E4DhsvD2t5+x/ATL/Bb814Spq2ViXXP+DdBfu
	gFQ7pexQgydIE4TFw7nPbc30FumOvzMmp3a96o8EcZmp22CWJEXPs0iohFQCEBFb
	G1p/PB5xLmI0qfrp3WbxLMD4veYfc3U0DVTz9oXQko5i3Nqae7K8lAzGGO6YmMLi
	1cedD4HizhOWP7czzlCAtkWA3uziQTNgqPr5RbV/BbmgjGx4nceibMCAXpOhPwSf
	w==
Received: from nwd2mta3.analog.com ([137.71.173.56])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4h6dvw5xgw-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Fri, 09 Oct 2026 07:56:45 -0400 (EDT)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta3.analog.com (8.14.7/8.14.7) with ESMTP id 699Bui7i041952
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 9 Oct 2026 07:56:44 -0400
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by ASHBMBX9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1748.37; Fri, 9 Oct
 2026 07:56:43 -0400
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Fri, 9 Oct 2026 07:56:43 -0400
Received: from JGERONI2-L01.ad.analog.com ([10.66.6.190])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 699BuPt8014045;
	Fri, 9 Oct 2026 07:56:38 -0400
From: John Erasmus Mari Geronimo <johnerasmusmari.geronimo@analog.com>
To: <linux@roeck-us.net>
CC: <robh@kernel.org>, <krzk+dt@kernel.org>, <conor+dt@kernel.org>,
        <corbet@lwn.net>, <skhan@linuxfoundation.org>, <jdelvare@suse.com>,
        <linux-hwmon@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        Conor Dooley
	<conor.dooley@microchip.com>
Subject: [PATCH v3 1/3] dt-bindings: hwmon: lm75: add MAX31875
Date: Fri, 9 Oct 2026 19:56:15 +0800
Message-ID: <20261009115617.1976-2-johnerasmusmari.geronimo@analog.com>
X-Mailer: git-send-email 2.44.0.windows.1
In-Reply-To: <20261009115617.1976-1-johnerasmusmari.geronimo@analog.com>
References: <20261009115617.1976-1-johnerasmusmari.geronimo@analog.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDA5MDA0NyBTYWx0ZWRfX2Z1EKJVPnoGs
 eeMgLyRWypJP8kZUNmWXMbmFfgx/CHxtzOIR/cy2+9g8326WsLEUbQpLjnyqqyIn+6myYJ4Rze2
 D7Y22dQA7zjCSImpTu1IjvKpnZHgtMMrKQnHINYDtavtL6KCkUa2
X-Authority-Analysis: v=2.4 cv=LcKpeTfi c=1 sm=1 tr=0 ts=6ac8d67d cx=c_pps
 a=PpDZqlmH/M8setHirZLBMw==:117 a=PpDZqlmH/M8setHirZLBMw==:17
 a=660iZSQnnn4A:10 a=VkNPw1HP01LnGYTKEx00:22 a=0sLvza09kfJOxVLZPwjg:22
 a=OmVn7CZJonkx5R5zMQLL:22 a=gAnH3GRIAAAA:8 a=XYAwZIGsAAAA:8
 a=5VwCq3e5UpyTkxNNBmYA:9 a=E8ToXWR_bxluHZ7gmE-Z:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDA5MDA0NyBTYWx0ZWRfX+ukLUnm7SVlJ
 QwrdukzNEV0mrIDt/+oFyJIt1upjZiwBkr2fWDzWmLT4z2rANhpI+ULab7L7Ppd6O3ERZG0kIkb
 2nXBy7iyG4hdPjtDDf7tXuO9lAdNJl81W6x2f4Uco+5tWl8o8cOE6P0S5AFntTPnoR7Ifu0Zpuj
 hpPIMQ3k43QAXlPZPXkzcpuaexJG28ptC822AiuUJJnAro9wDDai7RtbxYPSGWYKcO0QM2ex+rj
 onpizCn8Bh7qmENjCJDEuAe9nBGHtUkjKQtM0hAPPY9GL5Rwe59sC4hWauRH+DeVWfh0j2EOWeT
 724Gkt6RIjVli6e/WskG/Q9baOxdHeGYQcOCp2wMqq3w7NG5XB0tCJJ2sLnTO3gGykqnDaddyoM
 HeShz+DPtg8fvbNCfkXCxlP9MPWChMgOceIAUQZ0ozvTZTqebTHTxdlepmx7FugeCPbs9Vn7BpG
 QoDDz2W1vRGuubuT5gA==
X-Proofpoint-ORIG-GUID: 9OsIXck-mvWoheQO0whf7HpAMQQ5aHCX
X-Proofpoint-GUID: 9OsIXck-mvWoheQO0whf7HpAMQQ5aHCX
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-10-09_03,2026-10-08_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 bulkscore=0 suspectscore=0 adultscore=0 phishscore=0 clxscore=1011
 priorityscore=1501 spamscore=0 impostorscore=0 malwarescore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2610020000
 definitions=main-2610090047

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
index b48bf3fd721fe..d56f3ec299105 100644
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

