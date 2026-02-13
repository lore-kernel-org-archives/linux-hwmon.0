Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9362B3563C5
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 11:44:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770983069; cv=none; b=dr0BKfW8P9GNhYBn8d8gvNHuIFxKWQhCS1HDVZrSKL2JtohojSTJa40TtZ6HibNmj8JwbVSG5arXSm9qKMcgUso/JLBbOt1nRV8IM2NfcWIVF1QAQnedxrlFoYcyGfhAFMBrgNRAOkpYdv3CrmkzZQU0cJLxrJdhGMDf2cBK/54=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770983069; c=relaxed/simple;
	bh=+LcElemC9nrpmLe2wlI1S3kt++mTKmvfF+Lzk8NSmJs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Koi6hxraFxi9yphZEPQvu13zbDXpMF6oO1kNSOBuvoZTPEEDf54xXg9+eETU3M8dBacZenIdcBSAyGcLL9QjnusrbzP6VpwoO47oL4xkAzOlFJilvFmflacSKmkinddBDABPV7dKrW0WwlUBwBAS8UeaGq2XtgJtzRSL3jrFrEI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=UsA/6lJk; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=AHgOxmNS; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="UsA/6lJk";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="AHgOxmNS"
Received: from pps.filterd (m0279868.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 61D7NDWa2629555
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 11:44:27 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	1vSrmcdAUNqsFYceKcue3EIkbdR/J2M9wFozyoLawK4=; b=UsA/6lJkJTcz2qii
	GXXtK0ekEnwCstsPCyrTES9LqYiXoRqqNtv7X59djSC6fG03KlDE3Umk9N/5Gjn9
	IdTta8bFwRRyjQA5k5wy4lSAj++FdhuJqtfp/t0CZpFNA5szdcfBvWiJJ3RDfkc0
	7qLDm7g2w3+fwUc5Sv1wuiR4HTDHEsRyhednJ/kaa51/1fkSPcsr7dtyv0xT2kRj
	H7s8QxlGxj6H5lftwqj/dpQSDeSQ96MaWRF9XbPivE05h13qojWwaqsAolqjcVy1
	cJ8kUSBJdJ8IAzs7APnGn2cn6moXdoscqHLL26Ty/Dy2wgvMjuwKB1DyoGrU28NJ
	CmBXsQ==
Received: from mail-pl1-f198.google.com (mail-pl1-f198.google.com [209.85.214.198])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4c9ygurwtv-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 11:44:27 +0000 (GMT)
Received: by mail-pl1-f198.google.com with SMTP id d9443c01a7336-2ab4de9580dso27053825ad.3
        for <linux-hwmon@vger.kernel.org>; Fri, 13 Feb 2026 03:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1770983067; x=1771587867; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=1vSrmcdAUNqsFYceKcue3EIkbdR/J2M9wFozyoLawK4=;
        b=AHgOxmNSbHRBCfP5a+VThY3vUc52eWNf/NDnHqr0laU3GQ/W0JPHQUbshZihy0R1b9
         94aR7QC4zTHp47gpZ70FVVubqiaBirAct1MKvo2tiTSpHbE7yL7VhRU3QrxNYj0zEw1o
         WCJfL3xVVDBYaujitSU96sB+RQVd+X44sqkO168RwnCdaukiMfGwmUisLe1omADEUHbr
         frpNb3NRXB2G5xtdNjiPBMlb6H3NqcAA73RwlXdgHS8+6jVFYnS/3JVBvKiGT121dP6P
         hINXyby7AQD7EjzQZgWVgBqbiy25uEwnH4Np32HM2b4EcHsPpDAPiVpXhNgbzI4bj95C
         Bb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1770983067; x=1771587867;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1vSrmcdAUNqsFYceKcue3EIkbdR/J2M9wFozyoLawK4=;
        b=IecOKub8d/9vEvy3sKR2QGobVmINayoBBCq6PWP6Se+bn2wIZbXu+XlLqAjqF6QHj7
         A6H7JMLYRXc/iOpfDuBXuhtKY2rmrQ6jm+uUTlhUFzRhFvT4OdJK2R5Sd4O04noCPJJ9
         k26k8X3Oa2dfy+E88vzDG0DU1DiVIIWl+5vhqUN8Q9FXb+oJmR+5WyE9s4v3q7hNWMT+
         uWkMWpXRS9CeWUh53OvovqQUT4IBN9cx7gdQqyJBnROY4XoyDur/0fJ9tI9CCOHZYHqJ
         HwWOGiiZnHgLhOdW6FfNNKD67deoRznLKpKt364mA9geklCmHxdSoMeexUdTvsm+35dO
         aFjw==
X-Forwarded-Encrypted: i=1; AJvYcCVqGGJPCaqmuawWn6O8i/ci6w+ZwtNDZv17iJbOz3+bi2PY2aiU+AFGffCx+/O+5E8Bu6m+EQMkS9wNuA==@vger.kernel.org
X-Gm-Message-State: AOJu0YyTywKWOWlinXZCpyNIrRMlzoEXYTTdd3HHnC/GVLsITjGS7mCC
	B+rs5F3h85dfdTyZcor6ofSy7sl4UwNIpyDE2+xAXfqPayaZlYEQ6GvZSLJmOMY7TTvxgS86+Q1
	EXAmioEMW2gmjtKFeQMUqLfsbqKdRHSBVWYfKS9YHlW/GDkpWi6wguLFQeES66CtB1A==
X-Gm-Gg: AZuq6aKvhwW7BGL/SyaWgaQ8fAHJW1LjWlphatWmQRrvC1rccL0RvnYeiS6+SOi72Uv
	BHdcmzHGZAFLNAEVd8W91+r5l+Ral+uzthd06Ze8wRktA/QKzW9qnc1qeZrrxSIU8UYTNd3Gcpy
	JkD/rlb/SMB7EN3JuqFHloVLhDQRekqboBp90ppHEx5fmeZGddCjRTExgqjTzXNW0Vx/PYaeAFu
	xhCB9oyi9GeboOhtbSp7HfvnW/i6ht1zzFxQZp3xI0WMgxaNJiMdHMAABeT2H6yayBKCDWH74ec
	7tS1P7qDd3N5zlBNKnlPKowgXLHZRvhK/eLBGqKiI9FPDCWT9+KRuTq3bycrlaENP3lZinrV/2L
	jrIzwZmw2kEmAkVK7HP16y2WPG1IiwVoFqKdMJJ5CJf3zR7/SK8UyS3fTtQ==
X-Received: by 2002:a17:902:f611:b0:2aa:e7f3:fb05 with SMTP id d9443c01a7336-2ab5064a0d6mr17365555ad.59.1770983066659;
        Fri, 13 Feb 2026 03:44:26 -0800 (PST)
X-Received: by 2002:a17:902:f611:b0:2aa:e7f3:fb05 with SMTP id d9443c01a7336-2ab5064a0d6mr17365185ad.59.1770983066087;
        Fri, 13 Feb 2026 03:44:26 -0800 (PST)
Received: from [10.217.198.130] ([202.46.22.19])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ab29964e5bsm117648405ad.48.2026.02.13.03.44.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 13 Feb 2026 03:44:25 -0800 (PST)
Message-ID: <d5de6feb-d3e8-423a-bc68-7de90e767c61@oss.qualcomm.com>
Date: Fri, 13 Feb 2026 17:14:20 +0530
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/4] arm64: dts: qcom: pm7250b: Enable Qualcomm BCL device
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>, amit.kucheria@oss.qualcomm.com,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Gaurav Kohli <gaurav.kohli@oss.qualcomm.com>,
        linux-hwmon@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20260206-qcom-bcl-hwmon-v1-0-7b426f0b77a1@oss.qualcomm.com>
 <20260206-qcom-bcl-hwmon-v1-3-7b426f0b77a1@oss.qualcomm.com>
 <20260206-tidy-aquamarine-cheetah-2badc0@quoll>
