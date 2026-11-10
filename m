Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=148.163.135.77
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794304904;
	b=0Bh5OtjWA/xmfdN1uwIibsYR7ASVS66sCeqDwq4KI5RR/f5laCEawD1SI7x8i1kwB/nW
	 vckmtD7XxBe7l0Hatx3AXEHjaFJBu6uXUrcGOe3C51gHupgZ8gls61RyWLtqiraf3iohG
	 tNIgk7eSYMYAeopz79LEXxNHrmHiu6UxDnwu3D6US6wV1I+qJngB4Crwz2GPquhf0uUfb
	 1F/QS7tpFtApnzLS2wf8+Ycd9UJ0zt0zmAaddo9lrvLSIcxOIevbx/gCFFjWkvW/TCI1g
	 D5nx3TGqcd9WS0mFyJ8evmwANhC00pUZsrWzhnGgjWZO7iQzIhcIJU/FLo3xAwImXBw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794304904;
	h=DMARC-Filter:Received:DKIM-Signature:DKIM-Signature:Received:
	 Received:Received:Received:Received:Received:From:Date:Subject:
	 MIME-Version:Content-Type:Content-Transfer-Encoding:Message-ID:
	 References:In-Reply-To:To:CC:X-Mailer:X-Developer-Signature:
	 X-Developer-Key:X-ADIRuleOP-NewSCL:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Authority-Analysis:X-Proofpoint-ORIG-GUID:
	 X-Proofpoint-GUID:X-Proofpoint-Virus-Version:
	 X-Proofpoint-Spam-Details;
	bh=Rh/HSkmw+MZCeBvQaqlgC2p1sRVAP5QuWwScX0slWGU=;
	b=WzxU6zTzk1vQsZoDQnf5mGju3YF6RZCkepTzw7VcYl1UBObqrUEf8astG3sfOulqgYH+
	 GlLaLbnvikStWKgNDVIMvT9Z63RQ/JTM4I0S+9bZTFOpxgB6XPSFzx80BWJQzNifv3sL0
	 oDc60/OOq2N71fwXezx2p/Ed59TtMyLlVtoCpIJ2btlXbH1RHdMGeejuqDfmuZzhEhM7G
	 SLsBCQeHlISkPmwi4H9/LPxafKtFNO8rCO1HvuLDJbfyoTmYoqucZgJ5PnkXABZmsFZvs
	 UfKgcnGui6g8QwJ/AElFWyzeGnwg6abnYm2d0VhGivhi01WwEb0FgaSHeEfi1XfAwcQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=analog.com;
	spf=pass smtp.mailfrom=analog.com;
	dkim=pass header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=MN2S5Bkf;
	dkim=pass header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=elEef98L;
	arc=none smtp.remote-ip=148.163.135.77
