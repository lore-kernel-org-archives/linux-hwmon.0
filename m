Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467346;
	b=A2X317rwv+EGaUpdRhlhJ+DXruu91YaTL01bGMQNHnEhjHOi4jbNf+wlblSOk2W8eg/c
	 jx9i312+elHSRnp09v9fFZyNA6BZIVRxw1a5ORxZbK5Zx5DxMNwYOjX5M44JwXrppOLy5
	 fsYbmHceLCnLBDVLNMhT/P9bexg3qYhsGPGgJvb1Im2i7RTdMLDah6Fst/4KJmrbhVHTV
	 inhHEtmDO5qlohn9z8q9T/zzjZVeVy5iURmIxLGtc4RWmEmw2vkiX7LBl+nN/nl8AweBf
	 c/W0fTcoPrq+X2vlmKVTPbvxHBmzjlvT5gxXV4oeDZ4oVrNQElcP3MpOlhTGtFpYuAA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467346;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=UFbn/o9oLyqneSHbrIBmqKMg2kCew371Qq+HtQy41oA=;
	b=aXCgpRbl38d2SjbvPryTHcmLYgoWlR+rWwt2K1eKLvMOLmqT8Wj1TgV6RaQxdU3lU4+P
	 BB3kdH2PRAiDaII4G1z5zczftV0te4wdvuCK4mq9OgTJYzIzMR4f2ilh9Xs+hFWREsbay
	 6CB0CCZwXcVghQJe4YeMrlCkULDQ+kR25nqjNkVZPAATvtFdW6b442ANfj5nJsy+q2AUD
	 RN00BdgYfSYCzFTlGGoVYYf/1oGG9z2n72gb9oWX/+70/4SEsrmpG7wJvg0vRPoSu2oNk
	 ljhaXkdZYNU6yVkHdGzi8TN+Jdh13pdRTtAIhLqh9ACL/k6FzeW0k+4WKbpCRwjMABw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TfhYu3p4;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UHZhb3Vq;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EF122606A32D
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:55:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EF122606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=TfhYu3p4;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=UHZhb3Vq
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJueR22827546
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:55:45 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UFbn/o9oLyqneSHbrIBmqKMg2kCew371Qq+HtQy41oA=; b=TfhYu3p4HLmEAiBW
	Ys7hkLgYGRWjH2zZ2JTzF/Hy+/oTcf0+qFKPXf+uRkCIdFMimev2n4D8JQvok3J6
	Kh6ZNpFq8m26tpUe/caZfgwnDGhD0vzsoH6Mk6oHJVNfV/6Si9txQhQ0veRvGgzS
	omeA+pcT6ia9XcwcDo81OK+CBnVPr0QXKy+eMtoJIi9bLdTXuienzgQkTjwsomFx
	cpuCZTDG36vYNs+xyjemhHRDbT8E7DrFh+SaOGC7Ei6HpULF8ykRc/3TqA9AQjgZ
	G8Pbu4uTDRZTdZC4pgMKclogz9Y9mkcLm0QOeOrOBoaqz/6JXisJ662s0C+hyK87
	toh/1A==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx3m7h-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:55:45 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3854627c1c8so5565336eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 12:55:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467344; x=1796072144; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UFbn/o9oLyqneSHbrIBmqKMg2kCew371Qq+HtQy41oA=;
        b=UHZhb3Vq2Giew2FK0Aqmns/RaGLj05VTLHFhNJJQagLICQPuIZMYg+FGZmijYMVgZf
         8xEaEta6924Lh18aY9gBYChrLLAA6LKTSi/ipdYWP1nZNsfbJ1Yei0dmK1MvqoHU+NZW
         X2AkXx3B10nem4zaEzcRYP7ZrbWECn5oQgw1hf3YUXQiRsOFTKnQb9oB+lEzHsFUiZgx
         sEiR0ByL9YCbipF4uTQ1Pv5PEUWv9DtCTkZr2OobNFfrGZsWmSGU7K0MQ3D9CiGhZwS8
         n69nH/ERdpRFG2IJr/A/SXnCNqd+unAFaH8vzdSCadCJVPPK/Uu6nUg+VeF/qUSVzFzH
         DptQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467344; x=1796072144;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UFbn/o9oLyqneSHbrIBmqKMg2kCew371Qq+HtQy41oA=;
        b=mfxfTOfFxoKa0wurugiFvkIi/j5xaAJrDS7hV2ZZvz4+ro5QXGZDMinRRt+zLWPSZN
         kdARQqRbTYBSxGmOja3jISKerfPbGVitPS7Ouo+GAZwU2mjeVurpPcDrclXHHnIGOLhJ
         eryYJbi4SOkoKi+sPI1Mv0ORtQqhOKZdRWYa5wy3CLoOzWRkxHpHvZWOFSAGkI0ydt4S
         ynuIp9yX594XpuA0mkXxeR6RCQcDAZjodGzooV9g+oGDipakROUhzc2GPnd4ZMF4Ycx1
         JwHTHzR4MXrbI/lGulLCsLuwAJRh6TiufJ6J9yDSVaXIdE6Yfa9tKC7wv6MYwwtXhWVV
         UrwQ==
