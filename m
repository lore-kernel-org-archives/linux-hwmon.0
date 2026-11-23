Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467334;
	b=Ka1I24bbodRgIB8KWqNokM44nkeVpruX1IFc2KK/gSHHCo4ZzARBHP5DNnbpJNaIAsGr
	 1h2XsDF8pHsBBtW4fyoJF8cJL3Ub2d2TCBrzECIvjb0HNS9lkMHvsoEJt9LY63Z09a2VU
	 ZLV7/LaLDN2s3R9QrLqIWkjVblEa6KkIo+v6BLr+mr+KbGtgFRxXe2fpagmHk0EpaLj93
	 Eg3COBZ4xvSa7f0fUOdCALdaexONfI1r0K30itlW9IbHj02onM8OxVZl8wC2rh5rNYIkl
	 g8Qw9aqbrp9csh2AbZCUIcui5T2fBL2xMasP708N0UO5WuY8+TVkccCoNwIGtzXa7tg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467334;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Details-Enc:X-Proofpoint-ORIG-GUID:
	 X-Authority-Analysis:X-Proofpoint-GUID:X-Proofpoint-Spam-Info:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=FO787i0Up1CrINCS8JgLRJq4h0SoHPvJ6lnWJKpDTG4=;
	b=uY8ykqRyLtXKLTuHsZgln/9Z9LjeyKu1nxfwGxh7N04se+DG+gBI0Mc3H3NEQvvfR/K4
	 NY6SguBoREjhguNSUXR8TCScQbiPne6Tp7WB2aVERoKheCjZ1UrEI3Ip9G/c9yQHPNXOb
	 wKknZVqEErkcavRDbfM4txtyIjoQIVUPXzGFM86u3UMMam++V5LL6GHXnZzgM0nfItFir
	 Yn0lW/K1o36u4kFQS6BxOB3szwFZ02dTt42whQvGn33d23x/rU9vPgJbg/zhv+bOW2bU1
	 d6EqSLYj4ez/ToxBZoKvZbhlywlals8pMkYw6bktoH4UiLzQ1Lk7b5IQui4MdjcmnMw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mXyHqxhy;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e9oX+f0K;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E613606A32A
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:55:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8E613606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=mXyHqxhy;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=e9oX+f0K
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuarq2973607
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:55:32 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FO787i0Up1CrINCS8JgLRJq4h0SoHPvJ6lnWJKpDTG4=; b=mXyHqxhykrXmbbOB
	c+/PPeNUMQG2nQEliqU0Pnu5RqWuUV94jqtt3QfWwnKXO/dpntDJd7krxOIRl6Nh
	z9qYu1Zxp0ywgewuQIWQA5F0C6c9D/aBiXmCU8u3QvR/8tXJaS00lJuMcuFarAw4
	kKv068ordsY4dJRw3ydqEUoYP9O0JhINf2dFmLwJ4DL/TCztXZsfknmW3zRM7ohY
	hfLxi19sVWdTbAiLkXDLvcgrvbQcHxlJVxgCJxIXLaZJ7cAF/rVc1f5Kc0F/s8qT
	zj2Qd9keuj4zjF7jmthhhtVeQLLLhFGE3srkWF1jVwidaw9DOgoMnoq9PQzUx3d/
	WAYhTw==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fy03f9b-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:55:32 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-386b8624cf7so2116621eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 12:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467331; x=1796072131; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FO787i0Up1CrINCS8JgLRJq4h0SoHPvJ6lnWJKpDTG4=;
        b=e9oX+f0K6GARL+y/KJUJ7t0atx3e5EJzbfrPbcOmE16DCKEsrRnBGEjeBP6eQVyyFc
         6H1QMLDxiK1m4Xu6CqI4tucUteyCeKn4Liy/vWeDc1Ec4rd1hMBHfQFpA7EqDAIe7dRT
         XJZY3/Ixqb6d9xnZcdtz9ZVaM3OlNS1POL+Oq9EHsdOBHhBRnIWUH6pAhzigKJ41XzUz
         9o9OvtijVUtFSVK9zA6S3iOnreTlIy8tS8nnGSRsVrlrZ0B6f4fXrOysyDyJn6P23jue
         lBGGEdMCCWNZ7gzBShTLwsjRme5opVzEJGOFdxsR2vNGC42txhY8bGsXbTPUy36jBsiu
         gd9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467331; x=1796072131;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FO787i0Up1CrINCS8JgLRJq4h0SoHPvJ6lnWJKpDTG4=;
        b=dOwAVmky2fTWuOggDSFcnmgvFLWN0OQK5ydfK/wmtt1Vmm4w129hB10ko2J+OlJNAV
         jJeDK0I5PCOZh7PCwb/ey6z2stw409P4GWdUfuLItKYVD4LC1msDjnce6wOA4DUSiDBk
         XZIDr7lt9QH3EtU7lW4StBawxER1bdA9AfYPYaHb+//T0gT4rf1IbQS2wWilP1xQuGaX
         aWCUVdsv2unVYVlFK+68ULNs3mBbzJwV7hjGex+D3CYm7+RlmrxLHlG6CQ5NhQQLYuYw
         NZJihxeRRDzYdFSbFRQ08Ysr790BGFuGcqKida38+XeFDeAi6T0BrJ19nJ+1AqK0fSUM
         zSVw==