Content-Language: en-US
From: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
In-Reply-To: <20260206-tidy-aquamarine-cheetah-2badc0@quoll>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Proofpoint-GUID: ewhmw2DHuC_1cGYWBh_F9vbg6kZc1hKG
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwMjEzMDA5MCBTYWx0ZWRfX1HPKmmToo4PV
 ol3BtFCkjycQasE1w6Svruv7C2ZtH0x/sUJccLQ0721oyUvEm3sBL77Ah6AcjaekHWt5qp8A7ww
 G69awkGs1ojQRWht8iUW3VAT8kht+CuyM+9Bihg6aM243A5i+kyiCyCue0pNW1luZamHd29gwlh
 eOxUP2w5V0lvvZQeaB8Dt+kETyQsm2q0nH5oyKJ4poFSuifUjXh4IA6OKjCiGPAuJ5C7vWTc2Zl
 geNP5AmYZh0mDCqej2IxAerAOqk2nh2QzUEtbQtoJmye+nWxp9sdhXh/5eJGMcjKs+sZ5fr9tVv
 83oZrhLqOAOox+vNWy6eAKU+aIrkS4DZP/nXcX9PiYmyzvdv79EZvwETAptmMKQASb4ONkUf6uH
 1Az3DBPyad8ProBO4XI6ORgZ1Hx5A/JstgLMLFbyEuA5b6wi2wIt8/7rmWxxZvloa3iJgRLkFA/
 /mdVsrUJ5GIBELQ7Puw==
