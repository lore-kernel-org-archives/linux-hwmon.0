Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1E90151AFFF
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:10:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687442; cv=none; b=JdCb9weLn8Htt36PCF7Cv4n1neO5j90RfTsnPOksGMflOSVtQZTHGJCmP+0gXXC1hlibaw/Q6xn3d4mn6GiXP1qfwfq0bMlcIsEA08hkT4tqGioEvHjkqba5j0RJ+3dWFrLvMKLAgpdDV1v8umOpC8ySRebGC+BDEcxCMiL2ko8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687442; c=relaxed/simple;
	bh=c17Pf5rnH1vsI/iUXo1whZ8puXHwRPELdp7vpdeXB+A=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=WUrLMhiZUp7RamYEd0UOdWtzQcHOInBmKKfVtIm6d2subtBw4Yl6LfJn6NUSxQT0JHaLT35+WgEp54Lzh+MSxuoW7khm/XkJ45hv0jugCrL0FCvJDBndih7HPC3QxExE2wOKvqw5jjNaAXK3xtYpv5hEuvRozxtm4wbTHphYqYc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=JtxTDD3v; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=g7sS12Ph; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="JtxTDD3v";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="g7sS12Ph"
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqj0d4151457
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:10:40 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	FD6lC6MdS+vG8UDhCCvsK9pwZlCafc8102UVkEyzGXo=; b=JtxTDD3vOv5Eg3EZ
	74SW4nZDTmR5v3LuNgsquWaCmI1NIQdU4qegJMnTIYqCwuHKtDwNh6DLzM3zh+jj
	B0CDbneX5meq/rTsE7Z6iN3aEVcvIhs3F0amJq3q5WGMApysNQ12sOFYLWr5NwTS
	U2W/7nI5dm/pxffyQCViGRVR77JgSJuAP/fjNf8khRa8hBerry/yvlAOnxVTWZcm
	jmDQ1n/ZD87ElOn+f3hQ5gjIFrkO/df0Lc6iC2GRfDmcT2TNUr8gEty4BMzgkd3e
	0eoK7qILGkiAOpO8h3WdbKyTOuX25gVZw5xyBC6VF7Y3ov+2/w639qsYwRRgfKRS
	hmc9mA==
Received: from mail-qv1-f71.google.com (mail-qv1-f71.google.com [209.85.219.71])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4gyvwnc68f-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:10:40 +0000 (GMT)
Received: by mail-qv1-f71.google.com with SMTP id 6a1803df08f44-916cc44720aso33602676d6.3
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 06:10:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687439; x=1791292239; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FD6lC6MdS+vG8UDhCCvsK9pwZlCafc8102UVkEyzGXo=;
        b=g7sS12PhuVymvpvde+Jng9clBqsPyCuOFQ6Var0XlIqB1bOYbtIKGomCx4vAOkacFI
         +khjj9fCRMl9cuxFfhCqRzFas0jOBFmhzgCVx2rbBHT52GxQI6r108rMlZn8qu9NftpT
         Px7nzatbzlqpCv/itk5hITU5VXJszRp8rNAaG2435hUcZc6Wh2KE5jM8SR4xTvQmEvKg
         e8snkNFi2JpqfyMtrc8HwZXjie+zGzO6SB5ZAV6j/S3wHlErvirX2Zef3DW1j3SpVgsP
         QCvbtpW/kskSUHzhm14t4sL32vSnbSs1NbkkxqCgbHfamcA0ELDIRZiUP+HghnvI5Qe1
         ZZaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687439; x=1791292239;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FD6lC6MdS+vG8UDhCCvsK9pwZlCafc8102UVkEyzGXo=;
        b=acGVNcua0qvu27OWG2UwMpEUYTOgiWzbbXETJ9i/Xy3YKOp/5POQ9j/LOeR7joeF4T
         SJLkOI5+2wBe54/XIkP4cHbBXcGV1TBcrNyy2F0C6wT4JqoN2MuiDVlhtPInDurCC9vj
         H2y5MFI55DvaFgXzdhSGRIpPeCiLNElUMa6ZYudqxmwHmA+R9XCeqvpzzQC/0p3AM+15
         cI2PXGYDl37LVqx6gjf5wf+wLn9B8fYMF5eynAA0wxWl/Dnt5YHAo10FqD9bV8FWRMHw
         +FlbHfxUohO5qZ85RbKfW7JYNhlVr3G2oodeotJgTPElD+dh20UZV5QxSe6HWGJi6PVr
         5/vg==
X-Gm-Message-State: AFuF++nCxBqVoVSCU3N1OjHP7Vue1cNQrfaHD0D0MWdq2ZRAB8mWASoS
	W9bGtmY2uhdIKzF/C8PTWQKL0n1Qyhbb0q7+oFLufA5JKgxzGUyFBJ7jZKQseznMIBNjEe70kCi
	ljKztVG9cP1JI3FqouOIu7LFtxxWGEjcteQfcfFnTLhp3GyZeHPShh3rtFdXPqzgHAw==
