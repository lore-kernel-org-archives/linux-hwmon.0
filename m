Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467352;
	b=BsuC93+bg20YLHBmcrCaVpt3yTmCUfcX7fmaErn2ql9wTBFx39XZV5EBt0BoVUk7XxYC
	 c1YX1vUww70Yt7skGZ5RhI9/69MVKyXjXPmlohdKg/ECOck1Q5UC2K+ATnp9NRljukz6A
	 E/HpeJyQhvbEIfx2sldzH2kueZPfbDPjVTlFBQLJ/Bw44n1wovkCmsYM929AiIaWUtfT3
	 o28Tg/jReolLoapNPeYfsoqkqSSjGXWgh1/ulRL63CbDyK9aM77J7NLaZ+c5xYNgMymu2
	 pxYvpqPzI8xubG1IuuEi4fS5VqOFUFZw/Ul6duuB9wiLd3WSJ5C65wsO/jLF8lF449g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467352;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Authority-Analysis:X-Proofpoint-ORIG-GUID:X-Proofpoint-GUID:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=tfHrOCSYFZtXzYKdXoAzD1yb/ohB9hlTLVtFUdkulRw=;
	b=II0HMY+6UmLXjUmJuXo5avNvdBW8cP7C2ZYHeowGWHiQxSMnWeC8gNJxU2cEbFVeCUcE
	 D0sbLR8iz23YfPYQRNl2AIum7gcfn32u0O8Uy/r6OfQLetvuSnCFYaONBl9wZ0S2yTgAl
	 LyXDV9q6mL28UnwgPXkRlRJDJZ33/39fhHcMtZ3g6UPVrogRS43Kct1W6xrC222UIBvGz
	 9glGr0UgPfv93DlGGbtZAGyTiVvBQmELwO6WZ/9ahkZch5GOEsvkvbvKQIznurK1UUw9U
	 D60/buPHMtbEGZr4aSKog5mqiTZW37B3eDbGrSX2XktcNcJIipbxp8R38sBJLioHCJQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=APu6pruJ;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FiXuGchy;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0585F606A327
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:55:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0585F606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=APu6pruJ;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=FiXuGchy
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJugYA2827644
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:55:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	tfHrOCSYFZtXzYKdXoAzD1yb/ohB9hlTLVtFUdkulRw=; b=APu6pruJKuRJdjIk
	YeJmkmvT43n9u64h/gmBKxcfibSMm4ZFWJ8ET9J3EmS1HcIHgEL+CPHry1D7KyK+
	/Wq7SrlmJhbrrnwrHsH+yAYsHHnAUo//U6orKs8xkVro0/nbKK7qwrBAPyytH/Q1
	rwXx0O7nEH/PuCcZXastnf5jwxYlhLo8VuwB+TD6rtwzfx8oINGwQpPi7goZTR/p
	5588ryxci1NWoZz6D0C1/nQ/eAeJ0YkuCWySf6ogCe4brNMNucKafcmQ6ancKnwd
	O+tTfpt94MvFNq2G/C0DAYz8Qv7mne4Tx1xmICX+H3ikd7FCJigAfAu3G8CE2odU
	v1PkNw==
