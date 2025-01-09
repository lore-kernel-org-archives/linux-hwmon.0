Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 148ED14F98
	for <linux-hwmon@vger.kernel.org>; Thu,  9 Jan 2025 14:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736433445; cv=none; b=NiWRgjvh411a1jx7M+T16OQJxARy3iA7MdwP8YXnwUk+7ry+psKjC8WIeRVhOEKFouqernxoxAwoB/9WF6P/MUDNhwB3wpxtFmS+WUmCVPAh1RVF7PTprtzyx50YgpBSeTMO1qGJxpE/jWCnnr1LrXcApNry8msNLrfZd7wttAQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736433445; c=relaxed/simple;
	bh=O0WMCuKaeCo18+EWld3efByDAsM1DMJMAJMmSP+RRC0=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=r/xrEMDiRwh7LR6bxU5JSPW2jvdTfHH2wqJbkAfA/9hIyhdDpn7H08u/sDjAEOEX82Zrs/gNIiUs2IT9w6UHNQmhfZG7v+tYHi/QcHkFPZ9TZrLingl7p/wn/H6Xfef2rBQhEIiV0CwuvIse+9wzgCFazbogtau/llYInZZAbhE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CSnoYSZD; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CSnoYSZD"
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 509EEYUh007584
	for <linux-hwmon@vger.kernel.org>; Thu, 9 Jan 2025 14:37:23 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	OXTAvWWJZJ1SEqZQJIZWExX9jqYfwbakZA0U9QC2/mw=; b=CSnoYSZDSEOZCWd5
	II3gvxjbwNvbwYGvByxrZUhbA6eBuHETBhl/vB6Ft60IdcFsNZYHe19FSjJed1/D
	3ma1vfohE/eQ5leh49dFVIKvhwoMswTqrwvS12o2RLd1RGqFzSQW6YPJATVzaHgp
	WV/F3W5S5YNWgja51JAiUFsr3LNLwY1bKfLFUN5CK1VIPPoe9hyTHOyn+tHNFgo4
	vAoCCU3ubNvQCB684udiUmJ+Oh+4sotX6Kt9mNs9zuTtpe/mjU5GtD5dst1owZU6
	CUtDX0ga6M6kTysLP8pXUqGN1ZX21RIVy+xBB+jQUYJYtsStyOI+mP8l8c+S1fn+
	QWIAOw==
Received: from mail-qt1-f197.google.com (mail-qt1-f197.google.com [209.85.160.197])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 442g2081kb-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Thu, 09 Jan 2025 14:37:23 +0000 (GMT)
Received: by mail-qt1-f197.google.com with SMTP id d75a77b69052e-469059f07e2so747051cf.3
        for <linux-hwmon@vger.kernel.org>; Thu, 09 Jan 2025 06:37:22 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736433442; x=1737038242;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OXTAvWWJZJ1SEqZQJIZWExX9jqYfwbakZA0U9QC2/mw=;
        b=ePUekFA5aprqFFRKZbOXm7kJLTYDU1sfBWkiOpUWcaw9kNOgaeTpxMWkPFxt9+vwZb
         wZbaGegfk+as2/JCppixTD7+TPfhIle8HLIC+tRD/G6MYepVcE20mBeLNH7n7lHewZ5b
         re5uJWPNkXgkOFacKc2vw65zQE09xDrGFk0TSvx/H9csOixvmDxZXslDr+m/VKGepEgY
         mwPRe+2zq1F2kc/bh78NJyLOH9p0GBHoP6UJYCfcG9vsWR6+1J7nkSkqYuEN5Dz5rBqq
         KZw8zC1w9mGQ53Vc4pyz0x/LaoTETRVcn7wxqwuJ2XWi5+Qb5//bXxLvHlaV55MDAMJt
         U6cw==
X-Forwarded-Encrypted: i=1; AJvYcCXEeHJWFvKWSJsyu2Xt4vNPGD6Jl4B5+p26K0d4xw7KApsELsoh8Ok3TAepZ7cn0/v9BliswZ2lNjaONA==@vger.kernel.org
X-Gm-Message-State: AOJu0YxxtiCJkod3UyRWawbq0HrRv50X6HGQekh/YTp4CGEt35G1VO0F
	Fut2Jrtv5Xvc8x//8D/7oVdJ8IAQ8aoB3YoAcBPfrMihNJD+kHjOZjm6Jiyneb6bwPYWKG8t1YJ
	rfa3JYpmWEVO8AZcegqqdicPXLFw2FPfdPDjbNF1RdIVW//KrHOSoAWCMbp9zWg==