Received: from mx0a-00128a01.pphosted.com (mx0a-00128a01.pphosted.com [148.163.135.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AE0E6080D8C;
	Tue, 10 Nov 2026 10:01:43 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2AE0E6080D8C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=analog.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=analog.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=vtelectron.com header.i=@vtelectron.com header.a=rsa-sha256 header.s=DKIM header.b=MN2S5Bkf;
	dkim=pass (2048-bit key) header.d=analog.com header.i=@analog.com header.a=rsa-sha256 header.s=DKIM header.b=elEef98L
Received: from pps.filterd (m0167088.ppops.net [127.0.0.1])
	by mx0a-00128a01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6AA7kb2A3726137;
	Tue, 10 Nov 2026 05:01:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=vtelectron.com;
	 h=cc:content-transfer-encoding:content-type:date:from
	:in-reply-to:message-id:mime-version:references:subject:to; s=
	DKIM; bh=Rh/HSkmw+MZCeBvQaqlgC2p1sRVAP5QuWwScX0slWGU=; b=MN2S5Bk
	f+RNuQzE2pnYAKfE4S1vuYUmwK70o7vh+txK7eUBI+zcbuLABbVOC3L/Z79YUHa6
	Pj5bd5GpmLr6/phO52tT7PL+0s+yhLHW0lKldPah8icuw/vVs/fAymz3pJSYqwID
	0CO+/zKYDjb1KzrRncjlS4Vr243wij3K+fHSs8clkogHvBi2tJ0ZvJid6IX88a7q
	SCkDgBZmKfy6evJK4aYmXMoOVhWaIRaduKwjrcgNXfhqBEqSNU8YVWHTXqFrXSSr
	or9I5VBqmvh9cflaisnsjjlV5PMv2QJEQmPZF64M184E0PZhnPKTZlrdtWk/IvyX
	OL9XlNMgJa7gqOg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=analog.com; h=cc
	:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=DKIM; bh=Rh/HS
	kmw+MZCeBvQaqlgC2p1sRVAP5QuWwScX0slWGU=; b=elEef98LNVxP2N4X3OOhv
	92XeGcdsF0gjXX2kR7LBbGDErEj6f5+WZu4xDPxkdA2unq+Tc7MSMyShjEIq/Ala
	jkAW6g9gPiqFzgiCzAWoR2i7SmCzS2kDSjFYaiOPE4xGi9kZlFYtn32CljoWONLr
	+j37h17c6ewMKJoFzVkX7vKU1p7VopXwD+rP1cQ7KZ0pHfHk0ujXiB8nP5zqYxKM
	qKCrZ2CqI5trFsTUKlpBFJOHy+zLi+Y4m2cROI9rZEgKV2TjCFTCx3+/Hc/PP9nq
	g/11DCF6GrDWRPHov/HILsw9kmmuDJLL8DUwLakpA+wCZIv5E5DTyNAmx+AKN/EJ
	A==
Received: from nwd2mta4.analog.com ([137.71.173.58])
	by mx0a-00128a01.pphosted.com (PPS) with ESMTPS id 4huvyq9wfq-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 10 Nov 2026 05:01:15 -0500 (EST)
Received: from ASHBMBX9.ad.analog.com (ASHBMBX9.ad.analog.com [10.64.17.10])
	by nwd2mta4.analog.com (8.14.7/8.14.7) with ESMTP id 6AAA1Es2021193
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 10 Nov 2026 05:01:14 -0500
Received: from ASHBCASHYB5.ad.analog.com (10.64.17.133) by
 ASHBMBX9.ad.analog.com (10.64.17.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 10 Nov 2026 05:01:14 -0500
Received: from ASHBMBX9.ad.analog.com (10.64.17.10) by
 ASHBCASHYB5.ad.analog.com (10.64.17.133) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1748.37; Tue, 10 Nov 2026 05:01:14 -0500
Received: from zeus.spd.analog.com (10.66.68.11) by ashbmbx9.ad.analog.com
 (10.64.17.10) with Microsoft SMTP Server id 15.2.1748.37 via Frontend
 Transport; Tue, 10 Nov 2026 05:01:14 -0500
Received: from HYB-GHaNx595DZ2.ad.analog.com (HYB-GHaNx595DZ2.ad.analog.com [10.117.116.192])
	by zeus.spd.analog.com (8.15.1/8.15.1) with ESMTP id 6AAA0eue008466;
	Tue, 10 Nov 2026 05:01:08 -0500
From: Christopher de Guzman <christopher.deguzman@analog.com>
Date: Tue, 10 Nov 2026 18:00:43 +0800
Subject: [PATCH v2 4/4] hwmon: ltc2978: Remove LT7170 and LT7171 from curr1
 iin documentation
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
Message-ID: <20261110-upstream-lt7175-lt7176p-v2-4-dd60d28383bf@analog.com>
References: <20261110-upstream-lt7175-lt7176p-v2-0-dd60d28383bf@analog.com>
In-Reply-To: <20261110-upstream-lt7175-lt7176p-v2-0-dd60d28383bf@analog.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1794304841; l=1008;
 i=christopher.deguzman@analog.com; s=20261020; h=from:subject:message-id;
 bh=OyQcOk9ojRy6qLTd7V/Ae57gH0b7P5v/GS44Yh6k0/k=;
 b=DMuAwBq5uhf9+gDbheV7PR/XWcngBQwHqXSd3Fog3JrgTQlS3awE2ZjCc+d9iobQ6FMp5c3iU
 TYmfn4lSl8zACuPzbHhI4YkG3WMRG2aYcCdXzGrImmLk1fxs+0XfhZX
X-Developer-Key: i=christopher.deguzman@analog.com; a=ed25519;
 pk=nSwfp91RWULY/zCnrDkBvXulgnpfKy+5C6/Gh3ecLwo=
X-ADIRuleOP-NewSCL: Rule Triggered
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfX1q7Cih9dOWlM
 dEUtYuq4S+fmh/w7mRS0eNRtDDUwo3z0elm+tUvPtLcvGgOJA+qPSkN+8uWvvzNinC1H4KwVQOc
 ljitZsxeoknAHAQpL6RxBruMpwN4i7za3uisDZCRWFOjW8mOeW2yOmI/FhNBx06f5LDVYEcW9+f
 33zaOaKm8gbN6Q79neGEdh+70BoqilSDqVjUiOkse7aBzyyUHhHDQMIs8yNtuamFemuYBX5y3A8
 e8zMtHQhFkJsn7lpameTuWOJZ+mIfr3/4pHhQDv5EoW0chFXSoveeZGmSpkYMtH1ot9aU+lVDJ9
 4/qPLTFEU59JxHhHwiPZRY2FnhVCVUhGmWvbvMDF40RkByejybJQrSQIwdMzXxr0alodgaze6Zw
 wqpX877yikuuxGhDVCr0ghcLCSMju8AWtDsqRO4SImUYVBWMEKe1QLJSe0rsbsMpS0fCdhfurmN
 BdD8fgMtYTz7HWN3bpQ==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTEwMDAzOSBTYWx0ZWRfXzYYjdcdWzk+9
 sZaWcI1pMTb57iOOH6KgEYmjxGrSN1MWPe7KzHmJj6dmHKl/unr6kNX7CH8i6AuSmVJN+fQwqi8
 s4nEcvpwf0xKlbUVebOif6aUlK8rSKydzmYqn91hYfDjSOKqPq3E
X-Authority-Analysis: v=2.4 cv=MsDHeGae c=1 sm=1 tr=0 ts=6af2eb6b cx=c_pps
 a=3WNzaoukacrqR9RwcOSAdA==:117 a=3WNzaoukacrqR9RwcOSAdA==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=0sLvza09kfJOxVLZPwjg:22 a=uXIjobp8t2wMuQ0fPvqm:22 a=gAnH3GRIAAAA:8
 a=FmBUL9UuVR7jdI2fGj0A:9 a=QEXdDO2ut3YA:10
X-Proofpoint-ORIG-GUID: LRMCbaZCieyulTd_H6gkKC1uH9k2cR2h
X-Proofpoint-GUID: LRMCbaZCieyulTd_H6gkKC1uH9k2cR2h
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-10_03,2026-11-06_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 spamscore=0 adultscore=0 clxscore=1015 suspectscore=0
 malwarescore=0 bulkscore=0 lowpriorityscore=0 phishscore=0 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611100039

LT7170 and LT7171 do not set PMBUS_HAVE_IIN, so curr1 reports the
output current ("iout1") rather than the input current. Remove them
from the list of chips with an "iin" curr1_label.

Signed-off-by: Christopher de Guzman <christopher.deguzman@analog.com>
---
 Documentation/hwmon/ltc2978.rst | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/hwmon/ltc2978.rst b/Documentation/hwmon/ltc2978.rst
index 9e8448a9c1ed..7a95aefda301 100644
--- a/Documentation/hwmon/ltc2978.rst
+++ b/Documentation/hwmon/ltc2978.rst
@@ -450,9 +450,9 @@ power[N]_input		Measured output power.
 
 curr1_label		"iin".
 
-			LT7170, LT7171, LTC3880, LTC3883, LTC3884, LTC3886,
-			LTC3887, LTC3889, LTM4644, LTM4675, LTM4676, LTM4677,
-			LTM4678, LTM4680, and LTM4700 only.
+			LTC3880, LTC3883, LTC3884, LTC3886, LTC3887, LTC3889,
+			LTM4644, LTM4675, LTM4676, LTM4677, LTM4678, LTM4680,
+			and LTM4700 only.
 
 curr1_input		Measured input current.
 

-- 
2.43.0

