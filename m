Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467385;
	b=QkIDrzfAT+P/HnnS6fmXklwf3ltwPhMEcTjdu0QF0HoZRFaHcns1aMG+924dgStEmR5u
	 zi6y2h7icFeAvIRTgsTJ56FVfTWyVJZ9+/dBQbl7YrlPiCxTbV43x9+ZAVDvydJrLYhlh
	 hE+uhCdsPaatX02MP7tW4QG0I8qfwUK6Qk2e0BxTduw6CvNfNjIW05WdjSKv3Y6CYd3ib
	 +dMVWBUeZKSmwxy4llCDh1Pr1UdnoOnVdyAndFGgNXwpzxq+FcDm6Vz8Hb5g4jDQjf+v+
	 bqJpHeXkkQBIhc/CQGMw5eBAWKBfd9/FKThiuhfPljXEms82D0nsHjtKuYOeNeWAf5w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467385;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-ORIG-GUID:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Spam-Info:X-Proofpoint-GUID:X-Authority-Analysis:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=;
	b=bzLWrw7WwOu+JqOl2YXYII7XlJFW4JVNjz/PFayzX0ZikHSt6xCaZT005BXxoGRvNrcG
	 wlwn4MKGhExm9s8q8KHJvtGGGsvJ9l9oNOpbLopNB4+qTA3ncqDr7jYjxD+TXNuxMXfps
	 hfzCqBiPwYDFohGms/Ip4BZGd4FNhyxSXUvRIAEWzG+0KgWImel/+o2v0oIIj0zEchdzu
	 TlPRVDLm/YV/pGLb/PhuOqN2dkRhvZedNu5swI1cONIWx9EOwgmTYZ7hWTCvAnKhENsek
	 XUq52IixvY9TaYh7fXxltSHjQHeIDa5kLEfS5koYPF7jT4eTFxx42wDvsGrSNqA3TAg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H2z0940B;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Olu07rpe;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 39816606A326
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:56:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 39816606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=H2z0940B;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Olu07rpe
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJufcr026215
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:56:24 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=; b=H2z0940Br/B6IYM5
	v050grSbNasErG8gRzb/FuLQCmYqwrHcY7TL6CmETJ3DOvBxKlip3EH3Qqqd4Xmi
	waVlwJpkhabehJ00n0ZtXV+qS5WtOjhWhF/MaR6ySBkRI3aLCmvHo6pKJNtsieqL
	e/2it7vqG5XlXdyboJ8N9rmvxMxFoFkKMRgR7bk73Z36d0TpHMALUCD7syoZZO96
	L69IQ6SpldT5XSP0828uLmaNCwpsp4bQODJcCAc7vm0ZZ9wKvJES7qbp/8fTQmY8
	tew7zVMnodslqlb+AFcCaWEKATXT3yDcWf0CUA3ChfhBD8wHuscNSM8Gk8ZkFnpL
	HIEk4g==