X-Gm-Gg: ASbGncs1gJEjXNH49rOODnwVeYgWYrqAkdEBRzxbGPRUIcqaeQiHvcHp31gk9f/AfrW
	hVT92X+0oF9A0ynjYeMw+IkHLcRzjJigixYkCUydAda8jlJNAfdVaSq+RQHtBmoFUUQAT+a/JLL
	FYT2ZrLonBmPyp5Eu4yrRM58FVyr6HnEIvb7X2G1VqOchiWvIs+EgmK8TFrlxDPaD3tY7MLikTP
	tsj2pAEE3y1BnMGuMLnIBugxau+rtk5hEdb/TyLSbpNC3HKob53CyGH1nqemwxFrewX16oMBns3
	VFIxgeH2H/Qdi2tezIs/PRhf2DwD9fO/XK4=
X-Received: by 2002:a05:622a:1210:b0:467:5eaf:7d22 with SMTP id d75a77b69052e-46c7107d773mr40847531cf.10.1736433441587;
        Thu, 09 Jan 2025 06:37:21 -0800 (PST)
X-Google-Smtp-Source: AGHT+IGUZYQUve7zJIeK0jKX/0nSErkVBt1y7Exysoxyuwprb0L/l48rtjRcFnYYdZ7KVHC5YjlsVg==
X-Received: by 2002:a05:622a:1210:b0:467:5eaf:7d22 with SMTP id d75a77b69052e-46c7107d773mr40847221cf.10.1736433441218;
        Thu, 09 Jan 2025 06:37:21 -0800 (PST)
Received: from [192.168.65.90] (078088045245.garwolin.vectranet.pl. [78.88.45.245])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-5d9903c3333sm688478a12.47.2025.01.09.06.37.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Jan 2025 06:37:20 -0800 (PST)
Message-ID: <e003376b-0560-4d9b-8909-937d70ca9f22@oss.qualcomm.com>
Date: Thu, 9 Jan 2025 15:37:17 +0100
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 5/5] arm64: dts: qcom: gaokun3: Add Embedded Controller
 node
To: Pengyu Luo <mitltlatltl@gmail.com>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>,
        Hans de Goede <hdegoede@redhat.com>,
        =?UTF-8?Q?Ilpo_J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>,
        Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
        Sebastian Reichel <sre@kernel.org>,
        Heikki Krogerus <heikki.krogerus@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, platform-driver-x86@vger.kernel.org,
        linux-pm@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-hwmon@vger.kernel.org,
        Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
References: <20250105174159.227831-1-mitltlatltl@gmail.com>
 <20250105174159.227831-6-mitltlatltl@gmail.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20250105174159.227831-6-mitltlatltl@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: tMPNKRB0j8ZZwyNsO5LYaBKfV19Ek5m8
X-Proofpoint-GUID: tMPNKRB0j8ZZwyNsO5LYaBKfV19Ek5m8
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1011
 lowpriorityscore=0 suspectscore=0 malwarescore=0 phishscore=0 adultscore=0
 impostorscore=0 bulkscore=0 spamscore=0 mlxlogscore=999 mlxscore=0
 priorityscore=1501 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2411120000 definitions=main-2501090117

On 5.01.2025 6:41 PM, Pengyu Luo wrote:
> The Embedded Controller in the Huawei Matebook E Go is accessible on &i2c15
> and provides battery and adapter status, port orientation status, as well
> as HPD event notifications for two USB Type-C port, etc.
> 
> Add the EC to the device tree and describe the relationship among
> the type-c ports, orientation switches and the QMP combo PHY.
> 
> Signed-off-by: Pengyu Luo <mitltlatltl@gmail.com>
> ---
>  .../boot/dts/qcom/sc8280xp-huawei-gaokun3.dts | 139 ++++++++++++++++++
>  1 file changed, 139 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> index 09b95f89e..ff5db8f63 100644
> --- a/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> +++ b/arch/arm64/boot/dts/qcom/sc8280xp-huawei-gaokun3.dts
> @@ -28,6 +28,7 @@ / {
>  
>  	aliases {
>  		i2c4 = &i2c4;
> +		i2c15 = &i2c15;
>  		serial1 = &uart2;
>  	};
>  
> @@ -216,6 +217,40 @@ map1 {
>  		};
>  	};
>  
> +	usb0-sbu-mux {
> +			compatible = "pericom,pi3usb102", "gpio-sbu-mux";

Sorry, there's still one too many tabs here and under /usb1-sbu-mux

The rest looks okay though!

Konrad


