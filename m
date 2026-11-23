Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.180.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467366;
	b=JT6csYLAf7LwRX3qf5XI+zkQvLpvh4ojVAJyr8yIcGnza/ZLvgltK49+e5NL/Z2VbwJy
	 2bgFu5CD6ApgYb1N9gHFcknmDpxXpvFevJMr4Ig76lwYmEQ1AgADzuLKOnKnfCuFQRyFm
	 R3ag8v+NTzu6z+VFUMUXd9CQIpN+2PS3yDbeSy3Qvs8F2FSf3710b3Xpq3uhO0lUw6Eeb
	 B4OvKLL0xhQSQ2Y9+0huP0/kXo0MY3Wk4f/hEFMgDyW2khAUw4g72dJZemtoAZV6BRqhe
	 XbF/yrrNO6fVtR4AV2noKKM2nTDqDBarc5Hv4CG4NT5WmL5mw7z86bKtlldC02ixySQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467366;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-GUID:X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Info:
	 X-Authority-Analysis:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=3B0sddGns6tpiivmvUnZfvXMbFjv4i9fbfRQRV48XlE=;
	b=2mFIGWkBxi4Xoczqne80osfuwcoib4qyDdw4p/SxZCG/mZenO5lDqYBZo5Dtn83mrVxU
	 23GaChmPldNbLkqtEvx2M//x7c4emyna8Sy24hXhoJL6ab0LMdD0Zwt78un5/ESoPMApA
	 +5jmvEpxT055XJNE7dolGFYHqby+EbsT96bC1I8EfCQhQU/0XBAQjEB13P7wXL2HM+oz1
	 PkpmIp9YrLUO8gqFeOo+/ZLZiYRK/w6CKTPPLYtnA2qPZxpNgmbqe7JhN1txNMR8JDIj8
	 se/ixtrNiEjDX7sWEH1QnLEDBLoEd1Xe2qiAOzNRoHGLAJyq0h/LmzjweW1czEE7lMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jSvXuoSO;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j3MwRn5L;
	arc=none smtp.remote-ip=205.220.180.131
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45AEF606A331
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:56:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 45AEF606A331
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=jSvXuoSO;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=j3MwRn5L
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuXd31332761
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:56:05 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	3B0sddGns6tpiivmvUnZfvXMbFjv4i9fbfRQRV48XlE=; b=jSvXuoSOUp29r3YP
	UGRAlBHjsoytB7EKyciLou6y6Ceo1/+Vr6tOBvCHevzLQ1PYMCTqYotBKpz/hTXU
	mYpoceh776OjlZHBSmpiCxE0773FZS7pKC3c8cNPBP5fIBaMeEX9KGvp5VevBcf2
	Y/x1AyvfPZqBGS+VTHtSginFptiCkGyOeibs4hRRDuHpU8KzkqhzGl0Y7xN4J6t9
	jnYN9Y8Z0PlGpS/4E+SKkQ1QLLH8MVol1fY0s/ApF0zATZtWPt0KLHFmUbW6yvoR
	cSavC3wKzwPcKJwOwVdZ00SNAEbvhBZkcHz2ca+f7+We3st0L66nyhsCLBHmshNS
	l+ozgA==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g743ew1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:56:05 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3854627c1c8so5565893eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 12:56:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467364; x=1796072164; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=3B0sddGns6tpiivmvUnZfvXMbFjv4i9fbfRQRV48XlE=;
        b=j3MwRn5LXavpEvkUQoKaNkNGPR7CAlr00zMATQ708aeyeBL3pmg57ttO5pcGQNG3if
         vliX8vLl/bcYH//QMkEscw02SOZ/enZl3XAOIVdRCK8/pgxM49PTNAHUHXRX7Uuu1DjB
         FryEj9cGqCtw4F9VbvZ6NMq9TvICAQTDo+zE6i9AW6dNjBuljf85gnwf/yHn5Je15sAv
         CdCzL0VMf4xGWrBLaJKxWP+GCFPwyDazSeKFhyZ4VlGiwQGyeFUekK8b+VNx4clt/ggA
         M8Xsvi6Gt0nykj/KqRVsZTavJSeLcnbx4gkEEkTNQHjOv/IyRLeeZoOf4LcKBqVoFej4
         djmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467364; x=1796072164;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=3B0sddGns6tpiivmvUnZfvXMbFjv4i9fbfRQRV48XlE=;
        b=x5g7/yX726M19XKLguBKD8J0oKvSqqqXA5Mw/nN9Gz31DG4oZF+I7vVCtP6/MjXz5Z
         aHLk2+GtqRuLwmbQ0bu+3XD9oKhtW97T4fSvqyPCsTWkSLBTQDN7e1y8FHNYZEm95N9s
         MgCBp/CI8UDB+iYpwvVCt5E1H45nLqmjINRrghPtHJL4LWLx0wkvhNrH3Q8fBb3HmrKf
         QwE+Qash4gFU+5ITPgLGlcp+9a5W6zzrHlvST/ZVymblFzsBzKvf7jIt7Dl+rxoB9Uu1
         v3aoHwOkYhfvI32ogTBJY63kbk90CiT+pL5YueK5buhnmYLUtSgCvd7qdn7PjSpkot5C
         trqA==
