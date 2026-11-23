Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467339;
	b=EJx3M2Cc9eLPeRQ+Dd/qLjjuWKnQ6dLSS12xq2hzXgU4lfEfvKMy4ODr7w/A/g7XiRjW
	 0HXGzbEWzugf8nlOY6wRinE/gnpTbfegAzUq3pEufCtfRIIGnyf1NndmHPrShXVWZ0+h2
	 jQAEBCUcAemMGpFVkWFVLU+OGvWRx3pXZN6ihc3KT9nCioqgmnJuvyapVCr8pxa8Wr/VW
	 4bR3jZDZBfBTpcGAcryoZFkvQlfWW3Ml8xziSQfGn7aYc6VkjnfLNQvN6AzEyBFBKjXei
	 jrZogOJLXqJP4PaTbQRNpxW70HuoKg8eIWK833nrhcyvPRMwCBzrW3YDfSEqlPzQQWg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467339;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=QVasG0GIAMMtQZmXmIZ/u3rymwHyTpJSQBxvHK5S8ek=;
	b=Pa56TL3LK8MPkwCn18OsJVSeU2uVMY3dxzGgeumcX0qM/1jjzwDklxTG9AD+5gCT2SVy
	 W8cB3IBEdXSQ/NvSSHjSzyQfntN7a5+vLTzOAEALSXrlQiJUJ0qIEYN+gfLx6QwZpnUaz
	 fOa1mBifZmXJUmkOg9cKIxIiEyZRrdHbV+93d9LS4mioKN7yXSUEeRz8AYgXqW0X3V5bK
	 UHpQ5psRAI5apUwKjuNgCQJs4IQisylt5pgXUtRM6tlU+oTQYkJFU5d0ud5M3I+LQ39LU
	 R0ifHg6k1D8EvyhSs50HjMn2SovjI1XuD3mBvh/HCI3j1tAyDlByF94GT0sAfbNNd3A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UWLFtAe2;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gAjSoauk;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41A06606A31E
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:55:39 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41A06606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=UWLFtAe2;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=gAjSoauk
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJueQt2827546
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:55:38 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	QVasG0GIAMMtQZmXmIZ/u3rymwHyTpJSQBxvHK5S8ek=; b=UWLFtAe2S4Q8jUG3
	mTrIiniGHu/xf1FQ8LVv7WN3T0HiTcefhVSzp70zVDcu46R/EiuwfBGr2oSGGxvg
	9+zfFJ5m3j58wGgTWFJ2oxM6Ul66PA2Jfoqk8jKiMRMaS+zBnoXqDJopwLiOixKi
	EUQo1bGQMsTmjE9Hv76okRuAIWfunDw7UcaTX4vMF/DmWB5Lg1Q7/m2LYJLB+bbI
	j8vvvTDgc2DtbhnxDvcsaHSn9QtDPIiSPz0PO1POE3uk9nj+o5Yw0MP6DkoS/d3x
	KAasvX4e/U31MVLVZNeL35+PJ+8dipLM7OgAOaW/JlbdIGxCwxLTqgvRJJ+Tfd1v
	iI7PtQ==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx3m6x-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:55:38 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-30bcb065bfdso4183186eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 12:55:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467338; x=1796072138; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=QVasG0GIAMMtQZmXmIZ/u3rymwHyTpJSQBxvHK5S8ek=;
        b=gAjSoaukfJEXi7HCHnJfD84msTrNSOX5ADp+UcztIDKxPexyTGmRpQJxQPloohS9kM
         JSaeXyzXDFM7XqcScqwbQPei9FsYtZldxFzypyZyoGR4cGm9g6hNvWeOQEkOJ2rlHM/s
         bAIN6wTWrGdaYkSNH0FGWSkbUt61fX58rvEj8qC19YK4Zejx94Fits5neyxOjeUHY6Up
         lGJEi8sTDVDGJy5x5MikXR14JTVDn5rA1WFV8uqP9Z/KUGum74cQJU+p4X7GrdxamoOS
         TCqlTEEVb7zakToV7BedfRbXLQ0OIgUUNhSUUC15t1AoFDntAg4T79CogpM94wI5ZO9m
         1JZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467338; x=1796072138;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=QVasG0GIAMMtQZmXmIZ/u3rymwHyTpJSQBxvHK5S8ek=;
        b=Z7QZbj+9XaP4q298g7xQaUyN4TtaXUXKcegu40wGZDCr3th5DZiPyv+XArT8BTDngR
         vh6TV9qAVyQkRhWpK12ZTZyrcvX9IhGzVWsI4NASwodwt/k76MqMG9zpMlgWOW8yXGu/
         a3jLejuoHddk2VCqIicVmfSwYE3hUAf8gR04BtR0JneG58Ji7pwhh692WGYLzlMWgUrx
         IqPIiGmaR3T/gSVW/SzhNxTmKcAkkL9X5o0cIs+vnJjQwA8huxGrahqIYGZQ22dAMAdb
         9BKw+5n25wjocKjPEKjqueoyP1L+nWftJtZXlSsOTzfnhoM5HdW9QZbeSxyrbouJV7Od
         REpg==