X-Authority-Analysis: v=2.4 cv=If+KmGqa c=1 sm=1 tr=0 ts=698f0e9b cx=c_pps
 a=MTSHoo12Qbhz2p7MsH1ifg==:117 a=fChuTYTh2wq5r3m49p7fHw==:17
 a=IkcTkHD0fZMA:10 a=HzLeVaNsDn8A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=Mpw57Om8IfrbqaoTuvik:22 a=GgsMoib0sEa3-_RKJdDe:22
 a=UXIAUNObAAAA:8 a=EUspDBNiAAAA:8 a=Xc56VXtM65tYru8N8fYA:9 a=3ZKOabzyN94A:10
 a=QEXdDO2ut3YA:10 a=GvdueXVYPmCkWapjIL-Q:22 a=a1s67YnXd6TbAZZNj1wK:22
X-Proofpoint-ORIG-GUID: ewhmw2DHuC_1cGYWBh_F9vbg6kZc1hKG
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.51,FMLib:17.12.100.49
 definitions=2026-02-13_02,2026-02-12_03,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 adultscore=0 bulkscore=0 clxscore=1015 suspectscore=0
 impostorscore=0 phishscore=0 malwarescore=0 spamscore=0 lowpriorityscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2601150000 definitions=main-2602130090

Hi Krzysztof,

On 2/6/2026 1:43 PM, Krzysztof Kozlowski wrote:
> On Fri, Feb 06, 2026 at 02:44:07AM +0530, Manaf Meethalavalappu Pallikunhi wrote:
>> Enable Qualcomm BCL hardware devicetree binding configuration
>> for pm7250b.
>>
>> Signed-off-by: Manaf Meethalavalappu Pallikunhi <manaf.pallikunhi@oss.qualcomm.com>
>> ---
>>   arch/arm64/boot/dts/qcom/pm7250b.dtsi | 10 ++++++++++
>>   1 file changed, 10 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/qcom/pm7250b.dtsi b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>> index 0761e6b5fd8d..69ad76831cde 100644
>> --- a/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>> +++ b/arch/arm64/boot/dts/qcom/pm7250b.dtsi
>> @@ -202,6 +202,16 @@ pm7250b_gpios: gpio@c000 {
>>   			interrupt-controller;
>>   			#interrupt-cells = <2>;
>>   		};
>> +
>> +		bcl@1d00 {
> Node names should be generic. See also an explanation and list of
> examples (not exhaustive) in DT specification:
> https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
> If you cannot find a name matching your device, please check in kernel
> sources for similar cases or you can grow the spec (via pull request to
> DT spec repo).
Ack, I will use node as "sensor" as we are enabling hwmon sensors here.
>
> Plus, I doubt this was ever tested. Considering lack of internal review
> I do not think this should be posted.
It is tested on qcs6490-rb3gen2 for pm7250b BCL and pm8350c bcl
>
> Best regards,
> Krzysztof
>
