Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 49A1537DE90
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Jun 2026 11:51:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781524272; cv=none; b=TLA7TDdVfM4OfYqL2ttyPdeDnbKUV/rC061g/scuaNoSDOtuNPZtAKhQtX8/LEuCQBvCk+o69dFXYaIDT5sFdLzRXxdW9XL5L0u5L3o3sRsbBdbpxmK98ZeYCufVczLE9p37R5qvgd64+pD9Kps1KQVtJiNM/g+q/NlwluQePIM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781524272; c=relaxed/simple;
	bh=nw0aLHpnQA82rpkW00XD2SysA11uS6WrfAfwEDYy+hs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=XzxaqITGRCbhHlk6rsRRvE+fquG+R0CFMMezfye/8bt3tRewIc1zESqsABJTbw3qUJO6G1jRkn9HzNk5juxlGO+VB2nB9D34ZS6Qi19PdLotPu9H+vC8UYb85m9YXRhiNhHxqHxSd2V5j4DXsiW9+nuLQtESq3MrN0VL9ZWYHkg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=hi31+O1Q; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=J2p/Mdci; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="hi31+O1Q";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="J2p/Mdci"
Received: from pps.filterd (m0279869.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 65FBoj9N464447
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Jun 2026 11:51:10 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	F9+0CHJoUk41lmBjkCxpmQ8baT4Z++KJbPbqneNDOMk=; b=hi31+O1Q1fJWWGvd
	WBb/zC47cDiZJa0rABSRBcEP335MOSjT9TJ90FAGGnKXBZKIXXJmEcUZY+AjK/jw
	oKaEEUVJfvIiHbGQQAirLD9+aTuXfwfW4rX5rHJ83W/SWDAA5I8Ts+NHLE5ElePc
	373Df6aA9tcLSnbMALzSwoCl194thq7kbmae2LEqDAP/FlPPs7X+DAyaRS4knUsP
	+l24M9/sfhAI4GW3j499korQi189eUPdWGnRieJFdOCgzUDSnwsB6WnyYPyrK4JS
	TF4L5Cx85s8HezwU8chb26kmWoLwjKwh2SIC7VJf6YuGHyNVKBYmJEWIpqzAfRYC
	euz95Q==
Received: from mail-qt1-f200.google.com (mail-qt1-f200.google.com [209.85.160.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4etgvhg046-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 15 Jun 2026 11:51:10 +0000 (GMT)
Received: by mail-qt1-f200.google.com with SMTP id d75a77b69052e-517647fbff1so9572631cf.2
        for <linux-hwmon@vger.kernel.org>; Mon, 15 Jun 2026 04:51:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1781524269; x=1782129069; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=F9+0CHJoUk41lmBjkCxpmQ8baT4Z++KJbPbqneNDOMk=;
        b=J2p/MdciV6ngazU9MfEhw/1bzNDbo9Jh9T3XGWgEn+J3dChfkaPlD8Sg+9m9zhtNcT
         R01vtEjCyQ0InfWnHNd8Qi5AKYGI/4eKxAL6I5tcBrq/fHofR8urRrsiXClFVljUkbYn
         xvmg9AQF52Xcw6EdrHKGJ/mO8ciFX85W/r8O6YEvQD8fr8A2zRJt1ryx2jdcLkoomJXy
         1nzLdNzx23ycoBnM8bzuixmsITiGwj41/UJSAFSPHm28XSiQ6cAChYRvp//i6dEwKYa5
         pKvSiI5SSx1c/wiB754l1ewu2UWCqtjpOKYPx7MOasfis0bZY4iVnFzSVf8dhWqzD5Oo
         ft7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781524269; x=1782129069;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=F9+0CHJoUk41lmBjkCxpmQ8baT4Z++KJbPbqneNDOMk=;
        b=URDFXkwYrhn2QgoOEoSjyZgbxQ5WwJU66aXGuqjJa9zR3G9eKF3OleuwJMT59UvXBG
         hpnFXZhsiAgI2DIQ3tpWfrf5CHQ/muVblPMnU/I1YNGfBXkdDNRT+xJYLx/uwZOIFBVI
         NEbzCPn/Z2jrPNwnEFkUTf4K+oXTL7GDzBnhTOEGbHAjQI0AR20D/Oxoq+1XPvf91XH7
         Q/Jfl7JXgHlewF9dMWMLHYe7XhMVg3H813Ke2WS4w7pR8J4tODQvvMVyScyEa4jY5y/P
         TmxMNuF3Wnrf6+MWv8egOrRF+putdKLEqwBbs9voSPOBv19ERQfpDMpCJjsyCpn7GOwf
         AbTw==
X-Forwarded-Encrypted: i=1; AFNElJ8Az6RiKOVm1ku0dKolGa7uzadrAJiFbqnFsX0sRCMtg57ihyZY6tW8v4CLjrTAr/ErDgZfUaYHZCPRYA==@vger.kernel.org
X-Gm-Message-State: AOJu0YwipRrzRi7TJhIWNCgIfVRmhhDnOodk2xVNTY3dRxXJmCsdpx1X
	HuqqVvEmRVZHMQbSLGic1jaCbMQUp7mz/FhVFtXACZUgCCe+AcmouKFWYqh4j2W+0bOzS5bG8K0
	mo/MG9B1njHpCenRVdqeo3PsMS+hao+Eg+CeKqBk0dpcZezAb9aQ8Hwt0QbkjhNHKHsFV9frs6Q
	==
X-Gm-Gg: Acq92OEr2vltYh93CICngN7sSNnjlC3ZchHVadh0tpIxzxo5tAyCVVALT1dFxPwT+7P
	bxsei+/PpQx4lj2BaZoch/Aq67XRcf9W95R62N9/AWJDVIGi2LFC3sCbMmvRj6nJswfaQwV+Q7P
	5w2A0aH7wbfMsTQoWnB3Pl1yJfaix6COrxlFsYocS0GhB/eWeFsXNhvEehNlOpXaU+g3IjY0e8P
	/K8ug6my38s6hOMVRjbL3A27/Rj3c0ngESH35TUhYXDybIgxW3CnM6LLvnvN3gNHnqNBuvwwM1k
	kTwKf7Q4WOs8QEwSLFiVS5ZlLkZoZBnLkwbNJ59wFudoHJhZJZoKPnusGrBpB+ZMDkU7CDfMfzO
	tozKTLiUvCWDmMSOT/yhmQDXKgJr0JJ55zrHMkSZySEHVLg==
X-Received: by 2002:ac8:598e:0:b0:517:62f4:e3d1 with SMTP id d75a77b69052e-517fde8985amr128656041cf.2.1781524269504;
        Mon, 15 Jun 2026 04:51:09 -0700 (PDT)
X-Received: by 2002:ac8:598e:0:b0:517:62f4:e3d1 with SMTP id d75a77b69052e-517fde8985amr128655771cf.2.1781524269081;
        Mon, 15 Jun 2026 04:51:09 -0700 (PDT)
Received: from [192.168.120.170] ([178.235.128.140])
        by smtp.gmail.com with ESMTPSA id 4fb4d7f45d1cf-693794b36d7sm3525875a12.31.2026.06.15.04.51.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jun 2026 04:51:07 -0700 (PDT)
Message-ID: <0a8f987a-3792-4bd1-a07f-04a37bd59fc8@oss.qualcomm.com>
Date: Mon, 15 Jun 2026 13:51:04 +0200
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 3/3] arm64: dts: qcom: monaco-arduino-monza: add ina232
 power sensor
To: Loic Poulain <loic.poulain@oss.qualcomm.com>,
        Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Conor Dooley
 <conor+dt@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konradybcio@kernel.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, linux-hwmon@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org
References: <20260611-monza-ina232-v2-0-e4375ce652d0@oss.qualcomm.com>
 <20260611-monza-ina232-v2-3-e4375ce652d0@oss.qualcomm.com>
Content-Language: en-US
From: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
In-Reply-To: <20260611-monza-ina232-v2-3-e4375ce652d0@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Info: AW1haW4tMjYwNjE1MDEyNSBTYWx0ZWRfX9EeZYqtcbOtU
 QX8ARlkmpjNAbJAuo4s+Lgu2nw6ucVTcqtbIo8H+78gdfdoVV6zpLSa3UPa/alyKsYERJYRucO7
 AoHa061Q5FZmHvL8hz2ZI8G1Zh/ggAs=
X-Authority-Analysis: v=2.4 cv=Zqnd7d7G c=1 sm=1 tr=0 ts=6a2fe72e cx=c_pps
 a=JbAStetqSzwMeJznSMzCyw==:117 a=PRfkaYvzSr8QmIIGAkY2Sg==:17
 a=IkcTkHD0fZMA:10 a=FelO9ux0wxsA:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=_glEPmIy2e8OvE2BGh3C:22
 a=EUspDBNiAAAA:8 a=vtxEUVkT7waMBiOsAPUA:9 a=QEXdDO2ut3YA:10
 a=uxP6HrT_eTzRwkO_Te1X:22
X-Proofpoint-GUID: 859E4wVjdqsbkjLU4tBljN1GwdaXutux
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNjE1MDEyNSBTYWx0ZWRfX4an6G8nBBnsb
 pZndvj5XBvoR7EOPkEQwPkmqglcfyM0AFnZt3JiCcuG9qTdeF5qgJZQ/UU0///BTIGCOa2AhXda
 Bqrd49IhZxuBOClQQf5yKcRXrnxzx9hthQAV1jfpiRPexRV2yRA0Cj6X4C8mWUKouvny3Up5xwR
 Z9WeKrWiukEeeGhzrixMp4dCfE8GK82bUkM+5Hz8wLI5cj6qql3CCs7OWULZH1ZKjmMm1VuWGRi
 fuN5fBYP3i0TetwAV36Dzp7ANrsk8dO7zwhNGRoKUzKSYyykVjkZ8+QGKtKkWWiUNsTdlr8Fzd4
 dxtdUOxIHudVin2nUdBDAsq6K/WgBmigsdG/C+2ealwCfNwzDf3FrI98quDaVncuxfmGpj+CNtr
 Qd6+0EB86mFcSqLIet1XHK7xhbS5EQ2ZVPt4JXJVax7dQb/y4zpLX4A56iJfgyJiePK/7N8vmiN
 WZvYoQyxx3cBDcfvXSg==
X-Proofpoint-ORIG-GUID: 859E4wVjdqsbkjLU4tBljN1GwdaXutux
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.125,FMLib:17.12.100.49
 definitions=2026-06-15_03,2026-06-15_01,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 phishscore=0 spamscore=0 priorityscore=1501 suspectscore=0 lowpriorityscore=0
 adultscore=0 malwarescore=0 clxscore=1015 impostorscore=0 bulkscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2606040000 definitions=main-2606150125

On 6/11/26 4:05 PM, Loic Poulain wrote:
> The Arduino Monza board has a TI INA232 current/power monitor connected
> on I2C12 at address 0x40. It is used to measure the board supply current
> through a 2 milliohms shunt resistor.
> 
> Signed-off-by: Loic Poulain <loic.poulain@oss.qualcomm.com>
> ---

Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>

Konrad
