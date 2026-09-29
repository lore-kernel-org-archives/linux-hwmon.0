Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45F6C52BE59
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:11:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790687477; cv=none; b=Z2uB8hpN9/WCtCvRPf/lFmuZJ5KZqeZrd1pgHitdKd6q5Ra3XrJg/btBuEYc9juuGBs5huOfHuZDUAyy4OivxIaNr+g+pSUxuSbabew4Gnh6hp2voV5V/lmX7VjaJa1ezlM9EgJHJeHz7WdCah5AniR+gR3HpqI+TynNca2zGZA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790687477; c=relaxed/simple;
	bh=O5w6xCV6zqlu9zFfHn+r5awG/He1W71Xy4zJcI3Epi8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=e7B7RaLuYagPlCd8+b2oDBLRaUZwqvc8V2L0MpSEFuN5TiuCN/pL1+KzqsMwnnbIF4HJec4ugoxvN/ozJfXQ+JMwqh4w+HN1MYXuGVXZb9Sl+saCnkCSmf8PMquVr5v6mMKzUIU0Pvm0W5WGkVjHgWJBYn9Nxes/HpjOUIrnTFY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=HgmE2TMJ; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=LhAvqa02; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="HgmE2TMJ";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="LhAvqa02"
Received: from pps.filterd (m0279873.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 68TCqr20351030
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:11:14 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	UHYcoiHXDQCxhXTk6wbevGF/oKGAv0Pa8gGj/VFAQqA=; b=HgmE2TMJoVBA3FXq
	VK/2OVF4lA2Oq88usOkoAsIxRMDj7uIKfxGrg86AdxE/+Yd3wXd5HZDt0hEOCnZF
	6Lb1kuWqwexH5VpjoDiz10LK/JMExNU+UuPfZSHnoqZfd50bC8EjCKqgh4Pnblvx
	f5f/5lNZRZNmtgVqiV5/dAf+z9qwVfWhnTHEi42slxGVOoGXNJadOMqHeGJLpYfx
	mPV3iAeZa+mqD301/rZcD4ZYORNRH7pMW2BdQQ1XXtnp3dpa/DBIIpy7T+UP/z8g
	INcxQDgElZGFx8MEo0YZVfBP47GU+Fn+yxpAAqzRvMVi93KLan9nx/OwqJJXytB/
	dgjfGw==
Received: from mail-qv1-f70.google.com (mail-qv1-f70.google.com [209.85.219.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4h01vkjxud-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 13:11:14 +0000 (GMT)
Received: by mail-qv1-f70.google.com with SMTP id 6a1803df08f44-9123c523d0cso47828606d6.0
        for <linux-hwmon@vger.kernel.org>; Tue, 29 Sep 2026 06:11:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1790687473; x=1791292273; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=UHYcoiHXDQCxhXTk6wbevGF/oKGAv0Pa8gGj/VFAQqA=;
        b=LhAvqa02OoaI1ao6Sr+RSkxvhMedQWJ9eRqpdnRaRGvolZhEqJ0zt0a1Rhvv6ycXZn
         Vz12CuZv1IXNMpnM6hW2x2xY3ft9W4aTXjC8KUu2+ZnkgySBL4/wh4C32HdnZeELVTP9
         T8CJ5BZOlhdEhAHKKQLV7Q/5WQ962aV65AIEP311H0OBiTj81OgaVOiCSrkRAan6GG1Y
         FQfUuhUC+m5wVu8sWTd8ihdfmuBS6VjecxCq7eeeNS3Z4uLaNITOCigOH5sxINFGo3u2
         Qw0Xldo4PAlPy8+qDYL8kvc2P5mjKdZzImXnO7Ps/ZK85PCFs1Yok4K+piXSM1gs7kvm
         GZ2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790687473; x=1791292273;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=UHYcoiHXDQCxhXTk6wbevGF/oKGAv0Pa8gGj/VFAQqA=;
        b=b+J+H91kieekY3g86Tf5fSjIFYKZy7k0Ea3qKrMUGUr43EQBLexIr8BHgT+t9WTqF3
         8HPYgLc2YN8Dztp0ss6f0PYQP/DdJclp/Ak3UiyaRYAFFDT2Ln5pv/4zRCJynLJQEPKi
         yYxLdcqO1ew0HjAEbwWf4kX6QeAW5UKVcHLRZvG3GVyG6S37TvbZlx2pQIIe3M0LNfkv
         KCtRlkcBPqycYC4qmu4264Vh/HmAFf2a3qdJwuz7K5rEWWRNfcHBhw6iL8Zx7BlJt3jz
         UaeZrmq3VwDOHJgqzME55QzhuOd5gsST956AcxxuxniIOXjfJjJ8UEs/UdmLiXRrHiSx
         7h2g==
X-Gm-Message-State: AFuF++kOBHg/NK47S9ZHp3wcG2MG9uymOSfSZkaTqgAn+Mp0NZAWMTJD
	PhEvgt6d1/QTcD4Y6XCfx9Gn9CKE3oQ9Z2cyP7ldJ6Fb13sEyIp18bf3ZsCscD0qK1hXimSlt3v
	ejRKXVbMUefw5usZCPfsmi0zXRROoW+674XySyYLPneaKVBRDqGZte+0St6SZUwYfCQ==
X-Gm-Gg: AYBFou1bwUzdc/zQJlP1L232koNgxCqdsCTQGaVNAfJ254mAWjArskTd3NoD6jQU9ig
	olZH+nQvNnFpmr9vsubQBclRCJRbowYVgfdwRx2W7tm3zizFd7bEv+nKAbBc523GpmtC4Jqxv0w
	O6Im2xH4d3I/yc4Ip7xnLy6kS8uZfP/nvpMilCAAJxkOqHAuriuAmC+OrsH9itg9F/cjTnO4RLU
	SAYGBe4lwZBnXu5KmIa3dQi3eCdZVFtXo0bPfKQb3H+DZFqtbyCqjf8tt0o6xmyK+zXj1lGs0dD
	TZGvm/AZRP5n41Z4h/Gjc2fCoPiPyXZwxhKF2PjWd/4eo3WuUU6bEgQbJ6qc5DRBuQbSKDghA8w
	n/UU22mB0qylW88eR5sjd09B4Dc1xb9tdnjo=
X-Received: by 2002:a05:6214:2dc6:b0:917:9338:6f16 with SMTP id 6a1803df08f44-917933871f9mr11896186d6.3.1790687473209;
        Tue, 29 Sep 2026 06:11:13 -0700 (PDT)
X-Received: by 2002:a05:6214:2dc6:b0:917:9338:6f16 with SMTP id 6a1803df08f44-917933871f9mr11895406d6.3.1790687472624;
        Tue, 29 Sep 2026 06:11:12 -0700 (PDT)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-9178d013e8bsm10225326d6.0.2026.09.29.06.11.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 29 Sep 2026 06:11:12 -0700 (PDT)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 29 Sep 2026 18:39:44 +0530
Subject: [PATCH v3 12/12] arm64: dts: qcom: smb2370: Enable BCL sensor node
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-qcom-bcl-hwmon-v3-12-f5ca00889cf7@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1790687377; l=1145;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=O5w6xCV6zqlu9zFfHn+r5awG/He1W71Xy4zJcI3Epi8=;
 b=D5j/rezBI+6woOgH4Aa1XUrZtzWWPHx+aHttGaTValqJSzXgPUB2KFniFLy6aQPzTvUM+nEG3
 IntmD3xUVE0DVf6LBfXZVHe6DoHKkbNWzrcAM0Oc3Aasll7HiO69l07
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX5QxAMcKknyQw
 DXw5MCEANc2+7ZdV7VvJbXyxxcNvOvZ/5PFWyKuQ556DIAJoD8EHFlyxSeB7IQ5ggbUwf4aResQ
 TOWyis9nN9RTmyyFmHPEMNUN9EAui/7CZ4tp6D4RZLC7qvCXPq+w5GieY7UPuib6A+iVehLUnw+
 AYvxEwBV9VBGuFKv85a/ifIYfJBNHGj7wYNdlUaowhqNHRdPCrr7cKu7zV2UTgbMm77iqeFs54y
 ILQHiUfINe6iNMIsyaN2MHUnDAH43x82upziv0TzeJsuu1W66Ggf6OT03zTwkNPTe5c8fE9i3fE
 2g/q0pAya+qokV+OEWzG6oCbStCEGnPKI//bkvwt7Pnk1QrQJx9Zk+6Lw9GeAn0r/NdM+AIfjmR
 /bzGPVs4yYAdsqRXkAMxO3w7o0Ri8gVu+miSpa2lIAMMoFiPbzEoSnnENJvfQNeWAURTurk+m66
 0fDp5Faye/S/l/ga5yg==
X-Proofpoint-GUID: -68-Xfk80W2yOzBk3KfiONzEg4mNo6C6
X-Authority-Analysis: v=2.4 cv=VcVir1p9 c=1 sm=1 tr=0 ts=6abbb8f2 cx=c_pps
 a=oc9J++0uMp73DTRD5QyR2A==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=VdqzKS8jKosA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=rJkE3RaqiGZ5pbrm-msn:22
 a=EUspDBNiAAAA:8 a=Mdvtvp0LKpy3kcB40AAA:9 a=QEXdDO2ut3YA:10
 a=iYH6xdkBrDN1Jqds4HTS:22
X-Proofpoint-ORIG-GUID: -68-Xfk80W2yOzBk3KfiONzEg4mNo6C6
X-Proofpoint-Spam-Info: AW1haW4tMjYwOTI5MDA1MiBTYWx0ZWRfX+gDD1JDg1W7f
 niFvRc223mFwrDYdfUDKZpXzUFDTZeApvspkahgY9NJAXQoRGtvEmdoZuB3YL1jd4Th5biZ6fur
 abzPosFirqOdZaUa1xfYMUM6VFAQwaA=
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-09-29_04,2026-09-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 bulkscore=0 clxscore=1015 suspectscore=0
 lowpriorityscore=0 spamscore=0 phishscore=0 malwarescore=0 adultscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2609040000
 definitions=main-2609290052

Add Battery Current Limiting (BCL) hardware monitor node for smb2370
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

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