X-Gm-Message-State: APuU4Z/OfIPb9mhMjRzHxeGcNym9kLmIPpiYXwG+ZpynkWFBE/DjAFOc
	ipESaIE956ksN/bIehnP1QNz7NO/cCVLvU2vR5vAtU8FfeuHeLArsJ9XyUr35/B/enYH7DSeBs5
	diHphEaRMJmOe2cURtzMlcajwLtxTOD4i4y8vgnIp4bFwWFyk2qxg+2P1lXUX0T5/Eg==
X-Gm-Gg: AZFdTZds2OyYJDMreuxfKRZ4ROd3fXMfpfG5f6d8ipm5RSl6KKwxNHf9TTrSPPr4eam
	lZaea5i8QbvVfRADqu93SkIfhgT4cFU+myHqL/l31AQtaKDEhzy/gniyKejLC9MA9r2HyjEUjJY
	aqNgXoHZVXNXcfueXIe0JpVom8TKe3ye6I8dQtWyVnXdLVjH88ubpeqcImkIxBsu1+nZxkYZ0fQ
	ItANIQdFhES2CIbgZ2e76VHfdjy+4+ViF4MOkoGv9qt/weBOi+YVlMzZbje7LcLRplph54lPtf8
	B5Dm1uR8Q4E0QLhrgLzp37hot+RV0R3YJRK3uYJ5p3YUmo98+8q/lcBbDz3m7LT8gexOEmhaoVb
	g93CToITK6sO6prqeu8X4w7SMjh0nIrePIUmahJu0rJxkXk77UPhggYwP6ttshG8grX9itUK3FE
	uNF9HMOEpx
X-Received: by 2002:a05:701b:2091:10b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b556912a4bmr14463355c88.32.1795467363973;
        Mon, 23 Nov 2026 12:56:03 -0800 (PST)
X-Received: by 2002:a05:701b:2091:10b0:1b2:366a:e7d1 with SMTP id a92af1059eb24-1b556912a4bmr14463318c88.32.1795467363407;
        Mon, 23 Nov 2026 12:56:03 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:56:03 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:49 +0530
Subject: [PATCH v5 09/12] arm64: dts: qcom: pmh0101: Enable BCL sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-9-747d5383d538@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1260;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=L6nSizHG/y+HmrSiyaptHCLW4K4aN1EFqVoX6vPricw=;
 b=WBO0DXaIYcrZfed6MtS/D0ti+xN8r+XNBuwf+df2d8oFiTs220C7lXXMY9zB482qMtmxdWwxd
 Snsqm69g5abDtBFFihGQduCh2F/DMNTqnj2OanknbZ+y+u2i4FRVODH
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-GUID: m1efBplK5rXm-Vnr6QJyamT4ycvEK4H8
X-Proofpoint-ORIG-GUID: m1efBplK5rXm-Vnr6QJyamT4ycvEK4H8
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX6Go9B6HhAqSp
 1fRmBv7np7benQbYDOLtLn/QopRSVo4prMS9OKBS6scDHk6sNZzUK9SdXpmbb/Li++W/NiUUrL1
 06AwXARN7pqifysffWMQRDOmXTttfuA=
X-Authority-Analysis: v=2.4 cv=T/cZ3PKQ c=1 sm=1 tr=0 ts=6b04a865 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=C1EnqVrfhtXmwaaqmQIA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX7XofCiZrh+zR
 /dr+I3+WRtwVQpOhzu55HDE3HgyPwupfOpwlmBYOwkhh1/Fu0Dd0ncoIqDO0xwqFuw0QxNZ50Ry
 QdCXxLh9oXPvzQPrUkrKKQBF2qEW4lWpJ7pjc+iNl/fGA0+lxkhc6vG2enSFC6edJID1K10O4RF
 dTqXbluR6C/Bgrwzg4DLkK1IDEHt0t5OL0hAym3v8HpKlFevjowa/mNBhhc+mLbAFWEdHazTvo/
 AtxKmGgducRD4Kg88Rnr0jmDJu3JV8DTzEl57/oZ+ZFjjS0m89mTOBwFRl5zFGeAwoBDFEWW1w5
 m9qZKdeN4SUB2cqptJGfOxOX1/DnlhkUtE446XDhFs0/uUQYvv017LQeuSOcdzEpltjlcDcqDsZ
 2gw837I3lftJnGg6P3UdJIJeciDnOffDkdU+2mt1bPUzDEGAyK52io1q0dd+rQXdFoWntVo+KdZ
 0nH8q39EJqqdJzuc4vw==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 spamscore=0 clxscore=1011 bulkscore=0 suspectscore=0 lowpriorityscore=0
 impostorscore=0 priorityscore=1501 adultscore=0 phishscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pmh0101
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pmh0101.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pmh0101.dtsi b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
index b1ec41325958..5635ed350f38 100644
--- a/arch/arm64/boot/dts/qcom/pmh0101.dtsi
+++ b/arch/arm64/boot/dts/qcom/pmh0101.dtsi
@@ -43,6 +43,17 @@ pmh0101_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pmh0101-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pmh0101_gpios: gpio@8800 {
 			compatible = "qcom,pmh0101-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