Received: from mail-dy1-f199.google.com (mail-dy1-f199.google.com [74.125.82.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4exx3m82-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:55:51 +0000 (GMT)
Received: by mail-dy1-f199.google.com with SMTP id 5a478bee46e88-383ec96a7deso4262704eec.1
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 12:55:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467351; x=1796072151; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=tfHrOCSYFZtXzYKdXoAzD1yb/ohB9hlTLVtFUdkulRw=;
        b=FiXuGchydlJAO9RDU/V+fOHAIHc61fvyDp36lEe5htwztFldq1hDKyr0XOp48QriA2
         R5se3nz5xTU9DcR1yRAHvB/QZhEtwez2wS6AsWV7crZBLTvN2NZ8UBDqugKLaPkfV29n
         tVKvo3dMKafCw0cOPtYoiYiYX1oE4CxXQoM4dT9KJLz3WF9dcRne7fRykTQ2zRmiyqGG
         u0jxMJarsli2pkc4i/MUOGEDuyv3YXJNfNROFZqDH8RU7tBmAlWFxHQw3QCc6/Mmajvl
         pTe2t/+DJTg8vOMkXdzQDsp8I2CJSC3A9kGCyd6LpZXECmAVNkZodxAOYUbPJcJK76pZ
         0NUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467351; x=1796072151;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=tfHrOCSYFZtXzYKdXoAzD1yb/ohB9hlTLVtFUdkulRw=;
        b=HpPnXngqoi86cWLeDDB5IrJwDJk0w/alzzNv+UPmFsby/1orSTcFzyqPw7Z0QJ13zD
         3bRV85UVhoOrpFKyaO9+3iZ+7V1CE/NskR4fPd3vfBmfHyK+MSXXMhQlN5aoYF/tCouo
         7IjxW17fogWRuWgIWI7hfOepPYmthdjmujs9fpmuCwbcThQF9rtWRsdI1z/Bmp/Prkvz
         chpulhSion1y5iO6vPecyXSIhXPGwvlmESjE5PbYHiZLnSOqQxrOl1vJ/dfH7v3Sz2OM
         AqnK85T7HjsPGA3HlzKq891ReFOKXFvVaelQfFn6237X/ZF+67W2Ia8oYs67kkvXZJRC
         UyNA==
X-Gm-Message-State: APuU4Z+YsY1vh1cF8FAKohFnkGgNC9VfkIDslA6kfcecSKnB+94iDb6/
	ntzZSM/hRWInp+8QGg7v9LUOymN23476KT6fCbhP2uq02mgya/bqoZWtWSvN7jeLI731ox/AZ4h
	fevSXe3VhFykcW0hHpFgS04p6CdJADEIE2CMXwPJUyrdRXn5ZJzQdqGsaiO36e/niTw==
X-Gm-Gg: AZFdTZc3xkGDBzLg09yaYyetvjJEBVeio8wEev8C5IExy499KKOtBM0Ifs5wVGeJpdt
	YLCsnRvS05Ojqln0Nk9nQ6lDO6NUFa/rvPXbe6FPX6+OCtJfu0PbRm8e1mNgo6/4ChbUHnM2AQ4
	qLneJfKhGSytJgjq8wo278Ptc3zb3VqkOdvhQ6pij3RWhfuzoKkkyb6BidnYZBIEuQf2vS8xrHD
	v+skzKBrXd662uo0vFzSA5YNVatA8oBGbAmP5NUtXB/Jv8cAkEV18r45QS6XAf8VupUM8pAn02Y
	t/1Ad0uyuQhds3YUxjbUzm9JkLj9ZP/+QzVkaCMVERzwuhVyDB8kEUMWo51ChDUHwrjCpZlS5Kr
	d16au4zBVHycQ/aDjzBtLSIgH6DYs7xHimXf5hhobpG5c5O8Hfe2hbMJCph6CZ5gcz6H2Bvf/WH
	7+winU4lbz
X-Received: by 2002:a05:693c:88d0:10b0:386:b894:f6dc with SMTP id 5a478bee46e88-386b894f8c8mr2555340eec.2.1795467350686;
        Mon, 23 Nov 2026 12:55:50 -0800 (PST)
X-Received: by 2002:a05:693c:88d0:10b0:386:b894:f6dc with SMTP id 5a478bee46e88-386b894f8c8mr2555309eec.2.1795467350116;
        Mon, 23 Nov 2026 12:55:50 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:49 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:47 +0530
Subject: [PATCH v5 07/12] arm64: dts: qcom: pm8350c: Enable BCL sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-7-747d5383d538@oss.qualcomm.com>
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
        Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1207;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=4gGZ4kBU9Ca0wJlDsLv1nEPxLz+5jyLqksSuJ+sGbGc=;
 b=RBVFLuG5HbWKUBG5b/9FUOJu/oqCo1UJjR508Mn6KfkxgGlMz8FiV3zsD0z5Rvk+e+mKhHNt+
 WlwErK0s24kCiiizyVJ3IlLxn8qznWUq+p/iymZiRvTfsMAQRtch8uZ
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Authority-Analysis: v=2.4 cv=FKKOVOos c=1 sm=1 tr=0 ts=6b04a857 cx=c_pps
 a=cFYjgdjTJScbgFmBucgdfQ==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=I246FzBBSJD3MQbeXTIA:9 a=QEXdDO2ut3YA:10
 a=scEy_gLbYbu1JhEsrz4S:22
X-Proofpoint-ORIG-GUID: GqK8VaYY-4-OhpOmpVG2nfaGhy1OWWit
X-Proofpoint-GUID: GqK8VaYY-4-OhpOmpVG2nfaGhy1OWWit
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfXyjEVTzZPsxia
 vCgyW7DJxnhbLaJKvd5P1+V/zcn+qzKIjBOBy4PcpI9ly3uL9unS6LGPoMV4kSfict++N3reqH0
 q9kUdeaY8zPVpz93zI1RK1fL7jmcaqo=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX3bnMJkTVlJ8g
 d5wTNqlEGMRZYrq6AB/Y2/fK0XzzC2n+2nEjNJL8J4K8p6LfcEVZ2OQwtXV1vzAdTZUmYyKuTtW
 2MRobwuc75xjXtz3IGqCyAKEQAbDG3ZVvBZNzPvgT3P+dOM1XTd7b8j+UAA0aYMvAsVGElkCKFT
 EuYq8AtaXAd2ZCNkAmVF9TEQsfIqmWc+5diElhePeYsPkr5YTEKd0CmW+nbTzPP9/ga5YQvl3Ov
 T2n0++YytdGM3+9Lvkz0CMyYaT4CNRQeHZ/OXQDty+Nrsflm99isUzWAz7Duy2NNnITM1X7jVG6
 kKWYtuUPgag2ZBC0AZ2C173cNihAr2ppyrJq23YAu+oWcvGsoNmNdoI98vJe2q+CeAYXpySUxXS
 JyF9jxn0owgO8L95UgaKD2MSG9IU2ZY27my8vqbU/lWJzSS+j3oXC2f2srkbWtauwSuvsSXq1P5
 iXhtP5EWt7Su2xGCR5g==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 clxscore=1015 spamscore=0 bulkscore=0 priorityscore=1501 malwarescore=0
 lowpriorityscore=0 impostorscore=0 phishscore=0 suspectscore=0 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2611040001 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pm8350c
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index 1a24e6439e36..d9e3a1069d78 100644
--- a/arch/arm64/boot/dts/qcom/pm8350c.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
@@ -20,6 +20,17 @@ pm8350c_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
 		};
 
+		sensor@4700 {
+			compatible = "qcom,pm8350c-bcl";
+			reg = <0x4700>;
+			interrupts = <0x2 0x47 0x0 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x47 0x1 IRQ_TYPE_EDGE_RISING>,
+				     <0x2 0x47 0x2 IRQ_TYPE_EDGE_RISING>;
+			interrupt-names = "max-min",
+					  "critical",
+					  "emergency";
+		};
+
 		pm8350c_gpios: gpio@8800 {
 			compatible = "qcom,pm8350c-gpio", "qcom,spmi-gpio";
 			reg = <0x8800>;

-- 
2.43.0

