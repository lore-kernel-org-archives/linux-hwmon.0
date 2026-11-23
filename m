Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467379;
	b=DR7ecbI4uyVXUxnyvqv9XQFWHGbwL6d39uVA7TGYbcB/TNJk847Pn95kUnhQ/FKqZJ/E
	 Z945LX4272L/b0cweTICWEIZJaaJ4Lzc1klsveaMbQjLThj90+9cE7iW74izs3Tg8oG71
	 Zw46ilImdgai2mnXezqxK7VvkzwCPuHsJoZg208C+wcLhJXbOiFS1Ot2/phtSIZPd664h
	 dydDUDAl2XdpZQPGugBah1LgeYZoCMC/1zbAJvVEN41eqNFCaOKVEfvw2JxwxljpN1Q6u
	 BDvp7rmPbvL8H12f34mqyeN3MjcqFFssugFdesATzy4HMois9Oqk48tMkNIlGm3pOAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467379;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=ShLaGe1p5+gkGgUnMj4N6/Gbqp7RAUog7hkjsCLJl74=;
	b=z+zTeH4lEWdhqm+IJPMVTDZJuh9DggHzGDTdNlQKrWtGRDNnkhHFIsVkcDyZ/6U1hTFe
	 qYM8zx1aaSAiF9OeStRgG/Y6wIDKpsZU+qhKcByKdTNoKE88X4BDUfsEysF5tuIjgqmt/
	 wLHEEoOKjjuYM0CHaa8sKFqA86sUoWo2jT7110T4mEvTj9NV/BitXIy3tYejoDbIjzoU2
	 dTVwIKuQRgtJrpynbz27phyhWIkYIz0PkJVfVMrxaT4xEpoekwwBlEDAB+lfr+9O5+1Kf
	 BS+0h2LWnTYpDZs3NdfvRXsxB9ao8a6gLpoiWt+SnUJYSyh0mpGeOQnQeat76QsTKcw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PoyNcrf1;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WjCaLaHr;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E011606A32E
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:56:18 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4E011606A32E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=PoyNcrf1;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=WjCaLaHr
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJudPv2827521
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:56:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ShLaGe1p5+gkGgUnMj4N6/Gbqp7RAUog7hkjsCLJl74=; b=PoyNcrf1UJTCCSFM
	OZDfLj0txBnlx9abpng0AGg36Y/GVefkTUoiVav6wUTNW1aGZR2rGgxRSibv+J51
	PaPNGSLvIBd/Ot/FVAAsaWDwEwtVcLRKbYQ+TaeMfe8zXXe1OCWia62s3Lv+LgYv
	u4Th0xLmdBysF6TaqA2P2PVadMhQxF+FJlGkkR2GMXx8LZGuTavH/aXTcEhqCjt8
	siGLyrTUDEYziF9SZdg4jmpWP/kk7AnsTs9qAoSMC7C/UgBCEIjCEiE8EIKDuRC7
	dzgah3U/3zNb2lig5lgCWOrKRvEDhy30ffBV5WnV6AHQm4Xv474uRh/zH5xYARrY
	DMY02A==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx3maq-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:56:17 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-3869accaac2so2012841eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 12:56:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467377; x=1796072177; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ShLaGe1p5+gkGgUnMj4N6/Gbqp7RAUog7hkjsCLJl74=;
        b=WjCaLaHrx+MIa971TDIrXmWt+lfhOR0F67xIaoDkw+8IN+GjN5wBl+kOJbqTYjZTA1
         Rj2b2t0nrYvkLJ/uteq6lMAd5HcGXFe81GBnv5yT47G2X4BsnuzeUnOhm+QesTkfHt9Q
         6/gpY78x9tcDY4UuGLY5HSVMzn85nhYLwUVwczluCg9bZHv9S06ASTWSKr7zaBCe+ehK
         zjpHk9TZycrxDOdklfhSp23dheLzvTVCcCx/Io0O2gIOmMN8G0hcJwtVphjGu7NbIIra
         yghUny9IvMd2F9kGbM/4gY5wniHI6MoQwZHrSjRCOU+ndivrHS7/umwxj4dEc5Pcn7vP
         IM5A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467377; x=1796072177;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ShLaGe1p5+gkGgUnMj4N6/Gbqp7RAUog7hkjsCLJl74=;
        b=GdfoaZVPcBe5rHLd6+dxApAawGpVtsiuxj+4E1ls2rtrCtF1xJWvHLkqncvuwZShns
         Ot1r+KUD1yGhHf3H/BbDFUdFdI32kb0OvFWVpFV/Mu3I1Fjxw+VhrkI9CRUkGy7wyG5f
         ra5zoAPUUbflV27BOO+EP9Fy0OJqObRrwfe2OWGHkD6toXqZc0/q4Yn/X5A6/eTO+OGM
         UDRot+3671ea55KA4Mvzjrzzq4b56L9pBQCrUjFPaIoPme1x2hPbeMPudzzDjB/KHd8Z
         yCjTbnX7cHQDfvEAJ32a7aIgFIbCjS81cC/Xr/ZTN07s1HVhYh6FvMmWgrMpKuzhixkf
         Nh7w==
