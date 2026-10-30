Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793374109;
	b=seXcP9KA2b4oTEcyiPJSdJvXKvMhhy82pik71laoOo6dg8dzNgnUcNkSdUyuimXgI6i2
	 nDXgnL2xCkTi5VKzUf6XoyUlhqQnQ6glpPiYJuqI7H54kxL/fdJ6ayNs41miOOZ9YI51+
	 TONhDlJw0ydXIbJra4ASKedcdFcFxf1nTb16gQysiYrUvDvE67oHp8DF4y+Vs0DUGwroi
	 U7wsO74XuSPCNpwkEbd7wZgA6TLTKdP5oc9c2KEns98Rvo/2rLf/ZL4IOuJeiOwlRZ8y+
	 eSRRi43ldV1xsFzYf4Q0tTbNzLwzB0D68rMd34TJSORnJdUlRId+Mgryd6abENAgENA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793374109;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Forwarded-Encrypted:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:From:To:Cc:
	 Subject:Date:Message-ID:X-Mailer:MIME-Version:X-Developer-Signature:
	 X-Developer-Key:Content-Transfer-Encoding:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-Spam-Info:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=zbO/9T2WTPunnoMhOWAiSp41nG3mYh7EnFdKhIIYMKc=;
	b=N5Rk120VyFd88HCuXgHLadf8bhBeXvhXKH4VrkoRNum6HVwdsXNufnJA+vJjmJ8Mijfb
	 dBvrK9WmvoC2L4kAvkwJAc04d6xMe0MijgescaeSAOA4mdvzsD/QHHhVBYOpUWSW0cScT
	 gRL8GufCMXF10fk1e05fu2vvt/NoNU6fPxYD5b1Y/ZKJfRuKw7MtKzrZb+0EryRP/Hgc+
	 Tw+ielDZOtWuEum1oRqNFPHEdTsKN/kUlhF5Yi1FpQw6ynaffy4JhT0s99krAxCQTUTWh
	 Fba6r1iCtyroJ8U+BELSBm5cs7ZVNJj7WtoevhhTPxQLqi2k4cG8kcqV/D7FU+prxNA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U+3+fxFw;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PJBJUxWC;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DA15606A31D
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 15:28:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 2DA15606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=U+3+fxFw;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=PJBJUxWC
Received: from pps.filterd (m0279872.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69UERBYQ2494589
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 15:28:28 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:date:from:message-id:mime-version
	:subject:to; s=qcppdkim1; bh=zbO/9T2WTPunnoMhOWAiSp41nG3mYh7EnFd
	KhIIYMKc=; b=U+3+fxFwbUycfEfDWzdEZEkezQkkmX5LhHYrXiKTKDmXAhAZAmX
	Ouc0e4EpDLJZ+tRPg5gGMM0QOnCKLEHj2+0TtUo1I1zMZ0ISFR2xN66sXTJzP4YW
	LoeoUnS8frQyxbD65ILv9il06sYulY5YGkY47LHB8VANKEN+T17I6C4AvklrZ2+E
	ZZOLiATmnONCPYJeFcHYab3hmFG7ekIH4KdEFn78kcSqgoBF8WRD15e+Dw8ITAp9
	5x4d/70RGHVNITYdJrtQY1t6KMpgqxyFZXE4t6CT2ntYHwPp9c1L+QaV4cX9QRaE
	Ski4NR74OILZ29kreLLAGIo0TdXc7iSxxkw==
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com [209.85.222.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hme6p3t34-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 15:28:27 +0000 (GMT)
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-93c5ab5c136so131850285a.3
        for <linux-hwmon@vger.kernel.org>; Fri, 30 Oct 2026 08:28:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1793374107; x=1793978907; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=zbO/9T2WTPunnoMhOWAiSp41nG3mYh7EnFdKhIIYMKc=;
        b=PJBJUxWCSeddLwqBOYIAmY+HKbiV5ysm4ZyXiBPKK8BAIgKIyB/jy6gqpjmodHvrhp
         t+syQ/KmFi+6sZeB06BL1Oe0Gv2mAoNV6+hIcUpMsP4IHU4C9ZV9hKV/AVE5ErxLOiQf
         7kPtHR1nbVFoASXJIY1SQ7uxhmkWBjYabrtS+nJd64VV6kTue3Fpv+DSEZjxb6kNR51G
         MpI+i1kMcC4FDRDeklT4xtVkWzsCup2hY8+FmMFEawPh2ZW9cRehYgMI2GBPS+6PLvaN
         +0QD/hskz++ANrbW5f+JofVP9Nr9wKu5n53hOCejl5saPvg7RumWJSbxpejZlznrNeFz
         GTjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793374107; x=1793978907;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=zbO/9T2WTPunnoMhOWAiSp41nG3mYh7EnFdKhIIYMKc=;
        b=xlPFvTiYtsze/eH4/PTD9m70FXAqxvREyw4yHjF7X4yvuNnJcVi/isZ8d5RZ6J4Awm
         M/xeTzcid4f4gL1rx2SGcn0uPz3S9cz/dGDXYjuVUpuiC4AC05ELfTA689X/1N1CRRTo
         +zYm3bElGc/caM5rWf3GS4IwuG6gdKd9PqP1peQSMCLDVZDUGJAIBgLDYDHq7uibkN6H
         y/fnXyucLJwoOouwkwmFRo1BBvT4f4HtkVtMFFTgRORMWrXP8722klPIKZMDcMUvTLfm
         KpzSS9NJEBzxKXXZVOFBQRw+aE+oLQZgew0COAG3UGz3DbionykTzPGrLijCMZJ3IuWR
         iTbw==
X-Forwarded-Encrypted: i=1; AKwUvBxTT1I7b28IcIRIzrp1EE9pYwEwO+XexnzquKUWn/jv6xYbxBblhGQVzkFTuts7OpsugEaUrr/fy4f8Ww==@vger.kernel.org
X-Gm-Message-State: AFq9FYJEzut8mmVjJFx2+uizgf3fNipen4N8jdZs4nrw/tO26vYUn/Kk
	mUNbe6PYEYj6B740n/NtttVTyR2ZCyGy0wF3Jjxr1DVrWx8d3mRml/fbTSPCTQf9o/atIXBNKSl
	QBHCzzbS5rbVhFCRFHUEbl7FXfACNXqlc0SxU+ksQ/YdVRGwxdaLsW13rP2FOZg2uog==
X-Gm-Gg: AYBFou0OifHOQtJDKSucbH2MHd+UTdVlxh2eVonIOnH5wx6xDAbSZsMhFmHqyalkbS7
	MxCjnYBXPTfwxKbfRZKFSWzJX+gLWju7LfxCIzXPhL8UBgXtE/rUZ9zrh/xkNS5LkLL2RHoiZvU
	xMBHWoWYwRBD9mvuZDlRurAXr12tF2lcRCLltGPlrVvkwtDQmH3r288jn8LJFEHihj//QIU1uRG
	VAMJkk5r2wHGwTz/7ktF1SW/FdZlVpiieen4+xkYfwsDowwscLafslqG4H3Ebk6aToPwZVnQ4jx
	vy/bRBhAssBr7o9i6xRZ+18bzaHWaLGhth20RR/Fts/dyapru13WArjiyMTUQUMioNPkTxjbxDh
	LU/3CZ03TZatMkwkQEsJ+917ul42ivtBS3mydZ9vrDOOs2KF75TGy7IKJWwlksw==
X-Received: by 2002:a05:620a:480b:b0:93e:5fff:db07 with SMTP id af79cd13be357-9442175c1bemr457805985a.40.1793374107341;
        Fri, 30 Oct 2026 08:28:27 -0700 (PDT)
X-Received: by 2002:a05:620a:480b:b0:93e:5fff:db07 with SMTP id af79cd13be357-9442175c1bemr457799685a.40.1793374106734;
        Fri, 30 Oct 2026 08:28:26 -0700 (PDT)
Received: from quoll ([178.197.218.7])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4abf368bff7sm68611655e9.2.2026.10.30.08.28.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 08:28:25 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
To: Lee Jones <lee@kernel.org>, Guenter Roeck <linux@roeck-us.net>,
        Wim Van Sebroeck <wim@linux-watchdog.org>, mfd@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH] MAINTAINERS: mfd: Drop MEN F21BMC (bouncing email)
Date: Fri, 30 Oct 2026 16:28:22 +0100
Message-ID: <20261030152821.283215-2-krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: git-send-email 2.53.0
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Post: <mailto:linux-hwmon@vger.kernel.org>
List-Help: <mailto:linux-hwmon+help@vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-hwmon+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1052; i=krzysztof.kozlowski@oss.qualcomm.com;
 h=from:subject; bh=kmNdPJPVrDCm9e0u73KRmJcOPX1/jig+MXW5yF+K7Dw=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBq5LeW67VWmOyJl9abzEjB7AZHf33RHGV+iUb9V
 o3xT37t19GJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCauS3lgAKCRDBN2bmhouD
 12TLD/9UHhzB9Z2iclhe4fo+vxrjjRArNxuOUcSc99LCrx/pP6rmMi851ehP1mZm9863/6NI7rP
 9JiIol3rVgs1ak+t8fTNHW2KmiTKVUV/KUrAwjnee74F4/yfn92XwfJuQ+oPKHiVAfqgOkpaWVD
 k7zmsJrb2Bnu6KfvDzo1y5Oe4kjpsm7Un2+bHtPWBuuKi4T8HzcUSOn5xxLROvrp841M3H9j/m2
 0b7Zgr5LWI76z+ITgmpNINDoJtTbUL0nZ4ebxk+ShswE4/OjJ03C+Fup5LonLaoessEACzVXxaL
 J45SWgIOBOU0mFZCmcmwhDWZH+/onIumakKmocioSQEL8d80e44NlUyDehk4F5ZJMIoe90rAy6O
 tQtUtjoWjJiqLRWUqdosDwq077Zfw0QVavmXC8TXVPf/tuckcEHtoEPxzumhWDDYTJOCquBXRxx
 wOdVRkcM2beCYpoZhSAE70Flps6QGuLQCsZAcAyiXCdp97MWwQxMJV4RDD111RKbDehYwYxUZkJ
 0IijTO6Sw1AgXT2oYulLQj5HNfV8tBFaueHE41GorN0ueaEjz89SwRb3yA3itaTTlnqcFiu2D0B
 cG+O5Nne8q2rMBNQE4Gr7OF+UKbpvo4rVE0xlUGgOlMbhH1ry+aQ8poskus8B0glPkvPHhV1RJr c7uOwSrR+EZvlQw==
X-Developer-Key: i=krzysztof.kozlowski@oss.qualcomm.com; a=openpgp; fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B
Content-Transfer-Encoding: 8bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfX740wLqSHOaRh
 InbUwVH5L+GrfYS3TV4vA4n9YKsTWQnqyXgphXD4a93yPXTxSVYhTFtYehcbb/CrlcDMWgWBLCc
 slUgFde1PsL2Q4yFtwBsZhcdwcb5fdD61iV/2gM82TNJT+a5uAqESL8+LpezHLrUGuj071emeGf
 6HiYn8HRGpqymADUeYs34uHFUeTNHN1xQzBDJ51X8S2F/iYg+GqSTb/kgPVIjpr4jsuSa/J3ze3
 THTKt77kRfsnrVKaVCHoV1DoVXoJFucQhdvHgnrq1V8JKzkkHzFCXcIDyJsswC3dBuCrRIM6egA
 Ei1VWjfwmGGwWuktQYNF30/lkjC0idqHjOntW9kvvQM8TYB4IckuwnD8NCWY+eYCQvC7yisqmL6
 NUrCGOalmpWhcZHsLLduDaIzE7nxN8DMGCnW4Qc0HwjgeZe+utHGkm6YdkkZZsca3JtjLK2A8kL
 PrbO6GPeqFw/18tXgcg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDMwMDA2MSBTYWx0ZWRfXw+NEY5oIqlPl
 cCma1Wvfd58py+sx7qWbdEBZMuaZnw/PAq2GgyOXS5erdb9wSVlKzsliE9ZKYR957seC7t1uGII
 Eo5PEYf/LqrLCHgqGdZGbgt8PWtN4f0=
X-Proofpoint-ORIG-GUID: x-rAnQrT9aaTZJ7zBujR_UZUvlqlCjz5
X-Proofpoint-GUID: x-rAnQrT9aaTZJ7zBujR_UZUvlqlCjz5
X-Authority-Analysis: v=2.4 cv=TL3Q2Fla c=1 sm=1 tr=0 ts=6ae4b79b cx=c_pps
 a=hnmNkyzTK/kJ09Xio7VxxA==:117 a=uyPgTw0bjBTS2cVxpiNm5w==:17
 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yx91gb_oNiZeI1HMLzn7:22 a=EUspDBNiAAAA:8
 a=VwQbUJbxAAAA:8 a=2haQ2MhrNbTofsgfN2sA:9 a=PEH46H7Ffwr30OY-TuGO:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-30_05,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 impostorscore=0 lowpriorityscore=0 priorityscore=1501 clxscore=1011
 adultscore=0 bulkscore=0 malwarescore=0 phishscore=0 suspectscore=0
 spamscore=0 classifier=typeunknown authscore=0 authtc= authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.22.0-2610190000
 definitions=main-2610300061

Emails to Andreas Werner bounce ("reason: 550 5.4.1 Recipient address
rejected: Access denied.), so apparently driver is not supported
anymore.  Last emails from Andreas Werner are from 2016.  Drop the entry
completely.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

---

Maybe this can go via MFD tree?
---
 MAINTAINERS | 9 ---------
 1 file changed, 9 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 365bec8eb7fb..51673747ab91 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -17998,15 +17998,6 @@ F:	Documentation/driver-api/men-chameleon-bus.rst
 F:	drivers/mcb/
 F:	include/linux/mcb.h
 
-MEN F21BMC (Board Management Controller)
-M:	Andreas Werner <andreas.werner@men.de>
-S:	Supported
-F:	Documentation/hwmon/menf21bmc.rst
-F:	drivers/hwmon/menf21bmc_hwmon.c
-F:	drivers/leds/leds-menf21bmc.c
-F:	drivers/mfd/menf21bmc.c
-F:	drivers/watchdog/menf21bmc_wdt.c
-
 MEN Z069 WATCHDOG DRIVER
 M:	Johannes Thumshirn <jth@kernel.org>
 L:	linux-watchdog@vger.kernel.org
-- 
2.53.0