Received: from mail-dy1-f200.google.com (mail-dy1-f200.google.com [74.125.82.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4fyd3fhn-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:56:24 +0000 (GMT)
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3869865a304so2098317eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 12:56:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467383; x=1796072183; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=;
        b=Olu07rpeqo3Hu1bcDlZO9+luO8T2OwFWlh2HzFjcEkHEloz3QFb34g8OUJVvKzR1tN
         3bG1b2qsESxtHGiKS0wVjiO5La1l0TYrtgZyIHkRwagSipoRGI9Mmtcz2ngfdKO2Gg3U
         85yhqeR4JN557Ueq8vX1wgCNmxeNbrFP0/RJNr2g+YTHZxFu+IxKoWVX/6SUAn4W0DaD
         CYXskwS95nTLLPdHZjLfSWK2wxUEK11pGdzzgCbXBA9ozEMwMpvVPbotJkrl/x6kB+Nl
         J/o1+T/Uy79oU9pL0h/vQ4vkxd0TMMoxoNc6VwRQ/blo97/YCxfs890mJB3cLQLieeJR
         UvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467383; x=1796072183;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=HVZcSjFH4FJeUfEsBwsOf+lXeSQFSzxGuq+r24Kf3NI=;
        b=JhLqbWaunuKNXDfrBzX8LkRDBcKxZulJMrPfQAvQCFuHfGevfMFBHXSTmGew++r6In
         Y325NqcQTA+NYJH6RQN2WDHUZXHa0YqKrSP5+RH92JCAUKnRcjXOZ/CNub8F81cLuYot
         qwKfQSSHSx9FcGI41dPhb5v3F4t+x+2ussSpvA0p7Gk3BYNw9lkrYK1gJrbq29yYFpRx
         KZRiUvR/Gi08elEG8c8WI3ijeUb6MIxS74AtXV5A1mThsvxU/HWtg/CNaMhBYeKWCEoi
         acyYKeVr7ZpKSZz/hZgKXTjwZAX7qkWONCeG5mqks1ytuTZVnOduCZ3vRoS8wP+JH4v8
         swyQ==
X-Gm-Message-State: APuU4Z85HWYsmJkWGJ53ENoCNYfhfJmTeh7q3pt4v0v9zKLgvE0pc+xV
	+xJYoNdIpA8Fb/QMg70abo8T3S3E9FFmgUjisXvBZFNoqnIh9Fd8FmodGmOpXJ5gShktm+MmP3W
	+J5Otu5JXvIUce5YT4Rr56fUgPB6iganbDzIhyyNZr2fDqaYlfFQfLKQU0oIclLvIYw==
X-Gm-Gg: AZFdTZc3RQoVHeGEGkSCZkbxDxy316Yf2CV+CD7oTrSYYG1s5jI+AUgJx83skRs9TDQ
	dwWcprrVk0wU4JlzpjwFftm7JGTHDscljitVg9gglGfWvMYRWugXvGGYGpmu+Ed5apM/VgTAjom
	J2CabCxEDdeM0egMHx+9ix54Wfwct0uyViYTX+pSLayWtDpMGIokAFS8rdyhRp09sSVOPFXw1lP
	OsMWEk9uyYUg4b9J8ss49dIHVGV7h6FasGq1uw/gTylcHkY9ZdRlfVTb1fqEq+TAhskGwhH1ikh
	VbyLS8ppIhzSIg+34ci4dxfTlMV9FNbkvZhlHyQkA9TYshi0/YZVxiuG+2MRKyU+Jw9+p2Hlg9W
	XGdd0SpEn/SHz9NLkyX43XTyJ2n6zfZHpCriju8ZBdn4URbq2LdufA59rE4gv6MHfMZ9qsrkV9B
	zY/vU3EAN+
X-Received: by 2002:a05:693c:41d1:10b0:386:9d4b:9403 with SMTP id 5a478bee46e88-3869d4b9723mr8818067eec.19.1795467383402;
        Mon, 23 Nov 2026 12:56:23 -0800 (PST)
X-Received: by 2002:a05:693c:41d1:10b0:386:9d4b:9403 with SMTP id 5a478bee46e88-3869d4b9723mr8818038eec.19.1795467382818;
        Mon, 23 Nov 2026 12:56:22 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:56:22 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:52 +0530
Subject: [PATCH v5 12/12] arm64: dts: qcom: smb2370: Enable BCL sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-12-747d5383d538@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1198;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=vJQuhX/oBX172FGrYO7vTJtYeipTicxxvpxXEYh0ojs=;
 b=c1lfg4TaQF9XXCtiV+bWHYb+IQQy3xyZxsYuABAYVnTRz7kwnthdKHQVzbWpLFWVTQ0yUfG/o
 wCE+6d7SD4uDvya0APz5YCTuTN4NDHptzSZdB82hrfdPR3sFiuqSBT7
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: zPoKKLT0Hf4QQDCX_vHkabSrVoTqT3Oq
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX5frLeVj/lC63
 30oJ+X0Xz6u79yJ/OhBQ/sjLkTxtMrvjg/kveDG2q/1rNM/m+KLlge9Ac8A6/FYjkTlhiVelC9Z
 8q+LrMY5/ZSS1eftX+vZ0+DURp8I3Habb3kik35IqMU0hgBetBDp1zmd8FshuidBxSIjLGTKaSs
 FqMVCIGtJzH8fGszvyUL0luUJXlY0GV85rh9a2j0Ox8MQGyTmmn/uekmpJh8/2ieGX4iapirNkT
 O+/sTjtxzK9P9OkoZG4UUQwT9tZ5OZdapxWef08hxdH4AZz9tIIETTGPs3O5QWEIDIDSKVH7N+z
 9jKAB6lRClz5HFAGpRueHZhguAGAt7rdcizJrb3UORa2FzP24tfIZZMFMIHrwJrhVhrgCjngKHB
 GlPqhUJEfdXERN2Z1wNRcCCPk3j88rnl4E1NH3jX1U8Aqxg86dd2sHd608UhbqPgdN4L7HGnr67
 HxM/3rzWjQ2hhxOMdQg==
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX/OqLA9hrlnlp
 Pzny3UQC0184934pfQzObYMTZRIaaP12ZBX+dTYV29+lcC5IgyUXycEwbITuB5C9EDHWzpVC6o3
 SAIaZdcyfoT6YW/nyBv6xVL7X+wwdlk=
X-Proofpoint-GUID: zPoKKLT0Hf4QQDCX_vHkabSrVoTqT3Oq
X-Authority-Analysis: v=2.4 cv=Aol7T+9P c=1 sm=1 tr=0 ts=6b04a878 cx=c_pps
 a=PfFC4Oe2JQzmKTvty2cRDw==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=eoimf2acIAo5FJnRuUoq:22
 a=EUspDBNiAAAA:8 a=Mdvtvp0LKpy3kcB40AAA:9 a=QEXdDO2ut3YA:10
 a=6Ab_bkdmUrQuMsNx7PHu:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 suspectscore=0 phishscore=0 adultscore=0 lowpriorityscore=0
 spamscore=0 bulkscore=0 malwarescore=0 priorityscore=1501 impostorscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for smb2370
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/smb2370.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/smb2370.dtsi b/arch/arm64/boot/dts/qcom/smb2370.dtsi
index 1e02578e4ee3..4809b3d8cfe2 100644
--- a/arch/arm64/boot/dts/qcom/smb2370.dtsi
+++ b/arch/arm64/boot/dts/qcom/smb2370.dtsi
@@ -10,6 +10,17 @@ smb2370_j_e2: pmic@9 {
 		#address-cells = <1>;
 		#size-cells = <0>;
 
+		sensor@4700 {
+			compatible = "qcom,smb2370-bcl";
+			reg = <0x4700>;
+			interrupts = <0x9 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x9 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x9 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		smb2370_j_e2_eusb2_repeater: phy@fd00 {
 			compatible = "qcom,smb2370-eusb2-repeater";
 			reg = <0xfd00>;

-- 
2.43.0

