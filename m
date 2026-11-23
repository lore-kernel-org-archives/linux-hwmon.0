Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=205.220.168.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795467359;
	b=AHk6NrQudyaBqd6+2XSDZC2apcJ/gf3oPGgCOK7n6zWBZd+rn1GVWvqMlD8JaUhTjcl4
	 ExOUvJ+4Zz2dNGrl0G+kG8/40obq1ZjLVUA1t0eYnqoLwWwjX1BdNTH0w0Me419VaWdZr
	 ZVin+y6uXwyqhSyUyH6dz57G7d7zxYGY8ZgLPjAd+gtP7p4McDTqkRiGWq6xhJiMyzJys
	 2Zh523Q060mx28lVbw3irgMx+bXwQgfoNN4dk6IKcg9xf/y66YYEnQdVK7Uu6mD7qRc+N
	 DQBkXat1ytYCZcVBdtO6VL3t9veGU3M3nwQawDTKMwXY3Eni9Rhe136VXAKt+G1Jdfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795467359;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Received:
	 DKIM-Signature:X-Google-DKIM-Signature:X-Gm-Message-State:X-Gm-Gg:
	 X-Received:X-Received:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer:X-Developer-Signature:X-Developer-Key:
	 X-Proofpoint-Spam-Info:X-Proofpoint-Spam-Details-Enc:
	 X-Proofpoint-ORIG-GUID:X-Authority-Analysis:X-Proofpoint-GUID:
	 X-Proofpoint-Virus-Version:X-Proofpoint-Spam-Details;
	bh=NqNN6aSmLPAgx9McaQ+7qO+NtMT48sNYHU+owVsJ05k=;
	b=L4x6rF0aEkjRXXiwIYs2Im8gMdAF3g0ZNhzMNe+ygnkCr9FSsoAnOpchscezkKFPmC1b
	 o0iz+px5N3XdDskmWjwpSvK2cmu1PaJYhQsagiBeoTFVdBpuOEkYBpMPAt9Ubxbv1vY8P
	 3l+WF4yVKmAsZqOhQ2XPcemRIPP1IP0v5ws4aT9A9OLLKsv2ak6Bmeqzndq3SB/Frrk6K
	 WaQgk30X4ZfrQ5R0UZuzyx/odLwH0kBViGUjGwq8GTmqSs5ahDAtgYFYc/CwYUQUrATc7
	 ZbMxj+XhpueSO2DVWD0rl8L0e0HW0a3ZKp2D92cl7HHzFmior9gmUBVQnzsa7nvT6gw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=oss.qualcomm.com;
	spf=pass smtp.mailfrom=oss.qualcomm.com;
	dkim=pass header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fx1YEHeP;
	dkim=pass header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yutb2C6u;
	arc=none smtp.remote-ip=205.220.168.131
Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92A76606A326
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:55:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92A76606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=Fx1YEHeP;
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=Yutb2C6u
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6ANJuOhO2349990
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:55:58 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NqNN6aSmLPAgx9McaQ+7qO+NtMT48sNYHU+owVsJ05k=; b=Fx1YEHePkEIEbEYW
	DhVG9OabOyItaKaqLpwpyI4QA/LS+r/OrKMZgfdc4s/lr6s6EwLJPK60p7kkpryd
	WANzPuSP9hqabKBLljK4ssJXXQHaybm1EiEo9QMshW2DzsKe4qZ7PnBSAa2OQkgO
	yCr0PLdvqy5HR89EB8+Ox8UG2MLfsnwyFNhfSy83Iil6GjH3R6ZZQm5CzRiwOFiO
	kYv8Kt9E675aXNprt1l81qcCAeBy/YBJMqeBdpXU2r065eyDJdu70OTXJVESlWl9
	l0CKzKthG9HGgGxzuhx53iJSBiiQQcMQDBDq4hPNVhIbmdj9W+AhhcnyJp20RKJY
	pST2xg==