X-Gm-Message-State: APuU4Z9RZ0tLp+vw4ys1Us4tXhPwhmcjfXVBPm3MD9nCls3Sk4V7uzGF
	e/SLpELrnzXR8r7vzJpyD3aTr+zApfxziwGtivmSPtRNnupCqMZga3w8Ek3Bk9HSut8Gc3yqnY0
	0mXX62TItmN/BR+6EixHDBLWq8NrlQXh2ltJNFSV82VO92g4hWTAWKg5Ij5etd93joA==
X-Gm-Gg: AZFdTZeE7EpBKWgdst3yN1GtaXCI1jK4d4/YUVaPi6jCzzLxLHLuWYpZF/Jdu7NhAu1
	ZCrMac9K18xYU91M2wSfxseuMBAh4UEB1NrJoEihrh2/26sVaDA+89BgL5H+RlDP+B37HMe62Xq
	7GFSUIfkTBnkeXoaEw85PHhDDou7W/ouFMa2PRJOMJVgXF32twM/n/kUQ9GAJnEh4cS34frLEGE
	zx5rCCe8jp/fiI2vE3YWkhhtI5B29snaLzPbziD2a415voOd3oCsMZDy0MkMV4OUgZ8/1ifKtDY
	sekCj7ogc0cSXmbK81hM4Y0eCOqs03EDul3r5hGWQIktJ1Q70yo1ZrBj+Vl1SG0xMOvcS4ZkTox
	igSnuPcTUrDoNe6JdgO34DwCWsXi6Ub4TiXlRNJbed6XU4wZEnLXOtTTO4r4uUEsQxQu64QobnO
	1Jfc6Cnf4I
X-Received: by 2002:a05:701b:4541:20b0:1b5:6e71:3f0b with SMTP id a92af1059eb24-1b56e713f86mr5295848c88.18.1795467337904;
        Mon, 23 Nov 2026 12:55:37 -0800 (PST)
X-Received: by 2002:a05:701b:4541:20b0:1b5:6e71:3f0b with SMTP id a92af1059eb24-1b56e713f86mr5295807c88.18.1795467337385;
        Mon, 23 Nov 2026 12:55:37 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:37 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:45 +0530
Subject: [PATCH v5 05/12] arm64: dts: qcom: pm7550-eliza: Enable BCL sensor
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-5-747d5383d538@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1300;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=TQ8oMR4dp6+o4PLOcph+lfW15bcDXGH73jPsR+cwzaE=;
 b=C5ta8bd5Vrxxa5KbLb19w2pR0Zq327fKQRmZ4/uw81a02s8hsXDOFC662q0c8jyTj7xt/Wwxl
 kTo+phYoe7qDJH4Q+Mo6ZhjupbPnOQacYERjTqPlw/DkZBFXITGkTjB
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b04a84a cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=FmpG-t0u5PG92cBmzUAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: TR6JMRLLnIOXwHjjggQwoFROqgNWsVU_
X-Proofpoint-GUID: TR6JMRLLnIOXwHjjggQwoFROqgNWsVU_
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX/VYPV/koX+5J
 XVB8x57fiL+XIc2EWtJFTPvRUGXXRNWe8bFK72aaE3L1Dxs34WgdqkBBDl2ZAoyhqD8Wz/1RyqL
 Lc9H7454pTdQ5rGWe/uKef7IobYW00Q=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX4vr1yaaythJ/
 +8qrhZ2vjxg9Ov1/+j1s7gXBbGr9RRN/uVGbIopdin4DWFMn/fVsBgr1tSQ+R4LJwzf9M6RDnmo
 0v/aQnBaZkESmGPjYr2j+E1FCXIeoTiihfEgybk2KcsKbrbWviLlvJbUoSGXS4CZqbO993mvscP
 B/DQi+ui6CF9gJv+20LcP5tU+f31wYsvUjUdDh/9EhHt7KGp2tMraYFofCwQ0BAOeIXumt8Z0x7
 N/pgFtEmSfciBTRWiq5x/jBqrBUxnUXiOME3+rvG1u67a3zUR2/sk/6E76vdOmhswkXnI5G+PlF
 8nmeMI+fSBa1dUz5HjuKSYPboQIato6Z8CjUj1P5DL34c58wwdOKJ/UjXE9cn3CBLKmL2RR89Ta
 /IYzPQLJ4AMuYOT8E0yg7BH0yiZIWM0ytxg5xr/eYnQbvudVh06gcfrxo8Vnajpim21w4OkfIRA
 6os5injWdAukj93IeWA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for
pm7550-eliza. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
index 9b907f69264b..72a70b5dc9f5 100644
--- a/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550-eliza.dtsi
@@ -48,6 +48,17 @@ pm7550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm7550-bcl", "qcom,pm8550-bcl";
+			reg = <0x4700>;
+			interrupts = <0x1 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x1 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7550_gpios: gpio@8800 {
 			compatible = "qcom,pm7550-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

