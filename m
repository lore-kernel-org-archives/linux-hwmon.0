Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467326;
	b=TtkFGRuNCcYfhc7KRocfnfi7Dq2Gh+yw7Awf4amZu9p++mIU0jWPYMQjoCMIW/yb27ER
	 Kszx26G/RmQ1uQUqkF0uwfNfCLVChrW9QEMVcBBUgXILsPUFAMMFG3ARClhtDMUbTzwe/
	 supIz0j3wz7wBoTrXa6az2nbQVyZNommpTssHy7r26i05q7lw+aEwx4G27+HRjZJ+i+0h
	 W/vAlcYOPkT4bxJMph+Wk4SfwOZW+g3Nv89fDhdmbPKv+/nXUuf4Cda5wo5P/IQs+r4xs
	 sjCDwyFh/muqmggvkIMjhxCEAir2M5XkvJGvcpw2EeS7owCioy7wmLqcmuhEJvm02HA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467326;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-ORIG-GUID:X-Authority-Analysis:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=;
	b=4yuYX6preVynVWd2CnTZJd7PjrDhiKbM4sFJKpWf9kGL5n10Bwq3zm0egXSSNc1zBzdu
	 x0ujmEBF4tw2CEDZij5EzU5oSAPXo8/f0bc8oZc2hGF9extUTFKnDRT6QzXvQlPO2t60z
	 fRgRgw0c4jbyj6D1sZK+2ckez6K3U3ChmlGjhYxMPae+4Fd95ZxfMQ10+oYe3DNHsGya0
	 +V+kLx+Cs9d4FAgcgPo0eTME++vbmkvnIlm1Hgf/NzQWUEqnYrbU/WBsircaFiivv2K+r
	 DXhe1XK8GHJu/Uc4ktfxLwSYQQ+iLNqQw/tKgRqWx/EKko/+klpq6oCQ3zLDorVUz4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1so8nQF;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ony7BiFt;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 246F3606A32A
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:55:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 246F3606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=D1so8nQF;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Ony7BiFt
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJu8sP3513826
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:55:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=; b=D1so8nQFSfGWQh3d
	5muophMEI54gtgWnBFN4WI+jf2diOcOOh3E6uOPfZNiGNxwnI/0W0xMEqE/ELUTG
	GCDyzEkm3r0/+3nJdr0w85whv2A2PnRZrFZ71Imryfo27Qm562lS7LDh+mtr0L2b
	BYg5DctVFIU8Lvn3+T+NO2E3CiSLRcVxgwXsKLoObx2RJtxvyxUXcXXh+zDeEo9g
	N6dvyiF02lhyBis2vCBIAWddgX2OcHf++/SL2sc8YZ/Sqn/usSKSsWgsgmM6kOgn
	PjIYIoGxttyTL7vFfoqLmD6uJSAfEphAojM7Os2th1YRyYVhARjRqHWlBn/56J2V
	Nqcz4g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4ukr8be2-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:55:25 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-341eff9e381so6074006eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 12:55:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467325; x=1796072125; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=;
        b=Ony7BiFtFn9a8vz3aPgK53D05zb5BgBX85SZdMGU9Yqcd+y+NeUog0g7aSLw/oxBMF
         yffb7sCQlmQ2UE+zoBD7h1umndQSap/DnQfFu6OKEJtjNZ/rPMoee2nSbNSmaHtHVx+r
         iUuzyT+Ify9c43EMasqMrEOh9LkM+fJcGI2UxKEtARZyMSfFELdfwMN8/zAq3VFbjjGi
         syZ1+dm8tbfqZv2MgzpMtth2r7rv9rmLCYpViHHXnK/xFn07PvBZFDZMpIWJpCVoP53O
         HpbV2i/6dINc9ADvS+oiGHE+3u7wCOeJRGZ/aQgKoowEu/YiESZ+/UaXqthLm4YIwkUP
         x8Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467325; x=1796072125;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=o/gXwwriPCspFSLvm4k8J+IvKYQXCyefGW4XLOgCZN8=;
        b=TOKiw67Hi3w0tpSlu20AShKclNsfuJ9fhzwD0xczFhYA16fd+ql1hO4P7REdOMY1Ec
         HwI/4DoupKLLFgdmhB+lI0ce2MYpj893cs5UkIwq6tOkl0/eZlOY9bmiRtrQJRImqp45
         PqrKzzHBuZJXxA/oz9PrbAHaC4VMT5unrBNZWodJuV04fbYC4PZ3hAXzsji8LPP2PCI3
         2MT5ND3mZCOYz3Fp5O66u2gdmu+B5/LKN7LFW+WLN8wGWFtuycW7Jdvh+yp/u2v82nau
         94hiUBaRLEGrO82MTsPlwU5k8wVTkngARFu4/3BvIfR7U3LMHQaLuvT4RC362AFDLMfV
         UYyw==
X-Gm-Message-State: APuU4Z/7OetsgaTSvuUrv8FBDPTBl4n/aSdmlf0cjGoQQ7l3VL3e31OL
	P04o8imT/XeVLdxSik5+GJjekMaP5TysxwQWi12xcJ1qvx3fM5R8SPrpofK8Q7KmLtwAYlzv7GZ
	yfCuwX7QQDERojvAgtB1kUqw11KMFgks2IUJKiRSpWQZlGQz28/Fl0emOGgq55lS0uQ==