X-Gm-Message-State: APuU4Z9JyRFe1Q21xFP6Ue4LZTIYSmtckwCypPaou3RpCWOw3qUYeZOV
	B8GSHz7GG652flqFixJdrj6SVKWN701R/bAdmcH6kHTqCdHcFl+/Lfzz+kpYMyK35uWEuXk7KvK
	HU6qyihXDR4EuYX05Vb4kYtAZ8PSmB48ILpRnA0TsBjxEV6UFePUM8yj/LTNTHTlTmA==
X-Gm-Gg: AZFdTZc7MTzTgNEB36qImFD01/EPiYICE3wdcSvCCCiApM/SQC2Mq2OQc9ysWVuYRdz
	pDL2V1PSyE5Od/X1GL/VHW52/BKp9eTEgWImZG7Zhw5BZg0wTBavdb/h45nV1bLvWQFQ9ILTYWX
	DEJdhy8nxXkQq8D2evq57I5HwE/hMeXdCO0NazWn1CzWFiw+jOIrbTSwGXmaaRVSa6bFSGEfbWC
	ywt20UZmL/n1NY6TFfunzYbkp2C4rfk3WisWDB3cJDKdBapM5vc/nBp4zgZb5DOVNlvdewp2Txi
	4/POKtBVt49hsZ/Ax//TWCvr9dLKgrUj15avSappB1We5SNsi2aiiKmHsnPie+tCMuswWcevCDc
	nZZ12NXd+c/W0ckv737A4aisGGqowdEp+6NxJW18B25Y3jRI14z8yMpvJaQheesp8h18fELjq1L
	ZkSk6l1DB4
X-Received: by 2002:a05:7301:db86:b0:36e:2b8b:a098 with SMTP id 5a478bee46e88-3857025c736mr12202052eec.31.1795467344411;
        Mon, 23 Nov 2026 12:55:44 -0800 (PST)
X-Received: by 2002:a05:7301:db86:b0:36e:2b8b:a098 with SMTP id 5a478bee46e88-3857025c736mr12202032eec.31.1795467343843;
        Mon, 23 Nov 2026 12:55:43 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:43 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:46 +0530
Subject: [PATCH v5 06/12] arm64: dts: qcom: pm7550ba-eliza: Enable BCL
 sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-6-747d5383d538@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1301;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=ULRBXyIFz867Nh5qIBr+xcji/05W1S7N0crGceoW2e0=;
 b=XGzMJ068AmLrwGRQFHZFLFtWzDcU2FDiEN2mnxyhJfAeDvIbvp5Ol0ciu4Eu3D4VdRnPuwSnH
 20QpK2bPny5AjjLfjdfTcw0eenprUoAhNjIvJZ2etIKzHw0OSylz7HL
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b04a851 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=JVADKE0FdtAJhbIBjnoA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-ORIG-GUID: BfL0NpsU5LeFSrU2rQ2IZkELPhmEwLTg
X-Proofpoint-GUID: BfL0NpsU5LeFSrU2rQ2IZkELPhmEwLTg
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX6zPr8c1UX5Du
 OaLa1tvqdtV6pJtRdfH4J3KyK+mCGCzLTDEuk4UhdgXyJFR4d8ydBH/8+BHRfDmgI7vBdzNubTp
 s+++9IKILgLnlv6wKl61K4CnRaNSUt4=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX429JHfcqanlk
 rRbdNz8YAKVSUI57kzaMzaLz+9XAydSBoCh+b0U1OGY8PoM53Cc5x84+6M2ZlKJtxYdXDeAPsSV
 v9WXkBZz5i5B2BPCsrHE8HGhEtJvPeikYWyUuBwIP5vWtnjYv5oQmArgeOU0YrMySOb2aPFJWTF
 rpV+Djnr7LZKMkPhKrQSqyNQpgXzuAi7ldNTig3aVzp6wXXwcKN+N8+le2jH3B9WpVjc33Fx26O
 A8ETog3w/n8teBuwIvwgDSZCRNqNWgYLl7+HBGeE3YxEQ5wL40gU8jikn9Fjk/hy2s8q/VUn5Zh
 iy4T6jzzSmJTk8hiNOIpwxBfWaOMz/jKh8S5Qy7ksgAzo9QqeIn1yuuYP7lcaa1h9Y7Zj1GDZKI
 u0Z+7CYwP87uxEOGhLq7TcclCsXyNbSQWxDyx5zv1wn8jzWeovLRwTjFM68EkpzpdNQL27j2JT+
 uW3h6ed9apG2zZ6PqNA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for
pm7550ba-eliza. The BCL monitors battery voltage and current, providing
hardware interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
index 18692893ca41..f0c252a386ee 100644
--- a/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm7550ba-eliza.dtsi
@@ -50,6 +50,17 @@ pm7550ba_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm7550ba-bcl";
+			reg = <0x4700>;
+			interrupts = <0x7 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x7 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm7550ba_gpios: gpio@8800 {
 			compatible = "qcom,pm7550ba-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

