Received: from mx0a-0031df01.pphosted.com (mx0a-0031df01.pphosted.com [205.220.168.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1387938D6AD
	for <linux-hwmon@vger.kernel.org>; Mon,  6 Jul 2026 19:27:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.168.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783366074; cv=none; b=L9BMIxekbFYMUPhgZpYQt8NGw86GScIgywG2CMzursWoGTXGBxfTPpH6KiD7CMmVohbcE+BFswEM35YwoT58WuZXYO93IufTTJZ9EaxM4hCbfY0gfvrOvqGpIUOlk/KIr8z+LSrrv3SeW5wiwxUsAhncs+InYgIpYs80B6FDKv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783366074; c=relaxed/simple;
	bh=KwFroddWHFnfpsjjmJcfTGs4Cx+LN3mYnxqBFPiVtrQ=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=r/vHTdF2Hy57U8I/oH20Is19nYsLnq4Mj6lWwAZnJJPKH9QzNDDdgRrRhhtePuV8YTIOthvsf6mnpmHD9bBknBbOBfzr93IIX8RZnqjlntqvAUldYmSk2kCOze5YAStSo8d6hZsct4uGD5+icGLyCTgCnaWgW0KIHWUnx1wSuWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=CDm8+83/; dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b=W/YDRlHs; arc=none smtp.client-ip=205.220.168.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="CDm8+83/";
	dkim=pass (2048-bit key) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.b="W/YDRlHs"
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 666FF3js981369
	for <linux-hwmon@vger.kernel.org>; Mon, 6 Jul 2026 19:27:51 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=RrsznZZTAsFf9rgod+XonTC0
	tHI1lPnoz4qCTniAIfI=; b=CDm8+83/EBqBtCafuPl/E6BEeEPNBQLMnsA/r6xI
	78dVO3E7UqXuvyxlS9d9nP3NTmwb7XUxU5+f4CAWqan5wMp53XwU3501AyuwhKyq
	S9H3Jg+t8jRRK4J4FRwVypsBUbBMuNxKezwLzPuNt0nqZxt7A+SEe4sw9ca6mj7z
	wIxVAagYUUJqsnIryN0jd/gH0dG5ZgdcKTVI+3jUJrYT02tzobEMwr3wjo/kBgAV
	ACCH1jIfiTLjLMvi/U2a0te2Vd7qlABTlTbZPiITWYDQdYcbnsVL74r8rjWJEleA
	nqTrrmPh+vRwYNl56N1qD6f7cDjSZZGGFQ4d7+5ZMJk5Lw==
Received: from mail-vk1-f200.google.com (mail-vk1-f200.google.com [209.85.221.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4f89kgtqh1-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 19:27:51 +0000 (GMT)
Received: by mail-vk1-f200.google.com with SMTP id 71dfb90a1353d-5bdc8169a8dso3857191e0c.2
        for <linux-hwmon@vger.kernel.org>; Mon, 06 Jul 2026 12:27:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1783366070; x=1783970870; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=RrsznZZTAsFf9rgod+XonTC0tHI1lPnoz4qCTniAIfI=;
        b=W/YDRlHsD9v7uPY4oCMs9qpaPUQeVyUY1AsGR5XDRUjNfABcbYknH7/5Gbsw0/fBvY
         u9WH1WVqa0koh+wlEFR4d4Isfx8twBTLgXYvUJ+r01X4ygUXaR76dqYeruxL/vPALmpj
         77JUFQjNZvRBA84KTyrRkHJ/zgqWp37yC2k4JiDSSobdTPxjuV104F1zcCKn+aZXgWV0
         +Pqy4qOIpeiqq9j0XA91hCg57lzrZhMhI1wXxOhjxOwk/bt0afastcab6su6VHHYj777
         zrcM+UzmHoz7O9fXhlWcvNmLsnEpyjYka6KX/Fq47sRgCsN4kYyyRAhHni9rudJlc46v
         Blbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783366070; x=1783970870;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=RrsznZZTAsFf9rgod+XonTC0tHI1lPnoz4qCTniAIfI=;
        b=lGfekL+gkfT7ZRu81sITHPv7Ai0MbhzKR1RBp4x3N5dwFPLH7Ig4hRVdxqtuiW0TZ7
         RkmGyOWQx4bjOYWgMTRvRmpbURdFJ6q8i4h1S+vCiKm7bTDRYir8Y8Gs56ag7vcW1MeK
         UEKeg33hx17wgDGpLX5mj9lSXTE7iyUbWavfI5c3Umx78UNFLVx5aUoWb0gW0UZg9SjH
         zwDkhTWlCF5qkOu0CjKbFLA+Vg6tKpXuGwXJatobnOYIC0N79utzP60WWZ8rOcu9GbFk
         K6u1wCntnVAxp62q7I7XTQP4SDAdmcgeHuK5/NX4om1Qx7h/n0CAHykeK4ljB6VY4GBZ
         L8uQ==
X-Forwarded-Encrypted: i=1; AHgh+Ro1qI5+C9m+WSLZY0UuPHB8E8pjrbPLWoSCts+f1xeR9/0kdvvKoCTtPb6PJJaaHm+OaOI1TtPD/tgXtw==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyq01Z6hu7r6rM+dD9lkFcsO2Nf3B7qW95/RvS3Cxy/BIe1nrqS
	SSMexPLzp+exeSsRQbxA5XLEuANFIY2Ltowb4/wAa3fyDSM0r27nrGkPKoxeYC98WqPH3To9GJS
	p643vEHQVrtHSmkz5YmJpDGhtP0VxrN2KdfRGDmexYeL23C3yqKHgsDXDqPuGCy2s0Q==
X-Gm-Gg: AfdE7cn1Po81m9X10zc/y6YJwEQd5MtB0svhaUmB3EUSmS6DVX9xsnY6dl36tlWdykI
	sGjo1R0QEpYI9eoSbOthsLxXEylCDM0z6n6Pu7IA2fcEEKbxk3vaB6iwRl6pW6R1QflT5fEfsUW
	P8AMfcWYg3j/jXfTMzK3kzsaef1yEyFcfhvI/J0pSlmRJ8X55NgCw0nP4KF/S9rqTU/85ekatkF
	L8Q03dDZl8LS0247ISxLP6rWS0+snB4PpLDeDqba8kKNb0hFVTiDa6bJaOZjqHeRJmS7vaFYrlA
	+8zAilkxUJJ7fSuPQZkrB95tGXT+qR8Ny0w1WDn7P3HpE+ds2VEXdCeDXnFZberdOS8aAgk7A5P
	idC7LSVlyIreIxmEk3IaXJwKd7hOKM1YrZ57wOUv+hXb5sSTbRRxhFDiLVi+pYKV0/E1JtvIXjL
	9ffHNu6oklgc5PpbFc9GBcnmlw
X-Received: by 2002:a05:6122:1d04:b0:5bd:73b5:6d2b with SMTP id 71dfb90a1353d-5be9078494cmr1239876e0c.8.1783366070398;
        Mon, 06 Jul 2026 12:27:50 -0700 (PDT)
X-Received: by 2002:a05:6122:1d04:b0:5bd:73b5:6d2b with SMTP id 71dfb90a1353d-5be9078494cmr1239866e0c.8.1783366069969;
        Mon, 06 Jul 2026 12:27:49 -0700 (PDT)
Received: from umbar.lan (2001-14ba-a073-af00-264b-feff-fe8b-be8a.rev.dnainternet.fi. [2001:14ba:a073:af00:264b:feff:fe8b:be8a])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5aed13bfdfdsm3144066e87.59.2026.07.06.12.27.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 12:27:47 -0700 (PDT)
Date: Mon, 6 Jul 2026 22:27:45 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: sre@kernel.org, hansg@kernel.org, ilpo.jarvinen@linux.intel.com,
        linux@roeck-us.net, andersson@kernel.org, konradybcio@kernel.org,
        robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        bryan.odonoghue@linaro.org, platform-driver-x86@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        neil.armstrong@linaro.org, gaurav.kohli@oss.qualcomm.com,
        manaf.pallikunhi@oss.qualcomm.com, priyansh.jain@oss.qualcomm.com
Subject: Re: [PATCH v5 3/3] arm64: dts: qcom: x1e78100-t14s: Add thermal
 zones for keyboard skin and charging sensors
Message-ID: <x6gbkwgyr4z7ueuu5twvnz66ie2nusql7fmp22moet7l3ltlit@6lpm2vbnrqhd>
References: <20260706184648.35613-1-daniel.lezcano@oss.qualcomm.com>
 <20260706184648.35613-4-daniel.lezcano@oss.qualcomm.com>
Precedence: bulk
X-Mailing-List: linux-hwmon@vger.kernel.org
List-Id: <linux-hwmon.vger.kernel.org>
List-Subscribe: <mailto:linux-hwmon+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-hwmon+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260706184648.35613-4-daniel.lezcano@oss.qualcomm.com>
X-Proofpoint-GUID: nLLH1rOJXnv50cdxNF3Q8UAJn4TieNrJ
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYwNzA2MDE5NyBTYWx0ZWRfXyz4Jpx0Of2en
 Rql3ix91fuGXi1ebDiupHlbI2UKL+k7gkX2sMaFqhHOh+bh0XsZidBuweXew+ypGD8m21nus8AU
 vaIPNWGlLA/W3ltFWYaIBo6xotmg2Er/Qrus0BQYxoKRa+7XddjF6sqTLtrxAepdE13drSiqUFD
 huGk3rk97+pskHwhu5ZCncfk9WPH26eBggqkZOOiGfZP8cmwTfT0QYSUdC6kgzNZYTPTGcMnGOd
 9wBW2CfHaNkE8hMaREsN6Q4HBDHkEKcfYkLqCN4yvFOvtqLdUL4ZFrbmSCgPTdpHxGOt/KL6tEL
 o3DvLk0Wm235RRuzquBpB1lovbYhgZl45ibjckflOz2TEqz0+/kKX46ELm+l4yj6hhwWCXSj6Wz
 tdEQlDnQSx7MfVcM91TEZ8K9aUusSK9nbZ8VQi3+mxSfu8TCIw5NVtA9aPI+bi2GjvuEhz86i28
 p9Dvvb0T7Z2U/nPCVbQ==
X-Proofpoint-ORIG-GUID: nLLH1rOJXnv50cdxNF3Q8UAJn4TieNrJ
X-Proofpoint-Spam-Info: AW1haW4tMjYwNzA2MDE5NyBTYWx0ZWRfX5Y0gUbmVR/1z
 o77KDqEA/8Se+Vv5r0Y2DZlrSFqF6Jj7uF4MGPb2yS3eJdXw6jOHnTEt6jihcW11wKWBdB98R3p
 KCW388Io2PQZa4XVdRUU34+HM15bc5w=
X-Authority-Analysis: v=2.4 cv=c6Sbhx9l c=1 sm=1 tr=0 ts=6a4c01b7 cx=c_pps
 a=wuOIiItHwq1biOnFUQQHKA==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=RAioF0-LDSMA:10 a=s4-Qcg_JpJYA:10 a=VkNPw1HP01LnGYTKEx00:22
 a=u7WPNUs3qKkmUXheDGA7:22 a=yOCtJkima9RkubShWh1s:22 a=EUspDBNiAAAA:8
 a=KKAkSRfTAAAA:8 a=AzhOnzq_2AA1uY-T__EA:9 a=CjuIK1q_8ugA:10
 a=XD7yVLdPMpWraOa8Un9W:22 a=cvBusfyB2V15izCimMoJ:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1143,Hydra:6.1.134,FMLib:17.12.100.49
 definitions=2026-07-06_02,2026-07-06_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 phishscore=0 bulkscore=0 clxscore=1015
 adultscore=0 priorityscore=1501 lowpriorityscore=0 spamscore=0
 impostorscore=0 classifier=typeunknown authscore=0 authtc= authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.22.0-2606150000
 definitions=main-2607060197

On Mon, Jul 06, 2026 at 08:46:48PM +0200, Daniel Lezcano wrote:
> The Lenovo ThinkPad T14s embedded controller exposes several platform
> temperature sensors that are already used by the firmware for thermal
> management.
> 
> Expose the EC as a thermal sensor provider and describe the keyboard
> skin and charging circuitry sensors as thermal zones in the device
> tree.
> 
> The keyboard thermal zone defines passive and hot trip points, while
> the charging thermal zone also associates a cooling map with the CPU
> clusters, allowing the generic thermal framework to apply CPU
> throttling when the charging circuitry temperature exceeds the passive
> threshold.
> 
> This integrates the EC temperature sensors with the Linux thermal
> framework and enables platform thermal management using standard
> thermal zone definitions.
> 
> The EC protocol currently does not provide a mechanism to program trip
> points from Linux. Consequently, the thermal zones rely on periodic
> polling to detect threshold crossings.
> 
> Using the charging circuitry temperature for thermal mitigation provides
> a conservative approximation of the platform thermal state and prevents
> the platform from reaching critical temperatures under sustained heavy
> CPU load.
> 
> Without this change the platform reaches a critical thermal condition
> and resets under heavy load.
> 
> Reviewed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on T14s OLED
> Signed-off-by: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
> ---
>  .../qcom/x1e78100-lenovo-thinkpad-t14s.dtsi   | 67 ++++++++++++++++++-
>  1 file changed, 66 insertions(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>

> 
-- 
With best wishes
Dmitry