X-Gm-Gg: AYBFou07Z82MRY4+NcJuTJMRd7V74kNmxO7IL2jchEw7d7IA683uqRrgGtSJix8zAqW
	g6eBlD4bDJ0ITGBu7xKHTj9pBYZSDLRgjq0e3ZOlvJqMxvjyn3a+NkDUUPiuFLhSZWDvMMYcDIt
	5FgLcIEoauqKPuMOglOzm1W3mDhB/FJUO6C58Dr4UpwRYVLpww17PlO5IU2BLJORUxswrWN6tvh
	NWzRRNKwYj7jPylN2qgOL34yPtvXRulrALg4z8uN0t4a7GGDz3Q1/ec78Qk8rw3ZNEjD6ZjE99Q
	C8m2LS9WVnT/7sAGQIzcnkHAsLGYAaR7zZSuzSefyMTddUrjLeXWkFQZZoeeqevnE5hdgiYrzdE
	Ys1hbnWlQbAyaMqSYpH6ps+xAIzjWV26TZhY=
X-Received: by 2002:ad4:5948:0:b0:912:517b:40e5 with SMTP id 6a1803df08f44-9142f92ab08mr245699186d6.44.1790687439103;
        Tue, 29 Sep 2026 06:10:39 -0700 (PDT)
X-Received: by 2002:ad4:5948:0:b0:912:517b:40e5 with SMTP id 6a1803df08f44-9142f92ab08mr245697826d6.44.1790687438088;
        Tue, 29 Sep 2026 06:10:38 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.10.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:10:35 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:39 +0530
Subject: [PATCH v3 07/12] arm64: dts: qcom: pm8350c: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-7-f5ca00889cf7@oss.qualcomm.com>
References: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
In-Reply-To: <20260929-qcom-bcl-hwmon-v3-0-f5ca00889cf7@oss.qualcomm.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>,
        Stephen Boyd <sboyd@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>,
        Abel Vesa <abelvesa@kernel.org>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        mfd@lists.linux.dev, Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1258;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=c17Pf5rnH1vsI/iUXo1whZ8puXHwRPELdp7vpdeXB+A=;
 b=XhwaVHJnLjC/IgFYYs+mIbCRbw9D2kBck4SXpR/pnx7zD7aUsUa8z6K0ZIgE4nKO1zU4iPrkb
 aoKNmoN1I1pAeBy4TRQFW1W3TlnYAaJmRwB+3n/j4KUP/o49+T2NKst
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-ORIG-GUID: 315iJy419ZQvvrEzaYBwhgH8oAjeBRs1
X-Authority-Analysis: v=2.4 cv=W42txhWk c=1 sm=1 tr=0 ts=6abbb8d0 cx=c_pps
 a=UgVkIMxJMSkC9lv97toC5g==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_K5XuSEh1TEqbUxoQ0s3:22
 a=EUspDBNiAAAA:8 a=I246FzBBSJD3MQbeXTIA:9 a=QEXdDO2ut3YA:10
 a=1HOtulTD9v-eNWfpl4qZ:22
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX2utKxWQmxNu1
 6ug5t8HRYioKlmhuQ8prjoZlPANJVm92lWzuoKYL0TTxmF1+l/k6pzmAy4DcUnoAcTh4Rxt4ht8
 k1Z5YtQz7hrse3cQ5+qdNg+zVGPmssteARIOrkRvCdQajfw4k27KXtdhFPhUXVfnVefLKhVxf0A
 rEIzwix4OBDAo0Q2Osp1g9AwumMs3v4p8CeghnognCz3K5CqgJ7dej13RMhE/mai4e8FfsCMbdm
 Hs0QxdJrru1vvWQw/1ZDbRs3h+5aVCUKAivH7BkkBlHB1xKd86f28cJQTXLD1ExMgrBoGLoBMah
 p5pvUD82qUBnxd/Z/goG1H7k6OXo3uxBLS5JhT72F2I3R8DRWvwDWUOYbB3DL+zLwIvJyKgnbA8
 9QgxuynLvK2DtP15O++V1LviHSmSVUEDpKz5qgZi+pIzlN5fm9z146r5R9MYx5RzawvQiWpdRn9
 MWtNwWpNgbMtoHrcC9g==
X-Proofpoint-GUID: 315iJy419ZQvvrEzaYBwhgH8oAjeBRs1
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX/5EqlzbPTP9t
 2zMm7j/VWFXNeEiPBsfar8i1sMm/exyIK/fCbF3lWSGkb1e01Kk0o88hG7AqSvm/BXYCJNgFDoW
 cEuVPzaCzpkr8HoWKUwv+K03484YdPg=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 bulkscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 impostorscore=0 malwarescore=0 clxscore=1015 spamscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2609040000 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for pm8350c
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8350c.dtsi | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8350c.dtsi b/arch/arm64/boot/dts/qcom/pm8350c.dtsi
index 1a24e6439e36..52b5fc1ef9a3 100644
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
@@ -41,6 +52,7 @@ pm8350c_pwm: pwm {
 			#pwm-cells = <2>;
 			status = "disabled";
 		};
+
 	};
 };
 

-- 
2.43.0