X-Gm-Gg: AZFdTZfGRbYPKiRdt8hoU0ptiBQ0r7mMyUbix0+wf42YS5FIWs9h5aR5zIEmxx3pMao
	57TSo/nRDjdtlJ/GfC+aHDHWYY53JdUB3wSR/vqIkJZOLUGb/58XydT/pwkv+M/scms83P8FIen
	8H6MVhqxLLmXUOt8aZvm9qmVFd8PbPqiFI3iMt5eDoQQ6bk5t0qFJhAyNdnL2o+LtGEm60Nk/d7
	TZm1mt/EzgVnznUo48dOSJwP2O+TLBtiTTCivoBkLr1I+Tu4Ig+BdA3MVHohUgaZCgQwKofJZG8
	XAjzESHJX7DI6micgKeCbblC5VlyLricAOuxVc6haDDu+pQhoY97cslLCTgSjUgJ5YGo8fEQ7ZY
	tf/AhJUHWI93RGMD6bhUKv2q8MSOfR/AdANPL52Uy5+R76YYbGwJNoV9wsEFcklByN4Lt0USTgg
	rwzli8t31g
X-Received: by 2002:a05:7301:7d03:b0:386:9cef:ac3a with SMTP id 5a478bee46e88-3869cefaf23mr8905415eec.28.1795467324793;
        Mon, 23 Nov 2026 12:55:24 -0800 (PST)
X-Received: by 2002:a05:7301:7d03:b0:386:9cef:ac3a with SMTP id 5a478bee46e88-3869cefaf23mr8905387eec.28.1795467324257;
        Mon, 23 Nov 2026 12:55:24 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:23 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:43 +0530
Subject: [PATCH v5 03/12] arm64: dts: qcom: hamoa-pmic: Enable BCL sensor
 node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-3-747d5383d538@oss.qualcomm.com>
References: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
In-Reply-To: <20261124-qcom-bcl-hwmon-v5-0-747d5383d538@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <skhan@linuxfoundation.org>,
        Randy Dunlap <rdunlap@infradead.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, linux-doc@vger.kernel.org,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Abel Vesa <abel.vesa@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1726;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=zhna6efU8UrOq6A/hPXjtJfGBmOdiUoack36KYf7d+I=;
 b=JUF+Qvr1MfhBjQofxRFWz8itf9IQztM3tWFITF/Ndgd743dfOYnitwBPWbZGE0CaK4sM7mgmL
 BxKmzmW7mDgCmk6pKpOjoazilMJLtWkZCPzxl3zdJKpzLxtemj9S+hx
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX7nwAwXuNmv90
 xNV7v6NiXiznPOYZm+YgJazaYQhmEf/smXkMX1DBFMJsJCT3VTKATEmnAOkgKv0yE/rAuoUBJNT
 amIlWt0VD+zVhduIahc2sbDcA1RVamE=
X-Proofpoint-ORIG-GUID: Hqll2038NDlKjTHAVceaIek9D4pAJley
X-Authority-Analysis: v=2.4 cv=M+rYuCws c=1 sm=1 tr=0 ts=6b04a83d cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=Um2Pa8k9VHT-vaBCBUpS:22
 a=EUspDBNiAAAA:8 a=pei3ZxCQ2QdDqwo0ZtEA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX6mzfCkfi47wB
 HkpGg6NOGs1pKGZCp8Z+yh8Q0ofAFZzIkQ5bgFrpSp9dC3eafqL32yZW+ppVzhY6mRiZHD0JWVS
 CyPBXFgOzSoPQLP/A0THYExZzntqXdWDSXje9fU3qU96jlGMR6u00BM+Zr0vBrKBkw/5PeAKdbi
 nhyXfxhuE4jd3UPHk73gdV6X+PkZhWj4J9mofEWliAadLw+GyPiy1pRInTtN7mbg72v55SPHhip
 Cfq6oyFWWP5QHiNNeeANtZvi89j02C/monV2+X81FqsIEJEYGfDh9Q0T2aSQAqGeVhgHGoeNcxc
 z+aAp244JGrZou0HXH8bOnZWoKHUuy6fENArYVKS09PTuc1PDk0TAmCQiYwdc9ksr3XsoApWowz
 V05da3B+f2LqEhRZFGKF18MxzeT9LAzT/w80Xg43EoL644BDPmM+5wNpHqdH+N6ny62LpVw/rsk
 G5DvvoLiyphysl4udFw==
X-Proofpoint-GUID: Hqll2038NDlKjTHAVceaIek9D4pAJley
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 suspectscore=0 phishscore=0 spamscore=0 adultscore=0
 clxscore=1015 lowpriorityscore=0 malwarescore=0 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for
hamoa-pmic. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi | 22 ++++++++++++++++++++++
 1 file changed, 22 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
index 7fad4a9b92fa..6b17d568188e 100644
--- a/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
+++ b/arch/arm64/boot/dts/qcom/hamoa-pmics.dtsi
@@ -426,6 +426,17 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			io-channel-names = "thermal";
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8550_gpios: gpio@8800 {
 			compatible = "qcom,pm8550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;
@@ -674,6 +685,17 @@ smb2360_0: pmic@7 {
 
 		status = "disabled";
 
+		sensor@4700 {
+			compatible = "qcom,smb2360-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		smb2360_0_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2360-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