X-Gm-Message-State: APuU4Z+7QaPO7QjUmsCmK/FImSH5pxbrb/8crhE+6b1aiTLdFZIVfu4r
	6tQ1//LS11TJDbr14a8iFp5DAusB2zWItvcHatX16rHZ6Yl6sW/rguDNt58Hp7Ilqg7rNObkmfz
	dyrfdhbLVSYSfO0HUCNWlDO9Ug6GY3alBuBuMPdcbeFc79YGJsahf55V2z7CUCqwGKA==
X-Gm-Gg: AZFdTZcdCWI4DKxBWErrmKX/aXiOPomDdZ/I8c0PDFCApaaAo1K3AmBF7O2IBk3ih+O
	B4kZmWlaC4lcZMP0d81kd/K+fkHS7GUUH7dvU9BxqRiK3INxwvt5qR9kex4vMw0HoVZS6LHJ7vB
	0qbF99imHdpM4Tgv9wujOsjvDZNmL9mD16J1i86JyfbeMgg3IdEfgG1te3GR8bTpHB5dJrfxbUS
	APVgat1csvidt/egWwTwsUt2S6HlnNUKdzdAXCufzP9YQxgZXbMz+cHM/hhLHHXmqPKFzJvSAXI
	4ud4iD7ZaG94Pjhnr3veQMHmodRSSzBOSB8YU9t3ukeDKyHkJHTNmdn20TirQ/UeHb0NjqMaswq
	OhSa5MFr7ejrD5fzJRfnvF5GK7DtYK2K0GWbBfDu4Gq7Ib4U468Et8rcKEKWYLhTH2Ak+hmWoeX
	/ZveGHpT4T
X-Received: by 2002:a05:693c:894c:20b0:386:b566:85e with SMTP id 5a478bee46e88-386b5660d73mr3295197eec.16.1795467331453;
        Mon, 23 Nov 2026 12:55:31 -0800 (PST)
X-Received: by 2002:a05:693c:894c:20b0:386:b566:85e with SMTP id 5a478bee46e88-386b5660d73mr3295136eec.16.1795467330810;
        Mon, 23 Nov 2026 12:55:30 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:30 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:44 +0530
Subject: [PATCH v5 04/12] arm64: dts: qcom: pm7250b: Enable BCL sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-4-747d5383d538@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1257;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=4feVVnMM5ALc3+0FOkCxSTWjH8p033HoHYKJfJ9BPqE=;
 b=U4gJSJ7RC2dXsz6wOxP8adtXjI+Uqf0pB3DmbJF/K6HNUSlGrMCcyr1V+JIqX1azpuLpHkx59
 yfo5aLfJyi4D0Y66+UF37R5KpgJJGDmdkn41LputUlQxvgdm38TPc3X
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX6QYgZl2tapqk
 QP3l7D2hiRzBabgV+6XqT1ydwcolaVh2eckJmytI4HOERdpLEybUS/mW9PqeKUEISLidK6rlxWA
 AQ2OIXDeV1v7BzsvbtWrWssbizVjEqGELuPJNmL34YjeutWghWbYMO0fFGM87+WbKANCdCDWjbQ
 N2irbcMrMqgKlWmx+VAK/NrQTUSRc6OXYnRkXRpyM1adRD+UM8baPmkDEVlcpUONlIo3n5joGhj
 /ekFJtWlLWtxMUUVmBw7vSic3wY4zbEGE+lB6YdDU0p5h9j/hekvuaqWXejWZHPazs30xDb+pao
 Rk7ktCDd6TPPJ0NZfhOYQSqOE3U83ozBJbH7TbEGpOALXHUs9O2Hvgq1JP3a5V6bdCCskyiUUuW
 MIhNHRMSLEeESD7EatZ4ToXpJZ7qdPwIjJH3c43m2NMeDTnEIMHzwhe6tEhO/iSo94zlG78tAuQ
 u3dvH58O9rtYy5maW0w==
X-Proofpoint-ORIG-GUID: 1zmLzcVVW2FhsguwAc8uaxDc5M9Xqrsy
X-Authority-Analysis: v=2.4 cv=QrXLTlyd c=1 sm=1 tr=0 ts=6b04a844 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=ZpdpYltYx_vBUK5n70dp:22
 a=EUspDBNiAAAA:8 a=8YuGtcdev8JQwI9EQfsA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-GUID: 1zmLzcVVW2FhsguwAc8uaxDc5M9Xqrsy
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX/p+6E5paQc6Y
 aKnsaopMREm3ZjiDLkqFxeNrGi6fzLeKSFrJArI8aTqYvBt2mIO43FHz8w/fIe1B2sVLzpVisMm
 Gwy2qrV796Jp8nNlgfFSuAdourx9dOM=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 suspectscore=0 phishscore=0 spamscore=0
 lowpriorityscore=0 adultscore=0 clxscore=1015 malwarescore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pm7250b
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7250b.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
index 43cab07126c5..76d0481914e4 100644
--- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
@@ -89,6 +89,17 @@ pm7250b_typec: typec@1500 {
 			status = "disabled";
 		};
 
+		sensor@1d00 {
+			compatible = "qcom,pm7250b-bcl";
+			reg = <0x1d00>;
+			interrupts = <PM7250B_SID 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x1d 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <PM7250B_SID 0x1d 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7250b_temp: temp-alarm@2400 {
 			compatible = "qcom,spmi-temp-alarm";
 			reg = <0x2400>;

-- 
2.43.0

