Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCA5D356A0A
	for <linux-hwmon@vger.kernel.org>; Fri,  6 Feb 2026 09:11:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770369073; cv=none; b=Skgpz7cCsnNS2/Nxqdmw762WCmi3x8vuBhxLzoC52CW1jeYkubTQwZqWqg+X2WmvvOYqZSAioNmbwHJTwJlmkY3L7vQA5zNF1nfyNfMEEz36Hw5DQLc4F1naWCNVk+L0kh39Sxz+Fi8pttGarNNYnTFyjxHQhvE//mMFNyCzAx0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770369073; c=relaxed/simple;
	bh=TIVw9CNpR7eKwcCcEB9OVbsac8JnxA9iryTKgfDv9a4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=YTx8SMhiF+gl2AFlU+wikS/q5atgevWT4reH52LLuUEdRdBa1pkIW+YSNxUZwuXxbyJs0OPLYO6IFnA01u3ZXeyj1vJMMU7TX8RVTX1J3jk/1YpzCkvhuJ0y3ef7io/J9B4MOrrSAMN+iLwy1WLpaMmaBdIRO80jY+cGzw30IBE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=EksFQ9S2; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=I7RIXDIg; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="EksFQ9S2";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="I7RIXDIg"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 6167XsRC2482253
	for <linux-hwmon@vger.kernel.org>; Fri, 6 Feb 2026 09:11:12 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jvowj2AQnypvzkVEw1N9fZa3NmLiIaFVVSqGmxoEdTE=; b=EksFQ9S2658cCfaw
	L9i2AMXNFeGKeTEiGC8SkeuR5P8Dky2lWSiVj25Ni4b52DN9g1H3S/C2JUtvyiXX
	HzNC1KCLygWIVrKyxUdynpi1bIGkeUtE0omtaXjTXPurFlEhjGCTbksObszvp+Kt
	J/8z+Z6bMPHLVMLDXF4JAaakTvYxbJsz2oZiMkLtdS5vSgDOw/akDR6IG2dE7Sya
	g4zPmxnS0jARjOJw39SQ70RxRsWOTKtOt6COH3HIQKJksuGodzFs6QfXy4l4lSaD
	9XyTFvOuHwiyx3ldJE0eYSdqtcWDeU8ORBwTywQ3PXy8XozF4f+oeI20eiWXyVIH
	8ChUSw==