X-Gm-Message-State: APuU4Z/ylOsHmf8uE/UflFvhHfycRg1l6jCyqnI9tXdEK/QOqmwYlhEh
	bqo+E0umNYyWaPeKLFnvRR5qtm5NascekP7vR64TblzF77SfUNRGTKTg2WX+TB9ajOTucBArt5g
	NL+mHnGhaXitxoCm+LXx4Ew4TqDeuer5vfvLHN1W87acfr7/8VwJcgg/eXR2tT/jQuvA4ktaVXA
	==
X-Gm-Gg: AZFdTZdfTZCZ71s1gjBaY0G8NukqciVzKEHMC06b/knTkSVLV6DM93skwFSzSvLwZbY
	Z4CWfWBbTgM6moZs+snVOD7hj6OYZ8WABUypBW7jWqn/q42B2uFpczofTfcQizL7mdgEnxcoSPg
	hwgk7slnKBLOt5WpCI0SV20zMMCtxDB5V9jsIAK2nbLq81F6J6Eknjmk/ot7PK7gxEhHHXhcOcr
	lXTnbsVuvxL7vSkxHMQY5CBJXWphnmBYBqt34VABIAlYUiUn6fDf8P/h3qGCZkhoOVoZ3uXj4HX
	unOFhiKHD4B0gG5J/plu/ZsAp/YUuynEL9RolaiyVUqVg2exAjD5cU5KbkYf9d51cpXKTVZEq1e
	XdLT3hUeD2LH0AiYydZmGsd+wdMD0SJ3qAQR5Tx7Mf0zjqI+Fy+3LuOPj5kNamE+m0e70Pzf2PQ
	jmQcf1PgHt
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr11275524eec.18.1795467376914;
        Mon, 23 Nov 2026 12:56:16 -0800 (PST)
X-Received: by 2002:a05:7301:4283:b0:386:96fb:28c with SMTP id 5a478bee46e88-38696fb2022mr11275508eec.18.1795467376284;
        Mon, 23 Nov 2026 12:56:16 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.56.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:56:16 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:51 +0530
Subject: [PATCH v5 11/12] arm64: dts: qcom: pmih0108: Enable BCL sensor
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-11-747d5383d538@oss.qualcomm.com>
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
        Abel Vesa <abel.vesa@oss.qualcomm.com>,
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1270;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=47aN023hxv9OOnDCfygfziDOOhs2YVDNkTzqFv8vus8=;
 b=hM3yim468dCAZZp+27L7bqnFCF4BVqSMAsVAklDuWBZmBDI1auh+1HvrljOPuRq2pQrG5Fws4
 nZOhGgmi+RwDP0siclczf/aKCddVq5f5v0VoeRTAGrBt4uZK5IGGnhf
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b04a871 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=09zRouN1k7u6xsjrD3kA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: jDJ9MlJJtzLZ5epfL48VBOOX1t4JWQbG
X-Proofpoint-GUID: jDJ9MlJJtzLZ5epfL48VBOOX1t4JWQbG
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXwsgtJXqgs++t
 9TCS6oPOvRh9tayVhk6ifhgJqyc+HvC6lW4RlHDd9+l8UhhITVxL+S95zvQ0+ZX4mbsZFZLfeOt
 BX6P3Gp694RSnfZYkp9OBd5/dAPb5ww=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXwaRhkFLW+sLj
 QzzqMyU9IS7gUNFLw7811dLOlqw46fYC5+TzhYOSzQJ4IgQK3+p78W0xAA7Xd0A0SfkMFotECV3
 EOfl8KDyPBJMek2dUonxl6BLqoWalyLyFeilTK2wV8HMzKbiIucHChUbfhzacyo731BmbzzOq7M
 3T0S0p1gKIaSVcobjDnWvSEec/lmgZ6RRrwMpz4lFRANdieUxbW0w6WULrYY5jb/Ai23CAjBTwO
 Iq7OoACjjh96bqnymEd+NR34Hf3YgaxfBjA7cdJBmoFo24t9yagHLVVgCZIfM9CI/TqUDS8CA++
 J/6o1aGdoX7kkVg/srYfma/JecEWcd/PMwAzNkzrXsmqW3czAOuVC2zyugLhSVpwM9qD6erhVri
 ng6Nx3cso5rUefjUuIEvWi2l0lailN8zhPDqnKrVtA2JuIL5NTCUCy51KVtAGUX4A128StdSVRK
 yjLoQDKqOm8BxUo6eZA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pmih0108
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmih0108.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmih0108.dtsi b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
index 1c875995d881..e8af3e5d583c 100644
--- a/arch/arm64/boot/dts/qcom/pmih0108.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmih0108.dtsi
@@ -49,6 +49,17 @@ pmih0108_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmih0108-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmih0108_gpios: gpio@8800 {
 			compatible = "qcom,pmih0108-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