Received: from mail-dy1-f198.google.com (mail-dy1-f198.google.com [74.125.82.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4j4g9a3cx4-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 20:55:58 +0000 (GMT)
Received: by mail-dy1-f198.google.com with SMTP id 5a478bee46e88-33713e5e6daso6712824eec.0
        for <linux-hwmon@vger.kernel.org>; Mon, 23 Nov 2026 12:55:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1795467357; x=1796072157; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=NqNN6aSmLPAgx9McaQ+7qO+NtMT48sNYHU+owVsJ05k=;
        b=Yutb2C6u/HiwDijPC4cRR10cCND9KDbXjo3cw4EX+zZ/3UOkA9XoYevI37tgEs/UHQ
         XkNjpscfp9tnJFvfk8ufboPr6kwm5nS4DFI7v2Je6zO9mEQHO1/WxAMetxYtwlapLU5I
         tFFdgRdm5LrEo68T+9HXsULk8mNnK+qMowhR/CF47QKtOMauT5rcBTipEE/Y0ck5N1ls
         a+dOaGUoudUBUrLxWQ9uB2xqZ/Biw808AY1fFrp0YPeqpY44bdvu+bgi0wzfAkq6NAK+
         +GaQK4RM5bR70StC6ENd+bRm7reWSWU2P9dDWd1N1WTkueymZn4tm+GMJRJac37EZ1ua
         PvFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795467357; x=1796072157;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=NqNN6aSmLPAgx9McaQ+7qO+NtMT48sNYHU+owVsJ05k=;
        b=XFmdjE3yuV1yv5KNqPPZb3jK4dJ8lztSscQ+ktCyViZdvrJ518mCk/eGd+Qjv95VsM
         NCU87NkijHE9TvhqBQx6eZdhkbnAjydWXIKQCJYKAArasj0DFtT/uL/vjbByH1Vo8dsy
         CH/7hEuNeXBbVDgeT4tOI9CW59cPAXQFiaSlAcvDZbkQiWl1Q2klctXjyxemFNiIUG2V
         O/oJsmLoxKmDeKzqQs6OxYndMl/D+pvVvzxuPXaohwRbOFc0TvuBKfAjFosBOid2w7lu
         wpfse8B3LvzvwVdL39TkzuiyFx4Mq2Y14ltPyORf0e5rFNAtQw+YzfpkuK3bJ4Ajrlaj
         Bx+w==
X-Gm-Message-State: APuU4Z8SWkZ/vfKMkoL5vSdH4LJPtHffcCzGCw5LQITO2BpbxYIH1u03
	/iZADOFIZpQhVvr2DTKlrR7rtofuvae4PoT9vnJ63oI01agqOSX1NUF3qXSvsKwQdoyXXrNRMeS
	L76rLzSfOuA/BAaGUvV2Pg6Z3xhuENCzH/6bokoScS1wewG0iK40KbP4ijOxQeDvLbw==
X-Gm-Gg: AZFdTZc3VSqVUVmE3epGhXAkuCAJJzLXgm5RNiSPL7M+TxJvSeaaP+It6N+G617peV9
	WtjwpHBDjMea/jw0DkGyqIdF3LuiYjq/jLdTJE+XvKfP7eA1fIJoTbaJhdM7yTpvSMF3Flp2xWA
	HXi2I3Il+NKM7o6gTkEW3aFDWFCGZ20oyK7WVWETt4xhd88W4e8Rm3/e5gGgltMXwj5Wlszhmr7
	g5wJOjFswcOzieLA+WqAuLAzigdHmAjk8xNwtQTGcx3cV8xOKOAbU+NnW9nLxxNXkKSqgeJixCi
	3sxcAc/iIf4NUG1DSyAcVQkSlDNIq8iVfTRs3ghq1GPz+sCdy0JvOkXDEVL23QNsUuRt9f5O5WA
	cMarXRFKru02Dc7FdKYdpQuvVo4DgOBOWVIfxcU5y5Jrri3wVHcLe8W/wghLh9YjnPZe+Qj/R5p
	zTV5ssGoai
X-Received: by 2002:a05:7301:152f:b0:376:203e:7d7b with SMTP id 5a478bee46e88-3856c6b35b5mr14805724eec.2.1795467357351;
        Mon, 23 Nov 2026 12:55:57 -0800 (PST)
X-Received: by 2002:a05:7301:152f:b0:376:203e:7d7b with SMTP id 5a478bee46e88-3856c6b35b5mr14805680eec.2.1795467356775;
        Mon, 23 Nov 2026 12:55:56 -0800 (PST)
Received: from hu-manafm-hyd.qualcomm.com ([202.46.23.25])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-38567cafec4sm44209077eec.26.2026.11.23.12.55.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 12:55:56 -0800 (PST)
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
Date: Tue, 24 Nov 2026 02:24:48 +0530
Subject: [PATCH v5 08/12] arm64: dts: qcom: pm8550: Enable BCL sensor node
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
Message-Id: <20261124-qcom-bcl-hwmon-v5-8-747d5383d538@oss.qualcomm.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1795467299; l=1250;
 i=manaf.pallikunhi@oss.qualcomm.com; s=20260206; h=from:subject:message-id;
 bh=p+DrbvohnZm70RkY44JTffgUjgoL+i7eEMdPZYxTZjA=;
 b=/V7wXZSXhkt0EpHZdk8xNOAG5ylHqm/2+sfQJBwLcAfPocvgsEIMFDithwf9rfQD/kDQHODQL
 b5oQJaQ2G7RCTZwrGScrPunlmiaQhmnr8+GWNz7DdAJeMCtTTR8zh8h
X-Developer-Key: i=manaf.pallikunhi@oss.qualcomm.com; a=ed25519;
 pk=oZ3x9jh+FDyPwxHmCbyzEMQHMzKqrH6hUbbL7dEBe2g=
X-Proofpoint-Spam-Info: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX4mE6vCls5bsJ
 T2B8n4xMqEWiZ6UlXaA75DlPqNR6L8sapTUz+tsotjj9fDIg/NoNyM3Zx1CC0ieE6HvgXFuKjCi
 0/vEx5dSwRG7vhkNuqNNHa5ve4DHrwM=
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMTIzMDA4MyBTYWx0ZWRfX8YACR7h9+R4p
 LqaxLuHqTLcZDeEiGUvaHgiZht2tJ4wkCl+sSAxJKlnaxUrYBI/J96aV+M+BCjhd8n/qRUSLkK3
 iKee4OviPBQAryHyCgkwu8/0nNhLcYSUTqN4kw41mZMxTrLyXgOhEZr42f9Lm2fizZYLZdv+1Mm
 mAYp4M6K8RAU6lU8yWDlmiAWegxBfUU8L6SjYDEvhBCAzP+1HSYOyldiPqdE9ZCRnlbqmCSKjYV
 y+VuDqWLby/k6c7pfh9NKx0za4kFGAtjS9kuktEJMgdWUUJuGNH3G3VAraPZk3xQ1a121pry4/P
 D1GcRtpN0yesiIU9WeoeLIebPAXozq/D5Se4Ty17gqWE2HSzvJAd2nty4PFFWLG7BLfJyI2ll1P
 YVQWLwhAkX3EXUYPnbJxKOFPiyifhd5NUihK0vxPRmDaax4dVW1NasJvWhUj9RpkOQ56DUDdCCF
 wkUP6SYItIo4rxo9cNA==
X-Proofpoint-ORIG-GUID: _KuJFa6Gy6MoaRXoUdVTPSOuc2t1iZtz
X-Authority-Analysis: v=2.4 cv=cYJHPXDM c=1 sm=1 tr=0 ts=6b04a85e cx=c_pps
 a=wEP8DlPgTf/vqF+yE6f9lg==:117 a=ZePRamnt/+rB5gQjfz0u9A==:17
 a=IkcTkHD0fZMA:10 a=zJRp6_cAMcgA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=YMgV9FUhrdKAYTUUvYB2:22
 a=EUspDBNiAAAA:8 a=eLLqEcyxF3qFMBJkHZQA:9 a=QEXdDO2ut3YA:10
 a=bBxd6f-gb0O0v-kibOvt:22
X-Proofpoint-GUID: _KuJFa6Gy6MoaRXoUdVTPSOuc2t1iZtz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-11-23_05,2026-11-23_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 clxscore=1015 malwarescore=0 spamscore=0 bulkscore=0
 priorityscore=1501 adultscore=0 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2611040001
 definitions=main-2611230083

Add Battery Current Limiting (BCL) hardware monitor node for pm8550
PMIC. The BCL monitors battery voltage and current, providing hardware
interrupts when configurable thresholds are violated.

Reviewed-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
---
 arch/arm64/boot/dts/qcom/pm8550.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/pm8550.dtsi b/arch/arm64/boot/dts/qcom/pm8550.dtsi
index 896bcacb6490..c4a575af7bb6 100644
--- a/arch/arm64/boot/dts/qcom/pm8550.dtsi
+++ b/arch/arm64/boot/dts/qcom/pm8550.dtsi
@@ -45,6 +45,17 @@ pm8550_temp_alarm: temp-alarm@a00 {
 			#thermal-sensor-cells = <0>;
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

-- 
2.43.0