Received: from mail-qk1-f197.google.com (mail-qk1-f197.google.com [209.85.222.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c5c170av1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Fri, 06 Feb 2026 09:11:12 +0000 (GMT)
Received: by mail-qk1-f197.google.com with SMTP id af79cd13be357-8c52de12a65so40650285a.2
        for <linux-hwmon@vger.kernel.org>; Fri, 06 Feb 2026 01:11:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770369071; x=1770973871; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=jvowj2AQnypvzkVEw1N9fZa3NmLiIaFVVSqGmxoEdTE=;
        b=I7RIXDIgjBd05vvqzguvtll1IwegUmuAG/6Xqqukg+1trYtGcjLuvlHihUDpmM7llH
         1H3IUK6PVHTbEeHFwboSDbKl782ME3vFfWlM39hk4ySyIbHcJIJuJWS5HULMwEKz7sC+
         PmQcect2REoPiG8oeRAyWtqhM50OzFiqAAyG76/d7CRC7+BtTVi1lKhlG7S11E48tpYu
         y2f8osCDGkapeqln1UoFZT1NJMhDdygv/CXk3ZgMBcyBBYaRzMAx9ABUq0emq9i8Wlmg
         Y8ZKn+Lwe6CvRv47yA+TAQQxS46lX6iLwqYd0Yk5wUgsM8rTuXtsCyXapSEIrwGstKp7
         yvWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770369071; x=1770973871;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=jvowj2AQnypvzkVEw1N9fZa3NmLiIaFVVSqGmxoEdTE=;
        b=rKQTh4/tXpphHSdit+48FTkbwYZhTOARxmlS/2y0tVN7FOKWMrGMYZjEx17wqz1lF8
         +o/p4+4+vy0+hlzyGRmwx5+WCwmjOMCgpwo44CNo6LtcWw9F7bDmZPHLEPvpHiAk+ROp
         aK7O22zF443Ct7fYIx/YGIxhqtzRTNT9PZ2Yyz3oYgtJY54jTyZOl3T8OhxWzyeXj9ZM
         Rdp7GROy34llPbGWoZXXrimiR/rA2DFpnGUWceKgEFGR4Tzy3K+KGacPrNPGy/0xSBYJ
         tuDx3uAxLoeQlRs29GbVbaytG4YIz1SZft21NZbqKBECrPPXBSQaMrFZUFX2EZkfNsq6
         eEvw==
X-Gm-Message-State: AOJu0YxkE1sGT8PGfPAQNfuWGWQowdJ9Yvkitmc7owUby6HcBNryJDe8
	SxrNm1nFIfsmWsuw5mwNjG78WuvtForu7R5FZaOKfxIRC+VQmSiXrbmYx0F0nVZ08giUmMVym5s
	Sv0gD11JH1Bx57NVyapkhDJdItheWa9Dl8yJagp05mxhJZ8fX7SvJdkJfz8yrlS1/hQ==
X-Gm-Gg: AZuq6aI2d3D1lUpV2sqOos+2prMnLG6DtvARmICxsaMlgoIPxwCMcWPN5IGPSux4BRk
	f9j6L3K0r1ZN/N+FchyOzmOtr30+saLkrPuTgqiSSJuxGCdxdR4kGxj368jQFgZB4cFsvA8ub+B
	SHe9//C6RmyjTJzrjZ37x7jQwcDVh/PDjcpl31CkOB9HDmi8Kv0w2M/1o17vbieLKdAXlQOoDZy
	y0x62VifFR7A/m2vFvyBKoJH71To7uBR6voe9LRuFcjhayo+bh2i1llwLl3+xoYzaUgLOh+Wlpo
	RY8IPTHc/gl4/5pYc8On2qqmSGMRW8KfHeZA6L4gm9pAlrO9JyrmzQggVmjKo5I6GAY8Z/yV3kq
	BBjLa1BZ6jZjZiRFxLZQayZ7o4D0KSAJTGLcMgi7tXwy0iPtRkYZDE5Wx+2YNNcfw3+w=
X-Received: by 2002:a05:620a:14c:b0:8c0:c999:df5a with SMTP id af79cd13be357-8caf067dda9mr143078385a.6.1770369070984;
        Fri, 06 Feb 2026 01:11:10 -0800 (PST)
X-Received: by 2002:a05:620a:14c:b0:8c0:c999:df5a with SMTP id af79cd13be357-8caf067dda9mr143076085a.6.1770369070535;
        Fri, 06 Feb 2026 01:11:10 -0800 (PST)
Received: from [192.168.119.254] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8eda74a515sm65081666b.2.2026.02.06.01.11.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 06 Feb 2026 01:11:09 -0800 (PST)
Message-ID: <98ad13d8-82d0-4def-917d-b99cf455c5f1@oss.qualcomm.com>
Date: Fri, 6 Feb 2026 10:11:07 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: pm7250b: Enable Qualcomm BCL device
To: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>
Cc: linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-3-7b426f0b77a1@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260206-qcom-bcl-hwmon-v1-3-7b426f0b77a1@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: 1wQAeuBJHpAzOCPM1m941gNw7dSlaiKy
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjA2MDA2MCBTYWx0ZWRfXzE59oloZKtq5
 GFinFSUhfQP1GynGHu2bduCglctqn2JT/GIu8RlYVfnd2HkSpEgpKsHaI5m0L3fFroPWHvuSwmn
 TiXPbPLGjfK/f5gwmHkZFMl/jDOqngrDvtV4jRgQx+aEI3ywxoG9mBmnLm2oy591ug5pgKtTRcQ
 B0MMRoqzzGzVOrG/4qSwZr49eULVQa7LF08NXtvkUNQe0cQ3APQfJovvVY7TfkBMzmeEDpopRzU
 +V9QNBobHIlwYuIc/UYtzmKC8n726zkCRisVS5Bd/JnIuvthwx8NnnkPjcnSr25Gp2SG6ibUexi
 JozdCXImqgNJZGkuspvUi8GxWv/4ygpOppGsBfOmKfa9Tf/Ss0FBneeVLpn4EuRamowhnksF0jy
 vbH+WS8yblsqmzxh0XJ2jAkUFYSxVX5v1kEvldFbKikmm8LJ8+TfJ5lDbHRuCd7TV6nb+LsN1LK
 UyahjljKYS7SoCRbV8w==
X-Proofpoint-ORIG-GUID: 1wQAeuBJHpAzOCPM1m941gNw7dSlaiKy
X-Authority-Analysis: v=2.4 cv=E7TAZKdl c=1 sm=1 tr=0 ts=6985b030 cx=c_pps
 a=50t2pK5VMbmlHzFWWp8p/g==:117 a=FpWmc02/iXfjRdCD7H54yg==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=EUspDBNiAAAA:8 a=XTV_dTSmcC2b72LbCk0A:9 a=QEXdDO2ut3YA:10
 a=IoWCM6iH3mJn3m4BftBB:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-06_02,2026-02-05_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 adultscore=0 spamscore=0 clxscore=1011 bulkscore=0
 phishscore=0 priorityscore=1501 suspectscore=0 impostorscore=0
 lowpriorityscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2601150000
 definitions=main-2602060060

On 2/5/26 10:14 PM, Manaf Meethalavalappu Pallikunhi wrote:
> Enable Qualcomm BCL hardware devicetree binding configuration
> for pm7250b.
> 
> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
> ---
>  arch/arm64/boot/dts/qcom/pm7250b.dtsi | 10 ++++++++++
>  1 file changed, 10 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> index 0761e6b5fd8d..69ad76831cde 100644
> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
> @@ -202,6 +202,16 @@ pm7250b_gpios: gpio@c000 {
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
>  		};
> +
> +		bcl@1d00 {
> +			compatible = "qcom,pm7250b-bcl", "qcom,bcl-v1";
> +			reg = <0x1d00>;
> +			interrupts = <PM7250B_SID 0x1d 0x0 IRQ_TYPE_EDGE_RISING>,
> +				     <PM7250B_SID 0x1d 0x1 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "bcl-max-min",
> +					  "bcl-critical";

We should strip the "bcl-" prefix, since these interrupts happen
to be under the bcl device

> +			overcurrent-thresholds-milliamp = <5500 6000>;

Is that something that we expect to change between boards, or is
that an electrical characteristic of the PM7250B?

Konrad
